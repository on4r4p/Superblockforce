#!/bin/bash

bsz=512 # or 1024, 2048, 4096 higher = faster

for i in {2..10000000}; do
    echo "--->$i<---"
    mount -o offset=$(($bsz*$i)) -t ext4 /dev/sda1 /mnt/e8b5fd5a-a074-4e90-858b-545325fae83e/
    if [ $? == 0 ]; then # whahoo!
        echo Eureka
        break
    fi
done

