.MODEL SMALL
.DATA
NUM1 DW 10
NUM2 DW 20
RES DD ?

.CODE
MOV AX,@DATA
MOV DS,AX

MOV AX,NUM1
MUL NUM2
MOV RES,DX:AX

MOV AH,4CH
INT 21H
END