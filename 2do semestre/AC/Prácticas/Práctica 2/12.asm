TIMER EQU 10H
COMP EQU 11H
PIC EQU 20H
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H

ORG 1000H
 MIN2 DB 30H
 MIN1 DB 30H
 DP DB 3AH
 SEG2 DB 30H
 SEG1 DB 30H
 SALTO DB 0AH

ORG 40
DW RUT_TIMER

ORG 2000H
 CLI
 MOV AL, 11111101B
 OUT IMR, AL  ; PIC: registro IMR
 MOV AL, 10
 OUT INT1, AL  ; PIC: registro INT0
 MOV AL, 1
 OUT COMP, AL ; COMP: 1SEG 
 MOV AL, 0
 OUT TIMER, AL  ; CONT: 0
 STI
 
LAZO:JMP LAZO


ORG 3000H
RUT_TIMER:MOV BX, OFFSET SEG1
 CMP BYTE PTR [BX], 39H
 JZ AUMENTARS2
 INC BYTE PTR [BX]
 JMP PRINT
 
AUMENTARS2:MOV BYTE PTR [BX], 30H
 MOV BX, OFFSET SEG2
 CMP BYTE PTR [BX], 35H
 JZ AUMM1
 INC BYTE PTR [BX]
 JMP PRINT

AUMM1:MOV BYTE PTR [BX], 30H
 MOV BX, OFFSET MIN1
 CMP BYTE PTR [BX], 39H
 JZ AUMM2
 INC BYTE PTR [BX]
 JMP PRINT
 
AUMM2:MOV BYTE PTR [BX], 30H
 MOV BX, OFFSET MIN2
 CMP BYTE PTR [BX], 35H
 JZ HORA
 INC BYTE PTR [BX]
 JMP PRINT
 
HORA:MOV BYTE PTR [BX], 30H
 
PRINT:MOV BX, OFFSET MIN2
 MOV AL, OFFSET SALTO-OFFSET MIN2
 INT 7

 MOV AL, EOI
 OUT EOI, AL ; PIC: registro EOI
 MOV AL, 0
 OUT TIMER, AL
 IRET
 END
