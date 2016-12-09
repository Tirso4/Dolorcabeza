##Instituto Tecnológico de Mexicali

##### Programación Lógica y Funcional

###### Proyecto: Diagnosticador de dolor de cabeza

###### Maestro: Jorge Atempa
###### Alumna: Yersenia Enith Robles Rivera


_ _ _

**Introducción**
La programación lógica es un tipo de paradigmas de programación dentro del paradigma de programación declarativa es decir, no se indica cómo se hacen las cosas, sino qué cosas hacer. A partir de eso, el motor de ejecución decide cómo hacerlo. Esta Basado en la lógica de primer orden.

La programación lógica gira en torno al concepto de predicado, o relación entre elementos y reglas, donde se derivan conclusiones:

```
Todos los hombres son mortales
Socrates es un hombre           
----------------------------
Socrates es mortal
```

La programación lógica encuentra su hábitat natural en aplicaciones de inteligencia artificial o relacionadas: 

- **Sistemas expertos**, donde un sistema de información imita las recomendaciones de un experto sobre algún dominio de conocimiento.
- **Demostración automática de teoremas**, donde un programa genera nuevos teoremas sobre una teoría existente.
- **Reconocimiento de lenguaje natural**, donde un programa es capaz de comprender (con limitaciones) la información contenida en una expresión lingüística humana. 

_ _ _
**Problemática**

En el desarrollo de este proyecto implementaremos un sistema experto que ayude a las personas a diagnosticar las enfermedades de los tipos de dolor de cabeza.

Con el fin de que cualquier persona pueda  diagnosticarse qué tipo de dolor de cabeza presenta, este se realiza a base de preguntas muy simples y claras además de ayuda  de imágenes donde muestra cada síntoma. 

El programa cuenta con diez distintos tipos de dolor de cabeza, los cuales se mencionaran: 

•	Tensional.
•	Sinusitis.
•	Migraña
•	Tumor cerebral.
•	Meningitis.
•	Fatiga visual
•	Abstinencia a la cafeína.
•	Retiro de algún medicamento.
•	Cefalea.
•	Problemas hormonales.

_ _ _
**Justificación**

En el desarrollo de este proyecto se implementara un sistema experto que ayude a las personas a diagnosticar el tipo de dolor de cabeza que padecen, los dolores de cabeza son muy comunes pero cada uno se trata de distinta forma. De manera de que si el usuario no tiene la posibilidad de en el momento acudir al médico, pueda hacer uso del programa y entender qué tipo de dolor de cabeza presenta y como tratarlo. 

######Sin olvidar que la información que brinda este diagnóstico  es solo para tener un primer análisis de la posible causa de nuestro dolor de cabeza. Es de suma importancia acudir a su médico.  

_ _ _
**Implementación**

La implementación del sistema experto está divido en 3 partes:

•	Base de Conocimiento
•	Motor de Inferencia
•	Interfaz de Usuario


La base del conocimiento almacena los síntomas con su respectiva enfermedad, y adicionalmente se agregó el identificador de imagen para cada síntoma.

**Hechos**
```
conocimiento('Sinusitis',
['Tiene estornudos', 'Tiene una respiracion jadeante',
'Siente presion en senos nasales','Tiene ojos llorosos','Tiene escurrimiento nasal']).

conocimiento('Cefalea',['Siente dolor solo a un lado de la cabeza',
'Siente presion directamente en el ojo', 'Le dura 1 hora aproximadamente']).

conocimiento('Migraña',
['Siente nauseas', 'Tiene presion arterial',
 'Tiene sensibilidad a estimulos sensoriales']).

conocimiento('Tumor_cerebral',
['Le duele en las horas de la mañana', 'Tiene nausea o vomitos']).

conocimiento('Meningitis',
['Tiene fiebre', 'Siente el cuello rágido',
 'Tiene nausea o vomitos']).

conocimiento('Fatiga visual',
['Ve mucha television', 'Esta mucho tiempo frente a la computadora',
 'Lee en la obscuridad']).

conocimiento('Cafeina',
['Esta en absinencia de cafe']).

conocimiento('Retirada_de_medicamento',
['Dejo de tomar algun medicamento como: Tylenol, Motrin,Excedrin']).

conocimiento('Problema hormonal',
['Se acerca su mentruacion']).


```

