global main
extern printf
extern fflush
extern scanf
  
section .data
    msg db '%d %d %d', 0
     x db '3',10,0
     y db '1',10,0
section .bss
    a resd 1
    b resd 1
    c resd 1
    
section .text
    main:
            
            push a
            push b
            push c
            push msg
            call scanf
            add  esp, 16
              
            mov eax, [a]
            mov ebx, [b]
            mov ecx, [c]       
              
            CMP eax,ebx
            JG L1
            JB L2          
             
            L1 : CMP eax,ecx
				 JG L3			
				 JB L2
            
            L3 : push y
			     call printf
			     add esp, 4
			     JMP exit
			     
            L2 : push x
                 call printf
                 add esp, 4
              
                            
            ; exit(0)
            exit:
            push 0
            call fflush
            mov eax, 1
            mov ebx, 0
            int 0x80
    

    
