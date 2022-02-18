.data
	message: .space 256
	saida1: .asciiz "Número total de caracteres: "
	saida2: .asciiz "Número total de palavras: "
	saida3: .asciiz "Palavras repetidas: "
	linha: .asciiz "\n"
.text
#lendo a mensagem digitada
	li $v0, 8
	li $a1, 256
	la $a0, message
	syscall
	
ContarCaracteres:	
	li $t1,0		# inicializando a váriavel t1
	la $t0,message		# carregando a mensagem em t0

loop1:
	lb   $t2,0($t0)		# carrega o primeiro caracter da string em t2
	beqz $t2,end1		# se t2 == 0 va para end1
	addi $t0,$t0,1		# vai para o próximo caracter da string
	addi $t1,$t1,1		# incrementa o contador de caracter
	j loop1

end1:
	add $v0, $zero, 4	# exibindo a string saida1
	la $a0, saida1
	syscall

	subi $t1, $t1, 1  	# subtraindo o último enter da contagem

	li   $v0,1		# exibindo o valor de t1 na tela
	add  $a0, $0, $t1
	syscall

	add $v0, $zero, 4	# pular a linha
	la $a0, linha
	syscall
	

ContarPalavras:
	la $t0, message			# t0 = message
 	li $s0, 0x00000020 		# espaço em hex
	li $s1, 0		 	# inicializa o registrador s1 com zero
	
loop2:       
	lb $t2, 0($t0) 			# carrega o caracter da string em t2
	beqz $t2, end2			# se t2 == 0 va para end2
	beq $s0, $t2  verifica		# se s0 é igual a t2 eu vou para s, verificar se é uma palavra ou não

incrementa:
	add $t0, $t0, 1			 # vai para proximo caracter da string
	j loop2				 # volta para o loop2

verifica:
	# se a palavra começar com uma letra maiscula, sabemos que é uma palavra, então vai para soma, somar +1 ao contador de palavras
	slti $t3, $t0, 0x00000041 	# se o caracter for maior ou igual a "A" em hexadecimal, t3 é igual a zero
	slti $t3, $t3, 1		# se t3 for menor que 1, ou seja, zero, t3 é igual a 1
	slti $t4, $t0, 0x0000005b 	# se o caracter for menor que o próximo caracter, em hexadecimal, após "Z", t4 é igual a 1
	and $t5, $t3, $t4		# se t3 e t4 forem iguais a 1, t5 é igual a 1
	beq $t3, $t4, soma		# se t5 for diferente de 0, vai para a soma 
	
	# se a palavra começar com uma letra minuscula, sabemos que é uma palavra, então vai para soma, somar +1 ao contador de palavras
	slti $t3, $t0, 0x00000061 	# se o caracter for maior ou igual a "a" em hexadecimal, t3 é igual a zero
	slti $t3, $t3, 1		# se t3 for menor que 1, ou seja, zero, t3 é igual a 1
	slti $t4, $t0, 0x0000007b 	# se o caracter for menorque o próximo caracter, em hexadecimal, após "z", t4 é igual a 1
	and $t5, $t3, $t4		# se t3 e t4 forem iguais a 1, t5 é igual a 1
	bnez $t5, soma			# se t5 for diferente de 0, vai para a soma 
	
soma:
	add $s1, $s1, 1 		#soma 1 no caso de ser uma letra
	j incrementa

end2:
	add $v0, $zero, 4		# exibe a string saida2
	la $a0, saida2
	syscall

	li, $v0, 1			# exibe na tela o valor em s1 (quatidade de palavras)
	add $a0, $zero, $s1
	syscall
