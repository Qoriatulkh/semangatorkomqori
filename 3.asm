//
Buatlah program untuk menghitung penambahan bilangan kelipatan lima dari 0 hingga n.

Misal n = 18, maka hasil penambahan: 0 + 5 + 10 + 15 = 30
Contoh Masukan

18

Contoh Keluaran

30

//
global main
extern scanf
extern printf
extern fflush

section .data
	msg db "%d",0
	hasil db "%d", 10,0
	
section .bss
	n resd 1

section .text
main:
	push n
	push msg
	call scanf
	add esp, 8
	
	mov eax, 0
	mov ecx, [n]
	mov ebx, 0
	
L1 : add ebx, 5
	 cmp [n],ebx
	 JB L2
	 add eax,ebx
	 loop L1
	
L2 : push eax
	 push hasil
	 call printf
	 add esp,8
	 JMP exit
	
exit: 
	push 0
    call fflush
	mov eax, 1
    mov ebx, 0
    int 0x80
