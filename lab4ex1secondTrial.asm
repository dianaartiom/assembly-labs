.model small
.data
    answer  db       10 DUP(?)
    x       db      "abcdefghjinkmln $"
    myName  db      "diana artiom $" 
      
    sizeX   db       ?
    sizeMyName db    ?
    

.code
start:
    mov ax, @data
    mov ds, ax           
              
    
    call computeNOfElementsInX
    call computeNOfElementsInMyName
    
    call compareStrings    
                       
    computeNOfElementsInX proc 
        xor al, al
        xor bl, bl 
        xor cl, cl
        
        xor si, si  
        mov bl, '$'
        
        loop3:  
            mov al, [x+si] 
            inc si
            ; inc si
            
            inc cl   
            
            cmp al,bl            
            jne loop3
             
            mov sizeX, cl
    computeNOfElementsInX endp  
    
    
     computeNOfElementsInMyName proc 
        xor al, al
        xor bl, bl 
        xor cl, cl
        mov bl, '$'
        xor si, si
        
        loop4:
            mov al, x[si]   
            inc si
            ;  inc si
            
            inc cl          
            cmp al, bl
            jne loop4   
            mov sizeMyName, cl
            
    computeNOfElementsInMyName endp
    
                      
                      
                      
                      
                      
  ; cautam caracter cu caracter
      cmpr proc
        xor ax, ax
        xor ax, ax
        xor bx, bx
        xor si, si 
        xor di, di
        
        
        mov al, [myName + si]      
        loop2: 
            mov bl, [x + di]
            inc di
            cmp al, bl
            jne different
            mov [answer+si], bl
            
            jmp equal 
            
            different:
                jnz loop2 
            
            equal:
                inc si
                ; inc si 
                
                dec cl
                jz outside
                jmp loop1
            
      cmpr endp
        
        
        
    ; procedure to see whether the letters are present in the mname
    compareStrings proc
        
        mov cl, [sizeMyName]           ; TO DO: De aflat lungimea unui string     
        mov dl, [sizeX]                  ; length of the string with which I`m going to compare
        
        xor ax, ax
        xor ax, ax
        xor bx, bx
        xor si, si
        
        
        
         
         
        
        loop1:
            mov al, [myName + si]  
            ; mov di, 0 
            xor di, di
 
                mov bl, [x + di]
                cmp al, bl
                jne different
                mov [answer+si], bl
                
                jmp equal1 
                
                different1: 
                    ; inc di
                    inc di
                    
                    dec dl
                    jnz loop2 
                
                equal1:
                    inc si
                    ; inc si 
                    
                    dec cl
                    jz outside
                    jmp loop1 
        outside:
        compareStrings endp
    
end start                                 