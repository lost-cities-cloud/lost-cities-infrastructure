Before publishing `lostcities-common` you need to add `GITHUB_ACTOR` and `GITHUB_TOKEN` to your environmental variables.


```bash
bash <(curl -s https://raw.githubusercontent.com/lostcities-cloud/lostcities-infrastructure/master/bin/install.sh)
lsc down build up
```

* Stage environment
  * [x] Setup Vault 
  * [x] Add terraform
  * [x] Adding ansible for setting up services
  * [x] Add certbot for ssl
  * [ ] Add Dynamic DNS for nginx
  * [ ] Add prometheus
  * [ ] Add promtail
  * [ ] Add loki
  * [ ] Consider Grafana in the cloud


* Accounts
  * [x] Fix registration
  * [ ] Move to OAuth + JWT
  * [ ] Fix roles and authorities
  * [x] Support JWT on backend
  * [x] Create front end for registration
  * [x] Create front end for login
  * [x] Simple JWT store on frontend
* Matchmaking
  * [x] Write simple manual matchmaking
  * [ ] Smarter automatic matchmaking
  * [ ] Calculate elo on match completion
* Processing commands
  * [x] Command Processor Queue
  * [x] Command Processor Listener
  * [x] Add game completion Queue
* Gamestate Service
  * [ ] Recieve gamestate from command processor
  * [ ] Store in Redis
  * [ ] Expose debug ViewModel
  * [ ] Expose player ViewModel

* Debug game ui
  * [ ] Simple ui for showing gamestate
  * [ ] Add game actions to debug ui
* Official game ui
  * [ ] Draw hand
  * [ ] Draw deck
  * [ ] Draw my play area

* Development Environment
  * [x] Expose debugging locally
  * [ ] Add Jib
* Production
  * [ ] Create a container registry in azure (https://azure.microsoft.com/en-us/pricing/details/container-registry/)
  * [ ] Create Build Pack images for java
  * [ ] Figure out build strategy for Vue  


```docker login ghcr.io -u USERNAME --password-stdi```

Container Image 
https://www.flatcar.org/docs/latest/installing/cloud/digitalocean/#docslatest
https://rancher.com/docs/os/v1.x/en/support/

Google Secret Manager:
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret

App Servers
https://registry.terraform.io/providers/aliyun/alicloud/latest/docs

RabbitMQ Cloudamqp:
https://registry.terraform.io/providers/cloudamqp/cloudamqp/latest/docs

Redis Upstash:
https://registry.terraform.io/providers/upstash/upstash/latest

Redis Redislabs:
https://registry.terraform.io/modules/TobyHFerguson/Redislabs-Cloud-Account-Resources/aws/latest

Postgres ElephantSql:
https://www.elephantsql.com/blog/elephantsql_terraform_plugin.html


