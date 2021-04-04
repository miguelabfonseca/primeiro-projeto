Ins=.f.

STORE SPACE(60) TO _NOME
STORE SPACE(3)  TO _NUMERO
STORE SPACE(4)  TO _DISCOS
STORE SPACE(2)  TO _DISCO
STORE SPACE(40) TO _OBSER

USE LISTA

SAVE SCREEN To Introducao

	SET COLO TO "&CYA.+/&AZU."
	
	CLEAR                        
	
	@ 1,0 SAY ;
	"    Lista de Disquetes Ver.2.21                                        1994     "
	@ 2,0 SAY ;
	"    ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД     "
	@ 24,0 SAY ;
	"      Para outro campo    ENTER   Para seleccionar     ESC   Para voltar      "
	@ 23,0 SAY ;
	"                                                                                "
	
	SET Curs        ON
	SET Esca        ON
	SET Confirm     ON
 
	Go Bottom
	_Numero = Numero + 1 
	Set Colo to "&Ama./&Azu."
	@ 4,4  SAY "NЈmero..... " 
	@ 4,10 SAY _NUMERO
	@ 5,4  SAY "ConteЈdo.."  GET _NOME   PICT "@!K"
	@ 6,4  SAY "NЈmero de discos..... "  GET _DISCOS PICT "@!K"
	@ 7,4  SAY "Disquete............. "  GET _DISCO  PICT "@!K"
	@ 9,4  SAY "Observa‡”es.......... "  GET _OBSER  PICT "@!K" 
	
	Set Colo to "&Cya./&Azu."
	@ 8,0  SAY ;
	"    ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД     "
	@ 10,0 SAY ;
	"    ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД     "

	Read
	
	Set Curs Off

	Set Colo to "&Azu./&Cya."
	
	For B = 0 to 79
		For BB=1 To 40
			@ 23,79 Say "Ы"
		Next BB
		@ 24,B Say "°"
	Next B
	For B = 0 to 79
		For BB=1 To 40
			@ 23,79 Say "Ы"
		Next BB
		@ 24,B Say "±"
	Next B
	For B = 0 to 79
		For BB=1 To 40
			@ 23,79 Say "Ы"
		Next BB
		@ 24,B Say "І"
	Next B
	For B = 0 to 79
		For BB=1 To 40
			@ 23,79 Say "Ы"
		Next BB
		@ 24,B Say "Ы"
	Next B

	Set Colo to "&Cya./&Azu."
	@ 24,0 Say;
	"    F9 Insere                                                  F10 Cancelar     "

	X = Lastkey()
	If X = 27
		SET curs Off
		Return(0)
	Endif
 
	Cancelar=.F.
	
	X = NextKey()
	
	Do While !Cancelar=.T.
		
		If X = -8
			Cancelar=.T.
			Insere()
		ElseIf X = -9 
			Cancelar=.T.
			Set Curs Off
			Exit
		Else 
			X = NextKey()
		Endif

		X = NextKey()

	ENDDO

	If Cancelar=.T. .And. Ins=.T.
		Do Introd
	EndIf
			
	STORE SPACE(60) TO _NOME
	STORE SPACE(3)  TO _NUMERO
	STORE SPACE(4)  TO _DISCOS
	STORE SPACE(2)  TO _DISCO
	STORE SPACE(40) TO _OBSER
	 
	SET CONFI OFF
	SET curs OFF
	SET ESCA OFF
	SET COLO TO
	SET COLO TO "&VER.+*/&PRE."
	SET COLO TO
	 
	If Ins=.T.
		Reindex
	Endif
	 
	Restore Screen From Introducao

	Set curs Off 

Return
				     
Procedure Insere
	
	Append Blank
	 
	REPL NOME       WITH _NOME
	REPL DISCOS     WITH _DISCOS
	REPL DISCO      WITH _DISCO
	REPL NUMERO     WITH _NUMERO
	REPL OBSERVACAO WITH _OBSER
	Ins=.T.
	
	STORE SPACE(60) TO _NOME
	STORE SPACE(3)  TO _NUMERO
	STORE SPACE(4)  TO _DISCOS
	STORE SPACE(2)  TO _DISCO
	STORE SPACE(40) TO _OBSER

Return
