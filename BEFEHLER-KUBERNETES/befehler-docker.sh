Construir la imagen con la etiqueta correcta:

$ minikube update-check

docker build -t rosaflores/volumes-docker-app:v1 .

#ejecutar el contenedor 
docker run -d -p 3000:3000 nombre_imagen


docker login

docker push rosaflores/volumes-docker-app:v1

# para ejecutar un docker.compose.yml   // o reiniciar cuando estan detenidos
# Esto iniciará todos los servicios definidos en el archivo docker-compose.yml, 
# conectándolos entre ellos, y exponiéndolos en los puertos adecuados.
docker-compose up -d   

#verificar el estado de los contenedore
docker-compose ps

# parar los contenedore
docker-compose stop

#detener y elimnar 
docker-compose down


#elimina todo 
$ docker stop $(docker ps -aq) && docker rm $(docker ps -aq)


docker network ls

docker inspect postgres-db

*delete all
docker stop $(docker ps -q)

*start all
docker start $(docker ps -aq)

***
**Para conectar feedback-app a la red:

docker network connect feedback-app-nw feedback-app

**Para conectar postgres-db a la red:


docker network connect feedback-app-nw postgres-db
