DATA SEGMENT
    X DW -100
DATA  ENDS

STACK SEGMENT
    DB 256 DUP (0)
STACK ENDS

CODE  SEGMENT
    ASSUME CS:CODE, DS:DATA, SS:STACK

START:
    MOV AX, DATA
    MOV DS, AX
    MOV AX, STACK
    MOV SS, AX
    MOV SP, 256
    MOV AX, X
    CMP AX, 0
    JGE DONE
    NEG AX
    MOV X,  AX

DONE:
    MOV AH, 4CH
    INT 21H

CODE ENDS
END  START
