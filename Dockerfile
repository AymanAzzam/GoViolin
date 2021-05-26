## Step 1:
# Base Image for golang
FROM golang:1.16

## Step 2:
# Create a working directory
WORKDIR /app

## Step 3:
# Copy Code to working directory
COPY . /app/

## Step 4:
# Init module
RUN go mod init

## Step 5:
# Build the project  
RUN go build .

## Step 6:
# Expose port 8080
EXPOSE 8080

## Step 7:
# Run app at container launch
CMD go run .
