%include 'in_out.asm'
SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
res: DB 'Результат: ', 0
SECTION .bss
x: RESB 80
a: RESB 80
SECTION .text
GLOBAL _start
_start:
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov edi, eax

    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov esi, eax

    cmp edi, esi
    jl less_case
    
    mov eax, edi      ; eax = x
    mov ebx, 3
    mul ebx          ; eax = 3x
    add eax, 1       ; eax = 3x + 1
    jmp print_result

less_case:
    mov eax, esi      ; eax = a
    mov ebx, 3
    mul ebx          ; eax = 3a
    add eax, 1       ; eax = 3a + 1

print_result:
    mov edi, eax
    mov eax, res
    call sprint
    mov eax, edi
    call iprintLF
    call quit
