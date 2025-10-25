
# Stage 1: Build the JAR
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /maven/build

# Copy only the pom.xml and download dependencies (for caching)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Package the application, skipping tests
RUN mvn clean package -DskipTests

# Stage 2: Create slim runtime image
FROM eclipse-temurin:17-jdk-jammy

# Create a non-root user
RUN useradd -ms /bin/bash springuser
USER springuser

# Set working directory
WORKDIR /home/springuser/app

# Copy the JAR from build stage
COPY --from=build /maven/build/target/orderdesk-0.1.0.jar ./orderdesk.jar

# Expose port (if your app runs on 8080)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java","-jar","orderdesk.jar"]

