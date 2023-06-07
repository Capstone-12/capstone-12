# Use an official Node.js runtime as the base image
FROM node:10-alpine

# Set the working directory in the container
WORKDIR /usr/scr/app

# Bundle your app source code inside the Docker image
COPY . .

# Install application dependencies
RUN npm install


# Expose the port on which your Node.js application will run
EXPOSE 8080

# Define the command to run your Node.js application
CMD [ "npm", "start" ]
