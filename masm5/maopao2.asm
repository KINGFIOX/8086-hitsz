data segment 
A dw 03h, 0dh, 08h, 1dh, 20h, 0fdh
;两个字节保存一个值，对应十进制的3，13，8，29，32，253
data ends

code segment
main proc far
assume cs:code, ds:data
start:
push ds
sub ax, ax                ;ax寄存器清零
push ax
mov ax, data
mov ds, ax
mov cx, 7
dec cx                    ;减1指令

loop1:                    ;cx=cx-1若cx!=0则继续循环
mov di, cx
;把CX寄存器的值传送到以DS寄存器（默认是DS寄存器）的内容为段值有效地址为DI的存储单元中 
mov bx, 0

loop2: 
mov ax, a[bx]             ;把第bx个数传给ax寄存器
cmp ax, a[bx+2]           ;比较第bx个数和第bx+2个数？？？？？
jle continue              ;jle:小于等于则跳转，否则执行下句
xchg ax, a[bx+2]          ;否则两比较数交换位置
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

show: ; 显示ax里的值
mov cx, 10
cmp ax, 0
jle done
div cl         ;除法：被除数在DX，AX中，除数在cl中
push ax
xor ah, ah     ;xor实现两个操作数按位‘异或’运算,结果送至目的操作数中

call show
pop dx
mov dl, dh
or dl, 30h     ;或运算
mov ah, 2
int 21h
done:
ret
code ends
end start
