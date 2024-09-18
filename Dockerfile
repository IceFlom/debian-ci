FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y \
    git \
    curl \
    wget \
    build-essential \
    ca-certificates \
    apt-transport-https \
    software-properties-common && \
    apt clean

RUN wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz && \
    rm go1.23.1.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.134.2/hugo_extended_0.134.2_linux-amd64.deb && \
    dpkg -i hugo_extended_0.134.2_linux-amd64.deb && \
    rm hugo_extended_0.134.2_linux-amd64.deb

RUN wget https://github.com/sass/dart-sass/releases/download/1.79.1/dart-sass-1.79.1-linux-x64.tar.gz && \
    tar -xzf dart-sass-1.79.1-linux-x64.tar.gz -C /usr/local/bin --strip-components=1 && \
    rm dart-sass-1.79.1-linux-x64.tar.gz

WORKDIR /workspace

CMD ["/bin/bash"]