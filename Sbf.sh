#!/bin/bash

max_block_number=200781  # CHANGEME
device=/dev/sda1 # CHANGEME
offset=0; 
cont=1; 
while [[ cont -eq 1 ]]; do 
    sudo mount -t ext3 -o ro,sb=$offset "$device" /mnt > /dev/null 2>&1; 
    suc=$?; 
    if [[ suc -ne 32 ]]; then 
        cont=0; 
        echo "found something at $offset"; 
    else 
        echo "failed at $offset ($suc)"; 
        offset=$((offset + 1)); 
        if [[ $offset -gt $max_block_number ]]; then
            cont=0; 
            echo "didn't find anything at all"; 
        fi; 
    fi; 
done
