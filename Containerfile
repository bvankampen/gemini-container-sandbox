FROM opensuse/tumbleweed

RUN zypper --non-interactive refresh && \
    zypper --non-interactive install -y \
    curl \
    git \
    bash \
    vim \
    make \
    python3 \
    gcc \
    git-lfs \
    tar \
    gzip \
    less \
    findutils \
    nodejs \
    npm

RUN zypper ar -f \
    https://packages.cloud.google.com/yum/repos/cloud-sdk-el10-x86_64 \
    google-cloud-rhel10 && \
    zypper --non-interactive --gpg-auto-import-keys refresh && \
    zypper --non-interactive install -y google-cloud-cli

RUN npm install -g @google/gemini-cli

ENV PATH="/root/.local/bin:$PATH"
ENV TERM=xterm-256color
ENV COLORTERM=truecolor

WORKDIR /workspace

CMD ["bash"]