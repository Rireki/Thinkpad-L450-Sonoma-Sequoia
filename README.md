# What works
- Almost everything except SD Card Reader
# Caveat
- Sleep will result in the lost control of FN+F5 & F6 (Brightness control)
- Audio need to be selected to Line Out if you want to listen to audio on headphones. A tradeoff I made because Realtek in this laptop is esoteric, the autoswitching logic breaks audio functionality.
- Use HeliPort to connect to Wi-Fi, because kext here is for Intel Wireless
- Make sure to TURN OFF CSM (UEFI Only) when installing and after installing.
# Credits
- https://github.com/DomiDomian/Thinkpad-L450-Monterey for audio issues clue and their ACPI handling
- @dj-nest for his Thinkpad T450s OC for Sonoma https://github.com/CLAY-BIOS/Lenovo-ThinkPad-T450s-Hackintosh-OpenCore/issues/133#issuecomment-2766144014
# P.S.
- I used Thinkpad T450s OC because they're practically the same thing except L450 requires less kexts and audio handling is different.
