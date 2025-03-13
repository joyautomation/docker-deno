ARG DENO_VERSION

FROM denoland/deno:${DENO_VERSION} AS base

# Install SSH client and GitHub CLI
RUN apt-get update \
    && apt-get install -y \
    openssh-client \
    curl \
    iputils-ping \
    vim \
    && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install gh -y \
    && rm -rf /var/lib/apt/lists/*

# Set up bash customization
COPY .bashrc /tmp/.bashrc
RUN cat /tmp/.bashrc >> /root/.bashrc && rm /tmp/.bashrc

WORKDIR /app
CMD ["tail", "-f", "/dev/null"]
