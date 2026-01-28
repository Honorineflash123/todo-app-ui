# ------------ STAGE 1: BUILD ANGULAR APP ------------
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build -- --configuration production

# ------------ STAGE 2: NGINX RUNTIME IMAGE ------------
FROM nginx:1.27-alpine AS runner
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Angular "application" builder output
ARG DIST_DIR=dist/todo-app-ui/browser

RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/${DIST_DIR}/ /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
