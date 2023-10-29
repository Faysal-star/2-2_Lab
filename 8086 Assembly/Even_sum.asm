; print sum of even numbers in array
org 100h  
include 'emu8086.inc' 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
.model small
.data
    arr dw 1,2,3,4,5,6,2,2
    l dw $-arr
    sum dw 0
.code
    mov cx , l
    lea si , arr
    begin:
        mov bx , [si]
        and bx , 1
        jnz odd
        mov bx , [si]
        add sum , bx
        odd:
        add si , 2 
        dec cx
    loop begin
    
    xor ax , ax
    mov ax , sum
    call print_num    

ret




