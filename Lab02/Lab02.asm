
ORG 100H

MOV BL,2
MOV AL,number
SUB AL,2
MOV CL,AL


MYLOOP:

    MOV AH,0
    MOV AL,number
    
    DIV BL
    
    CMP AH,0
    
    JE ifPrimeEqual
        
        JMP ifPrimeNotEqual        
        
        ifPrimeEqual:
        MOV isPrime,0       
        JMP EXIT:
        
        ifPrimeNotEqual:
        INC BL
           
    
       
LOOP MYLOOP

MOV isPrime,1      
                

EXIT: 
      
MOV BL,2
MOV AL,number
SUB AL,2
MOV CL,AL


MYLOOP2:

    MOV AH,0
    MOV AL,BL
    
    MUL BL
    
    CMP AL,number
    
    JE ifSquareEqual
        
        JMP ifSquareNotEqual       
        
        ifSquareEqual:
        MOV isSquare,1
        JMP EXIT2
        
        ifSquareNotEqual:
        INC BL
           
    
       
LOOP MYLOOP2
       
EXIT2:

RET


number DB 19
isPrime DB 0
isSquare DB 0

