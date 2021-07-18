#!/usr/bin/with-contenv sh

PUID=${USER_ID:-1000}
PGID=${GROUP_ID:-1000}

groupmod -o -g "$PGID" chia
usermod -o -u "$PUID" chia

echo "
chia uid: $(id -u chia)
chia gid: $(id -g chia)
"

