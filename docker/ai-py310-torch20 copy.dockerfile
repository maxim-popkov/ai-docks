# Base image
FROM nvidia/cuda:11.4.3-base-ubuntu20.04

# Setup environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV USER_NAME popkov-mi
ENV HOME_DIR /home/${USER_NAME}
ENV MINICONDA_HOME ${HOME_DIR}/miniconda3
ENV CONDA_ART_ENV art-env
ENV PATH ${MINICONDA_HOME}/bin:$PATH

# Set bash as current shell
SHELL ["/bin/bash", "-c"]

# Add bash by default for new users
# Create a non-root user and give ownership of home directory
RUN echo "SHELL=/bin/bash" >> /etc/default/useradd && \
    useradd -m ${USER_NAME} && \
    chown -R ${USER_NAME}:${USER_NAME} ${HOME_DIR} && \
    touch /root/.no_auto_tmux

# Create necessary directories
RUN mkdir -p ${HOME_DIR}/install/ && \
    mkdir -p ${HOME_DIR}/sd-app/{cn15-models,cn21-models,cn-annotator,sd15-models,sd21-models,vae} && \
    mkdir -p ${HOME_DIR}/kand-app/{v1,v2}

# Copy necessary files
COPY ../toDocker/env-config ${HOME_DIR}/install/env-config
COPY ../toDocker/pip-reqs ${HOME_DIR}/install/pip-reqs
COPY ../toDocker/utils ${HOME_DIR}/utils
COPY ../toDocker/install ${HOME_DIR}/

# Installation process
RUN apt-get update && \
    apt-get install -y bzip2 ca-certificates libxext6 libsm6 libxrender1 libgoogle-perftools-dev libarchive13 libgl1 libglib2.0-0 --no-install-recommends && \
    apt-get install -y wget curl vim git git-lfs aria2 gcc g++ build-essential cmake --no-install-recommends

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh -O ${HOME_DIR}/miniconda.sh && \
    bash ${HOME_DIR}/miniconda.sh -b -p ${MINICONDA_HOME} && \
    rm ${HOME_DIR}/miniconda.sh && \
    ln -s ${MINICONDA_HOME}/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". ${MINICONDA_HOME}/etc/profile.d/conda.sh" >> /root/.bashrc && \
    chown -R ${USER_NAME}:${USER_NAME} ${HOME_DIR} && \
    chmod -R 755 ${HOME_DIR}


USER ${USER_NAME}
RUN echo ". ${MINICONDA_HOME}/etc/profile.d/conda.sh" >> ${HOME_DIR}/.bashrc && \
    find ${MINICONDA_HOME}/ -follow -type f -name '*.a' -delete && \
    find ${MINICONDA_HOME}/ -follow -type f -name '*.js.map' -delete && \
    ${MINICONDA_HOME}/bin/conda install -y -c conda-forge mamba && \
    ${MINICONDA_HOME}/bin/conda clean -afy && \
    conda update conda && \
    mamba env create --name ${CONDA_ART_ENV} -f ${HOME_DIR}/install/env-config/art-env.yaml && \
    echo "conda activate ${CONDA_ART_ENV}" >> ${HOME_DIR}/.bashrc && \
    conda init bash

ENV PATH ${MINICONDA_HOME}/envs/${CONDA_ART_ENV}/bin:$PATH

# RUN echo "conda activate art-env" >> ${HOME_DIR}/.bashrc && \
#     conda init bash

# Copy necessary files
COPY ../toDocker/env-deps ${HOME_DIR}/install/env-deps

SHELL ["conda", "run", "-n", "art-env", "/bin/bash", "-c"]

RUN conda init bash && \
    pip --no-cache-dir -q install ${HOME_DIR}/install/env-deps/torch-2.0.1+cu118-cp310-cp310-linux_x86_64.whl -U && \
    pip --no-cache-dir -q install ${HOME_DIR}/install/env-deps/torchvision-0.15.2+cu118-cp310-cp310-linux_x86_64.whl -U && \
    pip --no-cache-dir -q install ${HOME_DIR}/install/env-deps/flash_attn-1.0.1-cp310-cp310-linux_x86_64.whl -U && \
    pip --no-cache-dir -q install -r ${HOME_DIR}/install/pip-reqs/requirements-all.txt

USER root

RUN apt-get install -y python3-tk && \
    apt-get clean && \
    rm -rf ${HOME_DIR}/install/env-deps/

EXPOSE 1991

CMD [ "/bin/bash" ]


######## old

# FROM nvidia/cuda:11.4.3-base-ubuntu20.04
# ENV DEBIAN_FRONTEND noninteractive
# ENV HOME_DIR /home/popkov-mi
# ENV PATH ${HOME_DIR}/miniconda3/bin:$PATH


# # set bash as current shell
# SHELL ["/bin/bash", "-c"]
# RUN chsh -s /bin/bash && \
#     mkdir -p ${HOME_DIR}/install/ && \
#     mkdir -p ${HOME_DIR}/sd-app/{v1,v2} && \
#     mkdir -p ${HOME_DIR}/kand-app/{v1,v2} && \
#     mkdir -p ${HOME_DIR}/sd-app/{cn15-models,cn21-models,cn-annotator,sd15-models,sd21-models,vae} && \
#     touch ~/.no_auto_tmux

# COPY ../toDocker/env-config  ${HOME_DIR}/install/env-config
# COPY ../toDocker/pip-reqs ${HOME_DIR}/install/pip-reqs

