# Lua MQTT Filesystem

A small lua script that brings mqtt messages to your filesystem.

## Dependencies (Arch Linux)

Install dependencies and build required lua modules:

    pacman -S mosquitto lua luarocks
    luarocks install lua-mosquitto

## Dependencies (Ubuntu 20.04)

Install dependencies and build required lua modules:

    apt install git libmosquitto-dev mosquitto-clients \
      lua5.3 luarocks liblua5.3-dev
    luarocks install lua-mosquitto

## Install

    git clone https://github.com/shagu/lua-mqtt-fs.git
    cd lua-mqtt-fs

### Usage

    ./lua-mqtt-fs.lua <broker> <path>

- **broker:** The broker to connect
  *(default: mqtt.local)*
- **path:** The path to the folder where the mqtt messages should be created
  *(default: /tmp/lua-mqtt-fs)*

### Example

    ./lua-mqtt-fs.lua mqtt.midgard /tmp/lua-mqtt
