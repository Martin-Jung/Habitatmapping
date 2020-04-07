library(raster)
library(sf)
library(sp)
library(fasterize)
library(tidyverse)
library(assertthat)
library(progress)
raster::rasterOptions(progress = 'text')

# Seed for reproducibility
set.seed(10001)

# Number of points in each cluster and overall
total_points <- 10000

# Path to Biome data
eco_path <- '/media/martin/data/raw/Ecoregions2017/Ecoregions2017.shp'

# Country shapefile from Natural Earth
cou_path <- '/media/martin/data/raw/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp'

# Coarser habitat type map at 1km for stratification
ht_path <- '../iucn_habitatclassification_composite_lvl2_ver103.tif'

# ----------------------------------------------- #
#### Load and prepare all data ####
# Load ht
ras_ht <- raster(ht_path)
ras_ht <- setMinMax(ras_ht)

# Load and prepare biomes
eco <- sf::read_sf(eco_path) %>% dplyr::filter(!(REALM %in% 'Antarctica')) %>%  # Load and exclude antarctica
  dplyr::select(BIOME_NUM,BIOME_NAME) %>% 
  st_buffer(dist = 0) %>% st_cast('MULTIPOLYGON') # Buffer with and cast to MP

ras_eco  <- fasterize(eco,ras_ht,field='BIOME_NUM')

# Load and prepare countries - Use Continent to construct rank
cou <- sf::read_sf(cou_path) %>% dplyr::filter(!(CONTINENT %in% 'Antarctica')) %>% #Exclude antarctica
  dplyr::select(CONTINENT,SUBREGION) %>% 
  mutate(sr_rank = round(rank(CONTINENT))) # Rank the subregions numerically 
assert_that(n_distinct(cou$sr_rank) == n_distinct(cou$CONTINENT))

ras_cou  <- fasterize(cou,ras_ht,field='sr_rank')

cat('Number of possible groupings:', n_distinct(cou$CONTINENT) * n_distinct(eco$BIOME_NAME) )

# Multiply and sum the codes to create a distinct zones raster
ras_zones <- (ras_eco*10000) + ras_ht
ras_zones[ras_zones==10000] <- NA
ras_zones <- raster::crop(ras_zones,cou)
  
# Sample two thirds of all points stratefied over these zones
results1 <- sampleStratified(ras_zones,size = 25,na.rm = TRUE, xy = TRUE)
# Format them
results1 <- as.data.frame(results1) %>% select(x,y) %>% rename(longitude = x,latitude = y)

# Sample the rest at random over each continent
results2 <- sampleRandom(ras_zones, size = (total_points - nrow(results1))+200, na.rm = TRUE, xy = TRUE )
# Format them
results2 <- as.data.frame(results2) %>% select(x,y) %>% rename(longitude = x,latitude = y)

# Extract statistics for each of them
results <- bind_rows(results1,results2)

# Convert
ss <- results
coordinates(ss) <- ~longitude + latitude
proj4string(ss) <- st_crs(cou)$proj4string
results$BIOME_NUM <- raster::extract(ras_eco,ss)
results$sr_rank <- raster::extract(ras_cou,ss)

# Remove all NA values
results <- results %>% drop_na()
# Join in real name
results <- inner_join(results,cou %>% st_drop_geometry() %>% select(sr_rank,CONTINENT) %>% distinct(),by = 'sr_rank') %>% select(-sr_rank)
x = eco %>% st_drop_geometry() %>% select(BIOME_NUM,BIOME_NAME) %>% filter(BIOME_NAME != 'N/A') %>% distinct()
results <- left_join(results,x,
                     by = 'BIOME_NUM') %>% select(-BIOME_NUM)

results <- results %>% drop_na()
write_csv(results,'Validation_Sites.csv')


# # ----------------------------------------------- #
# #### Start sampling ###
# # Calculate for each grouping (continent / biome) a given number of points
# 
# # The resulting points
# results <- data.frame()
# 
# pb <- progress_bar$new(total = n_distinct(cou$CONTINENT) * n_distinct(eco$BIOME_NAME))
# 
# # Double looping
# for(continent in unique(cou$CONTINENT)){
#   print(continent)
#   temp_cou <- cou %>% filter(CONTINENT %in% continent)
#   ras_cou <- fasterize(temp_cou, crop(ras_ht,extent(temp_cou)), field = 'sr_rank')
#   
#   # Crop biomes
#   temp_eco <- sf::st_crop(eco,extent(temp_cou))
#   for(biome in unique(temp_eco$BIOME_NAME)){
#     temp_eco_subset <- temp_eco %>% filter(BIOME_NAME == biome) %>% st_cast('MULTIPOLYGON')
#     
#     ras_temp_eco <- fasterize(temp_eco_subset,crop(ras_ht,extent(temp_eco_subset)), field = 'BIOME_NUM')
#     
#     ras_ht_sub <- raster::crop(ras_ht,ras_temp_eco);ras_ht_sub <- raster::mask(ras_ht_sub,ras_temp_eco)
#     
#     # Now sample stratefied
#     x <- sampleRandom(ras_temp_eco,size = nr_points,na.rm = TRUE,xy = TRUE)
#     # Format
#     x <- as.data.frame(x) %>% select(x,y) %>% rename(longitude = x,latitude = y) %>% 
#       mutate(continent = continent, biome = biome)
#     results <- bind_rows(results,x) # Append
#     rm(ras_temp_eco,temp_eco_subset,x ) # Clean up
#     pb$tick()
#   }
# }
# rm(pb)
# 
# # Assess the number of sites per continent and biome and add additional ones where undersampled
# 
# write_csv(results,'Validation_Sites.csv')