# # install
# RUN apt-get update && \
#     apt-get install -y bzip2 ca-certificates libxext6 libsm6 libxrender1 && \
#     apt-get install -y libgoogle-perftools-dev && \
#     apt-get install -y libarchive13 && \
#     apt-get install -y libgl1 libglib2.0-0 wget curl vim git git-lfs && \ 
#     # python3-pip python-is-python3 && \
#     apt-get install -y --no-install-recommends aria2 && \
#     apt-get clean && \
#     # install anaconda
#     wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh -O ${HOME_DIR}/miniconda.sh && \
#     /bin/bash ${HOME_DIR}/miniconda.sh -b -p ${HOME_DIR}/miniconda3 && \
#     rm ${HOME_DIR}/miniconda.sh && \
#     ln -s ${HOME_DIR}/miniconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
#     echo ". ${HOME_DIR}/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc && \
#     find ${HOME_DIR}/miniconda3/ -follow -type f -name '*.a' -delete && \
#     find ${HOME_DIR}/miniconda3/ -follow -type f -name '*.js.map' -delete && \
#     ${HOME_DIR}/miniconda3/bin/conda install -y -c conda-forge mamba && \
#     ${HOME_DIR}/miniconda3/bin/conda clean -afy && \
#     # conda create env
#     conda update conda && \
#     mamba env create --name art-env -f ${HOME_DIR}/install/env-config/art-env.yaml && \
#     echo "conda activate art-env" >> ~/.bashrc && \
#     conda init bash

# ENV PATH ${HOME_DIR}/miniconda3/envs/art-env/bin:$PATH
# ENV CONDA_DEFAULT_ENV art-env

# COPY ../toDocker/env-deps ${HOME_DIR}/install/env-deps
# SHELL ["conda", "run", "-n", "art-env", "/bin/bash", "-c"]
# RUN pip --no-cache-dir -q install ${HOME_DIR}/install/env-deps/torch-2.0.1+cu118-cp310-cp310-linux_x86_64.whl -U && \
#     pip --no-cache-dir -q install ${HOME_DIR}/install/env-deps/torchvision-0.15.2+cu118-cp310-cp310-linux_x86_64.whl -U && \
#     pip --no-cache-dir -q install ${HOME_DIR}/install/env-deps/flash_attn-1.0.1-cp310-cp310-linux_x86_64.whl -U && \
#     pip --no-cache-dir -q install -r ${HOME_DIR}/install/pip-reqs/requirements-all.txt && \
#     apt-get install -y python3-tk && \
#     apt-get clean && \
#     rm -rf ${HOME_DIR}/install/env-deps/


# EXPOSE 1991

# CMD [ "/bin/bash" ]

# tar -czvf kand-app.tar.gz -C /home/popkov-mi/miniconda3/envs kand-app
# tar -czvf app.tar.gz -C /home/popkov-mi/kand-app/v1/ app

# docker cp stupefied_kepler:/root/kand-app.tar.gz ./
# docker cp stupefied_kepler:/root/app.tar.gz ./


# tar -czvf kand-app.tar.gz -C /home/popkov-mi/miniconda3/envs kand-app
# tar -czvf huggingface.tar.gz -C /root/.cache huggingface
# docker cp sd-app:/root/huggingface.tar.gz ./

# python launch.py --skip-torch-cuda-test --skip-version-check --no-download-sd-model --xformers
# !aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/realistic-vision-v20/resolve/main/realisticVisionV20_v20.safetensors -d /home/popkov-mi/sd-app/stable-diffusion-webui/models/Stable-diffusion -o realisticVisionV20_v20.safetensors



#wsl --list -v
#wsl --shutdown
#wsl --list -v
#wsl --export docker-desktop-data "D:\docker\wsl\data\docker-desktop-data.tar"
#wsl --unregister docker-desktop-data
#wsl --import docker-desktop-data "D:\docker\wsl\data" "D:\docker\wsl\data\docker-desktop-data.tar" --version 2

# RUN apt-get update -y && \
#     apt-get upgrade -y && \
#     apt-get install -y libgoogle-perftools-dev && \
#     apt-get install -y libgl1 libglib2.0-0 wget vim git git-lfs python3-pip python-is-python3 && \
#     apt-get install -y --no-install-recommends aria2 && \
#     apt-get clean

# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh -O miniconda.sh && \
#     chmod +x miniconda.sh && \
#     ./miniconda.sh -b -p ~/miniconda && \
#     eval "$(~/miniconda/bin/conda shell.bash hook)" && \
#     /bin/bash -c "source ~/miniconda/bin/activate" && 

# CMD [ "/bin/bash" ]


# docker build -t skifmax/art-base:py310-torch201-v3 -f .\docker\ai-py310-torch20.dockerfile .
# docker push skifmax/art-base:py310-torch201-v1 
# #docker build -t sd-app -f .\Dockerfile.app .
# docker run -it --rm skifmax/kand-app:v1.0 /bin/bash
# docker build -t skifmax/kand-app:v1.0 -f .\Dockerfile.base-cuda11-pth20 .
# docker push skifmax/kand-app:v1.0 


# python src/kubin.py \
#   --cache-dir="/home/popkov-mi/kand-app/kubin/models" \
#   --output-dir="/home/popkov-mi/kand-app/kubin/output" \
#   --disabled-extensions="" \
#   --share="gradio" \
#   --server-name="0.0.0.0" \
#   --server-port="1991"
#   --use-flash-attention




