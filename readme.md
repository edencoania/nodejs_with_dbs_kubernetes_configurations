# Node.js and Databases on Kubernetes 🌐🚀

Welcome to the **Node.js and Databases on Kubernetes** project! This project demonstrates how to deploy a Node.js application that interacts with MySQL and MongoDB databases within a Kubernetes cluster.

## Project Structure 📁

Here's an overview of the project structure:

├── apply_all.sh
├── DBS
│ ├── mongo
│ │ ├── deployment.yaml
│ │ ├── pvc.yaml
│ │ ├── pv.yaml
│ │ └── service.yaml
│ └── mysql
│ ├── deployment.yaml
│ ├── pvc.yaml
│ ├── pv.yaml
│ ├── secret.yaml
│ └── service.yaml
├── ingress.yaml
├── kube-admin-pod
│ └── deployment.yaml
├── kubectl
├── kubectl.sha256
├── node-kube
│ ├── deployment.yaml
│ └── service.yaml
└── readme.md

## Components 🛠️

### Databases 📚

- **MongoDB**:
  - `deployment.yaml`: Deployment configuration for MongoDB.
  - `pvc.yaml`: Persistent Volume Claim for MongoDB.
  - `pv.yaml`: Persistent Volume for MongoDB.
  - `service.yaml`: Service to expose MongoDB.

- **MySQL**:
  - `deployment.yaml`: Deployment configuration for MySQL.
  - `pvc.yaml`: Persistent Volume Claim for MySQL.
  - `pv.yaml`: Persistent Volume for MySQL.
  - `secret.yaml`: Secret for MySQL credentials.
  - `service.yaml`: Service to expose MySQL.

### Node.js Application 🟩

- **Node-Kube**:
  - `deployment.yaml`: Deployment configuration for the Node.js application.
  - `service.yaml`: Service to expose the Node.js application.

### Other Resources 🗂️

- `apply_all.sh`: Script to apply all Kubernetes configurations.
- `ingress.yaml`: Ingress configuration for routing.
- `kube-admin-pod/deployment.yaml`: Deployment configuration for an admin pod.
- `kubectl` & `kubectl.sha256`: Kubectl binary and its checksum.

## Prerequisites 📋

Before starting, ensure you have set up the local Persistent Volumes (PVs).

## Environment Variables 🌍

The Node.js application communicates with MySQL and MongoDB using environment variables defined in the deployment files. These services are accessed within the Kubernetes cluster.

## Getting Started 🚀

1. **Set up local PVs**:
   Ensure that your local persistent volumes are configured correctly.
    ```sh
    minikube ssh
    mkdir /data/kubernetes/mongo
    mkdir /data/kubernetes/mysql
    chown 777 /data/kubernetes/mongo
    chown 777 /data/kubernetes/mysql
    ```

2. **Apply Configurations**:
   Run the following script to apply all the Kubernetes configurations:
   ```sh
   ./apply_all.sh

