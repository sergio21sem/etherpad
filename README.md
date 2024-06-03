# etherpad
Приложение создано для проведения совместных коопераций, онлайн митапов.


HOW is it deploy??

1. Spawn VM on cloud

YC
```yc compute instance create \     
 --name test-node \
 --zone ru-central1-a \
 --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=45 \
 --ssh-key ~/.ssh/id_rsa.pub \
--memory 4 \
--cores 2
```

2. Terraform
go to dir terraform
```
 export ACCESS_KEY="******" 
 export SECRET_KEY="****"
 terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
 terraform plan && terraform apply
```

2. .gitlab-ci.yml help you for automaticly deploy app (nginx + database +app)

оr your can install docker-compose and run:
```docker-compose up -d```



TODO list for project developing:
- enable authentification from NGINX (sso or LDAR)
- modify ci and create test stages
- start deploy from k8s
