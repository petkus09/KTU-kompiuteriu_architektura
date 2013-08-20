data segment
    a dw 07FFFh
    b db 3
    c db 2
    x db 4, 2, 3, -5, 8 
    kiek = $-x
    y dw kiek dup(0AAh)
    isbv DB 'y=',6 dup (?), 0Dh, 0Ah, '$'
    perp DB 'Perpildymas', 0Dh, 0Ah, '$'
    netb DB 'Netelpa i baita', 0Dh, 0Ah, '$'
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    ; add your code here
    mov ax, data
    mov ds, ax
    xor si, si
    xor di, di  
    mov cx, 5 

    naujaprog:
    mov al, x[si]
    mov dl, b
    cmp al, dl
    jg func1
    je func2
    jl func3
    
     
    func1:
        mov al, c
        cbw
        imul ax
            jo perpkl
            
        mov dx, ax
        mov al, b
        cbw
        push ax
        add ax, dx
            jo perpkl
        
        pop dx
        push ax
        mov al, x[si]
        cbw
        sub ax, dx
            jo perpkl
        mov bx, ax
        pop ax 
        xor dx, dx
        idiv bl
        
        cbw
        jmp endoffunc
    
    func2: 
        mov ax, a
        mov dx, 7
        imul dx 
             jo perpkl
             
        push ax
        mov al, x[si]
        cbw 
        mov dx, ax
        pop ax
        sub ax, dx
             jo perpkl
        
        jmp endoffunc
        

    func3:
         mov ax, a
         mov dx, 2
         imul dx
             jo perpkl
         push ax
         mov al, c
         cbw
         cmp ax, 0
         jg notmodulfunc3
            neg ax
         notmodulfunc3:
            pop dx
            add ax, dx
               jo perpkl
         jmp endoffunc
    perpkl:
         LEA dx, perp
         MOV ah, 9
         INT 21h
         XOR al, al
         JMP endoffunc
    netelpkl:
         LEA dx, netb
         MOV ah, 9
         INT 21h
         XOR al, al
         JMP endoffunc    
    
    endoffunc:
         mov y[si], ax 
         dec cx
         inc si
         
         push ax  
         mov bx, offset isbv + 2
         push bx
         call binasc
         mov dx, offset isbv  
         mov ah, 9h
         int 21h
         jcxz ending  
         jmp naujaprog 
             
    ending:               
        mov ax, 4c00h
        int 21h
       

ends
  binasc  PROC NEAR
        PUSH bp
        MOV bp,sp
    ; naudojamø registrø iðsaugojimas
        PUSHA
    ; rezultato eilutæ uþpildome tarpais
        MOV cx, 6
        MOV bx, [bp +4] 
    tarp:
        MOV byte ptr[bx], ' '
        INC bx
        LOOP tarp
    ; skaièius paruoðiamas dalybai ið 10
        MOV ax, [bp+6]
        MOV si, 10
        OR ax, ax
        JNS val
    ; verèiamas skaièius yra neigiamas
        NEG ax
    val:
        XOR dx, dx
        DIV si
    ; gautà liekanà verèiame á ASCII kodà
        ADD dx, '0' ; galima --> ADD dx, 30h
        ; áraðome skaitmená á eilutës pabaigà
        DEC bx
        MOV [bx], dl
    ; skaièiuojame pervestø simboliø kieká
        INC cx
    ; ar dar reikia kartoti dalyba?
        OR ax, ax
        JNZ val
    ; gautas rezultatas. Uþraðome þenklà
    ; pop ax
        MOV ax, [bp+6]
        OR ax, ax
        JNS teig
    ; buvo neigiamas skaièius, uþraðome -
        DEC bx
        MOV byte ptr[bx], '-'
        INC cx
        JMP vepab
    ; buvo teigiamas skaièius, uþraðau +
    teig:
        DEC bx
        MOV byte ptr[bx], '+'
        INC cx
    vepab:
        POPA
        POP bp
        RET
    binasc ENDP
  
end start
