WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ prepare-environment introduction/getting-started
Refreshing copy of workshop repository from GitHub...
Refreshing copy of workshop repository from GitHub...

WSParticipantRole:~/environment $ kubectl get namespaces
NAME              STATUS   AGE
default           Active   13h
kube-node-lease   Active   13h
kube-public       Active   13h
kube-system       Active   13h
WSParticipantRole:~/environment $ kubectl get namespaces -l app.kubernetes.io/created-by=eks-workshop
No resources found
WSParticipantRole:~/environment $ ls ~/environment/eks-workshop/base-application/catalog
configMap.yaml  deployment.yaml  kustomization.yaml  namespace.yaml  secrets.yaml  serviceAccount.yaml  service-mysql.yaml  service.yaml  statefulset-mysql.yaml
WSParticipantRole:~/environment $ b
bash: b: command not found
WSParticipantRole:~/environment $ kubectl apply -k ~/environment/eks-workshop/base-application/catalog
namespace/catalog created
serviceaccount/catalog created
configmap/catalog created
secret/catalog-db created
service/catalog created
service/catalog-mysql created
deployment.apps/catalog created
statefulset.apps/catalog-mysql created
WSParticipantRole:~/environment $ kubectl get namespaces -l app.kubernetes.io/created-by=eks-workshop
NAME      STATUS   AGE
catalog   Active   72s
WSParticipantRole:~/environment $ kubectl get pod -n catalog
NAME                       READY   STATUS    RESTARTS      AGE
catalog-5578f9649b-lwz78   1/1     Running   2 (91s ago)   98s
catalog-mysql-0            1/1     Running   0             98s
WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ kubectl wait --for=condition=Ready pods --all -n catalog --timeout=180s
pod/catalog-5578f9649b-lwz78 condition met
pod/catalog-mysql-0 condition met
WSParticipantRole:~/environment $ ^C
WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ kubectl logs -n catalog deployment/catalog

2024/10/01 08:17:06 Running database migration...
2024/10/01 08:17:06 Schema migration applied
2024/10/01 08:17:06 Connecting to catalog-mysql:3306/catalog?timeout=5s
2024/10/01 08:17:06 invalid connection config: missing required peer IP or hostname
2024/10/01 08:17:06 Connected
2024/10/01 08:17:06 Connecting to catalog-mysql:3306/catalog?timeout=5s
2024/10/01 08:17:06 invalid connection config: missing required peer IP or hostname
2024/10/01 08:17:06 Connected
WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ kubectl get svc -n catalog

NAME            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
catalog         ClusterIP   172.20.165.190   <none>        80/TCP     9m26s
catalog-mysql   ClusterIP   172.20.198.112   <none>        3306/TCP   9m26s
WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ kubectl -n catalog exec -it \
>   deployment/catalog -- curl catalog.catalog.svc/catalogue | jq .

[
  {
    "id": "510a0d7e-8e83-4193-b483-e27e09ddc34d",
    "name": "Gentleman",
    "description": "Touch of class for a bargain.",
    "imageUrl": "/assets/gentleman.jpg",
    "price": 795,
    "count": 51,
    "tag": [
      "dress"
    ]
  },
  {
    "id": "6d62d909-f957-430e-8689-b5129c0bb75e",
    "name": "Pocket Watch",
    "description": "Properly dapper.",
    "imageUrl": "/assets/pocket_watch.jpg",
    "price": 385,
    "count": 33,
    "tag": [
      "dress"
    ]
  },
  {
    "id": "808a2de1-1aaa-4c25-a9b9-6612e8f29a38",
    "name": "Chronograf Classic",
    "description": "Spend that IPO money",
    "imageUrl": "/assets/chrono_classic.jpg",
    "price": 5100,
    "count": 9,
    "tag": [
      "dress",
      "luxury"
    ]
  },
  {
    "id": "a0a4f044-b040-410d-8ead-4de0446aec7e",
    "name": "Wood Watch",
    "description": "Looks like a tree",
    "imageUrl": "/assets/wood_watch.jpg",
    "price": 50,
    "count": 115,
    "tag": [
      "casual"
    ]
  },
  {
    "id": "ee3715be-b4ba-11ea-b3de-0242ac130004",
    "name": "Smart 3.0",
    "description": "Can tell you what you want for breakfast",
    "imageUrl": "/assets/smart_1.jpg",
    "price": 650,
    "count": 9,
    "tag": [
      "smart",
      "dress"
    ]
  },
  {
    "id": "f4ebd070-b4ba-11ea-b3de-0242ac130004",
    "name": "FitnessX",
    "description": "Touch of class for a bargain.",
    "imageUrl": "/assets/smart_2.jpg",
    "price": 180,
    "count": 76,
    "tag": [
      "smart",
      "dress"
    ]
  }
]
WSParticipantRole:~/environment $ ~/environment/eks-workshop/base-application/kustomization.yaml
bash: /home/ec2-user/environment/eks-workshop/base-application/kustomization.yaml: Permission denied
WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ kubectl apply -k ~/environment/eks-workshop/base-application

