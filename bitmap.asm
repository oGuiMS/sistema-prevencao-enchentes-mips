.data

# cores usadas no mapa ----------------------- >>

cores:		.word 0x004E9CA6 # [0] azul
		.word 0x008ACC6C # [1] verde
		.word 0x00000000 # [2] ponto cidade - preto
		
		.word 0x00FC3F19 # [3] vermelho - ruim
		.word 0x00FFD91C # [4] amarelo - m�dio
		.word 0x00FFF7E8 # [5] branco - bom

 # Os pixels que representam as cidades est�o na linha 2296

    .text
    .globl desenha_mapa
    
    desenha_mapa:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

bitmapa:
	
 # ------------------------------------------------- TERRA
 
 # ---------------------------------- 0 LINHA 
 
	li $a0, 0 # x
	li $a1, 0 # y
	li $a2, 1 # cor
	li $a3, 31 # tamanho
	jal linha
	
	li $a0, 32 # coordenada x
	li $a1, 0 # coordenada y
	li $a2, 1 # cor do pixel
	jal ponto
	
	li $a0, 36 # coordenada x
	li $a1, 0 # coordenada y
	li $a2, 1 # cor do pixel
	jal ponto
	
	li $a0, 44 # x
	li $a1, 0 # y
	li $a2, 1 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 47 # x
	li $a1, 0 # y
	li $a2, 1 # cor
	li $a3, 81 # tamanho
	jal linha
	
 # ---------------------------------- 1 LINHA 

	li $a0, 0 # x
	li $a1, 1 # y
	li $a2, 1 # cor
	li $a3, 30 # tamanho
	jal linha
	
	li $a0, 37 # coordenada x
	li $a1, 1 # coordenada y
	li $a2, 1 # cor do pixel
	jal ponto
	
	li $a0, 38 # coordenada x
	li $a1, 1 # coordenada y
	li $a2, 1 # cor do pixel
	jal ponto
	
	li $a0, 43 # x
	li $a1, 1 # y
	li $a2, 1 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 49 # x
	li $a1, 1 # y
	li $a2, 1 # cor
	li $a3, 79 # tamanho
	jal linha

 # ---------------------------------- 2 LINHA
 
	li $a0, 0 # x
	li $a1, 2 # y
	li $a2, 1 # cor
	li $a3, 32 # tamanho
	jal linha

	li $a0, 50 # x
	li $a1, 2 # y
	li $a2, 1 # cor
	li $a3, 52 # tamanho
	jal linha
 
	li $a0, 103 # x
	li $a1, 2 # y
	li $a2, 1 # cor
	li $a3, 25 # tamanho
	jal linha
	
 # ---------------------------------- 3 LINHA
	 
	li $a0, 0 # x
	li $a1, 3 # y
	li $a2, 1 # cor
	li $a3, 35 # tamanho
	jal linha
	
	li $a0, 52 # coordenada x
	li $a1, 3 # coordenada y
	li $a2, 1 # cor do pixel
	jal ponto
	 
	li $a0, 54 # x
	li $a1, 3 # y
	li $a2, 1 # cor
	li $a3, 49 # tamanho
	jal linha	
 
	li $a0, 106 # x
	li $a1, 3 # y
	li $a2, 1 # cor
	li $a3, 25 # tamanho
	jal linha
	
 # ---------------------------------- 4 LINHA		
	 
	li $a0, 0 # x
	li $a1, 4 # y
	li $a2, 1 # cor
	li $a3, 38 # tamanho
	jal linha
	
	li $a0, 41 # coordenada x
	li $a1, 4 # coordenada y
	li $a2, 1 # cor do pixel
	jal ponto

	li $a0, 55 # x
	li $a1, 4 # y
	li $a2, 1 # cor
	li $a3, 49 # tamanho
	jal linha
	
	li $a0, 107 # x
	li $a1, 4 # y
	li $a2, 1 # cor
	li $a3, 21 # tamanho
	jal linha
	
 # ---------------------------------- 5 LINHA		
	 
	li $a0, 0 # x
	li $a1, 5 # y
	li $a2, 1 # cor
	li $a3, 43 # tamanho
	jal linha
	
	li $a0, 55 # x
	li $a1, 5 # y
	li $a2, 1 # cor
	li $a3, 51 # tamanho
	jal linha
	
	li $a0, 113 # x
	li $a1, 5 # y
	li $a2, 1 # cor
	li $a3, 15 # tamanho
	jal linha
	
 # ---------------------------------- 6 LINHA
	 
	li $a0, 0 # x
	li $a1, 6 # y
	li $a2, 1 # cor
	li $a3, 45 # tamanho
	jal linha
	 
	li $a0, 54 # x
	li $a1, 6 # y
	li $a2, 1 # cor
	li $a3, 56 # tamanho
	jal linha
	
	li $a0, 116 # x
	li $a1, 6 # y
	li $a2, 1 # cor
	li $a3, 12 # tamanho
	jal linha

 # ---------------------------------- 7 LINHA

	li $a0, 0 # x
	li $a1, 7 # y
	li $a2, 1 # cor
	li $a3, 46 # tamanho
	jal linha
	
	li $a0, 52 # x
	li $a1, 7 # y
	li $a2, 1 # cor
	li $a3, 63 # tamanho
	jal linha
	
	li $a0, 117 # x
	li $a1, 7 # y
	li $a2, 1 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 124 # x
	li $a1, 7 # y
	li $a2, 1 # cor
	li $a3, 4 # tamanho
	jal linha
	
 # ---------------------------------- 8 LINHA

	li $a0, 1 # x
	li $a1, 8 # y
	li $a2, 1 # cor
	li $a3, 115 # tamanho
	jal linha
	
	li $a0, 118 # x
	li $a1, 8 # y
	li $a2, 1 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 126 # x
	li $a1, 8 # y
	li $a2, 1 # cor
	li $a3, 2 # tamanho
	jal linha

 # ---------------------------------- 9 LINHA
 
	li $a0, 1 # x
	li $a1, 9 # y
	li $a2, 1 # cor
	li $a3, 114 # tamanho
	jal linha
	
	li $a0, 117 # x
	li $a1, 9 # y
	li $a2, 1 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 125 # x
	li $a1, 9 # y
	li $a2, 1 # cor
	li $a3, 3 # tamanho
	jal linha
 
 # ---------------------------------- 10 LINHA
 
	li $a0, 0 # x
	li $a1, 10 # y
	li $a2, 1 # cor
	li $a3, 114 # tamanho
	jal linha
	
	li $a0, 115 # x
	li $a1, 10 # y
	li $a2, 1 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 124 # x
	li $a1, 10 # y
	li $a2, 1 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 127 # coordenada x
	li $a1, 10 # coordenada y
	li $a2, 1 # cor do pixel
	jal ponto

 # ---------------------------------- 11 LINHA
 
	li $a0, 2 # x
	li $a1, 11 # y
	li $a2, 1 # cor
	li $a3, 113 # tamanho
	jal linha
	
	li $a0, 119 # coordenada x
	li $a1, 11 # coordenada y
	li $a2, 1 # cor do pixel
	jal ponto

 # ---------------------------------- 12 LINHA
 
	li $a0, 3 # x
	li $a1, 12 # y
	li $a2, 1 # cor
	li $a3, 111 # tamanho
	jal linha
 
 # --------------------------------- LINHA 13 AT� 63
 
 	li $a0, 0 # x
	li $a1, 13 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 14 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 15 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 16 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 17 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 18 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 19 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 20 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 21 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 22 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 23 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 24 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha

 	li $a0, 0 # x
	li $a1, 25 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 26 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 27 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 28 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 29 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 30 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 31 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 32 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 33 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 34 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 35 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 36 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
 	li $a0, 0 # x
	li $a1, 37 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 38 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 39 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 40 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 41 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 42 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 43 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 44 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 45 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 46 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 47 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 48 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha

 	li $a0, 0 # x
	li $a1, 49 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 50 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 51 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 52 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 53 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 54 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 55 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 56 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 57 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 58 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 59 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 60 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 61 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 62 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha
	
	li $a0, 0 # x
	li $a1, 63 # y
	li $a2, 1 # cor
	li $a3, 128 # tamanho
	jal linha

 # ------------------------------------------------- �GUA
 # ---------------------------------- 0 LINHA 
      
	li $a0, 31 # coordenada x
	li $a1, 0 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

	li $a0, 33 # x
	li $a1, 0 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 37 # x
	li $a1, 0 # y
	li $a2, 0 # cor
	li $a3, 7 # tamanho
	jal linha
	       
	li $a0, 46 # coordenada x
	li $a1, 0 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto      
	
 # ---------------------------------- 1 LINHA	
 	
	li $a0, 30 # x
	li $a1, 1 # y
	li $a2, 0 # cor
	li $a3, 7 # tamanho
	jal linha
         	
	li $a0, 39 # x
	li $a1, 1 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha 
	         	
	li $a0, 45 # x
	li $a1, 1 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha 
	
 # ---------------------------------- 2 LINHA     

	li $a0, 32 # x
	li $a1, 2 # y
	li $a2, 0 # cor
	li $a3, 20 # tamanho
	jal linha
	       
	li $a0, 102 # coordenada x
	li $a1, 2 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

 # ---------------------------------- 3 LINHA

	li $a0, 35 # x
	li $a1, 3 # y
	li $a2, 0 # cor
	li $a3, 21 # tamanho
	jal linha
       
	li $a0, 53 # coordenada x
	li $a1, 3 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto	      

	li $a0, 103 # x
	li $a1, 3 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha

 # ---------------------------------- 4 LINHA

	li $a0, 38 # x
	li $a1, 4 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 42 # x
	li $a1, 4 # y
	li $a2, 0 # cor
	li $a3, 13 # tamanho
	jal linha
	
	li $a0, 104 # x
	li $a1, 4 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 # ---------------------------------- 5 LINHA
 
 	li $a0, 43 # x
	li $a1, 5 # y
	li $a2, 0 # cor
	li $a3, 12 # tamanho
	jal linha
	
 	li $a0, 106 # x
	li $a1, 5 # y
	li $a2, 0 # cor
	li $a3, 7 # tamanho
	jal linha
	
 # ---------------------------------- 6 LINHA
 
 	li $a0, 45 # x
	li $a1, 6 # y
	li $a2, 0 # cor
	li $a3, 9 # tamanho
	jal linha
	
 	li $a0, 110 # x
	li $a1, 6 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha

 # ---------------------------------- 7 LINHA

 	li $a0, 46 # x
	li $a1, 7 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 115 # x
	li $a1, 7 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 123 # coordenada x
	li $a1, 7 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto	
	
 # ---------------------------------- 8 LINHA      
 
	li $a0, 0 # coordenada x
	li $a1, 8 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 116 # x
	li $a1, 8 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 124 # x
	li $a1, 8 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha

 # ---------------------------------- 9 LINHA      
 
	li $a0, 0 # coordenada x
	li $a1, 9 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

	li $a0, 115 # x
	li $a1, 9 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 122 # x
	li $a1, 9 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 # ---------------------------------- 10 LINHA      
 
	li $a0, 114 # coordenada x
	li $a1, 10 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 120 # x
	li $a1, 10 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha

	li $a0, 126 # coordenada x
	li $a1, 10 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 11 LINHA  
 
 	li $a0, 0 # x
	li $a1, 11 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 	li $a0, 115 # x
	li $a1, 11 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
 	li $a0, 120 # x
	li $a1, 11 # y
	li $a2, 0 # cor
	li $a3, 8 # tamanho
	jal linha
 
 # ---------------------------------- 12 LINHA  
 
 	li $a0, 0 # x
	li $a1, 12 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 	li $a0, 114 # x
	li $a1, 12 # y
	li $a2, 0 # cor
	li $a3, 14 # tamanho
	jal linha
	
 # ---------------------------------- 13 LINHA  
 
 	li $a0, 1 # x
	li $a1, 13 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 	li $a0, 113 # x
	li $a1, 13 # y
	li $a2, 0 # cor
	li $a3, 14 # tamanho
	jal linha
	
 # ---------------------------------- 14 LINHA  
 
 	li $a0, 0 # x
	li $a1, 14 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
 	li $a0, 113 # x
	li $a1, 14 # y
	li $a2, 0 # cor
	li $a3, 10 # tamanho
	jal linha

 # ---------------------------------- 15 LINHA  

 	li $a0, 2 # x
	li $a1, 15 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 	li $a0, 5 # x
	li $a1, 15 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 	li $a0, 114 # x
	li $a1, 15 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
 	li $a0, 126 # x
	li $a1, 15 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 # ---------------------------------- 16 LINHA  

	li $a0, 0 # coordenada x
	li $a1, 16 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

	li $a0, 3 # x
	li $a1, 16 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 9 # coordenada x
	li $a1, 16 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 115 # x
	li $a1, 16 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 125 # x
	li $a1, 16 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 # ---------------------------------- 17 LINHA  
 
	li $a0, 1 # x
	li $a1, 17 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 6 # x
	li $a1, 17 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha

	li $a0, 123 # x
	li $a1, 17 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
 
 # ---------------------------------- 18 LINHA  
 
	li $a0, 3 # x
	li $a1, 18 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 9 # x
	li $a1, 18 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 122 # x
	li $a1, 18 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
 
 # ---------------------------------- 19 LINHA  
 
 	li $a0, 5 # x
	li $a1, 19 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 8 # x
	li $a1, 19 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 122 # x
	li $a1, 19 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha

 	li $a0, 100 # x
	li $a1, 19 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 71 # x
	li $a1, 19 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 # ---------------------------------- 20 LINHA  
 
 	li $a0, 4 # x
	li $a1, 20 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 	li $a0, 7 # x
	li $a1, 20 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha

 	li $a0, 98 # x
	li $a1, 20 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha

	li $a0, 102 # x
	li $a1, 20 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 	li $a0, 73 # x
	li $a1, 20 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 121 # x
	li $a1, 20 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha

	li $a0, 124 # coordenada x
	li $a1, 20 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 21 LINHA  
 	
	li $a0, 6 # x
	li $a1, 21 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 12 # x
	li $a1, 21 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 76 # x
	li $a1, 21 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha

	li $a0, 97 # x
	li $a1, 21 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 103 # x
	li $a1, 21 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 107 # x
	li $a1, 21 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 119 # x
	li $a1, 21 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 # ---------------------------------- 22 LINHA  
 
 	li $a0, 4 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
 
 	li $a0, 7 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 	li $a0, 12 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 	li $a0, 78 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 82 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 	li $a0, 97 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 104 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 	li $a0, 108 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 	li $a0, 116 # x
	li $a1, 22 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
 # ---------------------------------- 23 LINHA

	li $a0, 5 # x
	li $a1, 23 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 9 # x
	li $a1, 23 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 79 # x
	li $a1, 23 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 96 # x
	li $a1, 23 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 104 # x
	li $a1, 23 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 110 # x
	li $a1, 23 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 114 # x
	li $a1, 23 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 120 # x
	li $a1, 23 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 # ---------------------------------- 24 LINHA
 
	li $a0, 7 # x
	li $a1, 24 # y
	li $a2, 0 # cor
	li $a3, 7 # tamanho
	jal linha
	
	li $a0, 16 # x
	li $a1, 24 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 81 # x
	li $a1, 24 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 96 # x
	li $a1, 24 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 103 # x
	li $a1, 24 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 112 # x
	li $a1, 24 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
 # ---------------------------------- 25 LINHA
 
	li $a0, 9 # x
	li $a1, 25 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 14 # x
	li $a1, 25 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 82 # x
	li $a1, 25 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 95 # x
	li $a1, 25 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 104 # x
	li $a1, 25 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 110 # x
	li $a1, 25 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 # ---------------------------------- 26 LINHA
 
	li $a0, 10 # x
	li $a1, 26 # y
	li $a2, 0 # cor
	li $a3, 8 # tamanho
	jal linha
	
	li $a0, 85 # x
	li $a1, 26 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 95 # x
	li $a1, 26 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 106 # x
	li $a1, 26 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 113 # x
	li $a1, 26 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
 # ---------------------------------- 27 LINHA
 
	li $a0, 12 # x
	li $a1, 27 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 16 # x
	li $a1, 27 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 94 # x
	li $a1, 27 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 108 # x
	li $a1, 27 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 112 # x
	li $a1, 27 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha

 # ---------------------------------- 28 LINHA
 
	li $a0, 12 # x
	li $a1, 28 # y
	li $a2, 0 # cor
	li $a3, 7 # tamanho
	jal linha
	
	li $a0, 92 # x
	li $a1, 28 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 111 # x
	li $a1, 28 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha

 # ---------------------------------- 29 LINHA
 
	li $a0, 13 # x
	li $a1, 29 # y
	li $a2, 0 # cor
	li $a3, 7 # tamanho
	jal linha
	
	li $a0, 90 # x
	li $a1, 29 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 111 # x
	li $a1, 29 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
 # ---------------------------------- 30 LINHA
 
	li $a0, 15 # x
	li $a1, 30 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 87 # x
	li $a1, 30 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 110 # x
	li $a1, 30 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
 # ---------------------------------- 31 LINHA
 
	li $a0, 15 # x
	li $a1, 31 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 81 # x
	li $a1, 31 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 86 # x
	li $a1, 31 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 110 # x
	li $a1, 31 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 116 # x
	li $a1, 31 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 # ---------------------------------- 32 LINHA
 
	li $a0, 16 # x
	li $a1, 32 # y
	li $a2, 0 # cor
	li $a3, 7 # tamanho
	jal linha
	
	li $a0, 79 # x
	li $a1, 32 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 86 # x
	li $a1, 32 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 114 # x
	li $a1, 32 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 # ---------------------------------- 33 LINHA
 
	li $a0, 19 # x
	li $a1, 33 # y
	li $a2, 0 # cor
	li $a3, 8 # tamanho
	jal linha
	
	li $a0, 77 # x
	li $a1, 33 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 80 # x
	li $a1, 33 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 86 # x
	li $a1, 33 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 113 # x
	li $a1, 33 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 116 # x
	li $a1, 33 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 # ---------------------------------- 34 LINHA
 
	li $a0, 23 # x
	li $a1, 34 # y
	li $a2, 0 # cor
	li $a3, 8 # tamanho
	jal linha
	
	li $a0, 34 # x
	li $a1, 34 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 76 # coordenada x
	li $a1, 34 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 80 # x
	li $a1, 34 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 86 # x
	li $a1, 34 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 110 # x
	li $a1, 34 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 117 # x
	li $a1, 34 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 # ---------------------------------- 35 LINHA
 
	li $a0, 0 # x
	li $a1, 35 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
 
	li $a0, 25 # x
	li $a1, 35 # y
	li $a2, 0 # cor
	li $a3, 17 # tamanho
	jal linha
	
	li $a0, 79 # x
	li $a1, 35 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 85 # x
	li $a1, 35 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 108 # x
	li $a1, 35 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 118 # x
	li $a1, 35 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 # ---------------------------------- 36 LINHA
 
	li $a0, 1 # x
	li $a1, 36 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
 
	li $a0, 28 # x
	li $a1, 36 # y
	li $a2, 0 # cor
	li $a3, 10 # tamanho
	jal linha
	
	li $a0, 40 # x
	li $a1, 36 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 78 # x
	li $a1, 36 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 84 # x
	li $a1, 36 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 107 # x
	li $a1, 36 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 117 # x
	li $a1, 36 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 120 # coordenada x
	li $a1, 36 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 37 LINHA
 
	li $a0, 4 # x
	li $a1, 37 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
 
	li $a0, 30 # x
	li $a1, 37 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 35 # x
	li $a1, 37 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 43 # x
	li $a1, 37 # y
	li $a2, 0 # cor
	li $a3, 8 # tamanho
	jal linha
	
	li $a0, 82 # x
	li $a1, 37 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 105 # x
	li $a1, 37 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 115 # x
	li $a1, 37 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 121 # coordenada x
	li $a1, 37 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 38 LINHA
 
	li $a0, 6 # x
	li $a1, 38 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
 
	li $a0, 29 # x
	li $a1, 38 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 47 # x
	li $a1, 38 # y
	li $a2, 0 # cor
	li $a3, 10 # tamanho
	jal linha
	
	li $a0, 79 # x
	li $a1, 38 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 105 # x
	li $a1, 38 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 115 # coordenada x
	li $a1, 38 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 121 # coordenada x
	li $a1, 38 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 39 LINHA
 
	li $a0, 7 # x
	li $a1, 39 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha

	li $a0, 20 # x
	li $a1, 39 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha

	li $a0, 27 # x
	li $a1, 39 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 49 # x
	li $a1, 39 # y
	li $a2, 0 # cor
	li $a3, 8 # tamanho
	jal linha
	
	li $a0, 78 # x
	li $a1, 39 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 104 # x
	li $a1, 39 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 114 # coordenada x
	li $a1, 39 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 120 # coordenada x
	li $a1, 39 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 122 # coordenada x
	li $a1, 39 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

 # ---------------------------------- 40 LINHA
 
	li $a0, 3 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 10 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha

	li $a0, 17 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 22 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha

	li $a0, 25 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 53 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 78 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 82 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 102 # x
	li $a1, 40 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 106 # coordenada x
	li $a1, 40 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 114 # coordenada x
	li $a1, 40 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 119 # coordenada x
	li $a1, 40 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 122 # coordenada x
	li $a1, 40 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 41 LINHA
 
	li $a0, 1 # x
	li $a1, 41 # y
	li $a2, 0 # cor
	li $a3, 13 # tamanho
	jal linha

	li $a0, 15 # x
	li $a1, 41 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 23 # x
	li $a1, 41 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 56 # x
	li $a1, 41 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 76 # x
	li $a1, 41 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 83 # x
	li $a1, 41 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 101 # x
	li $a1, 41 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 106 # coordenada x
	li $a1, 41 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 113 # coordenada x
	li $a1, 41 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 119 # coordenada x
	li $a1, 41 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

 # ---------------------------------- 42 LINHA
 
	li $a0, 1 # x
	li $a1, 42 # y
	li $a2, 0 # cor
	li $a3, 15 # tamanho
	jal linha
	
	li $a0, 17 # x
	li $a1, 42 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 21 # x
	li $a1, 42 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 58 # x
	li $a1, 42 # y
	li $a2, 0 # cor
	li $a3, 8 # tamanho
	jal linha
	
	li $a0, 73 # x
	li $a1, 42 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 82 # x
	li $a1, 42 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 101 # coordenada x
	li $a1, 42 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 113 # coordenada x
	li $a1, 42 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 43 LINHA
 
	li $a0, 4 # x
	li $a1, 43 # y
	li $a2, 0 # cor
	li $a3, 13 # tamanho
	jal linha
	
	li $a0, 19 # x
	li $a1, 43 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 61 # x
	li $a1, 43 # y
	li $a2, 0 # cor
	li $a3, 14 # tamanho
	jal linha
	
	li $a0, 81 # x
	li $a1, 43 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 92 # x
	li $a1, 43 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 113 # coordenada x
	li $a1, 43 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 44 LINHA
 
	li $a0, 6 # x
	li $a1, 44 # y
	li $a2, 0 # cor
	li $a3, 14 # tamanho
	jal linha
	
	li $a0, 63 # x
	li $a1, 44 # y
	li $a2, 0 # cor
	li $a3, 10 # tamanho
	jal linha
	
	li $a0, 92 # x
	li $a1, 44 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha

 # ---------------------------------- 45 LINHA
 
	li $a0, 17 # x
	li $a1, 45 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 67 # x
	li $a1, 45 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 93 # x
	li $a1, 45 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 # ---------------------------------- 46 LINHA
 
	li $a0, 16 # x
	li $a1, 46 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 66 # x
	li $a1, 46 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 95 # x
	li $a1, 46 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha

 # ---------------------------------- 47 LINHA
 
	li $a0, 14 # x
	li $a1, 47 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 64 # x
	li $a1, 47 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 94 # coordenada x
	li $a1, 47 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 98 # x
	li $a1, 47 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha


 # ---------------------------------- 48 LINHA
 
	li $a0, 13 # x
	li $a1, 48 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 63 # x
	li $a1, 48 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 94 # coordenada x
	li $a1, 48 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 100 # x
	li $a1, 48 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
 # ---------------------------------- 49 LINHA
 
	li $a0, 11 # x
	li $a1, 49 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
	li $a0, 63 # x
	li $a1, 49 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 93 # coordenada x
	li $a1, 49 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 102 # x
	li $a1, 49 # y
	li $a2, 0 # cor
	li $a3, 3 # tamanho
	jal linha
	
 # ---------------------------------- 50 LINHA
 
	li $a0, 7 # x
	li $a1, 50 # y
	li $a2, 0 # cor
	li $a3, 5 # tamanho
	jal linha
	
	li $a0, 62 # x
	li $a1, 50 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 93 # coordenada x
	li $a1, 50 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 105 # coordenada x
	li $a1, 50 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 51 LINHA
 
	li $a0, 4 # x
	li $a1, 51 # y
	li $a2, 0 # cor
	li $a3, 6 # tamanho
	jal linha
	
	li $a0, 62 # x
	li $a1, 51 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 94 # coordenada x
	li $a1, 51 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 52 LINHA
 
	li $a0, 0 # x
	li $a1, 52 # y
	li $a2, 0 # cor
	li $a3, 7 # tamanho
	jal linha
	
	li $a0, 63 # x
	li $a1, 52 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 95 # coordenada x
	li $a1, 52 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 53 LINHA
 
	li $a0, 0 # x
	li $a1, 53 # y
	li $a2, 0 # cor
	li $a3, 4 # tamanho
	jal linha
	
	li $a0, 63 # x
	li $a1, 53 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 94 # coordenada x
	li $a1, 53 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 54 LINHA
	
	li $a0, 61 # x
	li $a1, 54 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 94 # coordenada x
	li $a1, 54 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

 # ---------------------------------- 55 LINHA
	
	li $a0, 59 # x
	li $a1, 55 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 95 # coordenada x
	li $a1, 55 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

 # ---------------------------------- 56 LINHA
	
	li $a0, 58 # x
	li $a1, 56 # y
	li $a2, 0 # cor
	li $a3, 2 # tamanho
	jal linha
	
	li $a0, 95 # coordenada x
	li $a1, 56 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 57 LINHA
		
	li $a0, 57 # coordenada x
	li $a1, 57 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
	li $a0, 95 # coordenada x
	li $a1, 57 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 58 LINHA
		
	li $a0, 56 # coordenada x
	li $a1, 58 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 59 LINHA
		
	li $a0, 56 # coordenada x
	li $a1, 59 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

 # ---------------------------------- 60 LINHA
		
	li $a0, 55 # coordenada x
	li $a1, 60 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 61 LINHA
		
	li $a0, 55 # coordenada x
	li $a1, 61 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto

 # ---------------------------------- 62 LINHA
		
	li $a0, 54 # coordenada x
	li $a1, 62 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto
	
 # ---------------------------------- 63 LINHA
		
	li $a0, 53 # coordenada x
	li $a1, 63 # coordenada y
	li $a2, 0 # cor do pixel
	jal ponto


 # ------------------------------------------------- PONTOS CIDADES
 
