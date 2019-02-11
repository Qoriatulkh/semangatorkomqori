global main
extern printf
extern fflush
extern scanf
 
section .data
    msg db '%d %d %d %d', 0
    lulus db "lulus", 10,0
    tidak db "tidak", 10,0
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
             
            mov ebx, 40
            CMP eax,ebx
            JAE L1
            JB L2
            
            L1 : push lulus
				 call printf
				 add esp, 4
				 JMP exit
				 
			L2 : push tidak
				 call printf
				 add esp, 4
				              
            ; exit(0)
            exit:
            push 0
            call fflush
            mov eax, 1
            mov ebx, 0
            int 0x80
