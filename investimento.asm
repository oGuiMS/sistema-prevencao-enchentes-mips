.data

#dados dos rios
rio1_nome:    .asciiz "Amazonas (Itacoatiara)"
rio2_nome:    .asciiz "Solimões (Manacapuru)"
rio3_nome:    .asciiz "Amazonas (Paritins)"
rio4_nome:    .asciiz "Negro (Manaus)"

#preço dos serviços
preco_p1: .float 4800.0
preco_p2: .float 11000.0
preco_p3: .float 10000.0

#variáveis de controle
rio1_tam: .float 50.0
rio2_tam: .float 20.0
rio3_tam: .float 10.0
rio4_tam: .float 11.0111

#mensagens para o usuário
msg_gravidades: .asciiz "\n=== GRAVIDADES DOS RIOS ===\n"
msg_rio1:     .asciiz "1. Amazonas (Itacoatiara): "
msg_rio2:     .asciiz "2. Solimões (Manacapuru): "
msg_rio3:     .asciiz "3. Amazonas (Paritins): "
msg_rio4:     .asciiz "4. Negro (Manaus): "
msg_saldo:    .asciiz "\nSaldo disponivel: R$ "
msg_opcao:    .asciiz "\n=== Selecione uma opção === \n[1] Alocar recursos\n[2] Adicionar saldo\n[3] Acessar porcentagens\n[4] Voltar ao menu\nSua escolha: "
msg_escolha:  .asciiz "\nPara qual rio deseja alocar recursos? (1-4):\n1 - Amazonas (Itacoatiara)\n2 - Solimões (Manacapuru)\n3 - Amazonas (Paritins)\n4 - Negro (Manaus)\nSua escolha: "
msg_add_saldo:.asciiz "\nValor a adicionar ao saldo (R$): "
msg_p1:       .asciiz "Porcentagem do saldo destinada à ARBORIZAÇÃO das vias públicas (%) do Rio "
msg_p2:       .asciiz "Porcentagem do saldo destinada à URBANIZAÇÃO das vias públicas (%) do Rio "
msg_p3:       .asciiz "Porcentagem do saldo destinada ao SANEAMENTO (%) do Rio "
msg_erro_rio: .asciiz "=== ERRO: Rio inválido! Escolha de 1 a 4. ===\n"
msg_erro_opcao:.asciiz "=== ERRO: Opção inválida! Escolha 1, 2, 3 ou 4. ===\n"
msg_continuar:.asciiz "=== Deseja continuar? ===\n[1] Sim\n[0] Não\nSua escolha: "
msg_final:    .asciiz "\n=== PROGRAMA ENCERRADO ===\n"
pergunta_saldo: .asciiz "Insira o valor destinado aos investimentos: R$ "
msg_erro_soma: .asciiz "\n=== ERRO: A soma das porcentagens ultrapassa 100%! ===\n"
dois_pontos:   .asciiz ": "

#constantes
float_100:    .float 100.0
float_1:      .float 1.0
ideal_p1:     .float 40.0
ideal_p2:     .float 50.0
ideal_p3:     .float 10.0
#eficiência base por 1% do ideal
efic_base:    .float 0.1
float_zero:   .float 0.0

#2 casas decimais
float_100_mul: .float 100.0
int_100:      .word 100

#buffers
buffer:       .space 10
nova_linha:   .asciiz "\n"
percent_simb: .asciiz "%"
ponto:        .asciiz "."
zero_str:     .asciiz "0"
espaco:       .asciiz " "

.text
.globl investimento

investimento:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    #impressão das gravidades iniciais
    jal imprimir_gravidades
    
    li $v0, 4
    la $a0, pergunta_saldo
    syscall
    
    li $v0, 6
    syscall
    #armazenamento do saldo no registrador f26
    mov.s $f26, $f0
    
