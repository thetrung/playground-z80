; --- Direct Hardware Mapping Configuration ---
VIDEO_DATA_PORT: EQU $A0      ; Port to send characters to screen
VIDEO_CTRL_PORT: EQU $A9      ; Port to send layout commands
CMD_NEXT_LINE:   EQU 1        ; Bit 0 mask to drop cursor down

    ORG $0000

_start:
  LD   HL, Message

PrintLoop:
  LD   A, (HL)
  OR   A                      ; Zero check
  JR   Z, PrintDone

  CP   $0A                    ; Is it a newline character '\n'?
  JR   NZ, PrintChar
                              ; Send layout command to control port
  LD   A, CMD_NEXT_LINE
  OUT  (VIDEO_CTRL_PORT), A
  JR   NextChar

PrintChar:
  OUT  (VIDEO_DATA_PORT), A   ; Send plain letter to printing data port

NextChar:
  INC  HL
  JR   PrintLoop

PrintDone:
  JR   $                  ; Halt loop

Message: DB "hello\nworld",0

  END

