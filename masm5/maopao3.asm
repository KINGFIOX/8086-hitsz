S0  SEGMENT STACK
    DW  30 DUP(?)
TOP LABEL   WORD
S0  ENDS

S1  SEGMENT
TIP DB  "Input ten number and separate the numbers with space:", 0DH, 0AH, 24H
ARY DW  20 DUP(0)
CRLF    DB  0DH, 0AH, 24H
N   DW  0
S1  ENDS



S2  SEGMENT
    ASSUME  SS:S0, DS:S1, CS:S2, ES:S1
P   PROC    FAR
    MOV AX, S0
    MOV SS, AX
    LEA SP, TOP

    MOV AX, S1
    MOV DS, AX

    MOV AX, S1
    MOV ES, AX

    LEA DX, TIP
    MOV AH, 9
    INT 21H

    LEA SI, ARY

    XOR DX, DX
    MOV BL, 10
    MOV CX, 10

INPUT:  MOV AH, 1
    INT 21H
    CMP AL, 20H ;空格分隔字符
    JE  SAVE
    ;输入十进制数，将数存入SI对应的内存单元
    MOV DL, AL 
    MOV AX, [SI]
    MUL BL
    SUB DL, 30H
    ADD AL, DL
    MOV [SI], AX
    JMP INPUT
SAVE:   
    ADD SI, 2 
    LOOP    INPUT
    ;数组保存完毕



    LEA SI, ARY
    MOV DI, SI
    ADD DI, 2

    MOV CL, 9
    MOV CH, 9

CMPA:   MOV BX, [DI]
    CMP BX, [DI-2]
    JA  CON
    MOV DX, [DI-2]
    PUSH    DX
    MOV [DI-2], BX
    POP DX
    MOV [DI], DX
CON:    ADD DI, 2
    DEC CH
    CMP CH, 0
    JNE CMPA

    CALL    PRINT
    MOV DI, SI
    ADD DI, 2
    DEC CL
    MOV CH, CL
    CMP CL, 1
    JNE CMPA



    ;以下为十进制输出ARY中的数


EXIT:   MOV AH, 4CH
    INT 21H

P   ENDP

PRINT   PROC    NEAR
    PUSH    SI
    PUSH    CX
    PUSH    AX
    PUSH    DX
    LEA DX, CRLF
    MOV AH, 9
    INT 21H

    LEA SI, ARY
    MOV CX, 10
L1: MOV AX, [SI]
    MOV N, AX
    CALL    OUTPUT
    ADD SI, 2
    MOV DX, 20H
    MOV AH, 2
    INT 21H
    LOOP    L1



    POP DX
    POP AX
    POP CX
    POP SI
    RET

PRINT   ENDP

OUTPUT  PROC    NEAR
    PUSH    AX
    PUSH    BX
    PUSH    CX
    PUSH    DX

    XOR CX, CX 
    MOV AX, N
    MOV BX, 10
L2: XOR DX, DX
    DIV BX
    PUSH    DX
    INC CX
    CMP AX, 0
    JNE L2

L3: POP DX
    ADD DX, 30H
    MOV AH, 2
    INT 21H
    LOOP    L3

    POP DX
    POP CX
    POP BX
    POP AX
    RET
OUTPUT  ENDP

S2  ENDS
    END P
