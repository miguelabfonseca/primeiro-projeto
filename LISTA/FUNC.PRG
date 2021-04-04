Procedure Listar

Local xx, y
Local Rato := Ft_MGetPos( @xx, @y)
TX=0                
TY=0
Ecra=.T.

STORE SPACE(60) TO _NOME
STORE SPACE(3)  TO _NUMERO
STORE SPACE(4)  TO _DISCOS
STORE SPACE(2)  TO _DISCO
STORE SPACE(40) TO _OBSER
Set Curs Off

USE LISTA

Set Esca On

SAVE SCREEN To Listare

        SET COLO TO "&CYA.+/&AZU."
        
        CLEAR                        
        
        PMig=.F.

        @ 1,0 SAY ;
        "    Lista de Disquetes Ver.2.21                                        1994     "
        @ 2,0 SAY ;
        "    컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�     "
        @ 24,0 SAY ;
        "      Para outro campo    ENTER   Para seleccionar     ESC   Para voltar      "
        @ 23,0 SAY ;
        "                                                                                "
        Go Bottom
        
        @ 20,4  Say "Registos....."
        @ 20,17 Say Numero 
        Reg=Numero
        Go Top
        _Nume = 1
        Num = _Nume

        @ 8,0  SAY ;
        "    컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�     "
        @ 10,0 SAY ;
        "    컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�     "
        
        @ 4,4  SAY "N즡ero..... "                              
        @ 5,4  SAY "Conte즔o.."  
        @ 6,4  SAY "N즡ero de discos..... "  
        @ 7,4  SAY "Disquete............. "  
        @ 9,4  SAY "Observa뇯es.......... "  
        Ecra()

        @ 20,4  Say "Proximo registo (PgDn)"
        @ 20,52 Say "Registo anterior (PgUp)"
        @ 21,4  Say "   Alterar registo    "
        @ 21,52 Say "    Apagar registo     "
        @ 22,52 Say "   Alterar indexa뇙o   "
        @ 22,4  Say "   Procurar Registo   "
        @ 20,35 Say " Listagem "
        @ 21,35 Say "  Voltar  "
        @ 22,35 Say "  Browse  "
        
        f=0
        X = LastKey()        

        Do While !X = 27
                
                X = inkey()        
                
                If X = 18
                        
                        _Nume = _Nume - 1
                        If _Nume = 0 
                                _Nume = Reg
                                Num = _Nume
                        EndIF
                        Num = _Nume
                        Ecra()

                ElseIf X = 3
                        
                        _Nume = _Nume + 1 
                        If _Nume > Reg
                                _Nume = 1
                        EndIf
                        Num = _Nume
                        Ecra()

                EndIf                                
                
                If Ecra=.T.
                        Ft_MSetPos(TX,TY)    
                        Ecra=.F.
                Endif
                
                Ft_MGetPos( @XX, @y)

                Ft_MShowCrs()
                
                Rato = Ft_MGetPos( @x, @y)
                mIGUEL=STR(XX)+STR(Y)
                @ 15,15 sAY MIGUEL
                
                If Rato=1 .And. XX=160 .And. Y>24 .And. Y<208 
                        TX = XX                                                
                        TY = Y

                        Set Colo to "&Bra./&Verm."
                        @ 20,4  Say "Proximo registo (PgDn)"
                        Pausa()                        
                        SET COLO TO "&CYA.+/&AZU."
                        @ 20,4  Say "Proximo registo (PgDn)"
                        
                        _Nume = _Nume + 1 
                        If _Nume > Reg
                                _Nume = 1
                        EndIf
                        Num = _Nume
                        Ecra()                              

                EndIf
                
                If Rato=1 .And. XX=160 .And. Y<600 .And. Y>408
                        TX = XX                                                
                        TY = Y

                        
                        Set Colo to "&Bra./&Verm."
                        @ 20,52 Say "Registo anterior (PgUp)"
                        Pausa()
                        SET COLO TO "&CYA.+/&AZU."
                        @ 20,52 Say "Registo anterior (PgUp)"

                        _Nume = _Nume - 1
                        Num = _Nume
                        If _Nume = 0 
                                _Nume = Reg
                                Num = _Nume
                        EndIF
                        Ecra()

                Endif
                
                If Rato=1 .And. XX=168 .And. Y<208 .And. Y>24                
                        TX = XX                                                
                        TY = Y

                        Set Colo to "&Bra./&Verm."
                        @ 21,4  Say "   Alterar registo    "
                        Pausa()                        
                        SET COLO TO "&CYA.+/&AZU."
                        @ 21,4  Say "   Alterar registo    "
                        Altera()

                EndIf
                
                If Rato=1 .And. XX=168 .And. Y<600 .And. Y>408
                        TX = XX                                                
                        TY = Y

                        Set Colo to "&Bra./&Verm."
                        @ 21,52 Say "    Apagar registo     "
                        Pausa()                        
                        SET COLO TO "&CYA.+/&AZU."
                        @ 21,52 Say "    Apagar registo     "
                        Delete()
                        Pack

                EndIf
                
                If Rato=1 .And. XX=160 .And. Y<360 .And. Y>272
                        TX = XX                                                
                        TY = Y

                        Set Colo to "&Bra./&Verm."
                        @ 20,35 Say " Listagem "
                        Pausa()                        
                        SET COLO TO "&CYA.+/&AZU."
                        @ 20,35 Say " Listagem "

                EndIf
                
                If Rato=1 .And. XX=168 .And. Y<360 .And. Y>272
                        TX = XX                                                
                        TY = Y

                        Set Colo to "&Bra./&Verm."
                        @ 21,35 Say "  Voltar  "
                        Pausa()                        
                        SET COLO TO "&CYA.+/&AZU."
                        @ 21,35 Say "  Voltar  "
                        X=27
                EndIf
                
                If Rato=1 .And. XX=176 .And. Y<360 .And. Y>272
                        TX = XX                                                
                        TY = Y

                        Set Colo to "&Bra./&Verm."
                        @ 22,35 Say "  Browse  "
                        Pausa()                        
                        SET COLO TO "&CYA.+/&AZU."
                        @ 22,35 Say "  Browse  "
                        Ft_MReset()
                        Ft_MDefCrs(0,0,0)
                        Set Curs Off
                        Browse(1,1,10,20)
                        Clear TypeAhead
                        Ft_MDefCrs(0,15,15)
                EndIf
        

                If Rato=1 .And. XX=176 .And. Y<600 .And. Y>408
                        TX = XX                                                
                        TY = Y

                        Set Colo to "&Bra./&Verm."
                        @ 22,52 Say "   Alterar indexa뇙o   "
                        Pausa()                        
                        SET COLO TO "&CYA.+/&AZU."
                        @ 22,52 Say "   Alterar indexa뇙o   "

                EndIf
                
                
                If Rato=1 .And. XX=168 .And. Y<208 .And. Y>24                
                        TX = XX                                                
                        TY = Y

                        Set Colo to "&Bra./&Verm."
                        @ 22,4  Say "   Procurar Registo   "
                        Pausa()                        
                        SET COLO TO "&CYA.+/&AZU."
                        @ 22,4  Say "   Procurar Registo   "
                        
                EndIf

                Loop

        EndDO
        
        Restore Screen From Listare

Return

Procedure ecra
                   
        Ft_MReset()
        Ft_MDefCrs(0,0,0)
        Set Curs Off
        Go Num
        @ 4,10  Say Num
        @ 5,15  SAY NOME
        @ 6,26  SAY DISCOS
        @ 7,26  SAY DISCO  
        @ 9,18  SAY OBSERvacao
        Ecra=.T.
        Ft_MDefCrs(0,15,15)

Return

Procedure Pausa
For A=1 to 1000
        Parado=50*59
Next A





