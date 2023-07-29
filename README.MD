# Primo avvio

```shell
# clone dei repository
$ git clone -b eh https://github.com/paolaguarasci/winted-ms-be be
$ git clone -b eh https://github.com/paolaguarasci/winted-ms-web web

# creazione dei file jar
$ echo -n IyEvYmluL2Jhc2gKcHJvamVjdFBhdGhMaXN0PWBmaW5kIC4vIC1kZXB0aCAtbmFtZSAibXZudyIgMj4vZGV2L251bGwgLWV4ZWMgcmVhbHBhdGgge30gXDtgCmZvciBwcm9qZWN0UGF0aCBpbiAkcHJvamVjdFBhdGhMaXN0CmRvCiAgYmFzZVBhdGg9YGRpcm5hbWUgJHByb2plY3RQYXRoYAogIGNkICRiYXNlUGF0aDsKICAkcHJvamVjdFBhdGggY2xlYW4gamFyOmphcjsKZG9uZQ== | base64 --decode > createJarFile.sh
$ chmod +x ./createJarFile.sh && ./createJarFile.sh

# creazione del docker-compose.yml globale
$ echo -n dmVyc2lvbjogJzMuOScKaW5jbHVkZToKICAtIHdlYi9kb2NrZXItY29tcG9zZS55bWwKICAtIGJlL2RvY2tlci1jb21wb3NlLnltbA== | base64 --decode > docker-compose.yml

# check struttura finale
$ tree ./ -L 1
./
├── be
├── createJarFile.sh
├── docker-compose.yml
└── web

# avviare il progetto
$ docker compose up
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

# avviare il progetto
$ docker compose up
```

Il servizio client e' esposto su [https://localhost:4200](https://localhost:4200)