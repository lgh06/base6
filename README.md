### Intro
A base environment for FFmpeg & gpac(MP4Box).  

### Usage  
You can use ```docker cp``` to transfer files.  

Theoretically,you can build FFmpeg & gpac from the git source,
But,I just wanna transform an mp4 file to DASH compatible.  

So there are ffmpeg-static files,extract them and ```ln -s```them to   
```/usr/local/bin``` or else.  


For gpac,I just use MP4Box,so I built it like this:  

```
>yum install glibc-static  
>make distclean  
>make clean  
./configure --static-mp4box --use-zlib=no  
make -j4  
sudo make install  

> means MAY NOT necessary.
```  
then you can use the MP4Box command.


Finall,enjoy your FFmpeg and MP4Box like this:  
```
ffmpeg -i frag_bunny.mp4 -x264opts keyint=48:min-keyint=48:no-scenecut new.mp4
MP4Box -dash 1000 new.mp4
```

see:
> https://gpac.wp.mines-telecom.fr/2015/07/29/gpac-build-mp4box-only-all-platforms/  
> https://ffmpeg.org/download.html  
>  http://blog.hapleo.com/work/live/2016/10/27/now-vod-and-live.html
