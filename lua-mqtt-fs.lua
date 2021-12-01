#!/bin/env lua
--[[

  dependencies (arch):
    pacman -S mosquitto lua luarocks
    luarocks install lua-mosquitto

]]--

local broker = arg[1] or "mqtt.local"
local base   = arg[2] or "/tmp/lua-mqtt-fs"

local mqtt = require("mosquitto")
local client = mqtt.new()

client.ON_CONNECT = function()
  client:subscribe("#")
end

client.ON_MESSAGE = function(mid, topic, payload)
  local path = "/tmp/lua-mqtt-fs/"..topic
  os.execute("mkdir -p '" .. path .. "'")

  local file = io.open(path .. "/msg", "w")
  if file then
    file:write(payload)
    file:close()
    print("UPDATE: " .. path .. "/msg")
  else
    print("ERROR: " .. path .. "/msg")
  end
end

print("Lua MQTT Filesystem")
print("  Broker: " .. broker)
print("  Path:   " .. base)

client:connect(broker)
client:loop_forever()
