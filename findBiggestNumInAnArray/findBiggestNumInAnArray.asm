

data segment
    
    arr db 0,9,12,23,8,10,3,7,1,2
    big db ?
    length dw $-arr  
    
   
data ends


code segment 
    
    assume ds:data cs:code
    
start:

    mov ax, data
    mov ds, ax  
    
    lea si, arr
    
    mov al, arr[si]
    mov big, al
    mov cx,length
    
    repeat:
    
    mov al, arr[si]
    cmp big, al
    jg swap
    mov big, al
    
    swap:
    
    inc si
    loop repeat
    mov ah,4ch
    int 21h
    

code ends

end start 