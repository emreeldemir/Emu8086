org 100h

; add your code here

#start=Emulation_Kit.exe# 




      MOV DI, 0
      
MAINLOOP:
      MOV DX, 2000h
      ADD DX, DI
      
      MOV BX,0
      
PRINT:

      MOV SI, 0
      MOV CX,5
      
      CMP DX, 2027H
      JLE NEXT
      MOV DX,2000H
      
NEXT:
      MOV AL, Dots[BX][SI]
      out DX, AL
      INC SI
      INC DX
      
      CMP SI, 5
      LOOPNE NEXT
     
      
      ADD BX, 5
      CMP BX, 40
      JL PRINT
      
      
      ADD DI, 5 
      CMP DI,35
      JLE MAINLOOP
      MOV DI, 0
      JMP MAINLOOP

ret 
     dots DB	01111111b, 00000100b, 00001000b, 00010000b, 01111111b  ; N
	 DB	01111111b, 01001001b, 01001001b, 01001001b, 01000001b  ; E	
	 DB	00100110b, 01001001b, 01001001b, 01001001b, 00110010b  ; S
	 DB	01111111b, 01000000b, 01000000b, 01000000b, 01000000b  ; L     
	 DB	00000000b, 00000000b, 01111101b, 00000000b, 00000000b  ; I
	 DB 00110110b, 01001001b, 01001001b, 01001001b, 00110110b  ; 8
	 DB 00110110b, 01001001b, 01001001b, 01001001b, 00110110b  ; 8
	 DB 00110110b, 01001001b, 01001001b, 01001001b, 00110110b  ; 8