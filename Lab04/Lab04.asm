

ORG 100h   

CMP N,15
JB MES
CMP N,25
JA MES

MOV SI,1
MOV ARRAY[0],0

INC SI
MOV ARRAY [1],1

SUB N,2
MOV CH,0
MOV CL,N

LOOP1:

INC SI
MOV BL,2
MOV AX,SI  
DIV BL

MOV DH,ARRAY[SI-2]
MOV DL,ARRAY[SI-3]

CMP AH,0

JE EVEN
     
     SUB DH,DL
     MOV ARRAY[SI-1],DH
     SUB CL,1 
     
     JMP LOOP1
      
     EVEN:
  
     ADD DH,DL
     MOV ARRAY[SI-1],DH
               
LOOP LOOP1 

JMP EXIT

    MES: 
    LEA SI, MESSAGE
    MOV CX, 38
    MOV AH, 0Eh
    GO: LODSB
    INT 10h
    LOOP GO
    
     EXIT:

ret

MESSAGE DB 'Please enter a value between 14 and 26',0  
N DB 16
ARRAY DB N DUP(0)
 