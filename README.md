# playground z80 assembly
Simple way to access all features of `Z80-Debugger` standardized with `z80asm`.

### USAGE
I choose to write assembly for my z80 system with `z80asm` from the start as simple/flat as possible. Which mean anything writing for it, and in it will be exactly `z80asm` syntax, no exception. As every external hardware function will be called from `0x80` to `0x87` which managed by the `8-bit PIC` microcontroller along `Z84C00` CPU for :

    $0x80 - Memory Banking
    $0x81 - UART (COM/TTL)
    $0x82 ~ 0x83 - I2C access (Display Mode + Data )
    $0x84 - SPI access (MicroSD/Disk)

In near future, if I still can find spare parts of Z80, I may add up more features later.

### COMPILE 
simply `make` with `z80asm` installed on Linux/MacOS directly from package manager.
