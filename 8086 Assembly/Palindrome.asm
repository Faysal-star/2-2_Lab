; input string and determine if it is a palindrome.
org 100h
.model small
.data
    str db 20 dup(0)
    msg1 db 10,13,"True$"
    msg2 db 10,13,"False$"
.code
    mov si ,  0
    here:
        mov ah , 000h
        mov al , 000h
        mov ah , 1
        int 21h
        mov str[si] , al
        
        cmp str[si] , 0dh
        je there
        
        
        cmp str[si] , 41h
        jl nt
        cmp str[si] , 7ah
        jg nt
        
        cmp str[si] , 61h
        jge case
        cont:
        inc si
        
        nt:     
     jne here
     
     case:
        mov ah , 32
        sub str[si] , ah
        jmp cont
         
        
     there:
        dec si
        mov ax , si
        mov cx , 2 
        div cx
        mov cx , ax
         
        mov di , 0
        
        L1:
            mov bh , str[si]
            cmp bh , str[di]
            jne ed
            dec si
            inc di
        loop L1
            
            mov dx , offset msg1
            mov ah, 9
            int 21h
            jmp sesh
        
        ed:
            mov dx , offset msg2
            mov ah, 9
            int 21h
        sesh:
    

ret     
