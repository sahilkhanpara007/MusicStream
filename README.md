# MusicStream
 Streaming music on YouTube with ffmpeg

## Requirements
- ffmpeg
- a PC (tested on Arch Linux and Debian 10)

## Configuration
Just change following variables in `start.sh`:
- `RTMP_URL` (required)
- `STREAM_KEY` (required)
- `VIDEO_SOURCE` (optional)
- `QUAL` (optional)
- `VBR` (optional)
- `FPS` (optional)
- `AUDIO_ENCODER` (optional)

## Start
`sh start.sh` :)

## Tips
- Use a low bitrate (also like 200k) and a 1280x720 JPG image if you don't want to start a fire in the machine's datacenter :)
