# Step 1: Use a Java Runtime (e.g., OpenJDK 25)
FROM openjdk:25-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy your JAR file into the container
# (Make sure you run './gradlew build' or './mvnw package' first)
COPY build/libs/*.jar app.jar

# Step 4: Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]