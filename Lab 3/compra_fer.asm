.data
	mensagem1: .asciiz "\nDigite o nome do produto: "
	NomeProduto1: .space 256
	NomeProduto2: .space 256
	NomeProduto3: .space 256
	NomeProduto4: .space 256
	NomeProduto5: .space 256
	mensagem2: .asciiz "Insira o valor unitário deste produto: "
	mensagem3: .asciiz "Insira a quantidade desejada deste produto: "
	mensagem4: .asciiz "\nDeseja comprar algo a mais? Se sim, digite 1. Caso contrário, digite 0. Resposta: "
	saida1: .asciiz "\nPedido:"
	saida2: .asciiz "x "
	saida3: .asciiz "Valor unitário: R$"
	saida4: .asciiz "\nValor total do produto: "
	saida5: .asciiz "Valor total do pedido: "
	linha: .asciiz "\n\n"
	zero: .float 0.0
.text
	# PRODUTO 1
	add $v0, $zero, 4		# exibe a mensagem1
	la $a0, mensagem1
	syscall

	li $v0, 8			# Lê o nome do produto
	li $a1, 256
	la $a0, NomeProduto1
	syscall

	add $s3, $a0, $zero 		# Salva o nome do produto
			
	add $v0, $zero, 4		# exibe a mensagem2
	la $a0, mensagem2
	syscall
	
	li $v0, 6			# Lê o preço do produto
	syscall 

	lwc1 $f1, zero
	add.s $f26, $f1, $f0 		# Salva o preço do produto
	
	
	add $v0, $zero, 4		# exibe a mensagem3
	la $a0, mensagem3
	syscall
	
	li $v0, 5			# Lê a quantidade desejada do produto escolhido
	syscall 
	add $s4 $v0, $zero 		# Salva a quantidade de produto
	
	mtc1 $s4, $f12 			# Converte-se o inteiro que correspondente a quantidade do produto para um float
	cvt.s.w $f12, $f12
	
	mul.s $f0, $f0, $f12		# É feita a multiplicação do valor do produto pela quantidade desejada 
	
	lwc1 $f1, zero			# Salva o valor total do produto
	add.s $f14, $f1, $f0	
	
	add.s $f31, $f31, $f14		# Salva o valor também em $f31 - será utilizado para somar e mostrar o valor total da compra no final

	add $v0, $zero, 4		# exibe a mensagem4
	la $a0, mensagem4
	syscall
	li $v0, 5			# Lê a resposta
	syscall 
	add $t5, $t5, 1			# incrementa 1 na contagem do total de itens pedidos
	beq $v0, $zero, sair		# se a resposta for igual a zero, termina a compra,caso contrário, continua
	
	# PRODUTO 2
	add $v0, $zero, 4		# exibe a mensagem1
	la $a0, mensagem1
	syscall

	li $v0, 8			# Lê o nome do produto
	li $a1, 256
	la $a0, NomeProduto2
	syscall

	add $s5, $a0, $zero 		# Salva o nome do produto
			
	add $v0, $zero, 4		# exibe a mensagem2
	la $a0, mensagem2
	syscall
	
	li $v0, 6			# Lê o preço do produto
	syscall 

	lwc1 $f1, zero
	add.s $f27, $f1, $f0 		# Salva o preço do produto
	
	
	add $v0, $zero, 4		# exibe a mensagem3
	la $a0, mensagem3
	syscall
	
	li $v0, 5			# Lê a quantidade desejada do produto escolhido
	syscall 
	add $s6, $v0, $zero 		# Salva a quantidade de produto
	
	mtc1 $s6, $f12 			# Converte-se o inteiro que correspondente a quantidade do produto para um float
	cvt.s.w $f12, $f12
	
	mul.s $f0, $f0, $f12		# É feita a multiplicação do valor do produto pela quantidade desejada 
	
	lwc1 $f1, zero			# Salva o valor total do produto
	add.s $f15, $f1, $f0	
	
	add.s $f31, $f31, $f15		# Salva o valor também em $f31 - será utilizado para somar e mostrar o valor total da compra no final
	
	add $v0, $zero, 4		# exibe a mensagem4
	la $a0, mensagem4
	syscall
	li $v0, 5			# Lê a resposta
	syscall 
	add $t5, $t5, 1			# incrementa 1 na contagem do total de itens pedidos
	beq $v0, $zero, sair		# se a resposta for igual a zero, termina a compra,caso contrário, continua
	
	# PRODUTO 3
	add $v0, $zero, 4		# exibe a mensagem1
	la $a0, mensagem1
	syscall

	li $v0, 8			# Lê o nome do produto
	li $a1, 256
	la $a0, NomeProduto3
	syscall

	add $s7, $a0, $zero 		# Salva o nome do produto
			
	add $v0, $zero, 4		# exibe a mensagem2
	la $a0, mensagem2
	syscall
	
	li $v0, 6			# Lê o preço do produto
	syscall 

	lwc1 $f1, zero
	add.s $f28, $f1, $f0 		# Salva o preço do produto
	
	
	add $v0, $zero, 4		# exibe a mensagem3
	la $a0, mensagem3
	syscall
	
	li $v0, 5			# Lê a quantidade desejada do produto escolhido
	syscall 
	add $t8, $v0, $zero 		# Salva a quantidade de produto
	
	mtc1 $t8, $f12 			# Converte-se o inteiro que correspondente a quantidade do produto para um float
	cvt.s.w $f12, $f12
	
	mul.s $f0, $f0, $f12		# É feita a multiplicação do valor do produto pela quantidade desejada 
	
	lwc1 $f1, zero			# Salva o valor total do produto
	add.s $f16, $f1, $f0	
	
	add.s $f31, $f31, $f16		# Salva o valor também em $f31 - será utilizado para somar e mostrar o valor total da compra no final

	add $v0, $zero, 4		# exibe a mensagem4
	la $a0, mensagem4
	syscall
	li $v0, 5			# Lê a resposta
	syscall 
	add $t5, $t5, 1			# incrementa 1 na contagem do total de itens pedidos
	beq $v0, $zero, sair		# se a resposta for igual a zero, termina a compra,caso contrário, continua
	
	# PRODUTO 4	
	add $v0, $zero, 4		# exibe a mensagem1
	la $a0, mensagem1
	syscall

	li $v0, 8			# Lê o nome do produto
	li $a1, 256
	la $a0, NomeProduto4
	syscall

	add $t9, $a0, $zero 		# Salva o nome do produto
			
	add $v0, $zero, 4		# exibe a mensagem2
	la $a0, mensagem2
	syscall
	
	li $v0, 6			# Lê o preço do produto
	syscall 

	lwc1 $f1, zero
	add.s $f29, $f1, $f0 		# Salva o preço do produto
	
	
	add $v0, $zero, 4		# exibe a mensagem3
	la $a0, mensagem3
	syscall
	
	li $v0, 5			# Lê a quantidade desejada do produto escolhido
	syscall 
	add $t0, $v0, $zero 		# Salva a quantidade de produto
	
	mtc1 $t0, $f12 			# Converte-se o inteiro que correspondente a quantidade do produto para um float
	cvt.s.w $f12, $f12
	
	mul.s $f0, $f0, $f12		# É feita a multiplicação do valor do produto pela quantidade desejada 
	
	lwc1 $f1, zero			# Salva o valor total do produto
	add.s $f17, $f1, $f0	
	
	add.s $f31, $f31, $f17		# Salva o valor também em $f31 - será utilizado para somar e mostrar o valor total da compra no final
	
	add $v0, $zero, 4		# exibe a mensagem4
	la $a0, mensagem4
	syscall
	li $v0, 5			# Lê a resposta
	syscall 
	add $t5, $t5, 1			# incrementa 1 na contagem do total de itens pedidos
	beq $v0, $zero, sair		# se a resposta for igual a zero, termina a compra,caso contrário, continua
	
	# PRODUTO 5
	add $v0, $zero, 4		# exibe a mensagem1
	la $a0, mensagem1
	syscall

	li $v0, 8			# Lê o nome do produto
	li $a1, 256
	la $a0, NomeProduto5
	syscall

	add $t2, $a0, $zero 		# Salva o nome do produto
			
	add $v0, $zero, 4		# exibe a mensagem2
	la $a0, mensagem2
	syscall
	
	li $v0, 6			# Lê o preço do produto
	syscall 

	lwc1 $f1, zero
	add.s $f30, $f1, $f0 		# Salva o preço do produto
	
	
	add $v0, $zero, 4		# exibe a mensagem3
	la $a0, mensagem3
	syscall
	
	li $v0, 5			# Lê a quantidade desejada do produto escolhido
	syscall 
	add $t3, $v0, $zero 		# Salva a quantidade de produto
	
	mtc1 $t3, $f12 			# Converte-se o inteiro que correspondente a quantidade do produto para um float
	cvt.s.w $f12, $f12
	
	mul.s $f0, $f0, $f12		# É feita a multiplicação do valor do produto pela quantidade desejada 
	
	lwc1 $f1, zero			# Salva o valor total do produto
	add.s $f18, $f1, $f0	
	
	add.s $f31, $f31, $f18		# Salva o valor também em $f31 - será utilizado para somar e mostrar o valor total da compra no final
	
	add $t5, $t5, 1 		# incrementa 1 na contagem do total de itens pedidos

