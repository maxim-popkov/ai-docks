FROM skifmax/art-base:py310-torch201-v3

# Setup environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV USER_NAME popkov-mi
ENV HOME_DIR /home/${USER_NAME}
ENV MINICONDA_HOME ${HOME_DIR}/miniconda3
ENV CONDA_ART_ENV art-env
ENV PATH ${MINICONDA_HOME}/bin:$PATH

USER ${USER_NAME}
# Set working directory
WORKDIR /home/popkov-mi/
# Copy all the tar archives from your local system into the Docker container
RUN mkdir /home/popkov-mi/temp
COPY ../archives/*.tar.gz.* /home/popkov-mi/temp

# Create directories
RUN mkdir -p /home/popkov-mi/.cache && \
    mkdir -p /home/popkov-mi/miniconda3/envs/art-env && \
    mkdir -p /home/popkov-mi/sd-app/v1/auto && \
    mkdir -p /home/popkov-mi/.config && \
    mkdir -p /home/popkov-mi/.insightface && \
    mkdir -p /home/popkov-mi/.keras && \
    mkdir -p /home/popkov-mi/.nv && \
    mkdir -p /home/popkov-mi/.cache && \
    mkdir -p /home/popkov-mi/.ifnude && \
    mkdir -p /home/popkov-mi/.ipython && \
    mkdir -p /home/popkov-mi/.local && \
    mkdir -p /home/popkov-mi/sd-app/cn-annotator && \
    mkdir -p /home/popkov-mi/sd-app/cn15-models && \
    mkdir -p /home/popkov-mi/sd-app/cn21-models && \
    mkdir -p /home/popkov-mi/sd-app/sd15-models && \
    mkdir -p /home/popkov-mi/sd-app/sd21-models && \
    mkdir -p /home/popkov-mi/sd-app/vae 

# Extract the archives to their respective directories
# RUN for file in `ls *.tar.gz.*`; do cat $file | gunzip | tar -xvf - -C /; done
# RUN for file in `ls *.tar.gz.*`; do cat $file | gunzip | tar -xvf - -C /; rm $file; done
RUN for file in /home/popkov-mi/temp/*.tar.gz.*; do cat $file | gunzip | tar -xvf - -C /; rm $file; done


# Set the shell to use conda
SHELL ["conda", "run", "-n", "art-env", "/bin/bash", "-c"]

EXPOSE 1991
# Define the command to start the app
CMD ["python launch.py --listen --port 1991 --xformers --theme dark --gradio-queue"]




# docker build -t skifmax/art-auto1111:v1 -f .\docker\art.dockerfile .
# docker build -t skifmax/art-auto1111:v1 -f .\docker\art.dockerfile .

# docker push skifmax/art-base:py310-torch201-v1 
# docker push skifmax/art-auto1111:v1 