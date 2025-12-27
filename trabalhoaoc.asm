.data
debug_status: .asciiz "\n[TESTE] Status (0=Alerta, 1=Normal) - Itac/Manac/Parin/Manaus: "
debug_porcent: .asciiz "\n[TESTE] Porcentagem Excedente (%) - Itac/Manac/Parin/Manaus: "
espaco: .asciiz " "


bem_vindo0: .asciiz "==========»§«============»§«============»§«============»§«============»§«==========\n"
bem_vindo1: .asciiz "» SEJA BEM VINDO AO SISTEMA DE PREVENÇÃO CONTRA ENCHENTES NA REGIÃO NORTE DO BRASIL «\n"
digitar_nome: .asciiz "\n»Digite o seu nome de usuário:\n"
digitar_senha: .asciiz "\n»Digite a sua senha:\n"
mensagem_erro: .asciiz "\n××××× USUÁRIO OU SENHA ERRADOS ×××××\n"
nome_cadastrado: .asciiz "nome certo\n"
senha_cadastrada: .asciiz "senha certa\n" 
logado: .asciiz     "                              »ACESSO LIBERADO«\n"
mensagem_menu: .asciiz "===========» MENU «===========\n"
primeira_selecao: .asciiz "»Selecione o que deseja fazer:\n"
main_opcoes: .asciiz "»1 - Consultar previsões\n»2 - Adicionar novas informações\n»3 - Sair do sistema\n"
erro_opcao: .asciiz "×××× opção inválida, escolha entre: ×××××\n"
escolhe_cidade: .asciiz "»Escolha qual cidade deseja consultar:\n1 - Itacoatiara		2 - Manacapuru		3 - Manaus		4 - Parintins\n"
escolhe_trimestre: .asciiz "»Escolha um trimestre de 2026:\n1 - Dezembro a Fevereiro      2 - Março a Maio     3 - Junho a Agosto      4 - Setembro a Novembro\n"
escolhe_info: .asciiz "»Escolha que tipo de informação deseja incluir à base de dados:\n1 - Precipitação por trimestre\n2 - Cota fluvial\n3 - Porcentagem de infraestrutura\n4 - Voltar ao menu\n"
decisao: .asciiz "»Digite 1 para voltar ao menu principal: "
msg_pos_previsao: .asciiz "\n» Digite 1 para voltar ao menu principal ou 2 para simular investimento: "
prompt_escolha: .asciiz "Sua escolha: "

espaco_nome: .space 1024
espaco_senha: .space 1024
espaco_resposta: .space 1024

.text
.globl main

main:
	
	li $v0, 11
    	li $a0, 10
    	syscall
    	
    	li $v0, 11
    	li $a0, 10
    	syscall
	
	li $v0,4
	la $a0, bem_vindo0
	syscall

	li $v0,4
	la $a0, bem_vindo1
	syscall

	li $v0,4
	la $a0, bem_vindo0
	syscall

cadastro:
	li $v0,4
	la $a0, digitar_nome
	syscall
	
	 li $v0,8
 	la $a0, espaco_nome
 	li $a1, 1024
 	syscall
	
	li $v0,4
	la $a0, digitar_senha
	syscall
	
	li $v0,8
 	la $a0, espaco_senha
 	li $a1, 1024
 	syscall
	
	
	la $a0, espaco_nome
	la $a1, nome_cadastrado
	jal compara
	bne $v0,$zero,erro

	la $a0, espaco_senha
	la $a1, senha_cadastrada
	jal compara
	bne $v0,$zero,erro
	
	j sistema
erro:
	li $v0, 4
	la $a0, mensagem_erro
	syscall
	
	j cadastro

compara:
	lb $t0, 0($a0)
	lb $t1, 0($a1)
	bne $t1,$t0, diferentes
	beq $t0, $zero, iguais
	
	addi $a0,$a0,1
	addi $a1,$a1,1
	j compara
	
	diferentes:
		li $v0,1
		jr $ra
	iguais:
		li $v0,0
		jr $ra	
	
