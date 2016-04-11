# Geeklets-Misc
Geeklets that I use that are just shell scripts to display some information

## Computer Name
Basically, a call to `scutil --get ComputerName;` and you get the computer's name

## Date
Basically, a call to `date +"%A %B %d, %Y"` and you get the date

## IP
Not sure if other's computers will end up with the same ethernet connections ids, but this is something that worked for me on my work's MacBook. Basically, it tries getting the ifconfig of a bunch of ethernet connections. It also tries to figure if there is a VPN connection, in that case it will give you the VPN IP address and then the computers IP.

## Time
Basically, a call to `date '+%H:%M:%S'` and you get the time
