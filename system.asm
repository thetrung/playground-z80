
; ==============================================================================
; Custom Z80 Hardware Example: Bank Switching & PIC I/O
; Assembler: Standard z80asm
; ==============================================================================

; --- Hardware Port Definitions ---
PORT_BANK: EQU 0x80          ; 74HC273 Latch for 512K SRAM Bank Switching
PORT_UART: EQU 0x81          ; UART Character I/O
PORT_I2C_CMD: EQU 0x82          ; I2C Screen Commands (128x64 Display)
PORT_I2C_DAT: EQU 0x83          ; I2C Screen Data/Text

ORG 0x0000                      ; Execution origin

reset:
    di                          ; Disable interrupts during setup
    ld sp, 0xFFFF               ; Initialize Stack Pointer to top of RAM

main:
    ; 1. Set Memory Bank via 74HC273 Latch
    ld a, 0x02                  ; Select SRAM Bank #2
    out (PORT_BANK), a          ; Instantly swap the memory bank

    ; 2. Print a string via the PIC-managed UART Port
    ld hl, uart_msg             ; HL = Pointer to the text string
    call send_uart_string       ; Run the UART streaming loop

    ; 3. Print character 'A' to the I2C 128x64 Display
    ld a, 0x41                  ; ASCII code for 'A'
    out (PORT_I2C_DAT), a       ; Send directly to the display data port

loop_forever:
    jr loop_forever             ; Halt execution here

; --- Subroutine: Stream String to UART ---
send_uart_string:
    ld a, (hl)                  ; Fetch character from current memory bank
    or a                        ; Is it the 0x00 Null terminator?
    ret z                       ; If yes, exit subroutine
    
    out (PORT_UART), a          ; Output character byte to PIC UART
    inc hl                      ; Point to next character byte
    jr send_uart_string         ; Loop back

; --- Data Block ---
uart_msg:
    defm "Bank 2 Active\r\n", 0  ; Null-terminated string
