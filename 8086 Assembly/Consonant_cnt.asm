; count the consonants of a string 
; input -> printf("Hello") , out -> 8 

org 100h
.data

.code

main proc
    xor dx , dx
    l1:   
        mov ah , 1 
        int 21h
        cmp al , 0dh
        je sesh
        cmp al , 'a'
        je ennd
        cmp al , 'e'
        je ennd  
        cmp al , 'i'
        je ennd
        cmp al , 'o'
        je ennd
        cmp al , 'u'
        je ennd
        cmp al , 'A'
        jle ennd
        cmp al , 'E'
        je ennd  
        cmp al , 'I'
        je ennd
        cmp al , 'O'
        je ennd
        cmp al , 'U'
        je ennd 
        cmp al , 'z'
        jg ennd
        inc dx
     ennd: jmp l1
     sesh:       
endp main 
hlt