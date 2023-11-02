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
