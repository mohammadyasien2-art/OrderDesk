# OrderDesk — Dockerized Spring Boot Application  
**Technical Assessment — System Implementation & Support Engineer**

This repository contains the Dockerized deployment for the **OrderDesk** Spring Boot service.  
It includes a PostgreSQL database, an NGINX reverse proxy, and supports scaling multiple app replicas using Docker Compose.

---

## 🧩 Project Overview

| Component | Description |
|------------|-------------|
| **Backend** | Spring Boot (Java 17) |
| **Database** | PostgreSQL 15 |
| **Proxy** | NGINX reverse proxy |
| **Build Tool** | Maven (multi-stage Docker build) |
| **Orchestration** | Docker Compose |
| **Scaling** | Multi-replica app service |
| **CI/CD (optional)** | GitHub Actions |
| **TLS (optional)** | Self-signed HTTPS cert support |

---

## 🚀 Quickstart

### 1️⃣ Prerequisites
- Docker & Docker Compose installed  
- Java 17 (optional for manual build)  
- Git CLI  

---

### 2️⃣ Clone the repository
```bash
git clone https://github.com/mohammadyasien2-art/OrderDesk
cd orderdesk-docker





Build the JAR (optional — can be done inside Docker)
cd app
 mvn clean package -DskipTests
 
 
*Build the Docker image

Replace YOUR_DOCKERHUB_USER with your Docker Hub username.

cd ..
  - name: Build Docker image
      run: docker build -t mohammadyasien2/orderdesk:${{ env.TAG }} .
    - name: Push Docker image
      run: docker tag  mohammadyasien2/orderdesk:${{ env.TAG }} mohamamdyaseen/orderdesk:${{ env.TAG }}

    - name: Push Docker image
      run: docker push  mohamamdyaseen/orderdesk:${{ env.TAG }}

5️⃣ Start the full stack
docker compose up -d


Services started:

db — PostgreSQL database

app — OrderDesk Spring Boot application

nginx — Reverse proxy (port 80 / 443)

6️⃣ Verify setup

Health check:

curl -s http://localhost/actuator/health | jq
# {"status":"UP"}


Daily stats:

curl -s http://localhost/orders/stats/daily | jq


Create a customer:

curl -X POST http://localhost/customers \
  -H "Content-Type: application/json" \
  -d '{"name":"Alice","email":"alice@example.com"}' | jq


Create an order:

curl -X POST http://localhost/orders \
  -H "Content-Type: application/json" \
  -d '{"customerId":1,"items":[{"sku":"ABC","qty":2,"price":9.99}]}' | jq

7️⃣ Scale the application

Run two replicas:

docker compose up -d --scale app=2


Check containers:

docker compose ps


Test load balancing (repeat health requests):

for i in {1..5}; do curl -s http://localhost/actuator/health; echo; done

8️⃣ Tear down
docker compose down -v

🔐 Optional: Enable HTTPS (self-signed)
mkdir -p nginx/certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout nginx/certs/server.key -out nginx/certs/server.crt \
  -subj "/CN=localhost"
docker compose up -d


Then test:

curl -k https://localhost/actuator/health

🧾 Git Tag and Versioning
git tag -a v0.1.0 -m "Initial Dockerized release v0.1.0"
git push origin --tags
git tag -n

