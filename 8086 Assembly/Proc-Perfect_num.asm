; Check Perfect Number
include 'emu8086.inc'
org 100h
.data
    num db 28
    sum db 0
.code
main proc
    mov cl , num 
    dec cl
    l1: 
        mov bl , cl
        call dv
        cmp dl , 01h
        jne nott
        xor dx,dx
        mov al , sum
        add al , bl
        mov sum , al
        nott:
    loop l1
    
    
    xor ax,ax
    mov al , sum
    mov bl , num
    cmp al , bl
    jne noh
    printn "Perfect"  
    hlt
    noh: printn "NOpp"   
endp main 

dv proc near 
   xor ax,ax
   mov al , num
   div bl
   cmp ah , 0
   jne rett
   mov dl , 01h
rett: ret
           

hlt