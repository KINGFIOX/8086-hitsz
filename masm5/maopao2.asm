data segment 
A dw 03h, 0dh, 08h, 1dh, 20h, 0fdh
;�����ֽڱ���һ��ֵ����Ӧʮ���Ƶ�3��13��8��29��32��253
data ends

code segment
main proc far
assume cs:code, ds:data
start:
push ds
sub ax, ax                ;ax�Ĵ�������
push ax
mov ax, data
mov ds, ax
mov cx, 7
dec cx                    ;��1ָ��

loop1:                    ;cx=cx-1��cx!=0�����ѭ��
mov di, cx
;��CX�Ĵ�����ֵ���͵���DS�Ĵ�����Ĭ����DS�Ĵ�����������Ϊ��ֵ��Ч��ַΪDI�Ĵ洢��Ԫ�� 
mov bx, 0

loop2: 
mov ax, a[bx]             ;�ѵ�bx��������ax�Ĵ���
cmp ax, a[bx+2]           ;�Ƚϵ�bx�����͵�bx+2��������������
jle continue              ;jle:С�ڵ�������ת������ִ���¾�
xchg ax, a[bx+2]          ;�������Ƚ�������λ��
mov a[bx], ax

continue:
add bx, 2
loop loop2
mov cx, di
loop loop1
mov cx, 7
mov bx, 0

next:
mov ax, [bx]
push cx
call show
pop cx
mov ah, 2
mov dl, ' '
int 21h
add bx, 2
loop next
ret
main endp

show: ; ��ʾax���ֵ
mov cx, 10
cmp ax, 0
jle done
div cl         ;��������������DX��AX�У�������cl��
push ax
xor ah, ah     ;xorʵ��������������λ���������,�������Ŀ�Ĳ�������

call show
pop dx
mov dl, dh
or dl, 30h     ;������
mov ah, 2
int 21h
done:
ret
code ends
end start
