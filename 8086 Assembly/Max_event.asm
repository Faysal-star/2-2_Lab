; Store largest Even -> DX
org 100h
.data
   arr db 7,15,22,10,3,24,12 ; 1,2,3,5,7,9
   l db $-arr
   mx db 0
.code

main proc
   xor cx , cx
   mov cl , l
   mov si , 0 
   l1:
        mov al , arr[si]
        and al , 1
        jnz odd
        mov bl , mx
        mov al , arr[si]
        cmp al , bl
        jle odd
        mov mx , al
        odd: inc si
    loop l1
    
    mov dl , mx 
endp main

hlt




