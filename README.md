# Debian Apt Cacher (apt-cacher-ng) Docker

Build the container.

```
./build.sh
```

Run the container.

```
docker run \
    -d --restart unless-stopped \
    --name debian-apt-cacher \
    -it \
    -v `pwd`/cache:/cache \
    -p 3142:3142 \
    williamhaley/debian-apt-cacher \
    /bin/cacher
```

On clients, set the address of the proxy server.

```
printf 'Acquire::http { Proxy "http://<address>:3142"; }' > /etc/apt/apt.conf.d/02proxy
```

See [Debian's AptCacherNg article](https://wiki.debian.org/AptCacherNg).

