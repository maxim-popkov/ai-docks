FROM skifmax/art-base:py310-torch201-v4

# Setup environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV USER_NAME popkov-mi
ENV HOME_DIR /home/${USER_NAME}
ENV MINICONDA_HOME ${HOME_DIR}/miniconda3
ENV CONDA_ART_ENV art-env
ENV PATH ${MINICONDA_HOME}/bin:$PATH

# Switch to root
USER root

# Copy .env and scripts to container
COPY ./toDocker/setup/.env ${HOME_DIR}/
COPY ./toDocker/setup/*.sh ${HOME_DIR}/

SHELL ["conda", "run", "-n", "art-env", "/bin/bash", "-c"]
# Run scripts
RUN mv ${HOME_DIR}/onstart.sh /root/onstart.sh && \
    chmod +x ${HOME_DIR}/*.sh && \
    ${HOME_DIR}/setup_environment.sh && \
    ${HOME_DIR}/create_directories.sh
RUN ${HOME_DIR}/install_requirements.sh

WORKDIR ${HOME_DIR}

EXPOSE 1991
CMD [ "/bin/bash" ]
# CMD ["python launch.py --listen --port 1991 --xformers --theme dark --gradio-queue"]


#wsl --list -v
#wsl --shutdown
#wsl --list -v
#wsl --export docker-desktop-data "D:\docker\wsl\data\docker-desktop-data.tar"
#wsl --unregister docker-desktop-data
#wsl --import docker-desktop-data "D:\docker\wsl\data" "D:\docker\wsl\data\docker-desktop-data.tar" --version 2


# docker build -t skifmax/art-app:v1 -f .\docker\art-app.dockerfile .
# docker push skifmax/art-app:v1 