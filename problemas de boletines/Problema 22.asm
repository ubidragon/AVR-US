; Problema 22
; Se conecta un pulsador al pin 6 del puerto B. 
; Hacer un programa para el AVR que establezca el pin 6 del
; puerto B como entrada. Que active la resistencia de “pull-up”
; de ese pin y que cuente en un registro R20 cuántas veces
; se ha pulsado dicho pulsador. IMPORTANTE: Si el pulsador 
; sigue pulsado sólo debe contar una vez.

 		CBI DDRB,6
 		SBI PORTB,6	;PINB6 CONFIGURADO COMO ENTRADA
 					;Y RESISTENCIA DE PULL UP ACTIVADA
 		CLR R20

BUCLE:	SBIS PINB,6
 		RJMP BUCLE

BUCLE2:	SBIC PINB,6
 		RJMP BUCLE2

 		INC R20
 		RJMP BUCLE