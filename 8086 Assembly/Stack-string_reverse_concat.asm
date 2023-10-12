; Take 2 strings -> Reverse them using stack
; Concat one after another -> Print the result
org 100h
.data
    s1 db 'abcg$'
    s2 db 'def$'
    s db 10 dup('$') 
    n dw ?
.code
    printf macro s
        lea dx , s
        mov ah , 9
        int 21h
    endm
    
    xor ax , ax
    mov ax , '$'
    push ax
    
    mov si , 0
    lp1:
       xor ax , ax 
       mov al , s1[si]
       cmp al , '$'
       je le1
       push ax
       inc si
    jmp lp1
    le1:
    
    mov si , 0
    lp3:
      xor ax , ax
      pop ax
      cmp al , '$'
      je le3
      mov s[si] , al
      inc si
    jmp lp3
    le3:
    
    mov n , si
    
    xor ax , ax
    mov ax , '$'
    push ax
    mov si , 0
    lp2:
       xor ax , ax 
       mov al , s2[si]
       cmp al , '$'
       je le2
       push ax
       inc si
    jmp lp2
    le2:
    
    mov si , n 
    
    lp4:
      xor ax , ax
      pop ax
      cmp al , '$'
      je le4
      mov s[si] , al
      inc si
    jmp lp4
    le4:
    
   printf s