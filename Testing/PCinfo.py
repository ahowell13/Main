import os
import socket
import datetime

Name = input ( "Enter your name: " )

hostname = socket.gethostname()

ipaddr = socket.gethostbyname(hostname)

username = os.environ.get('username')

print (f"Hello {Name}, your hostname is {hostname}, your ip address is {ipaddr}, and your username is {username}.")


