org 100h
#start=Emulation_Kit.exe#

info:
mov ah, 2ch  ;get time
INT 21h      ;ch=hour, cl=min, dh=sec

mov bh, dh
mov ax, 0
mov bl, 10   


;hour1
mov al, ch
div bl            
mov ah, 0     
mov si, ax
mov al, numbers[si]  ;bolum al'de  

mov dx, 2030h
out dx, al

mov ax, 0


;hour2
mov al, ch
div bl
mov al, ah ;kalan ah'ta
mov ah, 0
mov si, ax
mov al, numbers[si]
                    
mov dx, 2031h
out dx, al

mov ax, 0

;- 
mov al, numbers[10] 
mov dx, 2032h
out dx, al
   
   
;minute1
mov al, cl
div bl
mov ah, 0  
mov si, ax
mov al, numbers[si]

mov dx, 2033h
out dx, al

mov ax, 0 
   
   
;minute2
mov al, cl
div bl
mov al, ah
mov ah, 0
mov si, ax
mov al, numbers[si]

mov dx, 2034h
out dx, al

mov ax, 0   

;-
mov al, numbers[10]
mov dx, 2035h
out dx, al
    
    
;second1
mov al, bh
div bl
mov ah, 0 
mov si, ax
mov al, numbers[si]

mov dx, 2036h 
out dx, al

mov ax, 0   
     
     
;second2
mov al, bh
div bl
mov al, ah
mov ah, 0 
mov si, ax
mov al, numbers[si]

mov dx, 2037h
out dx, al   

mov ax, 0

loop info          
           
ret   
numbers DB	10111111b, 00000110b, 01011011b, 01001111b, 01100110b, 01101101b, 11111101b, 00000111b, 01111111b, 01101111b, 01000000b              
                ;0          ;1         ;2       ;3          ;4      ;5           ;6          ;7          ;8         ;9         ;-
	 