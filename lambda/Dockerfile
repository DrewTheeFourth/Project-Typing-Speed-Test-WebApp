# Use the official Node.js image as a base
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy the source code into the container
COPY lambda/store-results.js .

# Install any necessary dependencies (if you have any)
# RUN npm install

# Command to run your Lambda function (this is just for testing, AWS Lambda will handle execution)
CMD ["node", "store-results.js"]
