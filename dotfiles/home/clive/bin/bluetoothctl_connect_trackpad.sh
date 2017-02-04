#!/usr/bin/expect -f

spawn "bluetoothctl"
expect "#"
send "select 00:19:0E:17:69:A4\r"
expect "#"
send "power on\r"
expect "Powered: yes"
send "connect 84:38:35:3A:B6:23\r"
expect "Connected: yes"
send "quit\r"
