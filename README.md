# How To Use

## helm add repo
* helm repo add paxel https://raw.githubusercontent.com/devops-paxel/helm-paxel/main
* helm repo update

## helm search chart version
* helm search repo paxel/paxel -l

## helm get values with inspect
* helm inspect values paxel/paxel --version 0.0.1 > values-0.0.1.yaml

## helm upgrade or install
* helm upgrade -i -f values-0.0.1.yaml service-a paxel/paxel --namespace production --create-namespace --version 0.0.1


