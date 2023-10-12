; Find sum using procedure
; 1+2+3+......+n
; 1^2+2^2+3^2+......+n^2
org 100h
include 'emu8086.inc' 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
define_scan_num
.data
    n db 0
    nsum dw 0
    n2sum dw 0
    
.code

main proc
    xor ax , ax
    printn "Enter num : "
    call scan_num
    printn ""
    mov ax , cx
    mov n , al
    call ns
    call n2s
    printn "n sum :"
    mov ax , nsum
    call PRINT_NUM
    printn ""
    printn "n^2 sum : "
    mov ax , n2sum
    call PRINT_NUM
    hlt
endp main

ns proc near
    xor cx , cx
   mov cl , n
   lp:
       add nsum , cx
   loop lp
   ret   
endp ns 

n2s proc near
    xor cx , cx
    mov cl , n
    lp2:
        xor ax , ax
        mov ax , cx
        mul ax
        add n2sum , ax
    loop lp2
    ret
endp n2s