FROM base
MAINTAINER Richard Millet "richard.millet@berkeley.edu"

RUN echo Installing the Oracle/Sun JDK 7
RUN echo y | apt-get install software-properties-common
RUN echo $'\n' | add-apt-repository ppa:webupd8team/java
RUN echo y | apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN echo y | apt-get install oracle-jdk7-installer
RUN update-alternatives --display java
RUN java -version
RUN javac -version
RUN apt-get install oracle-java7-set-default
RUN export JAVA_HOME=/usr/lib/jvm/java-7-oracle
RUN echo 'JAVA_HOME=/usr/lib/jvm/java-7-oracle' >> /etc/environment

#
# Create a user named 'cspace'
#
RUN useradd cspace
RUN echo cspace$'\n'cspace | passwd cspace

#
# Install Apache Tomcat 6
#
RUN echo y | sudo apt-get install tomcat6
