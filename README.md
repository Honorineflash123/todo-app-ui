# Todo Application – Frontend UI

This repository contains the frontend user interface for the Todo application.

The frontend is built with Angular and served using NGINX. It is containerized with Docker and deployed to a private Kubernetes cluster on AWS.

---

## 📌 Application Responsibilities

The frontend provides:
- User interface for managing todo tasks
- Communication with the backend API via `/api`
- Static content delivery via NGINX

The frontend does not directly access the database.

---

## 🗂️ Project Structure

```text
todo-app-ui/
├── angular.json
├── Dockerfile
├── firebase.json
├── nginx.conf
├── package.json
├── package-lock.json
├── public/
├── src/
├── tsconfig.app.json
├── tsconfig.json
├── tsconfig.spec.json
├── README.md

🛠️ Technologies Used

    Angular

    NGINX

    Docker

    Kubernetes

    AWS Elastic Container Registry (ECR)

🐳 Docker

The frontend uses a multi-stage Docker build:

    Build stage (Angular)

    Runtime stage (NGINX)

Build locally

docker build -t todo-frontend .

Run locally (optional)

docker run -p 80:80 todo-frontend

☸️ Kubernetes Deployment

The frontend is deployed using:

    Deployment

    ClusterIP Service

    Ingress routing

Routing behavior:

/     → frontend service
/api  → backend service

The frontend is accessed only through Ingress.
🌐 Application Access

Due to AWS Load Balancer restrictions:

    Kubernetes LoadBalancer services are unavailable

    NodePort + reverse proxy is used

Access flow:

User → Public EC2 (NGINX) → NodePort → Ingress → Frontend

📦 Container Registry (ECR)

Frontend images are stored in AWS ECR.

Example image:

<account-id>.dkr.ecr.<region>.amazonaws.com/primus-capstone/frontend:latest

🔄 CI (Continuous Integration)

GitHub Actions is used to:

    Build frontend Docker images

    Push images to Amazon ECR

🚫 CD Scope (Intentional)

For this capstone:

    Kubernetes deployments are applied manually

    CI handles build and image publishing only

This keeps the Kubernetes cluster secure and private.
🔐 Security Design

    Kubernetes nodes have no public IPs

    Frontend pods run in private subnets

    Traffic is routed through controlled entry points

    Backend access is restricted via Ingress rules

👤 Author

Honorine
Primus Capstone Project
