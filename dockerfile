# Use an official Python 3.10 base image
FROM python:3.10-slim

# Install required system dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        build-essential \
        python3-dev

# Install PyYAML using pip
RUN pip install PyYAML

# Copy files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
