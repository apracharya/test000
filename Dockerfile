# Step 1: Use a maintained Java 25 image (Eclipse Temurin)
FROM eclipse-temurin:25-jdk-alpine

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy your JAR file
# Note: Ensure you run './gradlew build' before running docker build
COPY build/libs/*.jar app.jar

# Step 4: Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]