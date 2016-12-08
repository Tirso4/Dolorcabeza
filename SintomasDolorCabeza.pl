/*Hechos*/

conocimiento(tencional,'cuello y hombros tensos','sensibilidad a la luz','sensibilidad al sonido').

conocimiento(sinusitis,'estornudos', 'respiracion jadeante','presion en senos nasales','ojos llorosos','escurrimiento nasal').

conocimiento(cefalea,'dolor solo a un lado de la cabeza','presion directamente en el ojo','dura 1 hora aproximadamente').

conocimiento(migraña,'nauseas','presion arterial','sensibilidad a estimulos sensoriales').

conocimiento(tumor_cerebral,'duele en las horas de la mañana', 'nauseas o vomitos').

conocimiento(meningitis,'fiebre', 'cuello rigido','nauseas o vomitos').

conocimiento(fatiga_visual,'ve mucha television','mucho tiempo frente a la computadora','lee en la obscuridad').

conocimiento(cafeina,'abstinencia de cafe').

conocimiento(retirada_de_medicamento,'dejo de tomar algun medicamento como: Tylenol, Motrin,Excedrin').

conocimiento(hormonal,'se acerca menstruacion').

conocimiento(lo_siento_diagnostico_desconocido,'').



/*mostrar_diagnostico(tencional).*/
/*mostrar_diagnostico(sinusitis).*/


/*Reglas*/

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




























