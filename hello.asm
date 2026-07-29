
; hello.asm - A basic Z80 Assembly example

            ORG $8000           ; Set the origin (start address) to $8000 in RAM

start:      
            LD DE, text         ; Load the memory address of our string into DE
            CALL display_string ; Call our custom subroutine to print it
            RET                 ; Return to the operating system / monitor

display_string:
            LD C, $06           ; $06 is the standard API code for character display
print_loop:
            LD A, (DE)          ; Load the character pointed to by DE into the Accumulator (A)
            CP $00              ; Check if we hit the string terminator (NULL byte)
            RET Z               ; If the Zero flag (Z) is set (A == 0), we are done, so return
            
            RST $30             ; Call the system monitor's output routine
            INC DE              ; Move the pointer to the next character
            JR print_loop       ; Repeat the loop

text:       DB "Hello, World!", 0 ; Define the null-terminated string bytes in memory
            END                 ; End of the assembly file
