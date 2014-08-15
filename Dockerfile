FROM tutum/tomcat:8.0
MAINTAINER Seth Goings <seth.goings@readytalk.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -q -y libapr1

RUN wget -q http://launchpadlibrarian.net/181313159/libtcnative-1_1.1.31-1_amd64.deb -O tomcat-native.deb && \
	dpkg -i tomcat-native.deb && \
	rm -rf tomcat-native.deb

ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/usr/lib/x86_64-linux-gnu/

CMD ["/tomcat/bin/catalina.sh", "run"]