sair:
	#SAÍDA PRODUTO 1
	add $v0, $zero, 4	# exibindo a saida 1
	la $a0, saida1
	syscall	
	
	add $v0, $zero, 4	# pulando linha
	la $a0, linha
	syscall
	
	add $a0, $zero, $s4 	# Quantidade comprada do produto			
	li, $v0, 1		
	syscall

	add $v0, $zero, 4	# exibindo a saida2
	la $a0, saida2
	syscall	
	
	add $v0, $zero, 4	# Nome do produto comprado		
	la $a0, ($s3)
	syscall

	add $v0, $zero, 4	# exibindo a saida3
	la $a0, saida3
	syscall
			
	lwc1 $f1, zero		# Valor unitário do produto			
	add.s $f12, $f1, $f26
	li $v0, 2
	syscall
	
	add $v0, $zero, 4	# exibindo a saida4
	la $a0, saida4
	syscall

	lwc1 $f1, zero		# Valor total do produto			
	add.s $f12, $f1, $f14
	li $v0, 2
	syscall	
	
	add $v0, $zero, 4	# pulando linha
	la $a0, linha
	syscall
	
	sub $t5, $t5, 1		# decrementa 1 na contagem do total de itens pedidos
	beq $t5, $zero, fechar	# caso tenha acabado os produtos, vai para "fechar" e exibe o valor total da compra

	#SAÍDA PRODUTO 2	
	add $a0, $zero, $s6	# Quantidade comprada do produto			 
	li, $v0, 1		
	syscall

	add $v0, $zero, 4	# exibindo a saida2
	la $a0, saida2
	syscall	
	
	add $v0, $zero, 4	# Nome do produto comprado		 
	la $a0, ($s5)
	syscall

	add $v0, $zero, 4	# exibindo a saida3
	la $a0, saida3
	syscall
			
	lwc1 $f1, zero		# Valor unitário do produto			 
	add.s $f12, $f1, $f27
	li $v0, 2
	syscall
	
	add $v0, $zero, 4	# exibindo a saida4
	la $a0, saida4
	syscall

	lwc1 $f1, zero		# Valor total do produto			 
	add.s $f12, $f1, $f15
	li $v0, 2
	syscall	
		
	add $v0, $zero, 4	# pulando linha
	la $a0, linha
	syscall

	sub $t5, $t5, 1		# decrementa 1 na contagem do total de itens pedidos
	beq $t5, $zero, fechar	# caso tenha acabado os produtos, vai para "fechar" e exibe o valor total da compra
	
	#SAÍDA PRODUTO 3
	add $a0, $zero, $t8	# Quantidade comprada do produto			 
	li, $v0, 1		
	syscall

	add $v0, $zero, 4	# exibindo a saida2
	la $a0, saida2
	syscall	
	
	add $v0, $zero, 4	# Nome do produto comprado		 
	la $a0, ($s7)
	syscall

	add $v0, $zero, 4	# exibindo a saida3
	la $a0, saida3
	syscall
			
	lwc1 $f1, zero		# Valor unitário do produto			 
	add.s $f12, $f1, $f28
	li $v0, 2
	syscall
	
	add $v0, $zero, 4	# exibindo a saida4
	la $a0, saida4
	syscall

	lwc1 $f1, zero		# Valor total do produto			 
	add.s $f12, $f1, $f16
	li $v0, 2
	syscall	
	
	add $v0, $zero, 4	# pulando linha
	la $a0, linha
	syscall
	
	sub $t5, $t5, 1		# decrementa 1 na contagem do total de itens pedidos
	beq $t5, $zero, fechar	# caso tenha acabado os produtos, vai para "fechar" e exibe o valor total da compra

	#SAÍDA PRODUTO 4	
	add $a0, $zero, $t0	# Quantidade comprada do produto			 
	li, $v0, 1		
	syscall

	add $v0, $zero, 4	# exibindo a saida2
	la $a0, saida2
	syscall	
	
	add $v0, $zero, 4	# Nome do produto comprado		 
	la $a0, ($t9)
	syscall

	add $v0, $zero, 4	# exibindo a saida3
	la $a0, saida3
	syscall
			
	lwc1 $f1, zero		# Valor unitário do produto			 
	add.s $f12, $f1, $f29
	li $v0, 2
	syscall
	
	add $v0, $zero, 4	# exibindo a saida4
	la $a0, saida4
	syscall

	lwc1 $f1, zero		# Valor total do produto			 
	add.s $f12, $f1, $f17
	li $v0, 2
	syscall	
	
	add $v0, $zero, 4	# pulando linha
	la $a0, linha
	syscall
	
	sub $t5, $t5, 1		# decrementa 1 na contagem do total de itens pedidos
	beq $t5, $zero, fechar	# caso tenha acabado os produtos, vai para "fechar" e exibe o valor total da compra
	
	#SAÍDA PRODUTO 5
	add $a0, $zero, $t3	# Quantidade comprada do produto			 
	li, $v0, 1		
	syscall

	add $v0, $zero, 4	# exibindo a saida2
	la $a0, saida2
	syscall	
	
	add $v0, $zero, 4	# Nome do produto comprado		 
	la $a0, ($t2)
	syscall

	add $v0, $zero, 4	# exibindo a saida3
	la $a0, saida3
	syscall
			
	lwc1 $f1, zero		# Valor unitário do produto			 
	add.s $f12, $f1, $f30
	li $v0, 2
	syscall
	
	add $v0, $zero, 4	# exibindo a saida4
	la $a0, saida4
	syscall

	lwc1 $f1, zero		# Valor total do produto			 
	add.s $f12, $f1, $f18
	li $v0, 2
	syscall	
	
	add $v0, $zero, 4	# pulando linha
	la $a0, linha
	syscall
	
fechar:
	add $v0, $zero, 4	# exibindo a saida 5
	la $a0, saida5
	syscall
	
	lwc1 $f1, zero		# exibindo o valor total da compra
	add.s $f12, $f1, $f31
	li $v0, 2
	syscall	
	