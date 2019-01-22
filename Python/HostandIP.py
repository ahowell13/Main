# Python program to get Hostname and IP Address

import socket

hostname = socket.gethostname()

ipaddr = socket.gethostbyname(hostname)

print ("Your computer Name is: " + hostname)

print ("Your computer IP Address is: " + ipaddr)
