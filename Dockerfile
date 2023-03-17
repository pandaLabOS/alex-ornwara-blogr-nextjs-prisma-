#Specifies deployment process
FROM node:alpine
# Copy all files from current directory to /app
COPY . /app 

#Set working directory to /app
WORKDIR /app

CMD node pages/index.tsx