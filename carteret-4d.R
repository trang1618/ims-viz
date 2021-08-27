# library(rayshader)
# library(sp)
# library(raster)
# library(scales)
#
# # zion_elevation <- raster::raster("data/N34W077.hgt")
# # # height_shade(raster_to_matrix(zion_elevation)) %>%
# # #   plot_map()
# #
# # satellite_paths <- paste0(
# #   "data/LC08_L1TP_014036_20210522_20210529_01_T1/",
# #   "LC08_L1TP_014036_20210522_20210529_01_T1_B", c(4,3,2),
# #   ".TIF")
# #
# # zion_r = raster::raster(satellite_paths[1])
# # zion_g = raster::raster(satellite_paths[2])
# # zion_b = raster::raster(satellite_paths[3])
# #
# # zion_rbg = raster::stack(zion_r, zion_g, zion_b)
# # raster::plotRGB(zion_rbg, scale=255^2)
# #
# # zion_rbg_corrected = sqrt(raster::stack(zion_r, zion_g, zion_b))
# # raster::plotRGB(zion_rbg_corrected)
# #
# # zion_elevation_utm = raster::projectRaster(zion_elevation, crs = crs(zion_r), method = "bilinear")
# # crs(zion_elevation_utm)
# #
# # bottom_left = c(y=-76.7316, x=34.6452)
# # top_right   = c(y=-76.5656, x=34.7418)
# #
# # extent_latlong = sp::SpatialPoints(rbind(bottom_left, top_right), proj4string=sp::CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"))
# # extent_utm = sp::spTransform(extent_latlong, raster::crs(zion_elevation_utm))
# #
# # e = raster::extent(extent_utm)
# # e
# #
# # zion_rgb_cropped = raster::crop(zion_rbg_corrected, e)
# # elevation_cropped = raster::crop(zion_elevation_utm, e)
# #
# # save.image(file = "data/carteret.Rdata")
#
# names(zion_rgb_cropped) = c("r","g","b")
#
# zion_r_cropped = rayshader::raster_to_matrix(zion_rgb_cropped$r)
# zion_g_cropped = rayshader::raster_to_matrix(zion_rgb_cropped$g)
# zion_b_cropped = rayshader::raster_to_matrix(zion_rgb_cropped$b)
#
# zionel_matrix = rayshader::raster_to_matrix(elevation_cropped)
#
# zion_rgb_array = array(0,dim=c(nrow(zion_r_cropped),ncol(zion_r_cropped),3))
#
# zion_rgb_array[,,1] = zion_r_cropped/255 #Red layer
# zion_rgb_array[,,2] = zion_g_cropped/255 #Blue layer
# zion_rgb_array[,,3] = zion_b_cropped/255 #Green layer
#
# zion_rgb_array = aperm(zion_rgb_array, c(2,1,3))
#
# plot_map(zion_rgb_array)
#
# zion_rgb_contrast = scales::rescale(zion_rgb_array,to=c(0,1))
#
# plot_map(zion_rgb_contrast)
#
# plot_3d(zion_rgb_contrast, zionel_matrix, windowsize = c(1100,900), zscale = 15, shadowdepth = -50,
#         zoom=0.5, phi=45,theta=-45,fov=70, background = "#F2E1D0", shadowcolor = "#523E2B")
# render_snapshot(title_text = "Zion National Park, Utah | Imagery: Landsat 8 | DEM: 30m SRTM",
#                 title_bar_color = "#1f5214", title_color = "white", title_bar_alpha = 1)
#
#
# elevation_matrix <- raster_to_matrix(elevation_cropped)
# dim(montereybay)
#
# render_snapshot(clear = TRUE)
#
#
# elevation_matrix %>%
#   sphere_shade(texture="imhof1") %>%
#   plot_3d(elevation_matrix, zscale=50, water = TRUE, watercolor="imhof1", theta=-45, zoom=0.7,
#           waterlinecolor="white", waterlinealpha=0.5)
#
#
# waterdepthvalues = min(elevation_matrix)/2 - min(elevation_matrix)/2 * cos(seq(0,2*pi,length.out = 180))
# thetavalues = 90 + 45 * cos(seq(0,2*pi,length.out = 180))
#
# for(i in 1:10) {
#   montereybay %>%
#     sphere_shade(texture = "imhof3") %>%
#     add_shadow(ray_shade(montereybay)) %>%
#     add_shadow(ambient_shade(montereybay)) %>%
#     plot_3d(montereybay,
#             solid = TRUE, shadow = TRUE, water = TRUE,
#             waterdepth = waterdepthvalues[i], watercolor = "imhof3", wateralpha = 0.8,
#             waterlinecolor = "#ffffff", waterlinealpha = 0.5, waterlinewidth = 2,
#             theta = thetavalues[i], phi = 45)
#   rgl::snapshot3d(paste0("drain",i,".png"))
# }
#
# ?render_water
# render_water(montereybay, zscale = 50, waterdepth = -100,
#              waterlinecolor = "white", wateralpha = 0.7)
#
# montereybay %>%
#   sphere_shade() %>%
#   plot_3d(montereybay,zscale=50)
# render_snapshot()
# render_water(montereybay,zscale=50)
# render_snapshot()
#
# render_water(montereybay,zscale=50,waterdepth=-1000)
# render_snapshot()
#
# render_camera(theta=-45)
# render_water(montereybay,zscale=50,waterlinecolor="white")
# render_snapshot(clear = TRUE)
# rgl::rgl.close()
#
# render_snapshot(clear = TRUE)
#
# elevation_matrix %>%
#   sphere_shade() %>%
#   plot_3d(elevation_matrix, water = TRUE, waterlinecolor = "white",
#           theta = -45, zoom = 0.9, windowsize = c(1000,1000),zscale = 50)
# render_snapshot(title_text = "Monterey Bay, California",
#                 title_color = "white", title_bar_color = "black")
# render_water(elevation_matrix, zscale = 50, waterdepth = 0,
#              waterlinecolor = "white", wateralpha = 0.7)
# render_snapshot(title_text = "Monterey Bay, California (water level: -100 meters)",
#                 title_color = "white", title_bar_color = "black")
