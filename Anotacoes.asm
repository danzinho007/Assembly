Assembly Perguntas :

0-Onde rodar código assembly ?
https://www.mycompiler.io/pt/new/asm-x86_64

1-O que é uma instrução ?
É uma sequência binária que instrui o processador a executar uma determinada ação

2-O que é Assembly ?
Tradução direta das instruções binárias em uma linguagem textual

3-O que são registradores em Assembly ?
Locais de armazenamento rápido ou váriáveis nerfadas

4-Qual tamanho de um registrador ?
Um registrador armazena uma sequência de 16 1 ou 16 0
Exemplo : 1101110100100 binário é 7076 em Decimal

5-Converter Decimal para Binário:
Divida o número decimal por 2.
Anote o resto (que será 0 ou 1) e armazene.
Continue dividindo o quociente (resultado da divisão) por 2 até que o quociente seja 0.
O número binário será a sequência dos restos lidos de baixo para cima.
Exemplo : 

7076 ÷ 2 = 3538, resto = 0
3538 ÷ 2 = 1769, resto = 0
1769 ÷ 2 = 884, resto = 1
884 ÷ 2 = 442, resto = 0
442 ÷ 2 = 221, resto = 0
221 ÷ 2 = 110, resto = 1
110 ÷ 2 = 55, resto = 0
55 ÷ 2 = 27, resto = 1
27 ÷ 2 = 13, resto = 1
13 ÷ 2 = 6, resto = 1
6 ÷ 2 = 3, resto = 0
3 ÷ 2 = 1, resto = 1
1 ÷ 2 = 0, resto = 1
Lendo os restos de baixo para cima: 1101110100100.

6-Converter Decimal para Hexadecimal:
Divida o número decimal por 16.
Anote o resto, que será um número entre 0 e 15.
Continue dividindo o quociente por 16 até que o quociente seja 0.
O número hexadecimal será a sequência dos restos lidos de baixo para cima.
Resteos maiores que 9 são representados por letras (A=10, B=11, C=12, D=13, E=14, F=15).
Exemplo: Converter 7076 para hexadecimal.

7076 ÷ 16 = 441, resto = 0
441 ÷ 16 = 27, resto = 9
27 ÷ 16 = 1, resto = 11 (B)
1 ÷ 16 = 0, resto = 1
Lendo os restos de baixo para cima: 1B90.

7-Em resumo:
7076 (decimal) = 1101110100100 (binário)
7076 (decimal) = 1B90 (hexadecimal)

8-O que é stack ?
Pilha de valores

9-Qual símbolo é usado para comentar código em Assembly ?
; ( ponto e vírgula)

10-O que significa mov rax, 42 ?
Movendo para o registrador rax o valor 42

11- O que significa add rbx, rcx ?
Somando o valor registrado no rcx ao valor armazenado no registrado rbx, após isso o valor é armazenado no registrador rbx

12-O que significa sub rbx, rcx ?
Subtraindo o valor registrador no rcx ao valor armazenado no registrador rbx, após isso o valor é armazenada no registrado rbx

13- O que significa mul rbx ?
Multiplica rax por rbx e o resultado é armazenado em 2 registradores : rax ( parte baixa ) e rdx ( parte alta )
Exemplo : rax = 10 e rbx = 5
mul rbx ; rax = rax * rbx 
rax = 50 e rdx = 0 

14-O que significa div rcx ?
Divisão sem sinal de 128 bits por uma valor de 64 bits, o resultado é armazenado em 2 registradores : rax ( quociente ) e rdx ( resto )
Exemplo : rax = 20 e rcx = 4
div rcx
rax = 5 e rdx = 0

15- O que significa : lea rsi, [msg1] ?
Carregar o endereço de memória de uma variável / rótulo) no registrador especificado, neste caso, o RSI.

16- O significa : mov rsi, [msg1] ?
Lê o valor armazenado em msg1

12-O que significa mov rax, 1 ?
Chamada de sistema pra escrever

13-O que significa mov rax, 60 ?
Chamada se sistema pra sair do programa

14-Qual a diferença entre rax , eax e ldr ?
rax é sistema x64 / linux
eax é sistema x32 / x86
ldr é sistema ARM ( Android / iOS )

15-


