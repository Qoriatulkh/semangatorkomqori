global main
extern printf
extern fflush
extern scanf
  
section .data
    msg db '%d', 0
    lagi db '%d',10,0
    
section .bss
    n resd 1
  
section .text
    main:           
            push n
            push msg
            call scanf
            add  esp, 8
              
            mov eax,1
            mov ecx,[n]
            mov ebx, 2
     
            
            L1 : mul ebx
				 LOOP L1
			
			push eax
			push lagi
			call printf
			add esp, 8
              
                            
            ; exit(0)
            exit:
            push 0
            call fflush      
            add esp, 4
            mov eax, 1
            mov ebx, 0
            int 0x80
    

    