namespace/assets created
namespace/carts created
namespace/catalog unchanged
namespace/checkout created
namespace/orders created
namespace/other created
namespace/rabbitmq created
namespace/ui created
serviceaccount/assets created
serviceaccount/carts created
serviceaccount/catalog unchanged
serviceaccount/checkout created
serviceaccount/orders created
serviceaccount/rabbitmq created
serviceaccount/ui created
role.rbac.authorization.k8s.io/rabbitmq-endpoint-reader created
rolebinding.rbac.authorization.k8s.io/rabbitmq-endpoint-reader created
configmap/assets created
configmap/carts created
configmap/catalog unchanged
configmap/checkout created
configmap/orders created
configmap/dummy created
configmap/ui created
secret/catalog-db unchanged
secret/orders-db created
secret/rabbitmq created
secret/rabbitmq-config created
service/assets created
service/carts created
service/carts-dynamodb created
service/catalog unchanged
service/catalog-mysql unchanged
service/checkout created
service/checkout-redis created
service/orders created
service/orders-mysql created
service/rabbitmq created
service/rabbitmq-headless created
service/ui created
deployment.apps/assets created
deployment.apps/carts created
deployment.apps/carts-dynamodb created
deployment.apps/catalog unchanged
deployment.apps/checkout created
deployment.apps/checkout-redis created
deployment.apps/orders created
deployment.apps/orders-mysql created
deployment.apps/ui created
statefulset.apps/catalog-mysql unchanged
statefulset.apps/rabbitmq created
WSParticipantRole:~/environment $ 
WSParticipantRole:~/environment $ kubectl wait --for=condition=Ready --timeout=180s pods \>   -l app.kubernetes.io/created-by=eks-workshop -A
pod/assets-784b5f5656-8hx52 condition met
pod/carts-5475469b7c-6xjlh condition met
pod/carts-dynamodb-69fc586887-m2cjf condition met
pod/catalog-5578f9649b-lwz78 condition met
pod/catalog-mysql-0 condition met
pod/checkout-84c6769ddd-sh2kx condition met
pod/checkout-redis-76bc7cb6f9-j5v2w condition met
pod/orders-6d74499d87-jhkcz condition met
pod/orders-mysql-6fbd688d4b-8bbgj condition met
pod/ui-5f4d85f85f-dmrd9 condition met
WSParticipantRole:~/environment $ kubectl get namespaces -l app.kubernetes.io/created-by=eks-workshop
NAME       STATUS   AGE
assets     Active   87s
carts      Active   87s
catalog    Active   13m
checkout   Active   87s
orders     Active   87s
other      Active   87s
rabbitmq   Active   87s
ui         Active   86s
WSParticipantRole:~/environment $ kubectl get deployment -l app.kubernetes.io/created-by=eks-workshop -A
NAMESPACE   NAME             READY   UP-TO-DATE   AVAILABLE   AGE
assets      assets           1/1     1            1           3m56s
carts       carts            1/1     1            1           3m56s
carts       carts-dynamodb   1/1     1            1           3m56s
catalog     catalog          1/1     1            1           16m
checkout    checkout         1/1     1            1           3m56s
checkout    checkout-redis   1/1     1            1           3m56s
orders      orders           1/1     1            1           3m56s
orders      orders-mysql     1/1     1            1           3m56s
ui          ui               1/1     1            1           3m56s
WSParticipantRole:~/environment $ 