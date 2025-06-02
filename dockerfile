FROM ubuntu:latest

# Add the deadsnakes PPA to install Python 3.10
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update

# Install required packages
RUN apt-get install -y \
    python3.10-full \
    python3-pip \
    git \
    build-essential \
    python3-dev

# Use update-alternatives to set python3 to point to python3.10
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Make sure pip is up to date
RUN python3 -m pip install --upgrade pip

# Install PyYAML
RUN pip install PyYAML

# Copy files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
