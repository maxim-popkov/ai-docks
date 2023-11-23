#!/bin/bash
# Install cudatoolkit and symbolic links

# Install cudatoolkit
mamba install -y cudatoolkit

# Create symbolic link for libstdc++.so.6
ln -sf /home/popkov-mi/miniconda3/envs/art-env/lib/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6
# # Make link unmutable (for  vast.ai, vast.ai on docker start crash links)
# chattr +i /usr/lib/x86_64-linux-gnu/libstdc++.so.6
