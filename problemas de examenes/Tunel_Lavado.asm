; Usando un microcontrolador avr, se requiere controlar un puente de lavado
; de coches. El coche esta parado en todo momento y es el puente el que se
; mueve. En el puente de lavado estab instalados los siguientes elementos:
; salidas de agua a presion, salidas de jabon, salidas de aire caliente a 
; presion, salidas de cera y salidas de control de motor.
; Con objeto de detectar si ha finalizado el recorrido de "ida y vuelta", 
; existe tambien dos celulas fotoelectricas, CELULA-A(pos. inicial) y
; CELULA-B(fin de recorrido).

; FALTA TERMINAR EL ENUNCIADO

; Para las salidas del sistema usaremos el PORTD
; PORTD: motor vuelta
; 	   motor ida
; 	   aire
; 	   cera
; 	   jabon
; 	   rodillos
; 	   agua

; Para las entradas del sistema usaremos el PORTB
; PORTB: CELULA-A
; 	   CELULA-B
; 	   TIPO(con o sin cera)
; 	   PULSADOR

.include "m328pdef.inc"

MAIN:	CLR R16 
	 	OUT DDRB, R16
	 	LDI R16, $01
	 	OUT PORTB, R16 ;ACTIVO PULL-UP
	 	LDI R16, $7F
	 	OUT DDRD, R16
	 ;coloco puente en posicion inicial
	 	CALL VUELTA

ESPERO:	CALL PULSADOR
		CALL FASE1
		CALL FASE2		
		CALL FASE3
		SBIC PINB,1 ;salta una instruccion si el bit del puerto 1 esta a 0
		CALL FASE4
		CALL FASE5
		RJMP ESPERO
;FASE agua a presion y jabon
FASE1: 	SBI PORTD, 0
		SBI PORTD, 2
		CALL IDA_VUELTA
		CBI PORTD, 0
		CBI PORTD, 2
		RET 
;FASE rodillos y agua a presion
FASE2: 	SBI PORTD, 0
		SBI PORTD, 1
		CALL IDA_VUELTA
		CBI PORTD, 0
		CBI PORTD, 0
		RET 
;FASE agua a presion
FASE3: 	SBI PORTD, 0		
		CALL IDA_VUELTA
		CBI PORTD, 0
		RET 
;FASE cera
FASE4: 	SBI PORTD, 3
		CALL IDA_VUELTA
		CBI PORTD, 3
		RET 
;FASE aire caliente
FASE5: 	SBI PORTD, 4
		CALL IDA_VUELTA
		CBI PORTD, 4
		RET 

IDA_VUELTA: CALL IDA
			CALL VUELTA
			RET

IDA: SBI PORTD, 5; motor de ida
	 SBI PINB, 2
	 RJMP IDA
	 CBI PORTD,3

VUELTA: SBI PORTD, 6
	 SBI PINB, 3
	 RJMP VUELTA
	 CBI PORTD,6
	 RET





