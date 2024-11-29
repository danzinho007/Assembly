section .data
    msg1 db "Aula 02: Pulando linha", 0x0A, 0
    msg2 db "Escrevendo 2 mensagens", 0x0A, 0
    msg3 db "E pegando o tamanho das mensagens", 0x0A, 0

section .text
    global _start

_start:
    ; Escrevendo msg1
    lea rsi, [msg1]        ; Carregar o endereço de msg1
    call msg_length        ; Chamar função para calcular o tamanho
    mov rdx, rax           ; Tamanho retornado em rax
    mov rax, 1             ; syscall: write
    mov rdi, 1             ; file descriptor: stdout
    syscall

    ; Escrevendo msg2
    lea rsi, [msg2]        ; Carregar o endereço de msg2
    call msg_length        ; Calcular o tamanho
    mov rdx, rax           ; Tamanho retornado em rax
    mov rax, 1             ; syscall: write
    mov rdi, 1             ; file descriptor: stdout
    syscall

    ; Escrevendo msg3
    lea rsi, [msg3]        ; Carregar o endereço de msg3
    call msg_length        ; Calcular o tamanho
    mov rdx, rax           ; Tamanho retornado em rax
    mov rax, 1             ; syscall: write
    mov rdi, 1             ; file descriptor: stdout
    syscall

    ; Encerrar o programa
    mov rax, 60            ; syscall: exit
    xor rdi, rdi           ; código de saída 0
    syscall

; Função para calcular o tamanho da mensagem
; Entrada: RSI aponta para o início da string
; Saída: RAX contém o tamanho da string
msg_length:
    xor rax, rax           ; Zerar rax (contador de tamanho)
.next_char:
    cmp byte [rsi + rax], 0 ; Verificar se o byte atual é nulo
    je .done               ; Se for nulo, sair do loop
    inc rax                ; Incrementar contador
    jmp .next_char         ; Repetir para o próximo caractere
.done:
    ret                    ; Retorna com o tamanho em RAX
