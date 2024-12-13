; Rever 
; Era pra sair > 
; Digite seu nome : Daniel
; Olá Daniel

section .data
    msg db 'Digite seu nome : ', 0
    resposta db 'Olá : ', 0

section .bss
    nome resb 100
    
section .text
    global _start

_start:
    ; Solicitar nome
    mov rax, 1                 ; syscall para write
    mov rdi, 1                 ; stdout
    mov rsi, msg               ; mensagem
    mov rdx, 19                ; comprimento da mensagem
    syscall

    ; Ler nome de usuário
    mov rax, 0                 ; syscall para read
    mov rdi, 0                 ; stdin
    mov rsi, nome              ; buffer onde armazenar
    mov rdx, 100               ; número máximo de bytes a ler
    syscall

    ; Aqui, rax tem o número de bytes lidos
    mov byte [nome + rax - 1], 0 ; substitui o último caractere por 0 (null terminator)

    ; Escrever o nome
    mov rdi, 1                 ; stdout
    mov rsi, nome              ; buffer
    mov rdx, rax               ; número de bytes lidos (sem o Enter)
    mov rax, 1                 ; syscall para write
    syscall

    ; Mostrar a resposta
    mov rax, 1                 ; syscall para write
    mov rdi, 1                 ; stdout
    mov rsi, resposta          ; resposta
    mov rdx, 6                 ; comprimento da resposta
    syscall

    ; Encerrar o programa
    mov rax, 60                ; syscall para exit
    xor rdi, rdi               ; status zero
    syscall
