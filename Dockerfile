FROM base
MAINTAINER Richard Millet "richard.millet@berkeley.edu"

RUN echo Installing the Oracle/Sun JDK 7
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -y update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-jdk7-installer
RUN update-alternatives --display java
RUN java -version
RUN javac -version
RUN apt-get install oracle-java7-set-default

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
RUN export JAVA_HOME=$JAVA_HOME
RUN echo JAVA_HOME=$JAVA_HOME >> /etc/environment

#
# Create a user named 'cspace'
#
RUN useradd cspace
RUN echo cspace$'\n'cspace$'\n' | passwd cspace

EXPOSE :8080
#
# Install Apache Tomcat 6
#
RUN apt-get install -y tomcat6
