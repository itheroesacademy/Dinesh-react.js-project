# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app
RUN /bin/sh -c npm run build

# Use an Nginx image to serve the build files
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

# Expose port 1012 to the outside world
EXPOSE 1012

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
