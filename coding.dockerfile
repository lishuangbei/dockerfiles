# image from ubuntu 22.04
FROM ubuntu:22.04
# set image name to coding_image
LABEL name="coding_image"
# set workdir to /workspace
WORKDIR /workspace
# add volume path in container
VOLUME /workspace/host
# expose port 80 for regular web traffic, 8888 for jupyter-lab
EXPOSE 80
EXPOSE 8888
# make it show root@scoding in command line
ENV PS1="root@coding"
# install python3.10, pip
RUN apt-get update && apt-get install -y python3.10 python3-pip
# install git, curl, wget, vim
RUN apt-get install -y git curl wget vim
# install jupyter-lab, ipywidgets
RUN pip install jupyterlab ipywidgets
# create jupyter-lab config file
RUN jupyter-lab --generate-config
# set jupyter-lab ip to '0.0.0.0'
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py
# set jupyter-lab port to 8888
RUN echo "c.NotebookApp.port = 8888" >> /root/.jupyter/jupyter_notebook_config.py