loop_principal:  
    #impressão do saldo
    li $v0, 4
    la $a0, msg_saldo
    syscall
    
    mov.s $f12, $f26
    jal imprimir_2_decimais
    
    #perguntar opção: alocar recursos ou adicionar saldo
pergunta_opcao:
    li $v0, 4
    la $a0, msg_opcao
    syscall
    
    #leitura da string e conversão para inteiro
    li $v0, 5
    syscall
    #guardar opção escolhida (1 ou 2)
    move $s2, $v0
    
    #validação da opção
    beq $s2, 1, opcao_alocar
    beq $s2, 2, opcao_adicionar
    beq $s2, 3, opcao_ver_gravidades
    beq $s2, 4, sair_investimento
    j erro_opcao

opcao_ver_gravidades:
    jal imprimir_gravidades
    li $v0, 4
    la $a0, nova_linha
    syscall
    j loop_principal

opcao_adicionar:
    #perguntar valor a adicionar
    li $v0, 4
    la $a0, msg_add_saldo
    syscall
    
    #ler valor como float
    li $v0, 6
    syscall
    
    #adicionar ao saldo principal (em $f26)
    add.s $f26, $f26, $f0
    
    #pular para pergunta de continuar no programa (s/ mostrar novas gravidades)
    j pergunta_continuar

opcao_alocar:
    #perguntar qual rio
pergunta_rio:
    li $v0, 4
    la $a0, msg_escolha
    syscall
    
    #leitura da string e conversão para inteiro
    li $v0, 5
    syscall
    move $t7,$v0
    
    li $v0, 11
    li $a0, 10
    syscall
    
    #validação dos rios
    blt $t7, 1, erro_rio
    bgt $t7, 4, erro_rio
    
    #perguntar porcentagens ao usuário
pergunta_p1:
    li $v0, 4
    la $a0, msg_p1
    syscall
    
    #imprime nome do rio selecionado
    jal imprimir_nome_rio_atual
    li $v0, 4
    la $a0, dois_pontos
    syscall
    
    li $v0, 6
    syscall
    #%p1 (AGORA FLOAT)
    mov.s $f8, $f0
    
    # --- LOGICA PULAR SE 100% ---
    l.s $f7, float_100
    c.eq.s $f8, $f7
    bc1t p1_eh_100
    c.lt.s $f7, $f8
    bc1t erro_soma_porcentagem
    
pergunta_p2:
    li $v0, 4
    la $a0, msg_p2
    syscall
    
    #imprime nome do rio selecionado
    jal imprimir_nome_rio_atual
    li $v0, 4
    la $a0, dois_pontos
    syscall
    
    li $v0, 6
    syscall
    #%p2 (AGORA FLOAT)
    mov.s $f9, $f0
    
    # --- LOGICA PULAR SE SOMA >= 100% ---
    add.s $f11, $f8, $f9
    c.eq.s $f11, $f7
    bc1t p2_soma_100
    c.lt.s $f7, $f11
    bc1t erro_soma_porcentagem
    
pergunta_p3:
    li $v0, 4
    la $a0, msg_p3
    syscall
    
    #imprime nome do rio selecionado
    jal imprimir_nome_rio_atual
    li $v0, 4
    la $a0, dois_pontos
    syscall
    
    li $v0, 6
    syscall
    #%p3 (AGORA FLOAT)
    mov.s $f10, $f0
    
    #validação da soma das porcentagens > 100
    add.s $f11, $f8, $f9
    add.s $f11, $f11, $f10
    
    l.s $f7, float_100
    c.lt.s $f7, $f11
    bc1t erro_soma_porcentagem
    
    j calcula_tudo

p1_eh_100:
    sub.s $f9, $f9, $f9   # zera p2
    sub.s $f10, $f10, $f10 # zera p3
    j calcula_tudo
    
p2_soma_100:
    sub.s $f10, $f10, $f10 # zera p3
    j calcula_tudo

