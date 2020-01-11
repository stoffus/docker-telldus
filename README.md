# telldus

A Debian-based wrapper for the the telldus libraries and binaries. It exposes two ports, one for events and one for client interaction.

## Sample docker-compose.yml

```
version: '2.2'

services:
  telldus:
    image: stoffus/telldus
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./tellstick.conf:/etc/tellstick.conf
    restart: always
    ports:
      - "50800:50800"
      - "50801:50801"
    devices:
      - /dev/bus/usb
```
