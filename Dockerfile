# STAGE 1: Build the JAR using Maven
FROM maven:3.9.9-eclipse-temurin-25-alpine AS build
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application (skipping tests for a faster build)
RUN mvn clean package -DskipTests

# STAGE 2: Create the final runtime image
FROM eclipse-temurin:25-jdk-alpine
WORKDIR /app

# Maven puts the JAR in the 'target' folder
COPY --from=build /app/target/*.jar app.jar

# Expose the port Spring Boot usually uses
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]