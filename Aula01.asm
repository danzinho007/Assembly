section .data ; Guardar dados
    mensagem db 'Olá, mundo!', 0  
    ; Guarda na variável mensagem a frase em " " de tipo byte 
    ; db = byte 
    ; 0 = Final da frase ( string )

section .text ; Seção de código executável
    global _start ; Ponto de entrada do programa

_start: ; Chama a syscall para escrever a mensagem
    mov rax, 1          ; Número da chamada de sistema para escrever (stdout)
    mov rdi, 1          ; Identificador do dispositivo de saída (stdout)
    mov rsi, mensagem   ; Endereço da mensagem
    mov rdx, 12         ; Tamanho da mensagem
    syscall             ; Chama a rotina de serviço do sistema operacional

    ; Sai do programa
    mov rax, 60         ; Número da chamada de sistema para sair
    xor rdi, rdi        ; Código de retorno 0
    syscall             ; Chama a rotina de serviço do sistema operacional
