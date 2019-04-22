extern scanf, printf, fflush

section .data
	input db "%f", 0
	fmt_out db "%f", 10, 0
	
section .bss
	d resd 1
	Kel resq 1

section .text
	global main
	main:
			push d
			push input
			call scanf
			add esp, 8
			
			fldpi
			fld dword [d]
			fmulp
			fstp qword [Kel] 
	

			push dword [Kel+4]
			push dword [Kel]
			push fmt_out
			call printf
			add esp, 12
			
			push 0
			call fflush
			mov eax, 1
            mov ebx, 0
            int 0x80
