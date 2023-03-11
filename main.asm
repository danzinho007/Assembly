section .data
    mensagem db 'Olá, mundo!',0

section .text
    global _start

_start:
    ; Escreve a mensagem na tela
    mov edx, tamanho_mensagem ; Tamanho da mensagem
    mov ecx, mensagem ; Endereço da mensagem
    mov ebx, 0 ; Identificador do dispositivo de saída (stdout)
    mov eax, 4 ; Código da chamada de sistema para escrever
    int 0x80 ; Chama a rotina de serviço do sistema operacional

    ; Sai do programa
    mov eax, 1 ; Código da chamada de sistema para sair
    xor ebx, ebx ; Código de retorno 0
    int 0x80 ; Chama a rotina de serviço do sistema operacional

section .bss
    tamanho_mensagem resd 1