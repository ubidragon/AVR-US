; Escriba una subrutina POTENCIA que calcule 2^n (con n<16).
; El exponente se pasa a la subrutina en el registro
; R16. La subrutina devuelve en R1:R0 el resultado.

			LDI R16, 12
			CALL POTENCIA
			FIN: RJMP FIN

POTENCIA:	PUSH R16
			PUSH R17
			LDI R17, 1
			CPI R16, 8
			BRSH GRANDE
			CLR R1
			MOV R0, R17
			CPI R16, 0
			BREQ RETORNA

BUCLE:		LSL R0
			DEC R16
			BRNE BUCLE

RETORNA: 	POP R17
			POP R16
			RET

GRANDE: 	MOV R1, R17
			CLR R0
			LDI R17, 8
			SUB R16, R17
			CPI R16, 0
			BREQ RETORNA
BUCLE2: 	LSL R1
			DEC R16
			BRNE BUCLE2
			RJMP RETORNA
