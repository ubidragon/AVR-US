;FORMA 2
; Escriba una subrutina POTENCIA que calcule 2^n (con n<16).
; El exponente se pasa a la subrutina en el registro
; R16. La subrutina devuelve en R1:R0 el resultado.

		CLR R1
		LDI R17, 1
		MOV R0, R17
BUCLE:	CPI R16, 0
		BREQ RETORNA
		LSL R0
		ROL R1
		DEC R16
		RJMP BUCLE
RETORNA:POP R17
		RET