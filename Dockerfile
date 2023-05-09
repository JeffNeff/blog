# Use the official Node.js LTS (Long Term Support) version as the base image
FROM node:lts

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files from your local machine to the /app directory in the container
COPY package*.json ./

# Install the Hexo CLI globally and install the dependencies for the project
RUN npm install -g hexo-cli && \
    npm install

# Copy the remaining files from your local machine to the /app directory in the container
COPY . .

# Expose the default Hexo port, 4000, so it can be accessed outside the container
EXPOSE 4000

# Run the Hexo server with the default theme, port, and IP address
CMD ["hexo", "server", "-p", "4000", "-i", "0.0.0.0"]
