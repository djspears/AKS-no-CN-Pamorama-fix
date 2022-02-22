#!/bin/bash
kubectl delete -f pan-cn-ngfw.yaml
kubectl delete -f pan-cn-ngfw-configmap.yaml
kubectl delete -f pan-cn-mgmt.yaml
kubectl delete -f pan-cn-mgmt-configmap.yaml
kubectl delete -f pan-cn-mgmt-secret.yaml
kubectl delete -f pan-cn-mgmt-slot-cr.yaml
kubectl delete -f pan-cn-mgmt-slot-crd.yaml
kubectl delete -f pan-cn-mgmt-configmap.yaml
kubectl delete -f pan-cn-mgmt-secret.yaml
kubectl delete -f pan-cni.yaml
kubectl delete -f pan-cn-ngfw-svc.yaml
kubectl delete -f pan-cni-configmap.yaml
kubectl delete -f plugin-serviceaccount.yaml
kubectl delete -f pan-mgmt-serviceaccount.yaml
kubectl delete -f pan-cni-serviceaccount.yaml
kubectl get pvc -n kube-system | grep pan | awk '{print $1}' | while read line; do kubectl delete pvc -n kube-system $line; done
