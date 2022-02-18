
.data 
mensagem1:		.asciiz "Entre com as horas:"
mensagemDeErro1: 	.asciiz "Valor inv�lido para as horas. Esperado n�mero entre 0 e 23. "
mensagem2:		.asciiz "Entre com os minutos:"
mensagemDeErro2: 	.asciiz "Valor inv�lido para os minutos. Esperado n�mero entre 0 e 59. "
mensagem3:		.asciiz "Entre com os segundos:"
mensagemDeErro3: 	.asciiz "Valor inv�lido para os segundos. Esperado n�mero entre 0 e 59. "
mf: 			.asciiz "Hor�rio digitado: "
p:	 		.asciiz ":"

.text

		# Leitura das horas
lerHora:	add $v0, $zero, 4	# exibir string mensagem1
		la $a0, mensagem1
		syscall 
	
		li $v0, 5		# Ler o valor que sera digitado referente as horas
		syscall 
		add $s0, $v0, $zero 	# Salvando o valor lido em s0
		j conferirHoras		# Conferindo se a hora digitada � v�lida

erro1: 		add $v0, $zero, 4	# exibir string mensagemDeErro1
		la $a0, mensagemDeErro1
		syscall 
		j lerHora		# Lendo o valor referente a hora novamente
											
conferirHoras: 	slti $t3, $s0, 24	# Comparando se s0 < 24, se sim, t3 = 1
		slt $t4, $s0, $zero	# Comparando se s0 < 0, se sim, t4 = 1
		beq $t3, $zero, erro1 	# Se t3 = zero, ou seja s0 > 23, a hora digitada � inv�lida, vai exibir a mensagem de erro
		bne $t4, $zero, erro1 	# Se t4 != zero, ou seja s0 < 0, a hora digitada � inv�lida, vai exibir a mensagem de erro
		j lerMin		# Ap�s digitado um valor v�lido referente a hora, vai para a instru��o de ler os minutos
	
		# Leitura dos minutos
lerMin:		add $v0, $zero, 4	# exibir string mensagem2
		la $a0, mensagem2
		syscall 
	
		li $v0, 5		# Ler o valor que sera digitado referente aos minutos
		syscall 
		add $s1, $v0, $zero 	# Salvando o valor lido em s1
		j conferirMin		# Conferindo se o minuto digitado � v�lido

erro2: 		add $v0, $zero, 4	# exibir string mensagemDeErro2
		la $a0, mensagemDeErro2
		syscall 
		j lerMin		# Lendo o valor referente ao minuto novamente
									
conferirMin:	slti $t3, $s1, 60	# Comparando se s1 < 60, se sim, t3 = 1
		slt $t4, $s1, $zero	# Comparando se s1 < 0, se sim, t4 = 1
		beq $t3, $zero, erro2 	# Se t3 = zero, ou seja s0 > 59, o minuto digitado � inv�lido, vai exibir a mensagem de erro
		bne $t4, $zero, erro2 	# Se t4 != zero, ou seja s0 < 0, o minuto digitado � inv�lido, vai exibir a mensagem de erro
		j lerSeg		# Ap�s digitado um valor v�lido referente ao minuto, vai para a instru��o de ler os segundos
		
		# Leitura dos segundos
lerSeg:		add $v0, $zero, 4	# exibir string mensagem3
		la $a0, mensagem3
		syscall 
	
		li $v0, 5		# Ler o valor que sera digitado referente aos segundos
		syscall 
		add $s2, $v0, $zero 	# Salvando o valor lido em s2
		j conferirSeg		# Conferindo se o segundo digitado � v�lido

erro3: 		add $v0, $zero, 4	# exibir string mensagemDeErro3
		la $a0, mensagemDeErro3
		syscall 
		j lerSeg		# Lendo o valor referente ao segundo novamente
									
conferirSeg:	slti $t3, $s2, 60	# Comparando se s1 < 60, se sim, t3 = 1
		slt $t4, $s2, $zero	# Comparando se s1 < 0, se sim, t4 = 1
		beq $t3, $zero, erro3 	# Se t3 = zero, ou seja s0 > 59, o segundo digitado � inv�lido, vai exibir a mensagem de erro
		bne $t4, $zero, erro3 	# Se t4 != zero, ou seja s0 < 0, o segundo digitado � inv�lido, vai exibir a mensagem de erro
		Exit:			# Ap�s digitado um valor v�lido referente ao segundo, vai para a pr�xima instru��o
	
		# Imprimir a mensagem final
		add $v0, $zero, 4	# exibir string mf
		la $a0, mf
		syscall
	
		li, $v0, 1		#Imprimir o valor referente a hora
		add $a0, $zero, $s0
		syscall
	
		add $v0, $zero, 4	#exibir a string p
		la $a0, p
		syscall
	 
		li, $v0, 1		#Imprimir o valor referente ao minuto
		add $a0, $zero, $s1
		syscall
	
		add $v0, $zero, 4	#exibir a string p
		la $a0, p
		syscall
	 
		li, $v0, 1		#Imprimir o valor referente ao segundo
		add $a0, $zero, $s2
		syscall