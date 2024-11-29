; 1- Armazenar as coisas nas variáveis 
; 2- Armazenas variáveis não inicializadas
; 3- Código executável
; 4- Execução do programa

section .data
    msg1 db "Operações Matemáticas", 0x0A, 0
    msg2 db "Digite 2 números e eu irei somar, subtrair, multiplicar e dividir ambos", 0x0A, 0
    msg3 db "Digite o 1° número : ", 0x0A, 0
    msg4 db "Digite o 2° número : ", 0x0A, 0
    msg_soma db "Soma : ", 0x0A, 0
    msg_sub db "Subtração : ", 0x0A, 0
    msg_mult db "Multiplicação : ", 0x0A, 0
    msg_div db "Divisão : ", 0x0A, 0

section .bss ; Armazenar variáveis não inicializadas
    num1 resq 1
    num2 resq 1
    resultado resq 1

section .text
    global _start

_start: 
    lea rsi, [msg1]
    call msg_length
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall

    lea rsi, [msg2]
    call msg_length
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall

    lea rsi, [msg3]
    call msg_length
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall

    lea rsi, [msg4]
    call msg_length
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall

    ; Lendo o 1° número :
    mov rax, 0 ; syscall : leitura
    mov rdi, 0 ; arquivo de entrada
    mov rsi, num1 ; endereço de memória para armazenar a leitura
    mov rdx, 4 ; tamanho da leitura
    syscall

    ; Convertendo para inteiro :
    mov rsi, [num1] ; carrega o valor lido em rsi
    sub rsi, '0' ; subtrai o valor ASCII de 0 para converter para inteiro
    mov [num1], rsi ; armazena o valor convertido em num1

    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 4
    syscall

    mov rsi, [num2]
    sub rsi, '0'
    mov [num2], rsi

    ; Soma
    mov rax, [num1]
    add rax, [num2]
    mov [resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_soma
    mov rdx, 7
    syscall
    mov rax, [resultado]
    add rax, '0'
    mov [resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, resultado
    mov rdx, 1
    syscall

    ; Subtracao
    mov rax, [num1]
    sub rax, [num2]
    mov [resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_sub
    mov rdx, 11
    syscall
    mov rax, [resultado]
    add rax, '0'
    mov [resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, resultado
    mov rdx, 1
    syscall

    ; Multiplicacao
    mov rax, [num1]
    imul rax, [num2]
    mov [resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_mult
    mov rdx, 14
    syscall
    mov rax, [resultado]
    add rax, '0'
    mov [resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, resultado
    mov rdx, 1
    syscall

    ; Divisao
    mov rax, [num1]
    cqo
    idiv qword [num2]
    mov [resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_div
    mov rdx, 10
    syscall
    mov rax, [resultado]
    add rax, '0'
    mov [resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, resultado
    mov rdx, 1
    syscall

    ; Sai do programa
    mov rax, 60
    xor rdi, rdi
    syscall

    msg_length:
        xor rax, rax           ; Zerar rax (contador de tamanho)
    .next_char:
        cmp byte [rsi + rax], 0 ; Verificar se o byte atual é nulo
        je .done               ; Se for nulo, sair do loop
        inc rax                ; Incrementar contador
        jmp .next_char         ; Repetir para o próximo caractere
    .done:
        ret                    ; Retorna com o tamanho em RAX
