FROM ubuntu:25.10

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=dumb

# Base tools needed for repo setup
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    less \
    lsb-release \
    unzip \
    vim \
    wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Google Cloud CLI
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
      | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
      > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    apt-get update && apt-get install -y google-cloud-cli \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# AWS CLI v2
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o /tmp/awscliv2.zip && \
    unzip -q /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/awscliv2.zip /tmp/aws

# MongoDB database tools
RUN curl -fsSL "https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2404-x86_64-100.14.1.deb" -o /tmp/mongodb-database-tools.deb && \
    apt-get update && apt-get install -y /tmp/mongodb-database-tools.deb \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/mongodb-database-tools.deb

# kubectl
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.35/deb/Release.key \
      | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.35/deb/ /" \
      > /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && apt-get install -y kubectl \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# MariaDB client and PostgreSQL client
RUN apt-get update && apt-get install -y \
    mariadb-client \
    msmtp \
    postgresql-client \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
