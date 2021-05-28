ffmpeg -i koala.mp4 yuv/out.yuv
kvazaar -i yuv/out.yuv --input-res 3840x2160 -o tiled_video/koala4k.hvc --tiles 3x3 --slices tiles --mv-constraint frametilemargin --bitrate 13000000 --period 15 --input-fps 30
kvazaar -i yuv/out.yuv --input-res 3840x2160 -o tiled_video/koala2k.hvc --tiles 3x3 --slices tiles --mv-constraint frametilemargin --bitrate 6000000 --period 15 --input-fps 30
kvazaar -i yuv/out.yuv --input-res 3840x2160 -o tiled_video/koala1080.hvc --tiles 3x3 --slices tiles --mv-constraint frametilemargin --bitrate 3000000 --period 15 --input-fps 30
kvazaar -i yuv/out.yuv --input-res 3840x2160 -o tiled_video/koala720.hvc --tiles 3x3 --slices tiles --mv-constraint frametilemargin --bitrate 4000000 --period 15 --input-fps 30
kvazaar -i yuv/out.yuv --input-res 3840x2160 -o tiled_video/koala480.hvc --tiles 3x3 --slices tiles --mv-constraint frametilemargin --bitrate 2000000 --period 15 --input-fps 30
MP4Box -add tiled_video/koala4k.hvc:split_tiles -fps 30 -new tiled_video/koala4k.mp4 
MP4Box -add tiled_video/koala2k.hvc:split_tiles -fps 30 -new tiled_video/koala2k.mp4 
MP4Box -add tiled_video/koala1080.hvc:split_tiles -fps 30 -new tiled_video/koala1080.mp4 
MP4Box -add tiled_video/koala720.hvc:split_tiles -fps 30 -new tiled_video/koala720.mp4 
MP4Box -add tiled_video/koala480.hvc:split_tiles -fps 30 -new tiled_video/koala480.mp4
MP4Box -dash 1000 -rap -frag-rap -profile live -out mpd/dash_tiled.mpd tiled_video/koala4k.mp4 tiled_video/koala2k.mp4 tiled_video/koala1080.mp4 tiled_video/koala720.mp4 tiled_video/koala480.mp4
