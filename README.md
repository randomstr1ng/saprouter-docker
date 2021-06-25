# SAP Router as Container

## Setup
```bash
cd saprouter-docker
docker build . -t saprouter
```

## Run
- without changing the default `saprouttab`:
```bash
docker run -dp 3299:3299 saprouter:latest
```
- with custom `saprouttab`:
```bash
docker run -v <PATH to custom SAPROUTTAB file>:/opt/saprouter/saprouttab -dp 3299:3299 saprouter:latest
```