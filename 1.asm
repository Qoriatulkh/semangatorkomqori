global main
extern scanf, printf

section .data
	r dd 4.8
	fmt_out db "%f", 10, 0
	
section .bss
	L resq 1

section .text
	main:
			fldpi 
			fmul dword [r]
			fmul dword [r]
			fstp qword[L]
	
			push L
			push r
			call scanf
			add esp, 8

			push dword [L+4]
			push dword [L]
			push fmt_out
			call printf
			add esp, 12
			
			mov eax, 0
			ret
