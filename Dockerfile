FROM node:alpine as builder
WORKDIR '/app'
# Install dependencies
COPY package.json .
RUN npm install
# Copy all files from current directory into container
COPY . .
# Build
RUN npm run build

# Run Step
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html