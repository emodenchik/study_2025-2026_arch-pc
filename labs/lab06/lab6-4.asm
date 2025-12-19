%include 'in_out.asm'

SECTION .data
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
    mov eax, msg
    call sprint

    mov ecx, x
    mov edx, 80
    call sread

    mov eax, x
    call atoi

    mov ebx, 2      ; Делим x на 2
    xor edx, edx    ; Обнуляем edx перед делением
    div ebx         ; eax = x / 2

    add eax, 8      ; eax = x/2 + 8

    mov ebx, 3      ; Умножаем на 3
    mul ebx         ; eax = (x/2 + 8) * 3

    mov edi, eax    ; Сохраняем результат

    mov eax, rem
    call sprint

    mov eax, edi
    call iprint

    call quit
