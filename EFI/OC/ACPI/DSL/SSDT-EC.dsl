/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLofvRcU.aml, Tue Sep  9 11:10:10 2025
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000CF (207)
 *     Revision         0x02
 *     Checksum         0x99
 *     OEM ID           "CORP "
 *     OEM Table ID     "SsdtEC"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "CORP ", "SsdtEC", 0x00001000)
{
    External (_SB_.PCI0.LPC_, DeviceObj)
    // These Externals need to refer to EC, as that's what this SSDT is interacting with
    // (after the SSDT-EC-Rename has done its job).
    External (_SB_.PCI0.LPC_.EC, DeviceObj)           // Corrected from EC__
    External (_SB_.PCI0.LPC_.EC.XSTA, MethodObj)      // Corrected from EC__.XSTA

    If (CondRefOf (\_SB.PCI0.LPC.EC.XSTA))
    {
        Scope (\_SB.PCI0.LPC.EC)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (\_SB.PCI0.LPC.EC.XSTA ())
                }
            }
        }
    }
}