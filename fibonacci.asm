global main
extern printf, fflush, scanf
      
section .data
    input db "%d", 0
    output db "%d", 10,0
       
segment .bss
    r resd 4
      
section .text
      
main:
      
        push r
        push input
        call scanf
        add esp, 8
        mov ebx, 1      
        mov edx, 0      
        mov ecx, [r]    
        loop fib        
            
fib:
        mov  eax, 0
        add  eax,ebx 
        add  eax,edx     
        mov  edx,ebx 
        mov  ebx,eax 
        loop fib
           
           
            
exit:
        push eax
        push output
        call printf
        add esp, 8
              
        push 0
        call fflush
        add esp, 4
        mov eax, 1         
        mov ebx, 0
        int 0x80
