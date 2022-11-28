

data segment
    sayAdedi db ?
    say1 db ?
    say2 db ?
    say3 db ?
    say4 db ?
    say5 db ?
    say6 db ?
    say7 db ?
    say8 db ?
    say9 db ?
    
    mesaj1 db 10,13,"Bu program girilen n adet sayinin en kucuk ve en buyuk olanini ve kacinci sirada girildiklerini bulur. Sayilar pozitif ve tamsayi olmak zorundadir.Belirtilen miktarda sayi girilmelidir. Pozitif tamsayi [0-9] girilmez ise program sonra erer. Belirtilen sayi adedi araligi disinda deger girilirse program sona erer. Hatali giris yapilirsa program sona erer. $"
    
    mesaj2 db 10,13,"Girilecek olan sayilarin adedi (Min 2 , Max 9): $"
    
    mesaj3 db 10,13,"[0-9] Araliginda Bir Sayi Giriniz: $"
    
    mesaj4 db 10,13,"Girilen En Kucuk Sayi: $"
    mesaj5 db 10,13,"En Kucuk Sayinin Sirasi: $"
    mesaj6 db 10,13,"Girilen En Buyuk Sayi: $"
    mesaj7 db 10,13,"En Buyuk Sayinin Sirasi: $"
    mesaj8 db 10,13,"Program Hatasiz Calisti  0 $"
    
    
    hataMesaj1 db 10,13,"[2-9] Araliginda sayi girilmedi. Program hatadan dolayi sonlandi.  Hata1 $"
    hataMesaj2 db 10,13,"[0-9] Araliginda sayi girilmedi. Program hatadan dolayi sonlandi.  Hata2 $"   
     
ends

stack segment
    dw   128  dup(0)
ends

code segment
    assume ds:data cs:code 
start:

    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea dx,mesaj1
    
    mov ah,9h
    int 21h
    mov ah,1h
    int 21h
    mov ah,2
    int 21h
    
    
    lea dx,mesaj2
    mov ah,9h
    int 21h
    mov ah,1h
    int 21h
    
    
    
    xor cx,cx 
    
    call girdikontrol

    forloop:
    
    lea dx,mesaj3
    mov ah,9h
    int 21h
    mov ah, 1
    int 21h       
    
    inc cl
    cmp cl,sayAdedi 
    
  
  
    
    jne forloop
    
    call degerkontrol
    
    
    exit:    
    
    lea dx, mesaj4
    mov ah,9h
    int 21h
    mov ah,1h
    int 21h
    
    lea dx, mesaj5
    mov ah,9h
    int 21h
    mov ah,1h
    int 21h 
    
    lea dx, mesaj6
    mov ah,9h
    int 21h
    mov ah,1h
    int 21h
    
    lea dx, mesaj7
    mov ah,9h
    int 21h
    mov ah,1h
    int 21h
    
    lea dx, mesaj8
    mov ah,9h
    int 21h
    mov ah,1h
    int 21h
   
    
    
    mov ah,4ch
    int 21h
    
    
    code ends

  

    girdikontrol proc near

    cmp al,49
    jb sayi_degil
    cmp al,57
    ja sayi_degil
    jmp devam
    
    sayi_degil:

    lea dx,hataMesaj1
    mov ah,9h
    int 21h
    mov ah,4ch
    int 21h
    
    devam:

    sub ax,48
    mov ah,0h
    mov sayAdedi,al

    
    ret

    girdikontrol endp      
    
    
    
    
    degerkontrol proc near

    cmp al,49
    jb deger_degil
    cmp al,57
    ja deger_degil
    jmp devamet
    
    deger_degil:

    lea dx,hataMesaj2
    mov ah,9h
    int 21h
    mov ah,4ch
    int 21h
    
    devamet:

    sub ax,48
    mov ah,0h
    mov say1,al

    
    ret

    degerkontrol endp
    

    mov ah, 9
    int 21h    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h
    int 21h  
    
    
        
ends

end start
