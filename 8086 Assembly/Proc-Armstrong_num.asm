; Check Armstrong Number
org 100h
include 'emu8086.inc'
define_print_num
define_print_num_uns
define_scan_num
.data
    num dw ?
    tnum dw 0
    dig db 3
    sum dw 0
    m dw 0
    d dw 0
.code
main proc 
   printn "ENTER : "
   call scan_num
   mov num , cx
   printn ""
   
   xor ax , ax
   mov ax , num
   mov tnum , ax
   
   mov cl , dig

   l1:
    xor ax ,ax
    mov ax, num
    mov bx , 10
    div bx 
    mov d, dx
    xor bx , bx
    mov num , ax
    mov m , dx 
    call pw
    mov bx , sum
    add bx , m
    mov sum , bx 
   loop l1
   
   printn "SUM :"
   mov ax , sum
   call print_num
   printn ""
   
   cmp ax , tnum
   jne nt
   printn "Armstrong Number"
   hlt
   nt: printn "Not Armstrong"
   hlt
    
endp main

pw proc near 
    mov ch , dig
    l2: 
      mov ax , m
      mul d
      mov m , ax
      dec ch
      cmp ch , 1
      je en
    jmp l2  
    en: mov ch , 0
    ret
endp pw