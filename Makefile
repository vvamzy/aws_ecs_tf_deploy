.PHONY: build-backend build-frontend

# Build backend Docker image
build-backend:
	docker build -t backend ./backend

# Build frontend Docker image
build-frontend:
	docker build -t frontend ./frontend
