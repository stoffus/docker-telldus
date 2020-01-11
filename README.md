# telldus

A Debian-based wrapper for the the telldus libraries and binaries. It exposes two ports, one for events and one for client interaction. Works like a charm if you run Home Assistant from another Docker container.

## Sample docker-compose.yml

```
version: '2.2'

services:
  telldus:
    image: stoffus/telldus
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./tellstick.conf:/etc/tellstick.conf
    ports:
      - "50800:50800"
      - "50801:50801"
    devices:
      - /dev/bus/usb
```
