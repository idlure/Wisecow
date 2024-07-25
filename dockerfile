# Use an official Ubuntu image as a parent image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    bash \
    fortune \
    cowsay \
    dos2unix

# Set the working directory
WORKDIR /app

# Copy the Wisecow script into the container
COPY wisecow.sh /app/wisecow.sh

# Ensure the script has Unix line endings and make it executable
RUN dos2unix /app/wisecow.sh && \
    chmod +x /app/wisecow.sh

# Expose port 4499
EXPOSE 4499

# Run the script
CMD ["/app/wisecow.sh"]

