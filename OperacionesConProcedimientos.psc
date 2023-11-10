// TP N� 2: - crear una nueva versi�n del algoritmo Operaciones (el que calculaba y mostraba los resultados de las operaciones:
// sumar, restar, multiplicar, dividir, potenciaci�n y mod, con dos n�meros ingresados por el usuario). 
// - Ponerle el nombre OperacionesConProcedimientos y deber�n utilizar subprocesos y/o funciones, como y d�nde crean conveniente.


// Se definen las 6 funciones de la calculadora //
// Sumar
Funcion resultadoSuma <- Sumar (n1, n2)
	Definir resultadoSuma Como Real;
	resultadoSuma = n1 + n2;
FinFuncion

// Restar
Funcion resultadoResta <- Restar (n1, n2)
	Definir resultadoResta Como Real;
	resultadoResta = n1 - n2;
FinFuncion

// Multiplicar
Funcion resultadoMultiplicacion <- Multiplicar (n1, n2)
	Definir resultadoMultiplicacion Como Real;
	resultadoMultiplicacion = n1 * n2;
FinFuncion

// Dividir
Funcion resultadoDivision <- Dividir (n1, n2)
	Definir resultadoDivision Como Real;
	resultadoDivision = n1 / n2;
FinFuncion

//  Potencia
Funcion resultadoPotencia <- ObtenerPotencia (n1,n2)
	Definir resultadoPotencia Como Real;
	resultadoPotencia = n1 ^ n2;
FinFuncion

// ObtenerM�dulo
Funcion resultadoObtenerModulo <- ObtenerModulo(n1,n2)
	Definir resultadoObtenerModulo Como Real;
	resultadoObtenerModulo = n1 MOD n2;
FinFuncion


// banners de t�tulo para cada Funci�n
SubProceso BannerSuma
	Mostrar("//==================================\\");
	Mostrar("|#        ***  S u m a  ***         #|");
	Mostrar("\\==================================//");
	Mostrar("");
FinSubProceso

SubProceso BannerResta
	Mostrar("//==================================\\");
	Mostrar("|#       ***  R e s t a  ***        #|");
	Mostrar("\\==================================//");
	Mostrar("");
FinSubProceso

SubProceso BannerMultiplicacion
	Mostrar("//==================================\\");
	Mostrar("| ** M u l t i p l i c a c i � n  ** |");
	Mostrar("\\==================================//");
	Mostrar("");
FinSubProceso

SubProceso BannerDivision
	Mostrar("//==================================\\");
	Mostrar("|#    ***  D i v i s i � n  ***     #|");
	Mostrar("\\==================================//");
	Mostrar("");
FinSubProceso

SubProceso BannerPotencia
	Mostrar("//==================================\\");
	Mostrar("|#    ***  P o t e n c i a  ***     #|");
	Mostrar("\\==================================//");
	Mostrar("");
FinSubProceso

SubProceso BannerModulo
	Mostrar("//==================================\\");
	Mostrar("|#      ***  M � d u l o  ***       #|");
	Mostrar("\\==================================//");
	Mostrar("");
FinSubProceso


