# Primo avvio

```shell
# clone dei repository
$ git clone -b eh https://github.com/paolaguarasci/winted-ms-be be
$ git clone -b eh https://github.com/paolaguarasci/winted-ms-web web

# creazione dei file jar
$ echo -n IyEvYmluL2Jhc2gKcHJvamVjdFBhdGhMaXN0PWBmaW5kIC4vIC1kZXB0aCAtbmFtZSAibXZudyIgMj4vZGV2L251bGwgLWV4ZWMgcmVhbHBhdGgge30gXDtgCmZvciBwcm9qZWN0UGF0aCBpbiAkcHJvamVjdFBhdGhMaXN0CmRvCiAgYmFzZVBhdGg9YGRpcm5hbWUgJHByb2plY3RQYXRoYAogIGNkICRiYXNlUGF0aDsKICAkcHJvamVjdFBhdGggY2xlYW4gcGFja2FnZSAtRG1hdmVuLnRlc3Quc2tpcDsKZG9uZQ== | base64 --decode > createJarFile.sh
$ chmod +x ./createJarFile.sh && ./createJarFile.sh

# creazione del docker-compose.yml globale
$ echo -n dmVyc2lvbjogJzMuOScKaW5jbHVkZToKICAgLSBwYXRoOiB3ZWIvZG9ja2VyLWNvbXBvc2UueW1sCiAgICAgcHJvamVjdF9kaXJlY3Rvcnk6IHdlYgogICAtIHBhdGg6IGJlL2RvY2tlci1jb21wb3NlLnltbAogICAgIHByb2plY3RfZGlyZWN0b3J5OiBiZQ== | base64 --decode > docker-compose.yml

# proseguire con i passaggi al punto successivo
```

# Avvii successivi

```shell
# assicurarsi di essere nella root di progetto
$ tree ./ -L 1
./
├── be
├── createJarFile.sh
├── docker-compose.yml
└── web

# assicurarsi di non avere nulla di attivo sulle porte 3306 e 27071
# eventualmente stoppare i servizi attivi
$ sudo systemctl stop mariadb
$ sudo systemctl stop mongodb

# avviare il progetto
$ docker compose up
```

Il servizio client e' esposto su [https://localhost:4200](https://localhost:4200)

# Metodi di utilita'

```shell
# Se dovesse essere necessario fare una pulizia di immagini, container e altri
# oggetti docker lo script cleanDocker.sh elimina TUTTO tranne, se presenti, 
# gli oggetti relativi al servizio portainer. 
# Attenzione fa anche un prune del sistema docker in generale.
$ sudo ./cleanDocker.sh
```