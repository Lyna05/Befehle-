helm repo add jenkins https://charts.jenkins.io

helm repo update

helm install jenkins jenkins/jenkins --set controller.serviceType=NodePort --set controller.nodePort=30000 als administrator password:   kubectl exec --namespace default -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo

password: iWZjqrMJRbbdK6yikiYlK0
user: admin

******  inicializar JENKINS en el browser 

minikube service jenkins   //       

kubectl apply -f jenkins-deployment.yaml

*********  kubernetes-jenkins

kubectl apply -f  jenkins-admin-role.yaml
kubectl apply -f  jenkins-sa.yaml
kubectl apply -f  jenkins-pod-template.yaml
kubectl apply -f  jenkins-sa-role-binding.yaml
kubectl apply -f  jenkins-deployment-role.yaml

******* kubernetes

kubectl apply -f  api-deployment.yaml
kubectl apply -f  configmap.yaml
kubectl apply -f  database-deployment.yaml
kubectl apply -f  database-volume.yaml
kubectl apply -f  secret.yaml

********** kubernetes_gke                         

kubectl apply -f  0_namespace.yaml                                           
kubectl apply -f  1_configmap.yaml
kubectl apply -f  1_secret.yaml
kubectl apply -f  2_database-deployment.yaml
kubectl apply -f  3_deployment.yaml

docker-compose up -d   


