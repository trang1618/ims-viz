# ## Download this lidar data
# download.file("https://dl.dropboxusercontent.com/s/hkdxt1zbsjp68jl/LID2007_118755_e.zip",destfile = "LID2007_118755_e.zip")
# download.file("https://dl.dropboxusercontent.com/s/omvb63urfby6ddb/LID2007_118754_e.zip",destfile = "LID2007_118754_e.zip")
#
# ##Alternate links
# # download.file("https://www.tylermw.com/data/LID2007_118755_e.zip",destfile = "LID2007_118755_e.zip")
# # download.file("https://www.tylermw.com/data/LID2007_118754_e.zip",destfile = "LID2007_118754_e.zip")
#
# unzip("LID2007_118755_e.zip")
# unzip("LID2007_118754_e.zip")
#
# whitebox::wbt_lidar_tin_gridding(here::here("LID2007_118755_e.las"),
#                                  output = here::here("miamibeach.tif"),
#                                   resolution = 1, verbose_mode = TRUE,
#                                  exclude_cls = '3,4,5,7,13,14,15,16,18')
#
# whitebox::wbt_lidar_tin_gridding(here::here("LID2007_118754_e.las"),
#                                  output = here::here("miamibeach2.tif"),
#                                   resolution = 1, verbose_mode = TRUE,
#                                  exclude_cls = '3,4,5,7,13,14,15,16,18')
#
# download.file("https://dl.dropboxusercontent.com/s/rwajxbdwtkcw50c/miamibeach.tif", destfile = "miamibeach.tif")
# download.file("https://dl.dropboxusercontent.com/s/39abkh87h05n7rm/miamibeach2.tif", destfile = "miamibeach2.tif")
# miami1 = raster::raster("miamibeach.tif")
# miami2 = raster::raster("miamibeach2.tif")
#
# miami_combined = raster::merge(miami1, miami2)
#
# miami_beach = raster_to_matrix(miami_combined)
#
# # 1/4th the size, so 0.25 for the second argument
# miami_beach_small = reduce_matrix_size(miami_beach, 0.25)
#
# ## Backup:
# #download.file("https://www.tylermw.com/data/miami_beach_small.Rds",destfile = "miami_beach_small.Rds")
# #miami_beach_small = readRDS("miami_beach_small.Rds")
# dim(miami_beach_small)
#
#
#
# miami_beach_small %>%
#   sphere_shade(texture = "desert") %>%
#   add_water(detect_water(miami_beach_small, cutoff=0.2, zscale=4,
#                          min_area = length(miami_beach_small)/150,
#                          max_height = 3)) %>%
#   add_shadow(ray_shade(miami_beach_small, zscale = 4, multicore = TRUE,
#                        sunaltitude = 10, sunangle = -110),0.3) %>%
#   plot_map()
#
#
