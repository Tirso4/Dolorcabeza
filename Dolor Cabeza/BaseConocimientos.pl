/* BASE DE CONOCIMIENTOS: Sintomas y Enfermedades
el identificador de imagenes de acuerdo al  sintoma
*/

conocimiento('Tencional',
['Siente cuello y hombros tensos', 'Tiene sensibilidad a la luz',
'Tiene sensibilidad al sonido']).

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

conocimiento('Fatiga_visual',
['Ve mucha television', 'Esta mucho tiempo frente a la computadora',
 'Lee en la obscuridad']).

conocimiento('Cafeina',
['Esta en absinencia de cafe']).

conocimiento('Retirada_de_medicamento',
['Dejo de tomar algun medicamento como: Tylenol, Motrin,Excedrin']).

conocimiento('Problema_hormonal',
['Se acerca su mentruacion']).



id_imagen_preg('Siente cuello y hombros tensos','cuello').
id_imagen_preg('Tiene sensibilidad a la luz','luz').
id_imagen_preg('Tiene sensibilidad al sonido','sonido').

id_imagen_preg('Tiene estornudos','estornudo').
id_imagen_preg('Tiene una respiracion jadeante','jadeante').
id_imagen_preg('Siente presion en senos nasales','nasal').
id_imagen_preg('Tiene ojos llorosos','lloroso').
id_imagen_preg('Tiene escurrimiento nasal','enasal').

id_imagen_preg('Siente dolor solo a un lado de la cabeza','dolor').
id_imagen_preg('Siente presion directamente en el ojo','ojos').
id_imagen_preg('Le dura 1 hora aproximadamente','dolorc').

id_imagen_preg('Siente nauseas','nauseas').
id_imagen_preg('Tiene presion arterial','presion').
id_imagen_preg('Tiene sensibilidad a estimulos sensoriales','sensibilidad').

id_imagen_preg('Le duele en las horas de la mañana','cama').
id_imagen_preg('Tiene nausea o vomitos','nauseas').

id_imagen_preg('Tiene fiebre','fiebre').
id_imagen_preg('Siente el cuello rágido','cuello').
id_imagen_preg('Tiene nausea o vomitos','nauseas').

id_imagen_preg('Ve mucha television','tv').
id_imagen_preg('Esta mucho tiempo frente a la computadora','pc').
id_imagen_preg('Lee en la obscuridad','leer').

id_imagen_preg('Esta en absinencia de cafe','cafe').

id_imagen_preg('Dejo de tomar algun medicamento como: Tylenol, Motrin,Excedrin',
	       'med').






































