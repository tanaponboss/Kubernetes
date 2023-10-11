# start from base
FROM maven:3.8.1-openjdk-11 as build

# copy our application code
# ADD . /app
WORKDIR /app

## Copy all the relevant files to the working dir i.e. ./ = ./app
COPY ./pom.xml ./
COPY ./ ./
RUN mvn package

FROM openjdk:11-jre
COPY --from=build app/target/ ./

# expose port
EXPOSE 8080

# start app
CMD ["java","-jar","ums-1.0.jar"]