# --- I. ITACOATIARA ($s0) (x,y) = (72,39) ---
    li $a0, 72      # coordenada x
    li $a1, 39      # coordenada y
    beq $s0, 0, cor_alerta_itac
    li $a2, 5       #branco (normal)
    j plota_itac
cor_alerta_itac:
    li $a2, 3       #vermelho (alerta)
plota_itac:
    jal ponto
    
 
# --- II. MANACAPURU ($s1) (x,y) = (12,38) ---
    li $a0, 12      # coordenada x
    li $a1, 38      # coordenada y
    beq $s1, 0, cor_alerta_mana
    li $a2, 5       #branco
    j plota_mana
cor_alerta_mana:
    li $a2, 3       #vermelho
plota_mana:
    jal ponto
  
 
# --- III. PARINTINS ($s2) (x,y) = (119,25) ---
    li $a0, 119     # coordenada x
    li $a1, 25      # coordenada y
    beq $s2, 0, cor_alerta_pari
    li $a2, 5       #branco
    j plota_pari
cor_alerta_pari:
    li $a2, 3       #vermelho
plota_pari:
    jal ponto
 
# --- IV. MANAUS ($s3) (x,y) = (32,32) ---
    li $a0, 32      # coordenada x
    li $a1, 32      # coordenada y
    beq $s3, 0, cor_alerta_manaus
    li $a2, 5       #branco
    j plota_manaus
