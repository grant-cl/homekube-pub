# homekube

sudo kubeadm init --control-plane-endpoint=control.kube --pod-network-cidr=10.220.0.0/16 --service-cidr=10.221.0.0/16

kubectl create secret generic smbcreds --from-literal username=USERNAME --from-literal password="PASSWORD"

CREATE DATABASE keycloak CHARACTER SET utf8 COLLATE utf8_unicode_ci

CREATE USER 'keycloak'@'%' IDENTIFIED BY 'keycloak';

GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'%';

