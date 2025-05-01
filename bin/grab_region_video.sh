# 4k
#res=3840x2160
# QHD
#res=2560x1440
# FHD
#res=1920x1080
# semi-FHD
#res=1600x900
# HD
res=1280x720

ffmpeg -f x11grab -framerate 25 -video_size 1920x1080 -i :0.0+0,0 -b:v 11M /home/tmp/out.mpg
