DATAS SEGMENT
    ;�˴��������ݶδ���  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS

main proc near
    MOV AX,DATAS
    MOV DS,AX
    ;�˴��������δ���
    call  speaker_on
	mov   ah, 1
	int   21h
	call  speaker_off
    MOV AH,4CH
    INT 21H
main endp


speaker_on   proc near
   push ax
   in   al, 61h   
   OR	al, 3
   out  61h,al
   pop  ax
   ret
speaker_on endp

speaker_off  proc near 
   push ax
   in   al, 61h
   and  al, 0fch
   out  61h, al
   pop  ax
   ret
speaker_off  endp

CODES ENDS
    END main  
   


