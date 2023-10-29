; program to find a substring (len 3) in a string
org 100h
.model small
.data
    inp db 'listen$'
    l db 6
    str db 'ist$'
    msg1 db 10,13,'Found$'
    msg2 db 10,13,'Not Found$'

.code

; defining string print macro
printf macro str
     lea dx , str
     mov ah , 09h
     int 21h
endm

main proc
    lea si , inp
    inc si
    lea di , str
    inc di
    mov cl , l 
    dec cl
    start:
        ; comparing middle element
        mov al , [si]
        cmp al , [di]
        jne nt
        ; comparing right element
        mov al , [si+1]
        cmp al , [di+1]
        jne nt
        ; comparing left element
        mov al , [si-1]
        cmp al , [di-1]
        jne nt
        jmp prn
        nt: inc si
    loop start
    
    printf msg2
    jmp end
    
    prn: printf msg1
    
    end: ret
main endp
        




