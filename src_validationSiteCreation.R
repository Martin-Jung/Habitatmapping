library(raster)
library(sf)
library(fasterize)
library(tidyverse)
library(assertthat)

# Seed for reproducibility
set.seed(10001)

# Number of points in each cluster and overall
nr_points <- 100
total_points <- 10000

# Path to Biome data
eco_path <- '../Ecoregions2017/Ecoregions2017.shp'

# Country shapefile from Natural Earth
cou_path <- '../ne_10m_admin_0_countries.shp'

# Coarser habitat type map at 1km for stratification
ht_path <- '../iucn_habitatclassification_composite_lvl2_ver103.tif'

# ----------------------------------------------- #
#### Load and prepare all data ####
# Load ht
ras_ht <- raster(ht_path)

# Load and prepare biomes
eco <- sf::read_sf(eco_path) %>% dplyr::filter(!(REALM %in% 'Antarctica')) %>%  # Load and exclude antarctica
  dplyr::select(BIOME_NUM,BIOME_NAME)
ras_eco <- fasterize(eco,ras_ht,field = 'BIOME_NUM')

# Load and prepare countries - Use Continent to construct rank
cou <- sf::read_sf(cou_path) %>% dplyr::filter(!(CONTINENT %in% 'Antarctica')) %>% #Exclude antarctica
  dplyr::select(CONTINENT,SUBREGION) %>% 
  mutate(sr_rank = round(rank(CONTINENT))) # Rank the subregions numerically 
assert_that(n_distinct(cou$sr_rank) == n_distinct(cou$CONTINENT))

ras_cou <- fasterize(cou, ras_ht, field = 'sr_rank')

cat('Number of possible groupings:', n_distinct(cou$CONTINENT) * n_distinct(eco$BIOME_NAME) )

# --- #
# Convert both to data frame with the ht map
df <- as.data.frame(ras_ht,xy = TRUE)
df <- data.frame(
  cont = values(ras_cou),
  biome = values(ras_eco)
) %>% drop_na()
# Composite columns for stratification
df$comp_col <- paste0(df$cont,'_',df$biome)

# ----------------------------------------------- #
#### Start sampling ###
# Calculate for each grouping (continent / biome) the

x <- sampleRandom(ras_ht,size = nr_points,na.rm = TRUE,xy = TRUE)