sistema:
	
	li $v0, 11
    	li $a0, 10
    	syscall

	li $v0,4
	la $a0, bem_vindo0
	syscall
	
	li $v0,4
	la $a0, logado
	syscall
	
	li $v0,4
	la $a0, bem_vindo0
	syscall
	

opcao:	

	li $v0, 11
    	li $a0, 10
    	syscall
    	
    	li $v0,4
	la $a0, mensagem_menu
	syscall

	li $v0,4
	la $a0, primeira_selecao
	syscall

	li $v0,4
	la $a0, main_opcoes
	syscall
	
	li $v0, 4
    	la $a0, prompt_escolha
    	syscall

	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0, 11
    	li $a0, 10
    	syscall
	
	beq $t0,1, previsao
	beq $t0,2, informacao
	beq $t0,3, final
	#else
	li $v0,4
	la $a0, erro_opcao
	syscall
	j opcao
	
previsao: 
    li $v0, 4
    la $a0, escolhe_trimestre
    syscall
    
    li $v0, 4
    la $a0, prompt_escolha
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0    #$s0 guarda o trimestre escolhido (1 a 4)
    
    li $v0, 11
    li $a0, 10
    syscall
    
    #Chama o cálculo (agora retorna se é 0 ou 1 em $s0-$s3 e a porcentagem em $s4-$s7)
    jal calculo
    
    
    
    # --- ÁREA DE TESTE (da pra apagar depois, ou só comentar tudo ---
    
    #Imprime ($s0 a $s3)
    li $v0, 4
    la $a0, debug_status
    syscall

    move $a0, $s0    # Itacoatiara
    li $v0, 1
    syscall
    
    li $v0, 4
    la $a0, espaco
    syscall
    
    move $a0, $s1    # Manacapuru
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, espaco
    syscall

    move $a0, $s2    # Parintins
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, espaco
    syscall

    move $a0, $s3    # Manaus
    li $v0, 1
    syscall


    #imprime porcentagem ($s4 a $s7)
    li $v0, 4
    la $a0, debug_porcent
    syscall

    # Itacoatiara %
    mtc1 $s4, $f12      # Move os bits de volta para o processador de float
    li $v0, 2           # Syscall 2 = Imprimir Float
    syscall
    
    li $v0, 4
    la $a0, espaco
    syscall
    
    # Manacapuru %
    mtc1 $s5, $f12
    li $v0, 2
    syscall

    li $v0, 4
    la $a0, espaco
    syscall

    # Parintins %
    mtc1 $s6, $f12
    li $v0, 2
    syscall

    li $v0, 4
    la $a0, espaco
    syscall

    # Manaus %
    mtc1 $s7, $f12
    li $v0, 2
    syscall
    
    # Quebra de linha final
    li $a0, 10
    li $v0, 11
    syscall
    
    # --- FIM DO TESTE ---

    #chama o desenho do bitmap, usando os registradores $s0-$s3
    jal desenha_mapa
    
    #decisao pra voltar ou investir
    li $v0, 4
    la $a0, msg_pos_previsao
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    #se for 1, volta pro menu
    beq $t0, 1, opcao
    
    #se for 2, vai pro investimento
    beq $t0, 2, chamar_investimento
    
    #se digitou algo que não é 1 ou 2, encerra
    j final
    
    
    
chamar_investimento:
    #transfere os valores das porcentagens ($s4-$s7) pros registradores de float ($f27-$f30) que a karen usou no codigo dela
    mtc1 $s4, $f27   #itacoatiara $f27
    mtc1 $s5, $f28   #manacapuru $f28
    mtc1 $s6, $f29   #parintins $f29
    mtc1 $s7, $f30   #manaus $f30

    #chama o codigo de investimento
    jal investimento
    
    #quando voltar do investimento, vai pro menu principal
    j opcao
    
    
informacao:
	li $v0,4
	la $a0, escolhe_info
	syscall
	
	li $v0, 4
    	la $a0, prompt_escolha
    	syscall
	
	li $v0, 5
	syscall
	move $s0,$v0
	
	beq $s0, 4, opcao
	jal adiciona
	jal opcao
 	
final:
	li $v0,10
	syscall
