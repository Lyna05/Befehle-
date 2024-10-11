
kubectl delete -f api-deployment.yaml
kubectl delete -f database-deployment.yaml

kubectl get deployments
kubectl get services


kubectl apply -f api-deployment.yaml
kubectl apply -f database-deployment.yaml

## apply die ganze  carpeta
kubectl apply -f .



kubectl get events


kubectl get pods


kubectl logs <pod-name>

minikube service feedback-app-frontend-service



kubectl apply -f api-deployment.yaml



kubectl get service feedback-app-api-service


kubectl describe service feedback-app-api-service


minikube service feedback-app-api-service --url


minikube ip

minikube service configmap-app-service


# Node-Status überprüfen: Überprüfe den Status der Nodes, um sicherzustellen,
# dass sie bereit sind und genügend Ressourcen verfügbar sind:

kubectl get nodes

# Details eines spezifischen Pods anzeigen:

kubectl describe pod feedback-app-api-6798bbdb45-5rrmb

# Untersuche die Logs der Container
#Die Container-Logs bieten oft direkte Hinweise
# auf Probleme innerhalb des Containers.

kubectl logs feedback-app-api-6798bbdb45-5rrmb --container feedback-app-backend-api

kubectl describe pod feedback-app-api-6798bbdb45-5rrmb

kubectl describe node NODE_NAME

kubectl describe deployment DEPLOYMENT_NAME
kubectl describe deployment feedback-app-api

kubectl describe service SERVICE_NAME
kubectl describe service feedback-app-service


#Erhöhe die Ressourcen des Clusters
Falls du feststellst, dass dein Cluster nicht genügend Ressourcen hat, erwäge, 
#die Anzahl der Nodes zu erhöhen oder die Ressourcenanforderungen zu optimieren.

minikube start --cpus=4 --memory=8192

kubectl scale deployment DEPLOYMENT_NAME --replicas=NUMBER
kubectl scale deployment feedback-app-api --replicas=2

get pods --watch


$ kubectl get configmap config-data -o yaml
#
apiVersion: v1
data:
  storage.txt: Initial configuration data
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"storage.txt":"Initial configuration data"},"kind":"ConfigMap","metadata":{"annotations":{},"name":"config-data","namespace":"default"}}
  creationTimestamp: "2024-09-19T13:30:33Z"
  name: config-data
  namespace: default
  resourceVersion: "2813"
  uid: b689a35d-f6fd-4194-81f2-32f606f43cb0


  Techstarter Admin@DESKTOP-U4LR2SM MINGW64 ~/terraform-aws-example/kubernetes-volumes (master)
$ kubectl exec -it configmap-app-deployment-7955c7d4dd-sgjrv -- sh
# 
#
# ls
app.js                          emptydir-deployment.yaml  package-lock.json
configuMap-deployment.yaml      hostPath-deploymant.yaml  package.json
dockerfile                      hostpath-deployment.yaml  persistentVolume.volume.yaml
emptyDirectory-deployment.yaml  node_modules
# ls /config
storage.txt
# cat /config/storage.txt
Initial configuration data#
# cat /config/storage.txt
Initial configuration data#

Techstarter Admin@DESKTOP-U4LR2SM MINGW64 ~/terraform-aws-example/kubernetes-volumes (master)
$ kubectl exec -it configmap-app-deployment-7955c7d4dd-sgjrv -- sh
# curl http://localhost:3000

******************

Techstarter Admin@DESKTOP-U4LR2SM MINGW64 ~/terraform-aws-example (master)
$ echo -n "postgres" | base64
cG9zdGdyZXM=

Techstarter Admin@DESKTOP-U4LR2SM MINGW64 ~/terraform-aws-example (master)
$ echo -n "password" | base64
cGFzc3dvcmQ=

Techstarter Admin@DESKTOP-U4LR2SM MINGW64 ~/terraform-aws-example (master)
$ echo -n "cG9zdGdyZXM=" | base64  --decode
postgres
Techstarter Admin@DESKTOP-U4LR2SM MINGW64 ~/terraform-aws-example (master)
$ 


************** que es? 

minikube addons enable metrics-server


**********  was ist  ***
 
k6 run loadtest.js

 PS C:\Users\Techstarter Admin\terraform-aws-example\Feedback-app\load_test> kubectl get pods --watch
NAME                                        READY   STATUS    RESTARTS      AGE
configmap-app-deployment-7955c7d4dd-sgjrv   1/1     Running   1 (12h ago)   24h
feedback-app-api-655cb8899c-7dvlh           1/1     Running   0             9h
feedback-app-database-786c779768-vnq6p      1/1     Running   0             9h
 kubectl rollout history deploy
deployment.apps/hello-world-deployment 
REVISION  CHANGE-CAUSE
1         <none>


 kubectl rollout undo deploy --to-revision=1
deployment.apps/hello-world-deployment skipped rollback (current template already matches revision 1)

 stern hello-world-deployment