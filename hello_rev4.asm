PORT_DISPLAY: EQU 00h       ; Changed 0x00 to 00h

; Z80 Hello World via I/O Port 0x00
ORG 0000h                   ; Changed 0x0000 to 0000h

INIT:
    LD SP, 0FFFFh           ; Changed 0xFFFF to 0FFFFh
    LD HL, MSG              ; Load the address of the string into HL register

MAIN:
    LD A, (HL)              ; Read character from ROM into Accumulator
    CP 0                    ; Check if it is the null terminator (0)
    JR Z, HALT_LOOP         ; If 0, string is finished, jump to halt
    
    OUT (PORT_DISPLAY), A   ; Send character in A to I/O Port 0x00 (The PIC)
    INC HL                  ; Move to the next character address
    JR MAIN                 ; Repeat for next character

HALT_LOOP:
    HALT                    ; Stop the Z80 execution
    JR HALT_LOOP            ; Safety loop in case of unexpected interrupts

MSG:
    DB "Hello World!", 0Ah, 0  ; Text string with LF (0Ah) and Null terminator
