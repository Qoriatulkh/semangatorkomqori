extern scanf, printf, fflush

section .data
	input db "%d", 0
	scanff db "%f", 0
	printff db "%.1f", 10, 0
	sum dd 0
	
section .bss
	ratarata resq 1
	banyak resd 1
	nilai resd 1
	
section .text
global main	
main:
	push banyak
	push input
	call scanf 
	add esp, 8
	
	fld dword [sum]
	mov esi, [banyak]
	
L: 
	push nilai
	push scanff
	call scanf 
	add esp, 8
	
	fadd dword [nilai]
	sub esi, 1
	cmp esi, 0
	jne L
	
	fidiv dword [banyak]
	fstp qword [ratarata]

print:
	push dword [ratarata+4]
    push dword [ratarata]
    push printff
    call printf
    add esp, 12
             
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80


