# Overview

Use at your own risk

Start by editing the `docker-compose.yaml` to suit.

The idea is that persistent storage is bind mounted in so upgrades and restarts require no further intervention beyond initial setup. The containers assume you already have a chia config (`~/.chia`), copy this somewhere else e.g `/srv/chia/config`  for the bind mount into `/chia/.chia`. The container imports your key from `/chia/.chia/nmemonic.txt` and the full node's ca from `/chia/.chia/ca` file see `gui/root/etc/cont-init.d/10-chiainit.sh`

## Directory structure of config
- /srv/chia/config
  - mainnet
  - nmemonic.txt
  - ca

# Remote Harvester

Run the container
```
docker-compose -f harvester.yaml -p chia up --build -d
```

## First time init

For setting up a new harvester, still need some manual config
```
docker exec -it -u chia chia_harvester_1 bash
# Increase logging to INFO or DEBUG
chia configure --log-level DEBUG
# Set remote farmer peer
chia configure --set-farmer-peer 192.168.10.2:8447
# Set plots dir
chia plots add -d /chia-plots-1
```
Then bring container `down` then `up`

# Issues

- New certificate is generated on each start, seems to work fine, but pool will show multiple harvesters when restarted
- Lots of TODOs

