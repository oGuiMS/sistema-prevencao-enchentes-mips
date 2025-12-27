.data
#precisa mudar esse endereço quando for usar em outro computador... só dados.bin não funciona, já tentei
nome_arquivo_add: .asciiz "/Users/guilhermeferro/Desktop/TrabalhoAOC/dados.bin"

#mensagens do menu
choose_cidade:      .asciiz "\n»A qual cidade você deseja alterar o dado?\n1 - Itacoatiara\n2 - Manacapuru\n3 - Parintins\n4 - Manaus\n"
choose_trimestre:   .asciiz "\n»O dado é referente a qual trimestre?\n1 - Dezembro a Fevereiro\n2 - Março a Maio\n3 - Junho a Agosto\n4 - Setembro a Novembro\n"
choose_nivel:       .asciiz "\n»Deseja atualizar:\n1 - Cota de Alerta (Máxima)\n2 - Cota Atual\n"
choose_infra:       .asciiz "\n»Deseja atualizar:\n1 - Urbanização\n2 - Arborização\n3 - Esgotamento\n"
scanf_valor:        .asciiz "»Digite o novo valor:\n"
msg_sucesso:        .asciiz "\n[SUCESSO] Dado atualizado no arquivo dados.bin!"
msg_erro_arq:       .asciiz "\n[ERRO] Nao foi possivel abrir o arquivo para escrita."
prompt_escolha: .asciiz "Sua escolha: "
msg_decisao_final:  .asciiz "\n»Digite 1 para voltar ao menu principal: "

#buffer para ler ou escrever o arquivo inteiro (4 cidades * 10 floats * 4 bytes = 160 bytes)
.align 2
buffer_dados: .space 160

.text
.globl adiciona

#$s0 vem do trabalhoaoc.asm indicando o TIPO de alteração:
#1 = Precipitação
#2 = Nível (Cota)
#3 = Infraestrutura (Porcentagem)

adiciona:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    #pergunta a CIDADE ($s1)
    li $v0, 4
    la $a0, choose_cidade
    syscall
    
    li $v0, 4
    la $a0, prompt_escolha
    syscall
    
    li $v0, 5
    syscall
    move $s1, $v0  #$s1 = cidade (1 a 4)
    
    li $v0, 11
    li $a0, 10
    syscall

    #verifica validade da cidade
    blt $s1, 1, fim_adiciona
    bgt $s1, 4, fim_adiciona

    #direciona para o submenu correto, baseado em $s0
    beq $s0, 1, menu_precipitacao
    beq $s0, 2, menu_nivel
    beq $s0, 3, menu_infra
    j fim_adiciona

# --- SUBMENUS ---

menu_precipitacao:
    li $v0, 4
    la $a0, choose_trimestre
    syscall
    
    li $v0, 4
    la $a0, prompt_escolha
    syscall
    
    li $v0, 5
    syscall
    
    move $s2, $v0
    li $v0, 11
    li $a0, 10
    syscall
    
    addi $t0, $s2, -1   #0 a 3
    li $t1, 4
    mul $t0, $t0, $t1   #pulo do trimestre
    addi $s3, $t0, 20   #$s3 = Offset relativo dentro da cidade
    j pedir_valor

menu_nivel:
    li $v0, 4
    la $a0, choose_nivel
    syscall
    
    li $v0, 4
    la $a0, prompt_escolha
    syscall
    
    li $v0, 5
    syscall
    move $s2, $v0   #1 = Alerta, 2 = Atual
    
    li $v0, 11
    li $a0, 10
    syscall
    
    #cota Alerta = Offset 12 (índice 3)
    #cota Atual  = Offset 16 (índice 4)
    beq $s2, 1, nivel_alerta
    
    #se for 2 (Atual)
    li $s3, 16
    j pedir_valor
nivel_alerta:
    li $s3, 12
    j pedir_valor

menu_infra:
    li $v0, 4
    la $a0, choose_infra
    syscall
    li $v0, 4
    la $a0, prompt_escolha
    syscall
    
    li $v0, 5
    syscall
    
    move $s2, $v0	#1=Urb, 2=Arb, 3=Esg
    li $v0, 11
    li $a0, 10
    syscall
    
    #Urb = 0, Arb = 4, Esg = 8
    addi $t0, $s2, -1   #0, 1 ou 2
    li $t1, 4
    mul $s3, $t0, $t1   #$s3 = Offset relativo (0, 4 ou 8)
    j pedir_valor

# --- LEITURA E ESCRITA ---

pedir_valor:
    #pede o valor float
    li $v0, 4
    la $a0, scanf_valor
    syscall
    
    li $v0, 6
    syscall
    #o valor lido está em $f0
    
    #primeiro, precisa carregar o arquivo pro buffer ---
    
    #abre arquivo pra LEITURA
    li $v0, 13
    la $a0, nome_arquivo_add
    li $a1, 0       #0 = Read Only
    li $a2, 0
    syscall
    move $s6, $v0   #file descriptor
    
    blt $s6, 0, erro_arquivo

    #le o conteúdo
    li $v0, 14
    move $a0, $s6
    la $a1, buffer_dados
    li $a2, 160     #tamanho total (4 cidades * 40 bytes)
    syscall
    
    #fecha o arquivo
    li $v0, 16
    move $a0, $s6
    syscall

    #depois, calcula a posição exata na memória ---
    
    #offset da Cidade = (Cidade - 1) * 40
    addi $t0, $s1, -1
    li $t1, 40
    mul $t0, $t0, $t1
    
    #offset final = offset cidade ($t0) + offset relativo do dado ($s3)
    add $t0, $t0, $s3
    
    #carrega o endereço do buffer
    la $t1, buffer_dados
    add $t1, $t1, $t0   #$t1 agora aponta exatamente pro byte que queremos mudar
    
    #aí, substituimos o valor ---
    s.s $f0, 0($t1)     #grava o float digitado no buffer

    #por fim, salva o arquivo de volta ---
    
    li $v0, 13
    la $a0, nome_arquivo_add
    li $a1, 1       #1 = write Only
    li $a2, 0
    syscall
    move $s6, $v0
    
    blt $s6, 0, erro_arquivo

    #escrever buffer modificado
    li $v0, 15
    move $a0, $s6
    la $a1, buffer_dados
    li $a2, 160     #tamanho total
    syscall
    
    #fecha o arquivo
    li $v0, 16
    move $a0, $s6
    syscall

    #diz que deu certo
    li $v0, 4
    la $a0, msg_sucesso
    syscall

fim_adiciona:
    li $v0, 4
    la $a0, msg_decisao_final
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    # Pula linha
    li $v0, 11
    li $a0, 10
    syscall

    # Recupera endereço de retorno ANTES de decidir
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    # Se digitou 1, volta para quem chamou (Menu Principal)
    beq $t0, 1, volta_pro_menu
    
    # Se digitou qualquer outra coisa (ex: 0), Encerra o programa
    li $v0, 10
    syscall

volta_pro_menu:
    jr $ra

erro_arquivo:
    li $v0, 4
    la $a0, msg_erro_arq
    syscall
    j fim_adiciona
