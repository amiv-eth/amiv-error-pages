# Second stage: Server to deliver files
FROM node:alpine

# Install http server
RUN npm install --global --no-save http-server

# Port 8080 can be used as non root
EXPOSE 8080

# Create user with home directory and no password
RUN adduser -Dh /public server
USER server
WORKDIR /public

# Copy files from first stage
COPY /index.html /public/
# Serve index.html for every file which is not found on the server
RUN ln index.html 404.html

# Run server (-g will automatically serve the gzipped files if possible)
CMD ["/usr/local/bin/http-server", "-g", "/public"]