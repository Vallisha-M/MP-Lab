.MODEL SMALL


.DATA
 STR1 DB 10 DUP(0)
 STR2 DB 10 DUP(0)
 LEN1 DB 00
 LEN2 DB 00
MSG1 DB 0DH,0AH,"ENTER FIRST STRING:-$"
MSG2 DB 0DH,0AH,"ENTER SECOND STRING:-$"
MSG3 DB 0DH,0AH,"STRINGS ARE EQUAL$"
MSG4 DB 0DH,0AH,"STRINGS ARE NOT EQUAL$"
MSG5 DB 0DH,0AH,"LENGTH OF FIRST STRING IS$"
MSG6 DB 0DH,0AH,"LENGTH OF SECOND STRING IS"
MSG7 DB 0DH,0AH,"LENGTH OF STRING IS$"


.CODE
MOV AX,@DATA
MOV DS,AX

LEA DX,MSG1
MOV AH,09H
INT 21H
MOV SI,00H

BACK1:MOV AH,01H
INT 21H
CMP AL,0DH
JE NEXT1
MOV STR1[SI],AL
INC SI
INC LEN1
JMP BACK1

NEXT1:LEA DX,MSG2
      MOV AH,09H
      INT 21H
      MOV SI,00

BACK2:MOV AH,01H
INT 21H
CMP AL,0DH
JE NEXT2
MOV STR2[SI],AL
INC SI
INC LEN2
JMP BACK2

NEXT2:MOV AL,LEN1
       CMP AL,LEN2
     JNE NOTEQUAL
      MOV SI,00
       MOV DI,00
      MOV CL,LEN1
      


BACK3:MOV AL,STR1[SI]
      CMP AL,STR2[DI]
      JNE NOTEQUAL
      INC SI
      INC DI
      DEC CL
      JNZ BACK3
      LEA DX,MSG3
      MOV AH,09H
      INT 21H


      LEA DX,MSG7
      MOV AH,09H
      INT 21H

MOV DL,LEN1
ADD DL,30H
MOV AH,02H
INT 21H
JMP LAST


NOTEQUAL:LEA DX,MSG4
         MOV AH,09H
         INT 21H
LEA DX,MSG5
MOV AH,09H
INT 21H

MOV DL,LEN1
ADD DL,30H
MOV AH,02H
INT 21H

LEA DX,MSG6
MOV AH,09H
INT 21H
MOV DL,LEN2
ADD DL,30H
MOV AH,02H
INT 21H

LAST:MOV AH,4CH
     INT 21H
     END
