Before publishing `lostcities-common` you need to add `GITHUB_ACTOR` and `GITHUB_TOKEN` to your environmental variables.


```bash
bash <(curl -s https://raw.githubusercontent.com/lostcities-cloud/lostcities-infrastructure/master/install.sh)
lsc down build up
```

* Development Environment
  * [ ] Expose debugging locally
* Production
  * [ ] Create Build Pack images for java
  * [ ] Figure out build strategy for Vue  

* Authentication
  * [x] Support JWT on backend
  * [x] Create front end for registration
  * [x] Create front end for login
  * [x] Simple JWT store on frontend
* Matchmaking
  * [ ] Write simple manual matchmaking
  * [ ] Smarter automatic matchmaking
  * [ ] Calculate elo on match completion
* Processing commands
  * [ ] Command Processor Queue
  * [ ] Command Processor Listener
  * [ ] Add game completion Queue
* Gamestate Service
  * [ ] Recieve gamestate from command processor
  * [ ] Store in Mongo
  * [ ] Expose debug ViewModel
  * [ ] Expose player ViewModel

* Debug game ui
  * [ ] Simple ui for showing gamestate
  * [ ] Add game actions to debug ui
* Official game ui
  * [ ] Draw hand
  * [ ] Draw deck
  * [ ] Draw my play area
