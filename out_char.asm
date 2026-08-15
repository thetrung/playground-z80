PORT_DISPLAY: EQU 0x00

ORG 0x0000 ; ROM on Lower 32K 

INIT:
  LD SP, 0x0000

MAIN:
  LD A, 0x41              ; character 'A'
  OUT (PORT_DISPLAY), A   ; Send request

HALT_LOOP:
  HALT                    ;LIGHT UP LED 
  JR HALT_LOOP
