%BASE DE CONOCIMIENTOS
%(Estos son solo ejemplos, no es informacion veridica)

frame(machine_learning,subclase_de(top),
      propiedades([necesita(datos)]),
      descripcion('El aprendizaje automatico es un campo de la inteligencia artificial que se centra en el desarrollo de algoritmos y tecnicas que permiten a las computadoras aprender a realizar tareas sin ser programadas explicitamente para cada una de ellas.')).

frame(aprendizaje_supervisado, subclase_de(machine_learning),
      propiedades([usa_datos(etiquetados)]),
      descripcion('El aprendizaje supervisado es un tipo de aprendizaje automatico donde se entrena un modelo utilizando un conjunto de datos etiquetados, es decir, datos que tienen asociadas las respuestas correctas.')).

frame(aprendizaje_no_supervisado, subclase_de(machine_learning),
      propiedades([usa_datos(no_etiquetados)]),
      descripcion('El aprendizaje no supervisado es un tipo de aprendizaje automatico donde el modelo se entrena utilizando datos que no estan etiquetados. El objetivo principal es encontrar patrones o estructuras intrinsecas en los datos.')).

frame(aprendizaje_por_refuerzo, subclase_de(machine_learning),
      propiedades([usa_datos(etiquetados_y_no_etiquetados)]),
      descripcion('El aprendizaje por refuerzo es un tipo de aprendizaje automatico en el que un agente aprende a traves de la interaccion con un entorno. El agente toma acciones en el entorno y recibe recompensas o penalizaciones segun el resultado de esas acciones. El objetivo del agente es aprender a tomar las acciones que maximicen la recompensa acumulada a largo plazo.')).

frame(regresion_lineal, subclase_de(aprendizaje_supervisado),
      propiedades([
            puede(predecir_valores_continuos), 
            usa(gradiente_descendente),
            requiere(pocos_datos),
            necesita(poder_computacional)
      ]),
      descripcion('La regresion lineal es un modelo de aprendizaje supervisado que busca encontrar la relacion lineal entre una o mas variables de entrada (caracteristicas) y una variable de salida (objetivo). Se utiliza principalmente para predecir valores continuos.')).

frame(svm, subclase_de(aprendizaje_supervisado),
      propiedades([
            puede(clasificar), 
            usa(kernel),
            requiere(mediana_cantidad_datos)
      ]),
      descripcion('Las Maquinas de Vectores de Soporte (SVM) son modelos de aprendizaje supervisado que buscan encontrar el hiperplano que mejor separa las clases en un espacio dimensional. Se utilizan principalmente para problemas de clasificacion binaria o multiclase.')).

frame(arbol_decision, subclase_de(aprendizaje_supervisado),
      propiedades([
            puede(clasificar),
            puede(predecir_valores_continuos),
            requiere(pocos_hiperparametros),
            necesita(poder_computacional)
      ]),
      descripcion('Los Árboles de Decisión son modelos de aprendizaje supervisado que pueden ser utilizados para clasificación o regresión. Funcionan dividiendo el conjunto de datos en subconjuntos más pequeños basados en características específicas, de manera que las muestras en cada subconjunto sean lo más homogéneas posible en términos de la variable objetivo. Son eficaces para datos con relaciones no lineales y pueden manejar datos faltantes de manera inherente.')).

