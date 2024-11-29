; 1- Armazenar as coisas nas variáveis 
; 2- Armazenas variáveis não inicializadas
; 3- Código executável
; 4- Execução do programa

section .data
msg db "Digite um número : ", 0x0A, 0
msg2 db "Você digitou: ", 0

section .bss
num resb 10

section .text
global _start

_start:
; Imprimir mensagem
mov rax, 1
mov rdi, 1
mov rsi, msg
mov rdx, 19
syscall

; Ler entrada
; 1- Guardar o número no registrador rsi
; 2- Tamanho do número no registrador rdx
; 3- Ler o número 
; 4- Move a entrada do teclado
; 5- Verifica se foi lido pelo menos 1 byte
; 6- Processa o byte lido
; 7- Se nada foi lido, encerra a leitura

mov rsi, num 
mov rdx, 10
ler:
mov rax, 0
mov rdi, 0
syscall
cmp rax, 1
je ler_char
jmp fim

; Processamento do caractere ler_char :
; 1- Verifica se é \n
; 2- Se for, termina a leitura
; 3- Avançar o ponteiro no buffer
; 4- Continua Lendo

ler_char:
cmp byte [rsi], 10 ; \n
je fim
inc rsi
jmp ler

fim:
dec rsi

; Imprimir mensagem de saída :
mov rax, 1
mov rdi, 1
mov rsi, msg2
mov rdx, 15
syscall

; Imprimir número :
mov rax, 1
mov rdi, 1
mov rsi, num
mov rdx, 10
syscall

; Sair
mov rax, 60
xor rdi, rdi
syscall
