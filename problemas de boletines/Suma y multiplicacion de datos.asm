//sumas dos datos de memoria guardados en $0100 y $0101

main: LDS R16, $0100
	  LDS R17, $0101
	  ADD R16, R17     ; R16 <-- R17
	  STS $0102, R16

//Multiplicar ambos datos y guardarlos en $0103 y $0104
      LDS R16, $0100
   	  MUL R16, R17
	  STS $0104, R1
	  STS $0103, R0




FIN:   JMP FIN      ;BUCLE SOBRE SI MISMO 
