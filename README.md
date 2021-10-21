# Pré-requis :
  
  - Test sur Debian 11
  - Docker
  - Helm
  - Nginx 
  - Dans /etc/hosts : ajout de la ligne " 127.0.0.1 melissadidon.com "
 
# Création de l'image Docker - Serveur Web

Dans le fichier Dockerfile :
  - Installation et update de l'ensemble des logiciels 
  - Installation de Nginx 


1. Pour créer une image Nginx  

$ docker build -t nginx_test .


2. executer l'image Buildé

$docker run -d -p 80:80 nging_test

3. Lister les images Docker 

$docker image ls

# Kbernetes

Kubernetest est un maanger de contenaire.
Il est sur plusieurs niveaux/couches . 
- POD : La première couche qui contient le contnaire
- Deployment : Déploie sur les contnaires
- Service : il fait le lien avec le POD pour pouvour communiquer entre eux 
- ingress : permet la communicaiton entre localhost et exéterieur, il joue de reverse proxy

1. Déploiement le container nginx

$kubectl apply -f ./Kubernetes/nginx.yaml


2. Liste des déploiements

$kubectl get deployment nginx-deployment

NAME               READY   UP-TO-DATE   AVAILABLE   AGE

nginx-deployment   3/3     3            3           16m


3. Services

$ kubectl apply -f ./Kubernetes/nginx-service.yaml

kubectl get service nginx-service

NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE

nginx-service   ClusterIP   10.99.80.232   <none>        80/TCP    11s
  
  

4. Recupère la liste des pods

$ kubectl get pods
  
NAME                                READY   STATUS    RESTARTS   AGE
  
nginx-deployment-549d886486-6xnbg   1/1     Running   0          2m45s

  

# ANSIBLE 

Le playbook va dans un premier temps vérifier l'existence des packages Docker, dans le cas où ces packages ne sont pas installés, le playbook procedera à l'installation des packages.


Cette commande pour éxecuter l'ensemble des tâches regroupées.
  
$ ansible-playbook palybook.yml
