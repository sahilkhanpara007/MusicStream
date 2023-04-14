#! /bin/bash

VBR="200k" #video bitrate
FPS="24" #fps of the stream (increase it if you stream videos)
QUAL="ultrafast" #quality of the stream
RTMP_URL="rtmp://x.rtmp.youtube.com/live2" #YouTube or Twitch's RTMP URL you can find on streaming settings
STREAM_KEY="cbyx-vwds-tssm-zzds-8vqp" #insert here your streaming key
VIDEO_SOURCE="video.mp4" #default background you can see in the main path
AUDIO_ENCODER="aac" #audio encoder :)

echo "Updating the list..."
rm list.txt
cd songs
ls *.mp3 | sort -R | while read file; do
    echo "file 'songs/$file'" >> ../list.txt
done
cd ..
echo "Starting the streaming..."

 ffmpeg -stream_loop -1 -re -i video.mp4 -stream_loop -1 -f concat -safe 0 -i <((for f in ./mp3/*.mp3; do path="$PWD/$f"; echo "file ${path@Q}"; done) | shuf) -vcodec libx264 -pix_fmt yuvj420p -maxrate 750k -preset veryfast -r 12 -framerate 30 -g 50 -c:a aac -b:a 128k -ar 44100 -strict experimental -video_track_timescale 1000 -b:v 150000k -f flv  rtmp://a.rtmp.youtube.com/live2/cbyx-vwds-tssm-zzds-8vqp
