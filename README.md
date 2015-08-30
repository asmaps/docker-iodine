Build and run:

```
docker build -t iodine .
docker run --rm -ti --privileged -p 53:53/udp -e IODINE_HOST=<tunneldomain> -e IODINE_PASSWORD=<pass> iodine
```
