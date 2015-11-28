import socket
import subprocess

s = socket.socket()
s.bind(('localhost', 9000))
s.listen(1)

while True:
    sc, addr = s.accept()
    p = subprocess.check_output(["powershell.exe", "-ExecutionPolicy", "Unrestricted", r"C:\Users\kaiser\Documents\GitWorkspace\vulsecure\Red\WinClientJSON.ps1"])
    sc.send(p)
    sc.close()

s.close()
