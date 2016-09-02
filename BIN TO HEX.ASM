.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER THE VALUE: $'
M2 DB 'THE HEXA VALUE: $'
M3 DB 'ILLIGAL!!!$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    CLEAR:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    
    XOR BH,BH
    
    INPUT:
    
    
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    CMP CH,0DH
    JE PRINT
    
    CMP CH,'0'
    JL EXIT
    
    CMP CH,'1'
    JG EXIT
    
    AND CH,15
    SHL BH,1
    OR BH,CH
    
    JMP INPUT
    
    PRINT:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    MOV AH,2
    
    CMP BH,9
    JLE NUMBER
    
    CMP BH,15
    JLE CHARACTER
    
    NUMBER:
    ADD BH,48
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    JMP CLEAR
    
    CHARACTER:
    ADD BH,55
    MOV AH,2
    MOV DL,BH
    INT 21H 
    
    JMP CLEAR
    
    EXIT:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,M3
    MOV AH,9
    INT 21H 
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN