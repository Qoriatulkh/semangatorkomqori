global main
extern scanf
extern printf
extern fflush

section .data
	msg db "%d %d",0
	luas db "%d", 10,0
	m dw 2

section .bss
	a resd 1
	b resd 1

section .text
main:
	push a
	push b
	push msg
	call scanf
	add esp, 12
	
	mov eax, [a]
	mul dword [b]
	cdq
	div dword [m]
	
	push eax
	push luas
	call printf
	add esp, 8
	
exit:
	push 0
    call fflush     
    mov eax, 1
	mov ebx, 0
	int 0x80
