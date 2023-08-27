# export LD_LIBRARY_PATH=/home/popkov-mi/miniconda3/envs/art-env/lib:$LD_LIBRARY_PATH
# нужно для работы curl \ git и для работы bitsandbytes +cudatoolkit
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.4/targets/x86_64-linux/lib:/usr/lib/x86_64-linux-gnu:/home/popkov-mi/miniconda3/envs/art-env/lib:$LD_LIBRARY_PATH' >> /home/popkov-mi/.bashrc
rm /usr/lib/x86_64-linux-gnu/libstdc++.so.6
cp /home/popkov-mi/miniconda3/envs/art-env/lib/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6
conda install cudatoolkit

source ~/.bashrc
