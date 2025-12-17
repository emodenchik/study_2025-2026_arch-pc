%include 'in_out.asm'

SECTION .data

msg: DB 'Введите строку: ',0h

SECTION .bss ; Секция не инициированных данных
buf1: RESB 80

SECTION .text ; Код программы
GLOBAL _start ; Начало программы
_start:

mov eax, msg ; запись адреса выводимого сообщения в `EAX`
call sprint

mov ecx, buf1 ; запись адреса переменной в `EAX`
mov edx, 80 ; запись длины вводимого сообщения в `EBX`

call sread ; вызов подпрограммы ввода сообщения
call quit
