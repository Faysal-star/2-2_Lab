; print k-th smallest element in an array
org 100h
include 'emu8086.inc' 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
.model small
.data
    arr db 12,4,6,8,7
    n db $-arr
    mn db ?
    k db ?
    idx dw ?
.code
    mov ah , arr[0]
    mov mn , ah
    
    mov ah , 1 
    int 21h
    sub al , '0'
    
    
    mov cl , al
    l1:
        mov si , 0
        mov bl , n
        mov ah , arr[0]
        mov mn , ah
        l2:
            mov bh , arr[si]
            cmp bh , mn
            jg less
            mov mn , bh
            mov idx , si
            less: inc si
            dec bl
            cmp bl , 0
            je ed
         jmp l2
         
    ed:
        mov ah , 100 
        mov si , idx
        mov arr[si] , ah    
    loop l1
    printn ''
    xor ax , ax 
    mov al , mn
    call print_num   

ret