calcula_tudo:
    # --- NOVA LÓGICA: CALCULAR MELHORIA BASEADA NO SALDO GASTO ---
    l.s $f7, float_100
    
    # --- P1: Arborização ---
    # Quanto dinheiro vai para P1? = Saldo * (p1 / 100)
    div.s $f4, $f8, $f7      # f4 = p1 / 100
    mul.s $f5, $f26, $f4     # f5 = Dinheiro gasto em P1
    l.s $f1, preco_p1        # Preço de 1 ponto de melhoria
    div.s $f16, $f5, $f1     # f16 = Pontos de melhoria conseguidos
    
    # --- P2: Urbanização ---
    div.s $f4, $f9, $f7
    mul.s $f5, $f26, $f4
    l.s $f1, preco_p2
    div.s $f17, $f5, $f1     # f17 = Pontos de melhoria
    
    # --- P3: Saneamento ---
    div.s $f4, $f10, $f7
    mul.s $f5, $f26, $f4
    l.s $f1, preco_p3
    div.s $f18, $f5, $f1     # f18 = Pontos de melhoria
    
    # --- Atualiza o Saldo ---
    # Custo Total = Saldo * (Soma_Porcentagens / 100)
    add.s $f11, $f8, $f9
    add.s $f11, $f11, $f10   # Soma das porcentagens digitadas
    div.s $f11, $f11, $f7    # Divide por 100
    mul.s $f6, $f26, $f11    # Valor gasto
    sub.s $f26, $f26, $f6    # Subtrai do saldo
    
    # --- Soma Total de Melhoria ---
    add.s $f1, $f16, $f17
    add.s $f1, $f1, $f18     # f1 = Total para reduzir da gravidade
    
    j muda_porcentagem


muda_porcentagem:
    #$t7: escolha do rio
    beq $t7, 1, am_it
    beq $t7, 2, sol
    beq $t7, 3, am_par
    beq $t7, 4, negro
   
am_it:
    sub.s $f27, $f27, $f1
    j verificar_limite_zero # Vai verificar se ficou negativo
    
sol:
    sub.s $f28, $f28, $f1
    j verificar_limite_zero
    
am_par:
    sub.s $f29, $f29, $f1
    j verificar_limite_zero
    
negro:
    sub.s $f30, $f30, $f1
    j verificar_limite_zero

# --- NOVA LÓGICA: Se gravidade < 0, vira 0 ---
verificar_limite_zero:
    l.s $f4, float_zero
    
    # Testa Rio 1
    beq $t7, 1, testa_rio1
    beq $t7, 2, testa_rio2
    beq $t7, 3, testa_rio3
    beq $t7, 4, testa_rio4
    j mostrar_resultados

testa_rio1:
    c.lt.s $f27, $f4
    bc1t corrige_rio1
    j mostrar_resultados
corrige_rio1:
    mov.s $f27, $f4
    j mostrar_resultados

testa_rio2:
    c.lt.s $f28, $f4
    bc1t corrige_rio2
    j mostrar_resultados
corrige_rio2:
    mov.s $f28, $f4
    j mostrar_resultados

testa_rio3:
    c.lt.s $f29, $f4
    bc1t corrige_rio3
    j mostrar_resultados
corrige_rio3:
    mov.s $f29, $f4
    j mostrar_resultados

testa_rio4:
    c.lt.s $f30, $f4
    bc1t corrige_rio4
    j mostrar_resultados
corrige_rio4:
    mov.s $f30, $f4
    j mostrar_resultados
    
mostrar_resultados:
    #impressão das novas gravidades
    li $v0, 4
    syscall
    
    jal imprimir_gravidades
    
pergunta_continuar:

    li $v0, 11
    li $a0, 10
    syscall
    
    #pergunta se o usuário deseja continuar
    li $v0, 4
    la $a0, msg_continuar
    syscall
    
    li $v0,5
    syscall
    move $t0,$v0
    
    beq $t0, 1, loop_principal
    
    #encerrar
    li $v0, 4
    la $a0, msg_final
    syscall
    
    jal imprimir_gravidades
    
    li $v0, 4
    la $a0, msg_saldo
    syscall
    
    #mostra saldo final de $f26
    mov.s $f12, $f26
    jal imprimir_2_decimais
    
    li $v0, 10
    syscall

