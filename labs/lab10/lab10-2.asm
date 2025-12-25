%include 'in_out.asm'

SECTION .data
filename db 'name.txt', 0
pr db 'Kak vas zovut?: ', 0
intr db 'Menya zovut ', 0

SECTION .bss
name resb 255

SECTION .text
global _start
_start:

mov eax, pr
call sprint

mov ecx, name
mov edx, 255
call sread

mov eax, 8
mov ebx, filename
mov ecx, 0o577
int 0x80

mov esi, eax

mov eax, intr
call slen
mov edx, eax
mov ecx, intr
mov ebx, esi
mov eax, 4
int 0x80

mov eax, name
call slen
mov edx, eax
mov ecx, name
mov ebx, esi

mov eax, 4
int 0x80

mov ebx, esi
mov eax, 8
int 0x80

call quit
