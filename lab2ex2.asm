.model small

.data
x dw 8
z dw -2          
y dw ?

.code
start:
    mov ax, data
    mov ds, ax      
    
    mov ax, x  
    mov bx, z      
    mov dx, x
    add dx, bx
    shr dx, 1
    mov cl, 3
       
                    ; cmp dx, 4
    test bx, bx
    js label1
                    ; js label1    
    shr ax, cl
    adc ax, 52
    sbb ax, z 
    mov y, ax
    jmp exit  
     
label1:  
    xor ax, ax 
    shl bx, 1
    sbb bx, 61   
    mov y, bx 

exit:
    mov ah, 0       
    int 21h
end start
