@echo off
title "Inimu | Arp Fix (by noxx)"
netsh interface ipv6 set teredo disable
netsh interface ipv6 set global randomizeidentifiers=disabled
netsh interface ipv6 set global state=disabled

arp -d

netsh winsock reset

netsh int ip reset

ipconfig /release

ipconfig /renew

ipconfig /flushdns

takeown /f "C:\Windows\System32\DriverStore\FileRepository\*\nvml.dll" /r /d y
icacls "C:\Windows\System32\DriverStore\FileRepository\*\nvml.dll" /grant administrators:F /t
del /f /q "C:\Windows\System32\DriverStore\FileRepository\*\nvml.dll"

exit
