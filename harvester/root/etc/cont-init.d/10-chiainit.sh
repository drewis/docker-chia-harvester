#!/usr/bin/with-contenv sh
set -x
export HOME=/chia

s6-setuidgid chia chia init -c ${HOME}/.chia/ca
s6-setuidgid chia chia keys add -f ${HOME}/.chia/mnemonic.txt

