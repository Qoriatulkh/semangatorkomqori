// Buatlah program untuk mengklasifikasikan nilai siswa sesuai rentang berikut:

    0–50: tidak lulus
    51–70: remedial
    71–100: lulus

Contoh Masukan

85

Contoh Keluaran

lulus

//



global main
extern scanf
extern printf
extern fflush

section .data
	msg db "%d", 0
	tidaklulus db "tidak lulus",10,0
	remedial db "remedial", 10,0
	lulus db "lulus", 10,0
	
section .bss
	a resd 1

section .text
main: 
	push a
	push msg
	call scanf
	add esp,8
	
	mov eax, [a]
	mov ebx, 50
	CMP eax,ebx
	JBE L2
	JA L1
	
	L1 : mov ebx, 51
		 CMP eax,ebx
		 JAE L3
		 
	L2 : push tidaklulus
		 call printf
		 add esp, 4
		 JMP exit
		 
	L3 : mov ebx, 70
		 CMP eax, ebx
		 JBE L4
		 JA L5
	L4 : push remedial
		 call printf
		 add esp, 4
		 JMP exit
	L5 : mov ebx, 100
		 CMP eax, ebx
		 JBE L6
	L6 : push lulus
		 call printf
		 add esp, 4
		 JMP exit
	
exit:
	push 0
    call fflush     
    mov eax, 1
	mov ebx, 0
	int 0x80


