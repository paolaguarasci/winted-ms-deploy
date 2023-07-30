# Nota
Questo readme e' pensato per essere autonomo quindi gli script a cui fa riferimento sono stati riportati per intero (in base64 per problemi di codifica).
Eventualmente questo stesso readme e tutti i file necessari al deploy si trovano in [questo](https://github.com/paolaguarasci/winted-ms-deploy.git) repository che si puo' clonare e usare come root folder per il deploy del progetto.

# Primo avvio

```shell
# clone dei repository
$ git clone -b eh https://github.com/paolaguarasci/winted-ms-be.git be
$ git clone -b eh https://github.com/paolaguarasci/winted-ms-web.git web

# creazione dei file jar
$ echo -n IyEvYmluL2Jhc2gKcHJvamVjdFBhdGhMaXN0PWBmaW5kIC4vIC1kZXB0aCAtbmFtZSAibXZudyIgMj4vZGV2L251bGwgLWV4ZWMgcmVhbHBhdGgge30gXDtgCmZvciBwcm9qZWN0UGF0aCBpbiAkcHJvamVjdFBhdGhMaXN0CmRvCiAgYmFzZVBhdGg9YGRpcm5hbWUgJHByb2plY3RQYXRoYAogIGNkICRiYXNlUGF0aDsKICAkcHJvamVjdFBhdGggY2xlYW4gcGFja2FnZSAtRG1hdmVuLnRlc3Quc2tpcDsKZG9uZQ== | base64 --decode > createJarFile.sh
$ chmod +x ./createJarFile.sh 
$ ./createJarFile.sh

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
$ echo -n IyEvYmluL2Jhc2gKCmNvbnRhaW5lckxpc3Q9YHN1ZG8gZG9ja2VyIHBzIC1hIHwgZ3JlcCAtdiBwb3J0YWluZXIgfCBncmVwIC12IE5BTUVTIHwgYXdrICd7IHByaW50ICQxIH0nYApzdWRvIGRvY2tlciBzdG9wICRjb250YWluZXJMaXN0CnN1ZG8gZG9ja2VyIHJtICRjb250YWluZXJMaXN0CgppbWFnZUxpc3Q9YHN1ZG8gZG9ja2VyIGltYWdlIGxzIC1hIHwgZ3JlcCAtdiBwb3J0YWluZXIgfCBncmVwIC12IFJFUE9TSVRPUlkgfCBhd2sgJ3sgcHJpbnQgJDEgfSdgCnN1ZG8gZG9ja2VyIGltYWdlIHJtICRpbWFnZUxpc3QKCnZvbHVtZUxpc3Q9YHN1ZG8gZG9ja2VyIHZvbHVtZSBscyB8IGdyZXAgLXYgcG9ydGFpbmVyIHwgZ3JlcCAtdiBEUklWRVIgfCBhd2sgJ3sgcHJpbnQgJDIgfSdgCnN1ZG8gZG9ja2VyIHZvbHVtZSBybSAkdm9sdW1lTGlzdAoKc3VkbyBkb2NrZXIgbmV0d29yayBybSB3aW50ZWRfbXNfc3ByaW5nLWNsb3VkLW5ldHdvcmsKCgpzdWRvIGRvY2tlciBzeXN0ZW0gcHJ1bmUgLWFm | base64 --decode > cleanDocker.sh 
$ chmod +x ./cleanDocker.sh
$ sudo ./cleanDocker.sh
```

# Demo
[<img src="https://img.youtube.com/vi/kCgPA-NWSTA/hqdefault.jpg" width="600" height="300"/>](https://www.youtube.com/embed/kCgPA-NWSTA)
<iframe width="560" height="315" src="https://www.youtube.com/embed/kCgPA-NWSTA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