cor_alerta_manaus:
    li $a2, 3       #vermelho
plota_manaus:
    jal ponto
  
 # ------------------------------------------------- NÚMEROS CIDADES
 
 # --------- ITACOATIARA:
 
	li $a0, 70 # coordenada x
	li $a1, 36 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 70 # coordenada x
	li $a1, 37 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 70 # coordenada x
	li $a1, 38 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
 
 # --------- MANACAPURU:

	li $a0, 10 # coordenada x
	li $a1, 35 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 10 # coordenada x
	li $a1, 36 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 10 # coordenada x
	li $a1, 37 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 8 # coordenada x
	li $a1, 35 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 8 # coordenada x
	li $a1, 36 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 8 # coordenada x
	li $a1, 37 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto

 # --------- PARATINS:
	
	li $a0, 121 # coordenada x
	li $a1, 26 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 121 # coordenada x
	li $a1, 27 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 121 # coordenada x
	li $a1, 28 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 123 # coordenada x
	li $a1, 26 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 123 # coordenada x
	li $a1, 27 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 123 # coordenada x
	li $a1, 28 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 125 # coordenada x
	li $a1, 26 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 125 # coordenada x
	li $a1, 27 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 125 # coordenada x
	li $a1, 28 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto

 # --------- MANAUS:

	# NUMERO:
	
	li $a0, 30 # coordenada x
	li $a1, 29 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 30 # coordenada x
	li $a1, 30 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 29 # coordenada x
	li $a1, 31 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 28 # coordenada x
	li $a1, 29 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 28 # coordenada x
	li $a1, 30 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto

	li $a0, 26 # coordenada x
	li $a1, 29 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto

	li $a0, 26 # coordenada x
	li $a1, 30 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto
	
	li $a0, 26 # coordenada x
	li $a1, 31 # coordenada y
	li $a2, 2 # cor do pixel
	jal ponto

 
 # -------------------------------------------------------------- >>>>

 # final do programa:

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra  #Volta pra trabalhoaoc.asm
 
 # PROCEDIMENTOS PRA PINTAR OS PIXELS ----------------------- >>>

 # PIXEL �NICO -------------- <<
