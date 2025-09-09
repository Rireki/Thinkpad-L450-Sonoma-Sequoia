/*
 * SSDT-ECRW for ThinkPad L450
 *
 * Provides standardized methods (RECB/WECB) for reading from and writing to
 * the Embedded Controller (EC). This is often required by advanced kexts
 * like YogaSMC to manage features such as Battery Conservation Mode.
 *
 * The paths have been adapted from the template to match your DSDT:
 * - EC Path:  \_SB.PCI0.LPC.EC
 * - Battery:  \_SB.PCI0.LPC.EC.BAT0
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "ECRW", 0x00000000)
{
    // External paths from your DSDT
    External (_SB_.PCI0.LPC_.EC, DeviceObj)      // Correct EC Path
    External (_SB_.PCI0.LPC_.EC.BAT0, DeviceObj) // Correct Battery Path

    Scope (_SB.PCI0.LPC.EC)
    {
        // Method to Read a single Byte from the EC
        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }
            Return (BYTE)
        }

        // Method to Read a block of Bytes from the EC
        Method (RECB, 2, Serialized)
        {
            // Arg0: Start offset
            // Arg1: Length in bits
            Arg1 = ((Arg1 + 0x07) >> 0x03) // Convert length from bits to bytes
            Name (TEMP, Buffer (Arg1) {})
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                TEMP [Local0] = RE1B (Arg0)
                Arg0++
                Local0++
            }
            Return (TEMP)
        }

        // Method to Write a single Byte to the EC
        Method (WE1B, 2, NotSerialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }
            BYTE = Arg1
        }
        
        // Method to Write a block of Bytes to the EC
        Method (WECB, 3, Serialized)
        {
            // Arg0: Start offset
            // Arg1: Length in bits
            // Arg2: Buffer to write
            Arg1 = ((Arg1 + 0x07) >> 0x03) // Convert length from bits to bytes
            Name (TEMP, Buffer (Arg1) {})
            TEMP = Arg2
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                WE1B (Arg0, DerefOf (TEMP [Local0]))
                Arg0++
                Local0++
            }
        }

        /*
         * Optional: Notify battery on conservation mode change.
         * This notifies BAT0, which is the battery device in your DSDT.
         */
        Method (NBAT, 0, Serialized)
        {
            If (CondRefOf (BAT0))
            {
                Notify (BAT0, 0x80) // 0x80 = Status Change
            }
        }
    }
}