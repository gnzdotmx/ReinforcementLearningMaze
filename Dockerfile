# Base image: Use the official image lab-3.5.0
# https://hub.docker.com/r/jupyter/base-notebook/tags?page=1&name=lab-
FROM jupyter/base-notebook:lab-3.5.0

# Working directory
USER jovyan
WORKDIR /home/jovyan/data
COPY ./requirements.txt /tmp

# Install python dependencies
RUN pip3 install -r /tmp/requirements.txt

# Run commands as root to install required packages
USER root
RUN chown -R jovyan:users /home/jovyan/data
RUN chmod 755 /home/jovyan/data
RUN chmod 755 /home/jovyan

# Run commands as normal user
USER jovyan