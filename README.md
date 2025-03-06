# Full-Stack Application Deployment on AWS ECS
Run Setup_me to setup backend statefiles

## Overview
This project deploys a full-stack application using Terraform and AWS services. The infrastructure includes:
- **Frontend**: A simple UI that displays a user's name and fetches details from the backend.
- **Backend**: An API that retrieves user details (name, mobile number) from an RDS database.
- **Infrastructure**: Terraform provisions VPC, subnets, security groups, ECS, RDS, and ECR.
- **CI/CD**: GitHub Actions for building Docker images and deploying to ECS.
- **Logging & Monitoring**: AWS CloudWatch for logs and ECS service metrics.
- **Scalability**: Designed to handle growth from 100 to 100K users within six months.

## Project Structure
```
├── terraform/                 # Terraform configurations
│   ├── variables.tf           # Configuration variables
│   ├── outputs.tf             # Output values
│   ├── ecs.tf                 # ECS cluster & services
│   ├── rds.tf                 # RDS database setup
│   ├── ecr.tf                 # ECR repository
├── frontend/                  # Frontend application
│   ├── Dockerfile             # Frontend Docker setup
│   ├── src/App.js             # Basic UI app
├── backend/                   # Backend application
│   ├── Dockerfile             # Backend Docker setup
│   ├── index.js                 # Express.js API that connects to RDS MySQL database and fetches candidate data
├── .github/workflows/         # CI/CD pipeline
│   ├── deploy.yml             # GitHub Actions workflow
├── README.md                  # Project documentation
```

## Deployment Steps


Manual
### 1. Prerequisites
- AWS account with necessary permissions.
- Terraform installed (`>=5.0`)
- Docker installed.
- AWS CLI configured.
- GitHub repository set up for CI/CD.

### 2. Infrastructure Setup
```sh
cd terraform
terraform init
terraform apply -auto-approve
```

### 3. Build & Push Docker Images
```sh
# Authenticate with AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ECR_URL>

# Build and push backend
cd backend
docker build -t backend .
docker tag backend <ECR_URL>/backend:latest
docker push <ECR_URL>/backend:latest

# Build and push frontend
cd ../frontend
docker build -t frontend .
docker tag frontend <ECR_URL>/frontend:latest
docker push <ECR_URL>/frontend:latest
```

### 4. Deploy to ECS
The GitHub Actions workflow will automatically deploy the containers to AWS ECS when new commits are pushed to the repository.

### 5. Access the Application
- The application will be accessible via the Load Balancer URL output from Terraform.
- RDS can be accessed using the credentials stored in AWS Secrets Manager.

## Monitoring & Logging
- **Logs**: View logs in AWS CloudWatch (`ECS -> Cluster -> Task Logs`)
- **Metrics**: Monitor ECS service metrics (`ECS -> Service -> Monitoring`)
- **Scaling**: Auto-scaling policies defined in ECS ensure scaling based on demand.

## IAM Roles & Access Control
- Developers have access to logs and metrics via IAM policies.
- ECS task roles allow containers to interact with AWS services securely.

## Future Improvements
- Implement a service mesh for better networking.
- Add a Web Application Firewall (WAF) for security.
- Optimize database queries for performance at scale.

