FROM centos:6
MAINTAINER hnnk <hnnk@qq.com>
RUN yum install -y epel-release && \
    su -c 'yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/updates/6/i386/rpmfusion-free-release-6-1.noarch.rpm https://download1.rpmfusion.org/nonfree/el/updates/6/i386/rpmfusion-nonfree-release-6-1.noarch.rpm' && \
    yum install -y git scons gcc gcc-c++ cmake svn libtool unzip xz && \
    yum clean all && \
    rm -rf /var/tmp/*
RUN cd /root && mkdir down && cd down && \
    git clone https://github.com/gpac/gpac/ && \
    git clone https://github.com/OpenHEVC/openHEVC && \
    git clone https://github.com/FFmpeg/FFmpeg
RUN cd /root/down/ && \
    git clone https://github.com/WeBest-test/testMSE
ADD http://download.tsi.telecom-paristech.fr/gpac/gpac_extra_libs.zip gpac_extra_libs.zip
ADD https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz ffmpeg-static.tar.xz
CMD ["/bin/bash"]
