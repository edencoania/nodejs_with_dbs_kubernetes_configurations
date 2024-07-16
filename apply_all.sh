#!/bin/bash


kubectl apply -f DBS/mongo/
kubectl apply -f DBS/mysql/
kubectl apply -f node-kube/
kubectl apply -f ingress.yaml