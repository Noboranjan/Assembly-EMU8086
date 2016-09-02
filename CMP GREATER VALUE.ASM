.MODEL SMALL
.STACK 100H
.DATA
M DB 'ENTER 1ST VALUE $'
M1 DB 'ENTER 2ND VALUE $'
M2 DB 'ENTER 3RD VALUE $'
M3 DB 'LARGE VALUE $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    CMP BL,CL
    JG L1
    JMP L2
    
    L1:
    CMP BL,BH
    JG L4
    JMP L3
    
    L2:
    CMP CL,BH
    JG L5
    JMP L3
    
    L3:
    LEA DX,M3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP EXIT
    
    L4:
    LEA DX,M3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    L5:
    LEA DX,M3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    
    