**Reglas**

```

mostrar_diagnostico(X):-conocimiento(X,'cuello y hombros tensos','dientes flojos').

mostrar_diagnostico(X):-conocimiento(X,'estornudos', 'respiracion jadeante','presion en senos nasales','ojos llorosos','escurrimiento nasal').

mostrar_diagnostico(X):-conocimiento(X,'dolor solo a un lado de la cabeza','presion directamente en el ojo','dura 1 hora aproximadamente').

mostrar_diagnostico(X):-conocimiento(X,'nauseas','presion arterial','sensibilidad a estimulos sensoriales').

mostrar_diagnostico(X):-conocimiento(X,'duele en las horas de la mañana', 'nauseas o vomitos').

mostrar_diagnostico(X):-conocimiento(X,'fiebre', 'cuello rigido','nauseas o vomitos').

mostrar_diagnostico(X):-conocimiento(X,'ve mucha television','mucho tiempo frente a la computadora','lee en la obscuridad').

mostrar_diagnostico(X):-conocimiento(X,'abstinencia de cafe').

mostrar_diagnostico(X):-conocimiento(X,'dejo de tomar algun medicamento como: Tylenol, Motrin,Excedrin').

mostrar_diagnostico(X):-conocimiento(X,'se acerca menstruacion').

```
![](https://github.com/enith/Dolorcabeza/blob/master/resultado1.jpg)

estas reglas que se mostraron anteriormente ya no fueron necesarias al realizar el programa con ayuda de una interfaz donde el en motor de inferencia(consultor), que nos preguntara si la persona muestra los síntomas y encontrara la respuesta.


**Reglas**
```
:- dynamic conocido/1.

  mostrar_diagnostico(X):-haz_diagnostico(X),clean_scratchpad.
  mostrar_diagnostico(lo_siento_diagnostico_desconocido):-clean_scratchpad .

  haz_diagnostico(Diagnosis):-
           obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas),
           prueba_presencia_de(Diagnosis, ListaDeSintomas).


obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas):-
                            conocimiento(Diagnosis, ListaDeSintomas).

prueba_presencia_de(Diagnosis, []).

prueba_presencia_de(Diagnosis, [Head | Tail]):-                                                    prueba_verdad_de(Diagnosis, Head),
                         prueba_presencia_de(Diagnosis, Tail).


prueba_verdad_de(Diagnosis, Sintoma):- conocido(Sintoma).
prueba_verdad_de(Diagnosis, Sintoma):- 
				not(conocido(is_false(Sintoma))),
				pregunta_sobre(Diagnosis, Sintoma, Reply), Reply = 'si'.


pregunta_sobre(Diagnosis, Sintoma, Reply):- 
						preguntar(Sintoma,Respuesta),
                        process(Diagnosis, Sintoma, Respuesta, Reply).


process(Diagnosis, Sintoma, si, si):- asserta(conocido(Sintoma)).
process(Diagnosis, Sintoma, no, no):- 															asserta(conocido(is_false(Sintoma))).


clean_scratchpad:- retract(conocido(X)), fail.
clean_scratchpad.


conocido(_):- fail.

not(X):- X,!,fail.
not(_).


```

La interfaz de usuario esta implementada con la librería XPCE de PROLOG.

```


/*
INTERFAZ GRAFICA: Esta parte del sistema experto es la que se encarga de
interactuar con la persona comun, mostrar imagenes, botones, textos, etc.

INICIAR SISTEMA EXPERTO:
PARA CORRER EL PROGRAMA, ES NESESARIO CARGAR LAS 3 PARTES AL SWI PROLOG
Y LUEGO SOLO CONSULTAR TODO, AUTOMATICAMENTE SE ABRIRA LA VENTANA DEL PROGRAMA
*/
 :- use_module(library(pce)).
 :- pce_image_directory('./imagenes').
 :- use_module(library(pce_style_item)).
 :- dynamic color/2.

 resource(img_principal, image, image('img_principal.jpg')).
 resource(portada, image, image('portada.jpg')).
 resource(cuello, image, image('cuello.jpg')).
 resource(luz, image, image('luz.jpg')).
 resource(sonido, image, image('sonido.jpg')).
 resource(estornudo, image, image('estornudo.jpg')).
 resource(jadeante, image, image('jadeante.jpg')).
 resource(nasal, image, image('nasal.jpg')).
 resource(lloroso, image, image('lloroso.jpg')).
 resource(enasal, image, image('Enasal.jpg')).
 resource(dolor, image, image('dolor.jpg')).
 resource(ojos, image, image('ojos.jpg')).
 resource(dolorc, image, image('dolorC.jpg')).
 resource(nauseas, image, image('nauseas.jpg')).
 resource(presion, image, image('presion.jpg')).
 resource(sensibilidad, image, image('sensibilidad.jpg')).
 resource(cama, image, image('cama.jpg')).
 resource(fiebre, image, image('fiebre.jpg')).
 resource(cuello, image, image('cuello.jpg')).
 resource(tv, image, image('tv.jpg')).
 resource(pc, image, image('pc.jpg')).
 resource(leer, image, image('leer.jpg')).
 resource(cafe, image, image('cafe.jpg')).
 resource(med, image, image('medicamento.jpg')).

 resource(Tencional, image, image('Tencional.jpg')).
 resource(Sinusitis, image, image('Sinusitis.jpg')).
 resource(Cefalea, image, image('Cefalea.jpg')).
 resource(Migraña, image, image('Migraña.jpg')).
 resource(Tumor_cerebral, image, image('Tumor_cerebral.jpg')).
 resource(Meningitis, image, image('Meningitis.jpg')).
 resource(Fatiga_visual, image, image('Fatiga_visual.jpg')).
 resource(Cafeina, image, image('Cafeina.jpg')).
 resource(Retirada_de_medicamento, image, image('Retirada_de_medicamento.jpg')).
 /*resource(Problrma_hormonal, image, image('hormonal.jpg')).*/



 mostrar_imagen(Pantalla, Imagen) :- new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(100,80)).
  mostrar_imagen_tratamiento(Pantalla, Imagen) :-new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(20,100)).
 nueva_imagen(Ventana, Imagen) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Ventana, display,Figura,point(0,0)).
  imagen_pregunta(Ventana, Imagen) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Ventana, display,Figura,point(500,60)).
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
  botones:-borrado,
                send(@boton, free),
                send(@btntratamiento,free),
                mostrar_diagnostico(Enfermedad),
                send(@texto, selection('El Diagnostico a partir de los datos es:')),
                send(@resp1, selection(Enfermedad)),
                new(@boton, button('Iniciar consulta',
                message(@prolog, botones)
                )),

                new(@btntratamiento,button('Detalles y Tratamiento',
                message(@prolog, mostrar_tratamiento,Enfermedad)
                )),
                send(@main, display,@boton,point(20,450)),
                send(@main, display,@btntratamiento,point(138,450)).



  mostrar_tratamiento(X):-new(@tratam, dialog('Tratamiento')),
                          send(@tratam, append, label(nombre, 'Explicacion: ')),
                          send(@tratam, display,@lblExp1,point(70,51)),
                          send(@tratam, display,@lblExp2,point(50,80)),
                          tratamiento(X),
                          send(@tratam, transient_for, @main),
                          send(@tratam, open_centered).

tratamiento(X):- send(@lblExp1,selection('De Acuerdo Al Diagnostico El Tratamiento Es:')),
                 mostrar_imagen_tratamiento(@tratam,X).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


   preguntar(Preg,Resp):-new(Di,dialog('Colsultar Datos:')),
                        new(L2,label(texto,'Responde las siguientes preguntas')),
                        id_imagen_preg(Preg,Imagen),
                        imagen_pregunta(Di,Imagen),
                        new(La,label(prob,Preg)),
                        new(B1,button(si,and(message(Di,return,si)))),
                        new(B2,button(no,and(message(Di,return,no)))),
                        send(Di, gap, size(25,25)),
                        send(Di,append(L2)),
                        send(Di,append(La)),
                        send(Di,append(B1)),
                        send(Di,append(B2)),
                        send(Di,default_button,'si'),
                        send(Di,open_centered),get(Di,confirm,Answer),
                        free(Di),
                        Resp=Answer.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  interfaz_principal:-new(@main,dialog('Sistema Experto Diagnosticador de Dolores de Cabeza',
        size(1000,1000))),
        new(@texto, label(nombre,'El Diagnostico a partir de los datos es:',font('times','roman',18))),
        new(@resp1, label(nombre,'',font('times','roman',22))),
        new(@lblExp1, label(nombre,'',font('times','roman',14))),
        new(@lblExp2, label(nombre,'',font('times','roman',14))),
        new(@salir,button('SALIR',and(message(@main,destroy),message(@main,free)))),
        new(@boton, button('Iniciar consulta',message(@prolog, botones))),

        new(@btntratamiento,button('Â¿Tratamiento?')),

        nueva_imagen(@main, img_principal),
        send(@main, display,@boton,point(138,450)),
        send(@main, display,@texto,point(20,130)),
        send(@main, display,@salir,point(300,450)),
        send(@main, display,@resp1,point(20,180)),
        send(@main,open_centered).

       borrado:- send(@resp1, selection('')).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  crea_interfaz_inicio:- new(@interfaz,dialog('Bienvenido al Sistema Experto Diagnosticador',
  size(1000,1000))),

  mostrar_imagen(@interfaz, portada),

  new(BotonComenzar,button('COMENZAR',and(message(@prolog,interfaz_principal) ,
  and(message(@interfaz,destroy),message(@interfaz,free)) ))),

  new(BotonSalir,button('SALIDA',and(message(@interfaz,destroy),message(@interfaz,free)))),
  send(@interfaz,append(BotonComenzar)),
  send(@interfaz,append(BotonSalir)),
  send(@interfaz,open_centered).

  :-crea_interfaz_inicio.




```
![](https://github.com/enith/Dolorcabeza/blob/master/resultado2.jpg)
![](https://github.com/enith/Dolorcabeza/blob/master/resultado3.jpg)
![](https://github.com/enith/Dolorcabeza/blob/master/resultado4.jpg)
![](https://github.com/enith/Dolorcabeza/blob/master/resultado5.jpg)

_ _ _



**Conclusión **
 Prolog a diferentecia de otros lenguajes de progrmacion, nos permite describir estructuras de datos,  sus relaciones y objetivos por ser un lenguaje declarativo. Consta decir entonces que el Lenguaje Prolog tiene una estructura de programación orientada a dar soluciones a  problemas del  área de aplicación de la Inteligencia Artificial mediante estructuras de programación orientadas a la  resolución de problemas.
_ _ _

**Referencias**


•http://es.wikipedia.org/wiki/Sistema_experto#Estructura_b.C3.A1sica_de_un_SE
•http://www.ecured.cu/index.php/Sistemas_expertos#Componentes_de_un_sistema_experto

•http://sistemasexpertosproactivas.blogspot.com/p/ventajas-y-desventajas-de-los-se.html

•http://www.itnuevolaredo.edu.mx/takeyas/Apuntes/Inteligencia%20Artificial/Apuntes/Filminas_Sistemas_Expertos/SistemasExpertos5.PDF


•http://arantxa.ii.uam.es/~dcamacho/logica/recursos/3848.0.prolog.pdf

