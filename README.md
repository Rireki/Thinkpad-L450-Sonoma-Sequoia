# What works
- Almost everything except SD Card Reader
# Caveat
- Turn off SD Card I/O port in BIOS>Security tab
- Sleep will result in the lost control of FN+F5 & F6 (Brightness control) BUT still can be controlled from Control Centre (The two button thing beside Time on Top Right at MacOS desktop).
- Audio need to be selected to Line Out (At Control Centre) if you want to listen to audio on headphones. A tradeoff I made because Realtek in this laptop is esoteric, the autoswitching logic breaks audio functionality.
- Use HeliPort (https://github.com/OpenIntelWireless/HeliPort) to connect to Wi-Fi, because kext here is for Intel Wireless
- IF SLEEP DOESN'T WORK then try removing every device that are connected to your USB ports. Usually those are the culprit.
- Make sure to TURN OFF CSM (UEFI Only) when installing and after installing.
# Credits
- https://github.com/DomiDomian/Thinkpad-L450-Monterey for audio issues clue and their ACPI handling
- @dj-nest for his Thinkpad T450s OC for Sonoma https://github.com/CLAY-BIOS/Lenovo-ThinkPad-T450s-Hackintosh-OpenCore/issues/133#issuecomment-2766144014
# P.S.
- I used Thinkpad T450s OC because they're practically the same thing except L450 requires less kexts and audio handling is different.
