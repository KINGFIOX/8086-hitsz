DATAS SEGMENT
    ;�˴��������ݶδ���
    s1 DB 'Hello World!', '$'  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
    DB 64 DUP(?)
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    mov ah, 09
    MOV DX, OFFSET s1
    INT 21H
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

