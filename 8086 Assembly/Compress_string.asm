; Compress string
; in -> aabbbc , out -> a2b3c1

org 100h
.data
   str db 20 dup(0)
   str2 db 20 dup('$')
   str3 db 10,13,'$'  

.code

printf macro str
     lea dx , str
     mov ah , 09h
     int 21h
endm

main proc
    mov si , 0
    xor cx , cx
    l1:
        mov ah , 1
        int 21h
        cmp al , 0dh
        je sesh
        mov str[si] , al
        inc si
        inc cx
    jmp l1
    sesh:
    
    mov si , 1
    mov di , 0 
    xor ax , ax 
    xor dl , dl
    inc dl
    l2:
        mov al , str[si]
        mov bl , str[si-1]
        cmp al , bl
        je new 
        mov al , str[si-1]
        mov str2[di] , al 
        inc di 
        add dl , '0'
        mov str2[di] , dl
        inc di
        mov dl , 0
        new: inc dl
        inc si
    loop l2
    
    xor ax , ax
    printf str3
    printf str2
            
endp main

hlt