/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250807 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of D:/SSDTTime-master/Results/SSDT-UNC.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000062 (98)
 *     Revision         0x02
 *     Checksum         0x63
 *     OEM ID           "DRTNIA"
 *     OEM Table ID     "UNC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200528 (538969384)
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "UNC", 0x00000000)
{
    External (_SB_.UNC0, DeviceObj)
    External (PRBM, IntObj)

    Scope (_SB.UNC0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                PRBM = Zero
            }
        }
    }
}

