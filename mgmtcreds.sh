#!/bin/bash
kubectl apply -f pan-mgmt-serviceaccount.yaml
kubectl apply -f pan-cni-serviceaccount.yaml
kubectl apply -f plugin-serviceaccount.yaml
#kubectl apply -f pan-cni-configmap.yaml
#kubectl apply -f pan-cn-ngfw-svc.yaml
#kubectl apply -f pan-cni.yaml
kubectl apply -f pan-cn-mgmt-secret.yaml
kubectl apply -f pan-cn-mgmt-configmap.yaml
kubectl apply -f pan-cn-mgmt-slot-crd.yaml
kubectl apply -f pan-cn-mgmt-slot-cr.yaml
kubectl apply -f pan-cn-mgmt-secret.yaml
#kubectl apply -f pan-cn-mgmt.yaml
kubectl apply -f dummy-mgmt-pods.yml
rm *.json
rm 'file_name.json[v]'
MY_TOKEN=`kubectl get serviceaccounts pan-plugin-user -n kube-system -o jsonpath='{.secrets[0].name}'`
kubectl -n kube-system get secret $MY_TOKEN -o json > file_name.json[v]
kubectl -n kube-system get secret $MY_TOKEN -n kube-system -o json > plugin-svc-acct.json
#while [ 1 ]; do kubectl get pods -n kube-system -l app=pan-mgmt; sleep 3; done
