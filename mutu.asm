global main
extern printf
extern fflush
extern scanf
 
section .data
    msg db '%d %d %d %d', 0
    A db "A", 10, 0
    B db "B", 10, 0
    C db "C", 10, 0
    D db "D", 10, 0
    E db "E", 10, 0
    m dw 4
     
section .bss
    a resd 1
    b resd 1
    c resd 1
    d resd 1
 
section .text
    main:
           
            push a
            push b
            push c
            push d
            push msg
            call scanf
            add  esp, 20
             
            mov eax, [a]
            mov ebx, [b]
            mov ecx, [c]
            mov edx, [d]         
          
            add eax, ebx
            add ecx, edx
            add eax, ecx
            cdq
            div dword [m]
             
            mov ebx, 39
            CMP eax,ebx
            JBE L2
            JA L1
            
            L1 : mov ebx, 49
				 CMP eax,ebx
				 JBE L3
				 JA L4
				 CMP eax,ebx
				 
			L4 : mov ebx, 59
				 CMP eax,ebx
				 JBE L5
				 JA L6
				
			L6 : mov ebx, 79
				 CMP eax,ebx
				 JBE L7
				 JA L8
			
			L8 : mov ebx, 100
				 CMP eax,ebx
				 push A
				 call printf 
				 add esp, 4
				 jmp exit
			
				 
			L2 : push E
				 call printf
				 add esp, 4
				 jmp exit
			
			L3 : push D
				 call printf
				 add esp, 4
				 jmp exit
				 
			L5 : push C
				 call printf 
				 add esp, 4
				 jmp exit
				 
			L7 : push B
				 call printf
				 add esp, 4
				 jmp exit
				 
				
				              
            ; exit(0)
            exit:
            push 0
            call fflush
            mov eax, 1
            mov ebx, 0
            int 0x80

