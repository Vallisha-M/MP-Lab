.MODEL SMALL
.DATA
N DB 5h
A DB 05h, 07h, 04h, 03h, 06h

.CODE
MOV AX,@DATA
MOV DS,AX


MOV CL,N
DEC CL
OUTLOOP:MOV CH,CL
        MOV SI,00H
INLOOP: MOV AL,A[SI]
        INC SI
        CMP AL,A[SI]
        JC NOEXCHANGE
        XCHG AL,A[SI]
        MOV A[SI-1],AL

NOEXCHANGE:DEC CH
           JNZ INLOOP
           DEC CL
           JNZ OUTLOOP

MOV AH,4CH
INT 21H
END



