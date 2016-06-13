;   laboratory work nr3
;   declare a 10-size array-x with iteger data words nubers
;   calculate their sum
;   calculate request condition

.model small
.data                                                               
x dw 0011h, 3322h, 5544h, 7766h, 9988h, 0011h, 3322h, 5544h, 7766h, 9988h 
message db "Enter a number $"               ; the dollar sign is used to tell the string ended
message2 db " Enter another number $"
message3 db " + $"
message4 db " = $"

.code        
    mov ax, data
    mov ds, ax
    
 
 
    ; procedure definition and code        
    ; the following procedure takes the nuber stored in cx and moves it in ax
    ; ..then adds to ax the value in dx - the second number 
    
    call sum
    mov x, ax
  
    sum:  
        mov cl, 10    
        mov si, 0
        loop:
            ; code what do do in loop 
            mov ax, x[si]               
            inc si
            inc si
            add ax, [x+si]
            add ax, 0
            dec cl
            jnz loop                                          
    ret