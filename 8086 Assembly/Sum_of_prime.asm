; print the sum of prime numbers in an array
; check whether the sum is prime or not
include 'emu8086.inc' 
org 100h
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
.model small

.data
    arr db 2,3,5,7,10,0
    l db 5
    sum db 0
    num db 0
    msg db 'Sum is : $'
    msg1 db 10,13,"True : Sum is Prime$"
    msg2 db 10,13,"False : Sum is Not Prime$"

.code

; defining string print macro
printf macro str
     lea dx , str
     mov ah , 09h
     int 21h
endm

main proc
     mov cx , 0000h
     mov cl , l 
     lea si , arr
     
     ; this loop will traverse the array and add every prime
     begin:
        mov al , [si]
        mov num , al
        call prime
        cmp al , 1
        jne not_prime
        mov al , [si]
        add sum , al
        not_prime:
        inc si
      loop begin
     
      ; printing the sum of primes 
      printf msg
      mov ax , 000h 
      mov al , sum
      call PRINT_NUM 
      ; this macro_procedure prints multi-digit number
      ; defined in emu8086.inc header file
      
      
      ; calling prime procedure for checking the sum is prime or not
      mov al , sum
      mov num , al
      call prime
      
      cmp al , 1
      jne np
      printf msg1
      jmp sesh
      np: printf msg2
      
      sesh:ret
         
main endp

; Procedure to check prime number
; if the number is prime it will store 'al = 1' else 'al = 0'
prime proc
    mov al , num
    mov bl , 02h
    mov bh , 00h
    mov dx , 000h
    mov ah , 000h
    cmp al , 2
    je true
    jl false
    
    L1:
        div bl
        cmp ah , 00h
        jne next
        inc bh
        
        next: cmp bh,01h
            je false
            inc bl
            mov ax,000h
            mov dx,000h
            mov al,num
            cmp bl,num
            jne L1
       true:
           mov al , 1
           jmp exit 
       false:
           mov al , 0 
            
       exit: ret
prime endp