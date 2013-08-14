FROM base
MAINTAINER Richard Millet "richard.millet@berkeley.edu"

RUN echo Installing the Oracle/Sun JDK 7
RUN apt-get install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && sudo apt-get install oracle-jdk7-installer
RUN update-alternatives --display java
RUN java -version
RUN javac -version
RUN export JAVA_HOME=/usr/lib/jvm/java-7-oracle
RUN echo 'JAVA_HOME=/usr/lib/jvm/java-7-oracle' >> /etc/environment
