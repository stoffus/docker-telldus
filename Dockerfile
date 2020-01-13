# Based on Jessie to satisfy the libconfuse0 dependency
FROM debian:8-slim

LABEL maintainer="stoffus@stoffus.com"

# Install base packages
RUN apt-get update && apt-get install -y \
  build-essential \
  libudev-dev \
  wget \
  socat \
  libftdi1 \
  && rm -rf /var/lib/apt/lists/*

# Add telldus repo and public key
RUN echo "deb http://download.telldus.com/debian/ stable main" >> /etc/apt/sources.list.d/telldus.list \
  && wget -qO - http://download.telldus.com/debian/telldus-public.key | apt-key add -

# Install telldus libraries and binaries
RUN apt-get update \
  && apt-get install -y \
    libtelldus-core2 \
    telldus-core \
  && rm -rf /var/lib/apt/lists/*

COPY run.sh /

CMD [ "/run.sh" ]

EXPOSE 50800 50801
