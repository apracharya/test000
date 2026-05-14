# STAGE 1: Build the JAR inside Docker
FROM eclipse-temurin:25-jdk-alpine AS build
WORKDIR /app

# Copy the gradle wrapper and configuration files first (for caching)
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# Give permission to execute the wrapper
RUN chmod +x gradlew

# Copy the source code
COPY src src

# Build the application (skipping tests to save time on the free tier)
RUN ./mvnw clean package -x test

# STAGE 2: Create the final small image
FROM eclipse-temurin:25-jdk-alpine
WORKDIR /app

# Copy only the JAR from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the port (Render usually looks at 8080 or the PORT env var)
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]