cmp byte [rsi], 10
Verifica se o caractere lido é uma nova linha \n

cmp rax, 0
Não verifica nada

cmp rax, 1
Verifica se foi lido exatamente 1 byte. 
Porém, se rax for maior que 1 (o número de bytes realmente lidos), o código pulará para fim

inc rsi
Avançar o ponteiro no buffer

je ler_char
Vai processar o byte lido

jmp fim
Se nada foi lido, encerra a leitura

jmp ler
Continua lendo 

mov rdi, 1
Identificador do dispositivo de saída padrão ( stdout )

mov rax, 0 / 1 / 60 ( pode ser 0, 1 ou 60 )
0- Usa o modo de leitura ( read ) do Syscall
1- Número da chamada de sistema para escrever (stdout)
60- Número da chamada de sistema para sair

mov rdi, 0
Move a entrada do teclado para o registrador rdi
0: stdin (entrada padrão) — Geralmente, o teclado.
1: stdout (saída padrão) — Geralmente, o terminal (exibe a saída do programa).
2: stderr (saída de erro) — Também o terminal, usado para mensagens de erro.

mov rdi, 0 / 1 / 2 ( pode ser 0, 1 ou 2 )
0- Identificador do dispositivo de entrada padrão (stdin)
O programa lê a entrada do usuário
1- Identificador do dispositivo de saída padrão (stdout)
O programa recebe a nossa entrada
2- Identificador do dispositivo de erro padrão (stderr)
Mostrar erros no terminal

mov rdi, 
mov rdx, 12
Tamanho da mensagem

mov rdx, rax
Movendo o valor armazenado no registrador rax pra rdx. No contexto do seu código, isso é usado pra definir o tamanho em bytes da parte do nome que será escrita na saída.
Após a leitura do nome, rax vai conter o número de bytes lidos, pois é assim que a syscall de read funciona. Ao mover esse valor pra rdx, você tá basicamente preparando o número de bytes que a próxima chamada de write precisa usar pra imprimir o nome do usuário na tela.

mov rsi, mensagem
Move a mensagem para o registrador rsi
rsi é usado para passar o buffer onde o nome do usuário será armazenado. Assim, quando o syscall de leitura (read) for chamado, ele vai saber onde colocar os dados que o usuário digitar. 

num resb 10
Reserva 10 bytes de memória na seção .bss com o rótulo num. 
Se estiver na section .bss : Os valores desses bytes serão inicialmente 0 até que você os modifique durante a execução do programa.

syscall
Chama a rotina de serviço do sistema operacional

variável db 'Frase qualquer ', 0
Guarda na variável o conteúdo da frase

variável db 100 dup(0)
A instrução nome db 100 dup(0) tá reservando espaço na seção de dados do seu programa. Vamos dividir isso:
- nome é o nome da variável que você tá criando.
- db significa "define byte", ou seja, tá definindo um espaço em bytes.
- 100 é a quantidade de bytes que você tá reservando.
- dup(0) significa que você quer inicializar esses 100 bytes com o valor 0, então isso cria um buffer vazio que pode ser usado pra armazenar o nome do usuário.
Basicamente, essa linha tá preparando um espaço na memória pra guardar até 100 caracteres, inicialmente tudo zerado.

xor rdi, rdi
Zerar o registrador rdi. Na verdade, ele faz um "XOR" bit a bit entre rdi e ele mesmo, e o resultado sempre será zero. Então, ao executar esse comando, você garante que rdi fica com o valor 0. Isso é útil para definir um valor de saída, como no seu caso onde 0 significa sucesso ao encerrar o programa. 

O código que você mostrou pedindo o nome do usuário e respondendo com "Olá, [nome]" tá bem estruturado. Se precisar de mais alguma coisa sobre isso, só avisar!
   
    
O que rolou foi que o nome "Daniel" foi lido corretamente e o código terminou a execução sem erros. Mas, parece que ele exibiu apenas "Olá, D" porque o buffer não foi configurado pra pegar o nome completo até o final. O código lê até 100 bytes, mas o rax não foi ajustado pra o número de caracteres lidos antes de passar pra write. Pra resolver isso, vc precisa armazenar a quantidade de bytes lidos. Assim, quando fizer write, vai saber exatamente o que mostrar. 

