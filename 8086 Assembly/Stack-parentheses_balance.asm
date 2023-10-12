; Check if the parentheses are balanced or not
org 100h
.data
    m1 db 10,13,'Damm! Balanced$' 
    m2 db 10,13,'Nop! Not Balanced$'  
.code
    printf macro s
        lea dx , s
        mov ah , 9
        int 21h
    endm
    
    xor ax , ax
    mov al , '$'
    push ax
    xor cx,cx
    
    lp:
        mov ah , 1
        int 21h
        cmp al , 0dh
        je ext
        cmp al , '('
        jne sec
        mov ah , 0000h
        push ax
        jmp sesh
        sec: pop ax
        cmp ax , '$'
        jne sesh
        mov cx , 01h
    sesh: jmp lp
    
    cmp cx , 01h
    je end
    ext:
        pop ax 
        cmp ax , '$'
        jne end
        printf m1
        hlt
    end:
        printf m2
        hlt
