# STAGE 1: Build the JAR
FROM eclipse-temurin:25-jdk-noble AS build
WORKDIR /app

# Install Maven manually in the build stage
RUN apt-get update && apt-get install -y maven

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# STAGE 2: Create the final runtime image
FROM eclipse-temurin:25-jdk-noble
WORKDIR /app

# Copy the JAR from the target folder
COPY --from=build /app/target/*.jar app.jar

# Expose the default Spring Boot port
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]