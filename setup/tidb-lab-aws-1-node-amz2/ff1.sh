#!/bin/bash
./01-install-tiup.sh
./02-precheck-and-fix-nodes.sh
./03-create-cluster.sh
./start-cluster.sh
sleep 25;
./check-cluster.sh