// barra de carga simulada
SubProceso BarraDeCarga
    Definir anchoTotal, anchoBarra Como Entero
    anchoTotal <- 20
    anchoBarra <- 0
    Limpiar Pantalla
        Mientras anchoBarra < anchoTotal Hacer // agrega un caracter cada vuelta hasta llegar al ancho total predefinido
        anchoBarra <- anchoBarra + 1 
        Limpiar Pantalla
		Mostrar("/------------------------------------\");
        Escribir "| Cargando... [", RepetirTexto("#", anchoBarra), RepetirTexto(" ", anchoTotal - anchoBarra), "] |"
		Mostrar("\------------------------------------/");
        Esperar 100 Milisegundos
    Fin Mientras
    
    Esperar 300 Milisegundos
    Limpiar Pantalla	
FinSubProceso

// barra de "Apagando..."
SubProceso BarraDeApagado
    Definir anchoTotal, anchoBarra Como Entero
    anchoTotal <- 21
    anchoBarra <- 0
    
    Mientras anchoBarra < anchoTotal Hacer
        anchoBarra <- anchoBarra + 1
        Limpiar Pantalla
        
		ESCRIBIR"|        =-=-=-=-=-=-=-=-=-=-=         |"
		ESCRIBIR"|       |      Realizado      ||       |"	
		ESCRIBIR"|       |         por         ||       |"	
		ESCRIBIR"|       |   Patricio Lay�s    ||       |"	
		ESCRIBIR"|        =-=-=-=-=-=-=-=-=-=-=         |"
		
		Escribir""
		ESCRIBIR"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
        ESCRIBIR"| Apagando... [", RepetirTexto(">", anchoBarra), RepetirTexto(" ", anchoTotal - anchoBarra), "] |"
        ESCRIBIR"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
        Esperar 100 Milisegundos
    Fin Mientras
	
	Limpiar Pantalla

	ESCRIBIR"|        =-=-=-=-=-=-=-=-=-=-=         |"
	ESCRIBIR"|       |      Realizado      ||       |"	
	ESCRIBIR"|       |         por         ||       |"	
	ESCRIBIR"|       |   Patricio Lay�s    ||       |"	
	ESCRIBIR"|        =-=-=-=-=-=-=-=-=-=-=         |"
	
	Esperar 1500 Milisegundos
	
    Limpiar Pantalla
FinSubProceso

// Funci�n para repetir caracteres
SubProceso caracterRepetido <- RepetirTexto(caracter, cantidad)
    Definir caracterRepetido Como Cadena
	Definir i Como Entero
    caracterRepetido <- ""
    Para i <- 1 Hasta cantidad Hacer
        caracterRepetido <- caracterRepetido + caracter
    Fin Para
FinSubProceso

// pantalla de bienvenida
SubProceso MostrarTitulo
	Mostrar("//==================================\\");
	Mostrar("||   ***   Bienvenido a la   ***    ||");
	Mostrar("||     ~   Mini-Calculadora   ~     ||");
	Mostrar("\\==================================//");
	Mostrar("");
	Mostrar("/------------------------------------\");
	Mostrar("| Presiona una tecla para continuar..|");
	Mostrar("\------------------------------------/");
	Esperar Tecla;
	Limpiar Pantalla
FinSubProceso

// funci�n Men� Principal
Funcion funcionElegida <- MostrarMenuPrincipal
	Definir funcionElegida Como Entero
	Definir errorIngreso Como Logico // se usa para la validaci�n de datos, si hay errores es VERDADERO
	Repetir
		errorIngreso = Falso
		
		Mostrar("+------------------------------------+");
		Mostrar("|      ~   Mini-Calculadora   ~      |");
		Mostrar("+------------------------------------+");
		Mostrar("| Escoge una funci�n: ingresa        |");
		Mostrar("| su n� y presiona la tecla ENTER    |");
		Mostrar("|------------------------------------|");
		Mostrar("| [1] Suma                           |");
		Mostrar("| [2] Resta                          |");
		Mostrar("| [3] Multiplicaci�n                 |");
		Mostrar("| [4] Divisi�n                       |");
		Mostrar("| [5] Potencia                       |");
		Mostrar("| [6] M�dulo                         |");
		Mostrar("|                                    |");
		Mostrar("| [9] Salir del programa             |");
		Mostrar("+------------------------------------+");
		Leer funcionElegida
		
		//  Validaci�n que comprueba si el usuario ingres� una 
		//  opci�n v�lida. Si no lo hizo, lo devuelve al men�
		Si funcionElegida < 1 o funcionElegida > 6 Y funcionElegida <> 9 Entonces
			errorIngreso <- Verdadero
			Limpiar Pantalla		
			Mostrar("+------------------------------------+");
			Mostrar("|                 #                  |");
			Mostrar("|       #  Opci�n no v�lida  #       |");
			Mostrar("|                 #                  |");
			Mostrar("|                                    |");
			Mostrar("|    Escoja una funci�n disponible   |");
			Mostrar("+------------------------------------+");
			Mostrar("");
			Mostrar("/------------------------------------\");
			Mostrar("| Presiona una tecla para continuar..|");
			Mostrar("\------------------------------------/");
			Esperar Tecla;
			Limpiar Pantalla
		Fin Si
	Mientras Que errorIngreso <> Falso // el men� se repite hasta que se seleccione una opci�n v�lida
FinFuncion


// SubProceso para consultar al usuario si quiere continuar
// Se usa un bucle como parte de la validaci�n de los datos ingresados
SubProceso seguirCalculando <- PreguntarSiContinua
	Definir seguirCalculando Como Entero
	Definir errorIngreso Como Logico
	Repetir
		Repetir
			Mostrar("+------------------------------------+");
			Mostrar("|  �Desea realizar otra operaci�n?   |");
			Mostrar("+------------------------------------+");
			Mostrar("| [1] S�                             |");
			Mostrar("| [2] No                             |");
			Mostrar("+------------------------------------+");
			Mostrar("")
			Leer seguirCalculando;
			Limpiar Pantalla
			
			// valida si el usuario ingres� una opci�n v�lida
			Si seguirCalculando <> 1 Y seguirCalculando <> 2 Entonces
				errorIngreso <- Verdadero
				Mostrar("+------------------------------------+");
				Mostrar("|                 #                  |");
				Mostrar("|       #  Opci�n no v�lida  #       |");
				Mostrar("|                 #                  |");
				Mostrar("+------------------------------------+");
				Mostrar("");
				Mostrar("/------------------------------------\");
				Mostrar("| Presiona una tecla para regresar...|");
				Mostrar("\------------------------------------/");
				Esperar Tecla;
				Limpiar Pantalla
			SiNo
				errorIngreso <- Falso
			FinSi
		Mientras Que errorIngreso = Verdadero
	Mientras Que seguirCalculando <> 1 Y seguirCalculando <> 2
FinSubProceso


//  Obtener el primer n�mero del usuario
Funcion numUsuario1 <- ObtenerNumUsuario1
	Definir numUsuario1 Como Real;
	Mostrar("+------------------------------------+");
	Mostrar("|      Ingresa el Primer n�mero      |");
	Mostrar("|      y presiona la tecla ENTER     |");
	Mostrar("+------------------------------------+");
	Leer numUsuario1;
	Limpiar Pantalla
FinFuncion


//  Obtener segundo n�mero del usuario
Funcion numUsuario2 <- ObtenerNumUsuario2	
	Definir numUsuario2 Como Real;
	Mostrar("+------------------------------------+");
	Mostrar("|      Ingresa el Segundo n�mero     |");
	Mostrar("|      y presiona la tecla ENTER     |");
	Mostrar("+------------------------------------+");
	Leer numUsuario2;
	Limpiar Pantalla
FinFuncion


// Mostrar resultados
SubProceso MostrarResultado(resultadoNum)
	Definir resultadoTexto Como Caracter
	resultadoTexto <- CONVERTIRATEXTO(resultadoNum)
	Mostrar("  ***  El resultado es  " + resultadoTexto + "  *** ");
	
	Mostrar("");
	Mostrar("");
	Mostrar("");
	Mostrar("/------------------------------------\");
	Mostrar("| Presiona una tecla para continuar..|");
	Mostrar("\------------------------------------/");
	Esperar Tecla;
	Limpiar Pantalla
FinSubProceso



	

// Aqu� comienza el procedimiento principal // --------------------------------------------------------------------------------------
Algoritmo OperacionesConProcedimientos
	// se definen las variables necesarias. (es necesario por el perfil de lenguaje)
	Definir seguirCalculando, funcionElegida  Como Entero;
	Definir numUsuario1, numUsuario2, resultadoNum Como Real
	Definir resultadoSuma, resultadoResta, resultadoMultiplicacion, resultadoDivision, resultadoPotencia, resultadoObtenerModulo Como Real;
	Definir resultadoTexto Como Caracter
	Definir errorIngreso Como Logico
	errorIngreso <- Falso;
	seguirCalculando <- 1; // se inicializa en 1 para que entre al bucle
	
	
	
	BarraDeCarga
	MostrarTitulo
	
	Repetir
		funcionElegida <- MostrarMenuPrincipal
		Limpiar Pantalla
		
		Segun funcionElegida Hacer // realiza el c�lculo y muestra el resultado de acuerdo a la funci�n elegida
			1:	// SUMA
				BannerSuma;
				numUsuario1 <- ObtenerNumUsuario1;
				BannerSuma;
				numUsuario2 <- ObtenerNumUsuario2;
				BannerSuma;
				resultadoSuma <- Sumar(numUsuario1, numUsuario2)
				MostrarResultado(resultadoSuma);
			2:	// RESTA
				BannerResta;
				numUsuario1 <- ObtenerNumUsuario1;
				BannerResta
				numUsuario2 <- ObtenerNumUsuario2;
				BannerResta;
				MostrarResultado(Restar(numUsuario1, numUsuario2));
			3:	// MULTIPLICACI�N
				BannerMultiplicacion;
				numUsuario1 <- ObtenerNumUsuario1;
				BannerMultiplicacion;
				numUsuario2 <- ObtenerNumUsuario2;
				BannerMultiplicacion;
				MostrarResultado(Multiplicar(numUsuario1, numUsuario2));
			4:	// DIVISI�N
				BannerDivision;
				numUsuario1 <- ObtenerNumUsuario1;
				BannerDivision;
				numUsuario2 <- ObtenerNumUsuario2;
				BannerDivision;
				MostrarResultado(Dividir(numUsuario1, numUsuario2));
			5:	// POTENCIACI�N
				BannerPotencia;
				Mostrar("+------------------------------------+");
				Mostrar("|       Ingresa el n�mero Base       |");
				Mostrar("|      y presiona la tecla ENTER     |");
				Mostrar("+------------------------------------+");
				Leer numUsuario1;
				Limpiar Pantalla
				BannerPotencia;
				Mostrar("+------------------------------------+");
				Mostrar("|      Ahora ingresa el exponente    |");
				Mostrar("|      y presiona la tecla ENTER     |");
				Mostrar("+------------------------------------+");
				Leer numUsuario2;
				Limpiar Pantalla
				BannerPotencia;
				
				resultadoNum <- ObtenerPotencia(numUsuario1, numUsuario2)
				resultadoTexto <- CONVERTIRATEXTO(resultadoNum)
				Escribir "  ***  " , numUsuario1  , " elevado a la " , numUsuario2 , " es: " resultadoTexto , "  *** ";
				Mostrar("");
				Mostrar("");
				Mostrar("");
				Mostrar("/------------------------------------\");
				Mostrar("| Presiona una tecla para continuar..|");
				Mostrar("\------------------------------------/");
				Esperar Tecla;
				Limpiar Pantalla
			6:	// M�DULO
				BannerModulo;
				Mostrar("+------------------------------------+");
				Mostrar("|        Ingresa el dividendo        |");
				Mostrar("|      y presiona la tecla ENTER     |");
				Mostrar("+------------------------------------+");
				Leer numUsuario1;
				Limpiar Pantalla
				BannerModulo;
				Mostrar("+------------------------------------+");
				Mostrar("|      Ahora ingresa el divisor      |");
				Mostrar("|      y presiona la tecla ENTER     |");
				Mostrar("+------------------------------------+");
				Leer numUsuario2;
				Limpiar Pantalla
				BannerModulo;
				resultadoTexto <- CONVERTIRATEXTO(resultadoNum)
				Escribir "  ***   Al dividir " , numUsuario1  , " entre " , numUsuario2 , "  *** ";
				Escribir "  ***  resulta un M�dulo de: " ObtenerModulo(numUsuario1, numUsuario2) , "  *** ";
				Mostrar("");
				Mostrar("");
				Mostrar("");
				Mostrar("/------------------------------------\");
				Mostrar("| Presiona una tecla para continuar..|");
				Mostrar("\------------------------------------/");
				Esperar Tecla;
				Limpiar Pantalla
			9: 
				Limpiar Pantalla
				seguirCalculando = 0; //si el usuario elige 9, se sale del bucle
		FinSegun
		Si funcionElegida <> 9 Entonces  // si el usuario seleccion� una funci�n de la calcu, despu�s, le consulta si quiere seguir
			seguirCalculando <- PreguntarSiContinua();
		FinSi
	Mientras Que seguirCalculando = 1 o errorIngreso = Verdadero // el bucle sigue mientras el usuario quiera seguir o mientras haya un error de ingreso
	
	BarraDeApagado
FinAlgoritmo
