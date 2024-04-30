# Use official Node.js 14 image as the base image
FROM node:14 as build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app
# RUN npm run build

# Use the same Node.js 14 image for the production environment
FROM node:14

# Set the working directory inside the container
WORKDIR /build

# Copy the build output from the previous stage
COPY --from=build /app /build

# Expose port 3000 to the outside world
EXPOSE 3008

# Command to run the React app
CMD ["npm", "start"]
