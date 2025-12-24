%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
SECTION .text
global _start
_start:
pop ecx ; Извлекаем из стека в `ecx` количество
pop edx ; Извлекаем из стека в `edx` имя программы
sub ecx,1 ; Уменьшаем `ecx` на 1 (количество
mov esi, 1 ; Используем `esi` для хранения

next:
cmp ecx,0h ; проверяем, есть ли еще аргументы
jz _end ; если аргументов нет выходим из цикла
pop eax ; иначе извлекаем следующий аргумент из стека
call atoi ; преобразуем символ в число
mul esi
mov esi,eax 

loop next 
_end:
mov eax, msg 
call sprint
mov eax, esi 
call iprintLF 
call quit 
