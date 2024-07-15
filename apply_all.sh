#!/bin/bash

#!/bin/bash

# Get the Minikube IP address
MINIKUBE_IP=$(minikube ip)

# Check if minikube is running
if [[ -z "$MINIKUBE_IP" ]]; then
  echo "Error: Minikube is not running. Please start it before running this script."
  exit 1
fi

# Username for SSH access (usually 'docker')
USERNAME=docker

# Path to the directory to create
TARGET_DIR=/data/kubernetes/mysql



TARGET_DIR=/data/kubernetes/mongo

# SSH command with proper quoting for directory path
ssh -i ~/.minikube/machines/minikube/id_rsa "$USERNAME@$MINIKUBE_IP" "sudo mkdir -p '$TARGET_DIR'"





create_directory() {
    local TARGET_DIR="$1"
    USERNAME=docker

    # Get the Minikube IP address
    MINIKUBE_IP=$(minikube ip)

    # Check if minikube is running
    if [[ -z "$MINIKUBE_IP" ]]; then
    echo "Error: Minikube is not running. Please start it before running this script."
    exit 1
    fi
    
    ssh -i ~/.minikube/machines/minikube/id_rsa "$USERNAME@$MINIKUBE_IP" "sudo mkdir -p '$TARGET_DIR'"
    ssh -i ~/.minikube/machines/minikube/id_rsa "$USERNAME@$MINIKUBE_IP" "sudo chown 777 -p '$TARGET_DIR'"

    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to create directory '$TARGET_DIR' on the Minikube node."
        exit 1
    fi
    echo "Directory '$TARGET_DIR' created successfully on the Minikube node."
}

create_directory "/data/kubernetes/mongo"
create_directory "/data/kubernetes/mysql"

kubectl apply -f DBS/mongo/
kubectl apply -f DBS/mysql/
kubectl apply -f node-kube/
kubectl apply -f ingress.yaml