calculo_endereco:
	li $v0, 0x10040000
	
	sll $t2, $a0, 2 # desloca x duas casas pra direita pois cada unidade tem 4 bytes
	sll $t3, $a1, 9 # faz y x largura da tela em unidades
	add $v0, $v0, $t2 # soma x
	add $v0, $v0, $t3 # soma y
	
	jr $ra

tinta:
	la $t0, cores # endere�o base das cores
	sll $a2, $a2, 2 # multiplica por 4 que � o tamanho da palavra
	add $a2, $a2, $t0 #soma os dois
	lw $v1, 0($a2)
	
	jr $ra
	
ponto:
	bltz $a0, final_ponto  # Mudado de "final" para "final_ponto"
	bltz $a1, final_ponto
	bgt $a0, 127, final_ponto
	bgt $a1, 127, final_ponto
	# isso ta checando se as coordenadas estao dentro do intervalo valido de x e y
	
	addi $sp, $sp, -4 # cada espaco tem 4 bytes
	sw $ra, 0($sp) #ta guardando o endereco de retorno em uma pilha pra poder restaurar ele depois
	jal calculo_endereco
	jal tinta
	
	sw $v1, 0($v0) #pega a cor de v1 e guarda em v1 que tem o endereco do pixel
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 #ta restaurando o valor de retorno

final_ponto:   #tive que mudar de "final" para "final_ponto", porque tava dando erro
	jr $ra
	
 # LINHA -------------- <<	
linha:
	addiu $sp, $sp, -20
	sw $ra, 0($sp)
	
	linha_loop:
		sw $a0, 4($sp) # coordenada x
		sw $a1, 8($sp) # coordenada y
		sw $a2, 12($sp) # cor
		sw $a3, 16($sp) # comprimento da linha
		
		jal ponto
		
		lw $a0, 4($sp)
		lw $a1, 8($sp)
		lw $a2, 12($sp)
		lw $a3, 16($sp)
		# pinta o primeiro pixel da coordenada dada e depois incrmenta o x, e diminui o tamanho da linha que vai ser pintada 
		addiu $a0, $a0, 1
		addiu $a3, $a3, -1
		bne $a3, $zero, linha_loop
		
	lw $ra, 0($sp)
	addiu $sp, $sp, 20 #reseta a pilha
	
	jr $ra
		
	
	
	
	
	
