DATAS SEGMENT
    ;�˴��������ݶδ���
    ;a dw n dup(?)
    a dw 8,5,16,84,32
    n dw 5 
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    mov cx, n
    dec cx
loop1:	mov di,cx
		mov bx,0
loop2:	mov ax, a[bx]
		cmp ax, a[bx+2]
		jge continue
		xchg ax, a[bx+2]
		mov a[bx], ax
continue:	add bx, 2
			loop loop2
			mov cx, di
			loop loop1

		mov dx, offset a
		mov ah,09h
		int 21H

    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
