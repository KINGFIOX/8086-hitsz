DATA SEGMENT
    input_buffer DB 20
                  DB ?
                  DB 20 DUP(0)

    output_msg DB 40 DUP('$')
DATA  ENDS

STACK SEGMENT STACK
    DB 100h DUP(0)
STACK ENDS

CODE  SEGMENT
    ASSUME CS:CODE, DS:DATA, SS:STACK

START:
    MOV AX, DATA
    MOV DS, AX
    MOV AX, STACK
    MOV SS, AX
    MOV SP, OFFSET STACK

    ; input
    LEA DX, input_buffer
    MOV AH, 0Ah
    INT 21h

    ; prefix
    LEA DI,     output_msg
    MOV AL,     '*'
    MOV [DI],   AL
    MOV [DI+1], AL
    MOV [DI+2], AL

    LEA SI, input_buffer+2
    MOV CL, [input_buffer+1]
    ADD DI, 3

COPY_INPUT_LOOP:
    MOV  AL,   [SI]
    MOV  [DI], AL
    INC  SI
    INC  DI
    LOOP COPY_INPUT_LOOP

    ; suffix
    MOV AL,   '*'
    MOV [DI], AL
    INC DI
    MOV [DI], AL
    INC DI
    MOV [DI], AL
    INC DI

    ; end
    MOV AL,   '$'
    MOV [DI], AL

    ; output
    LEA DX, output_msg
    MOV AH, 09h
    INT 21h

    MOV AH, 4Ch
    INT 21h

CODE ENDS
    END START
