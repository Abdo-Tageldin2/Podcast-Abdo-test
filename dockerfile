FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && \
    apt-get install -y \
        python3.10 \
        python3-pip \
        git \
        build-essential \
        python3-dev

# Use update-alternatives to set python3 to point to python3.10
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Make sure pip is up to date
RUN python3 -m pip install --upgrade pip

# Now install PyYAML using the correct pip
RUN pip install PyYAML

# Copy files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