erro_rio:
    li $v0, 4
    la $a0, msg_erro_rio
    syscall
    j pergunta_rio

erro_opcao:
    li $v0, 4
    la $a0, msg_erro_opcao
    syscall
    j pergunta_opcao

erro_soma_porcentagem:
    li $v0, 4
    la $a0, msg_erro_soma
    syscall
    j pergunta_p1

sair_investimento:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

#FUNÇÃO: imprimir nome do rio baseado em t7
imprimir_nome_rio_atual:
    beq $t7, 1, p_rio1
    beq $t7, 2, p_rio2
    beq $t7, 3, p_rio3
    beq $t7, 4, p_rio4
    jr $ra

p_rio1:
	la $a0, rio1_nome
	li $v0, 4
	syscall
	jr $ra

p_rio2: 
	la $a0, rio2_nome
	li $v0, 4
	syscall
	jr $ra

p_rio3: 
	la $a0, rio3_nome
	li $v0, 4
	syscall
	jr $ra

p_rio4: 
	la $a0, rio4_nome
	li $v0, 4
	syscall
	jr $ra

#FUNÇÃO: impressão do número com 2 casas decimais
imprimir_2_decimais:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    s.s $f12, 4($sp)
    
    #multiplicação por 100 para ter 2 casas decimais como inteiro
    l.s $f1, float_100_mul
    mul.s $f0, $f12, $f1
    
    #conversão para inteiro
    cvt.w.s $f0, $f0
    mfc1 $t0, $f0
    
    #separação da parte inteira e decimal
    li $t1, 100
    div $t0, $t1
    #parte inteira
    mflo $t2
    #parte decimal (c/ dois dígitos após a vírgula)
    mfhi $t3
    
    #impressão da parte inteira
    move $a0, $t2
    li $v0, 1
    syscall
    
    #impressão do ponto "."
    li $v0, 4
    la $a0, ponto
    syscall
    
    #para garantir que a parte decimal tenha 2 dígitos
    bge $t3, 10, imprimir_decimal
    
    #impressão do zero extra
    li $v0, 4
    la $a0, zero_str
    syscall
    
imprimir_decimal:
    #impressão da parte decimal
    move $a0, $t3
    li $v0, 1
    syscall
    
    l.s $f12, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 12
    jr $ra

#FUNÇÃO: impressão da gravidade com 2 casas decimais
imprimir_gravidade_formatada:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    jal imprimir_2_decimais
    
    li $v0, 4
    la $a0, percent_simb
    syscall
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

#FUNÇÃO: impressão das gravidades
imprimir_gravidades:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    li $v0, 4
    la $a0, msg_gravidades
    syscall
    
    #primeiro rio
    li $v0, 4
    la $a0, msg_rio1
    syscall
    
    mov.s $f12, $f27
    jal imprimir_gravidade_formatada
    
    li $v0, 4
    la $a0, nova_linha
    syscall
    
    #segundo rio
    li $v0, 4
    la $a0, msg_rio2
    syscall
    
    mov.s $f12, $f28
    jal imprimir_gravidade_formatada
    
    li $v0, 4
    la $a0, nova_linha
    syscall
    
    #terceiro rio
    li $v0, 4
    la $a0, msg_rio3
    syscall
    
    mov.s $f12, $f29
    jal imprimir_gravidade_formatada
    
    li $v0, 4
    la $a0, nova_linha
    syscall
    
    #quarto rio
    li $v0, 4
    la $a0, msg_rio4
    syscall
    
    mov.s $f12, $f30
    jal imprimir_gravidade_formatada
    
    li $v0, 4
    la $a0, nova_linha
    syscall
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra