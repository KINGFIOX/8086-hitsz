DATAS SEGMENT
    ;此处输入数据段代码
    s1 DB 'Hello World!', '$'  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
    DB 64 DUP(?)
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    mov ah, 09
    MOV DX, OFFSET s1
    INT 21H
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

