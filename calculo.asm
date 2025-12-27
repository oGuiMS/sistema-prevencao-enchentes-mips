.data
#precisa mudar esse endereço quando for usar em outro computador... só dados.bin não funciona, já tentei
nome_arquivo: .asciiz "/Users/guilhermeferro/Desktop/TrabalhoAOC/dados.bin"
.align 2
buffer: .space 160    
erro_txt: .asciiz "\n[ERRO] Arquivo 'dados.bin' nao encontrado.\n"

cem: .float 100.0
noventa: .float 0.09 

.text
.globl calculo

calculo:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    #tenta abrir o arquivo
    li $v0, 13
    la $a0, nome_arquivo
    li $a1, 0
    li $a2, 0
    syscall
     
    move $s6, $v0
    blt $s6, 0, arquivo_nao_encontrado

    #le o arquivo
    li $v0, 14
    move $a0, $s6
    la $a1, buffer
    li $a2, 160
    syscall

    #fecha o arquivo
    li $v0, 16
    move $a0, $s6
    syscall

    # --- PREPARAÇÃO DO TRIMESTRE ---
    # O $s0 vem com o trimestre (1, 2, 3 ou 4). 
    #como usaremos o $s0 para SAÍDA depois, é bom mover o dado para $t9 agora...
    addi $t9, $s0, -1   #guarda em $t9
    
    #pulo de 4 em 4 bytes
    li $t1, 4
    mul $t9, $t9, $t1

    # ---------------------------------------------------------
    # --- ITACOATIARA ---
    la $t8, buffer       
    jal realiza_conta_cidade
    
    #$v1 tem o status (0 ou 1) -> vai para $s0
    move $s0, $v1 
    #$v0 tem a porcentagem -> vai para $s4
    move $s4, $v0

    # ---------------------------------------------------------
    # --- MANACAPURU ---
    la $t8, buffer
    addi $t8, $t8, 40    
    jal realiza_conta_cidade
    
    move $s1, $v1  #status -> $s1
    move $s5, $v0  #porcentagem -> $s5

    # ---------------------------------------------------------
    # --- PARINTINS ---
    la $t8, buffer
    addi $t8, $t8, 80    
    jal realiza_conta_cidade
    
    move $s2, $v1  #status -> $s2
    move $s6, $v0  #porcentagem -> $s6

    # ---------------------------------------------------------
    # --- MANAUS ---
    la $t8, buffer
    addi $t8, $t8, 120   
    jal realiza_conta_cidade
    
    move $s3, $v1  #status -> $s3
    move $s7, $v0  #porcentagem -> $s7

    #isso aq retorna
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

arquivo_nao_encontrado:
    li $v0, 4
    la $a0, erro_txt
    syscall
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# --- FORMULA MATEMATICA E LOGICA DE ALERTA ---
#retorna:
#$v1 = 0 (Alerta) ou 1 (Normal)
#$v0 = Porcentagem excedente (inteiro)
realiza_conta_cidade:
    #primeiro, carrega os dados FIXOS
    l.s $f10, 0($t8)    # Urb
    l.s $f1, 4($t8)     # Arb
    l.s $f2, 8($t8)     # Esg
    l.s $f5, 12($t8)    # Cota Alerta (Máxima)
    l.s $f4, 16($t8)    # Cota Atual Fixa

    #depois, carrega PRECIPITAÇÃO VARIÁVEL, que depende do trimestre escolhido
    addi $t7, $t8, 20   
    add $t7, $t7, $t9
    l.s $f3, 0($t7)     #chuva

    #aí calcula o nivel final ($f1)
    add.s $f1, $f1, $f2  #Arb + Esg
    sub.s $f1, $f1, $f10 #(Arb+Esg) - Urb
    
    l.s $f0, cem
    sub.s $f1, $f0, $f1  #100 - x
    
    mul.s $f1, $f1, $f3  #multiplica pela Chuva
    div.s $f1, $f1, $f0  #divide por 100
    
    l.s $f2, noventa
    mul.s $f0, $f1, $f2  #multiplica por 0.09
    add.s $f1, $f4, $f0  #$f1 = Nível Final

    #por fim, verifica o status de alerta
    #se cotaMax ($f5) < Final ($f1) -> 0 (Alerta)
    c.lt.s $f5, $f1      
    bc1t eh_alerta
    
    #CASO NORMAL (status 1, Porcentagem 0)
    li $v1, 1      #retorna 1 (Normal)
    li $v0, 0      #retorna Porcentagem 0
    jr $ra

eh_alerta:
    #CASO ALERTA (status 0, e calcula Porcentagem)
    li $v1, 0      #retorna Status 0 (Alerta)

    #a porcentagem em si se calcula, pelo que eu entendi, como sendo: ((Final - Alerta) / Alerta) * 100
    sub.s $f6, $f1, $f5  #final - alerta
    div.s $f6, $f6, $f5  #divisão = diferença / alerta
    
    l.s $f8, cem
    mul.s $f6, $f6, $f8  #$f6 agora tem o valor completo (ex: 38.1157...)

    #tem mó role pra passar pra duas casas decimais
    
    #primeiro, multiplica por 100
    mul.s $f6, $f6, $f8  
    
    #dps, Converte pra inteiro, corta as casas decimais extras
    cvt.w.s $f6, $f6     
    
    #aí converte de volta para float
    cvt.s.w $f6, $f6     
    
    #e divide por 100
    div.s $f6, $f6, $f8  
    
    # ------------------------------------

    #move os bits do float arredondado para o registrador de retorno
    mfc1 $v0, $f6        
    
    jr $ra
