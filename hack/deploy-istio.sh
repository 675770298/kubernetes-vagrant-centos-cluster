#!/bin/bash
#kubectl create serviceaccount --namespace kube-system tiller
#kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
#helm init -i jimmysong/kubernetes-helm-tiller:v2.8.2
#kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

cd ../kubernetes/istio-1.0.6
kubectl apply -f install/kubernetes/helm/helm-service-account.yaml
#helm init -i jimmysong/kubernetes-helm-tiller:v2.11.0 --service-account tiller

#helm init --upgrade -i registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.13.0 --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
helm init --service-account tiller
helm repo add stable https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
#helm init --client-only --stable-repo-url https://aliacs-app-catalog.oss-cn-hangzhou.aliyuncs.com/charts/
helm repo add incubator https://aliacs-app-catalog.oss-cn-hangzhou.aliyuncs.com/charts-incubator/
helm repo update

## istio
helm install install/kubernetes/helm/istio --name istio --namespace istio-system

kubectl get customresourcedefinition|grep istio.io
