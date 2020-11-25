.model small

.data
ncrval dw ?
n db 5
r db 3

.code
mov ax,@data
mov ds,ax

xor ax,ax
mov cl,r
mov ch,n
call ncr
mov [ncrval],ax
mov ah,4ch
int 21h

ncr proc near
   cmp ch,cl
   je equal
   jc finish
   cmp cl,01h
   je next
   cmp cl,00h
   je equal
   dec ch
   push cx
   call ncr
   pop cx
   dec cl
   call ncr
   ret
next:xor bx,bx
     mov bl,ch
     add ax,bx
     ret
equal:inc ax
finish:ret
ncr endp
end
