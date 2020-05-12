#!/bin/bash
NIC=${NIC:-eth0};
# PORT=${PORT:-2333};

trap rcv INT;
function rcv() {
    ethtool -K $NIC tso on;
};

chmod u+x ./net_speeder;
ethtool -K $NIC tso off;
#./net_speeder $NIC "ip";
# ./net_speeder $NIC "port $PORT";
./net_speeder $NIC "port 233" &
./net_speeder $NIC "port 2333" &
read;
