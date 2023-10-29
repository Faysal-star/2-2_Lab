; Print the minimum and maximum element of an array
org 100h
include 'emu8086.inc'
define_print_num
define_print_num_uns

.data
    arr db 21,2,34,2,4,17,1,35
    n dw $-arr
    mx db ?
    mn db ?
.code
    mov cx , n
    mov si , 0
    mov bh , arr[si] 
    mov mx , bh
    mov mn , bh
    
    l1:
        mov bh , arr[si]
        cmp bh , mx
        jl great
        mov mx , bh
        great: inc si
    loop l1
    mov cx , n 
    mov si , 0
    l2:
        mov bh , arr[si]
        cmp bh , mn
        jg less
        mov mn , bh
        less: inc si
    loop l2 

    print "Min : "
    xor ax , ax
    mov al , mn
    call print_num   
    
    printn ""
    
    print "Max : "
    xor ax , ax
    mov al , mx
    call print_num 
    
ret