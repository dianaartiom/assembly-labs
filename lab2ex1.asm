.model small
.data    
x dw 5 dup(?)  
a dw 0001h;, DEF0h
b dw 0001h;, 5678h;, 1234h, 5678h

.code
begin:
    mov ax, @data
    mov ds, ax
    
    mov cx, 5       ; set the value of counter to be 5 
    mov bx, x       ; coborim valoarea lui x in bx 
    mov ax, a       ; set the value of ax to be a           
    mul b           ; multiply the value of ax with b
    sbb a, 30       ; store a*b - 30 in ax
    mov si, 0       ; initialize with 0 the si
    
loop:
    adc bx, ax      ; add the value of ax in bx
    mov x[si], bx
    inc si
    inc si
    dec cx  
    jnz loop   
    
    ;mov x, bx
   
end begin