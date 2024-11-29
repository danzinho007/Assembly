Rotina usando debugger :

80ab19 rts 
80aafa plb 
80aafb rtl
80be3c jsl $80abb5
80abb5 php
80abb6 php
80abb7 phk
80abb8 plb
80abb9 ldx #$002d
80abbc phx
80abbd lda $0309, X
80abc0 beq $abcf
80abc2 sta $0306
80abc5 lda $030a, X
80abc8 sta $0307

Essa rotina parece manipular a pilha e os registradores, muito comum em rotinas de controle em sistemas embarcados.