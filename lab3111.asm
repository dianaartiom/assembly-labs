.model small

.data                                               

 ; declare a 10-size array x with integer DW numbers
 x dw 9, 1, 2, 3, 4, 5, 6, 7, 8, 9
 
 
.code
start:
    mov ax, @data
    mov ds, ax
    
    ; call the procedure
    call sum      
    ; asfter calling the sum the result is stored in ax
    
    cmp ax, 8000h
    jge  callMax
    callMin:
        call minval 
        jmp end
        
    callMax:
        call maxval
                  
    

    
    ; procedure to calculate the sum of the array elements
    sum proc      
        ; store in si 0 - to be the initial offset of x
        mov si, 0 
        ; store the number to be decremented in cl
        mov cl, 10
        ; make ax to store zero
        xor ax, ax 
        ; make bx to store zero
        xor bx, bx
        loop:
            add ax, [x + si]
            adc ax, 0
            inc si
            inc si
            
            dec cl
            jnz loop
    sum endp

    
    ; procedure to compute max value in the string
    
    maxval proc
        ; store in si 0 - the initial offset of x
        mov si, 0
        ; store the number to be dectremented in cl 
        mov cl, 10
        ; make ax to be 0
        xor ax, ax  
        ; make bx to store zero
        xor bx, bx 
        
        mov ax, [x + si]
        mov dx, [x + si]
        loop2:  
            mov bx, [x + si]
            cmp bx, dx
            js isSmaller
            isGreater: 
                mov dx, bx 
            isSmaller:
            inc si
            inc si
            dec cl
            jnz loop2 
    maxval endp   
    
        
    ; procedure to compute min value in the string
    
    minval proc
        ; store in si 0 - the initial offset of x
        mov si, 0
        ; store the number to be dectremented in cl 
        mov cl, 10
        ; make ax to be 0
        xor ax, ax  
        ; make bx to store zero
        xor bx, bx 
        
        mov ax, [x + si]
        mov bx, [x + si]
        loop1:  
            mov dx, [x + si]
            cmp dx, bx
            jge greater
            lessThan: 
                mov bx, dx 
            greater:
            inc si
            inc si
            dec cl
            jnz loop1 
    minval endp    
    
    
    end:
    
end start
    
