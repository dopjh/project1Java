FROM ubuntu

# Install OpenJDK
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Create Working Directory
COPY ./HelloWorld.java /usr/app/
WORKDIR /usr/app

# Compile Application
RUN javac HelloWorld.java

# Run the Application in the Container
ENTRYPOINT ["java", "HelloWorld"]
