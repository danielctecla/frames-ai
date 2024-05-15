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

frame(k_nn,subclase_de(aprendizaje_supervisado),
	  propiedades([
            puede(clasificar), 
            requiere(pocos_datos)
	  ]),
	  descripcion('K-NN es un método de aprendizaje supervisado simple y efectivo que se puede utilizar tanto para clasificación como para regresión. La principal característica de K-NN es que no requiere un modelo explícito, sino que funciona directamente con las instancias de los datos de entrenamiento.')).

frame(redes_neuronales,subclase_de(machine_learning),
	  propiedades([
			usa_datos(etiquetados),
			puede(clasificar),
            usa(gradiente_descendente)
	  ]),
	  descripcion('Las redes neuronales son un componente central en el campo de la inteligencia artificial, especialmente en el aprendizaje automático. Inspiradas por las redes biológicas neuronales del cerebro humano, estas estructuras computacionales simulan la manera en que los humanos aprenden, permitiendo a las máquinas reconocer patrones y tomar decisiones con cierto nivel de autonomía.')).

frame(k_means,subclase_de(aprendizaje_no_supervisado),
	  propiedades([
			puede(clasificar),
            requiere(pocos_datos)
	  ]),
	  descripcion('El algoritmo K-means es uno de los métodos de clustering más utilizados en el aprendizaje no supervisado. Su objetivo es dividir un conjunto de datos en K grupos distintos basándose en la similitud de las características de los datos.')).

frame(dbscan,subclase_de(aprendizaje_no_supervisado),
	  propiedades([
			puede(clasificar),
            requiere(pocos_hiperparametros)
	  ]),
	  descripcion('El algoritmo DBSCAN (Density-Based Spatial Clustering of Applications with Noise) es una técnica de clustering popular en aprendizaje no supervisado que es especialmente efectiva para identificar clusters basados en densidades de puntos en el espacio de datos.')).

frame(q_learning,subclase_de(aprendizaje_por_refuerzo),
	  propiedades([
			usa_datos(no_etiquetados),
			puede(clasificar),
            requiere(pocos_hiperparametros),
			puede(predecir_valores_continuos)
	  ]),
	  descripcion('Q-learning es un algoritmo prominente en el ámbito del aprendizaje por refuerzo, conocido por su capacidad para aprender políticas óptimas de decisión para un agente en un entorno definido por un modelo de Markov. Es un método basado en valores que busca maximizar la suma de recompensas futuras al aprender la función de valor óptima para cada acción en cada estado posible.')).

frame(deep_q_learning,subclase_de(aprendizaje_por_refuerzo),
	  propiedades([
			puede(predecir_valores_continuos),
			puede(clasificar),
            usa(gradiente_descendente),
            necesita(poder_computacional)
	  ]),
	  descripcion('El algoritmo Deep Q-Network (DQN) es una técnica avanzada dentro del aprendizaje por refuerzo que combina Q-learning con redes neuronales profundas para crear un sistema que puede aprender políticas óptimas de decisión en entornos complejos.')).

frame(redes_neuronales_recurrentes,subclase_de(redes_neuronales),
	  propiedades([
			puede(predecir_valores_continuos),
			puede(clasificar)
	  ]),
	  descripcion('Las Redes Neuronales Recurrentes (RNN) son una clase de redes neuronales diseñadas para manejar secuencias de datos, como series temporales o secuencias lingüísticas. Son especialmente conocidas por su capacidad para mantener un estado o memoria que captura información sobre lo que se ha procesado hasta el momento, lo cual es ideal para tareas donde el contexto y el orden de los datos importan.')).

frame(redes_neuronales_convolucionales,subclase_de(redes_neuronales),
	  propiedades([
			puede(predecir_valores_continuos)
	  ]),
	  descripcion('Las Redes Neuronales Convolucionales (CNN) son un tipo de arquitectura de red neuronal profunda que es particularmente potente para procesar datos que tienen una estructura de cuadrícula, como imágenes. Las CNN utilizan una técnica matemática llamada convolución, que es una operación especializada que puede capturar patrones espaciales y temporales en los datos de manera más eficiente que las redes neuronales densamente conectadas.')).

frame(regresion_logistica,subclase_de(aprendizaje_supervisado),
	  propiedades([
			puede(clasificar),
			necesita(datos),
            usa(gradiente_descendente)
	  ]),
	  descripcion('La regresión logística es un modelo estadístico que se utiliza principalmente para la clasificación binaria. Este método predice la probabilidad de que una observación pertenezca a una de dos clases, modelando la probabilidad a través de la función logística. Es ampliamente utilizada debido a su simplicidad, eficacia y la interpretación directa que proporciona de los coeficientes del modelo.')).

frame(algoritmos_geneticos,subclase_de(machine_learning),
	  propiedades([
			necesita(poder_computacional),
			puede(predecir_valores_continuos)
	  ]),
	  descripcion('Los algoritmos genéticos (AG) son métodos heurísticos que imitan los procesos de evolución biológica para resolver problemas de optimización y búsqueda. Utilizan técnicas de la genética como mutación, cruce y selección para generar soluciones de alta calidad a problemas complejos y variados. Son particularmente efectivos en espacios de búsqueda grandes y complejos donde los métodos tradicionales podrían fallar o ser ineficientes.')).

frame(optimizacion_enjambre_particulas,subclase_de(algoritmos_geneticos),
	  propiedades([
			usa_datos(no_etiquetados)
	  ]),
	  descripcion('PSO es un método de optimización metaheurístico que modela el comportamiento social y colaborativo observado en la naturaleza, como el de los enjambres de pájaros o bancos de peces. Este algoritmo es eficaz para encontrar soluciones óptimas o cercanas a óptimas en problemas de optimización complejos y se caracteriza por su implementación sencilla y su capacidad para converger rápidamente hacia una solución.')).


frame(modelos_markov_ocultos,subclase_de(machine_learning),
	  propiedades([
			puede(predecir_valores_continuos),
			puede(clasificar),
            usa(gradiente_descendente)
	  ]),
	  descripcion('Un Modelo de Markov Oculto (HMM) es un modelo estadístico que asume que el sistema que se está modelando es un proceso estocástico de Markov con estados ocultos. El modelo se compone de estados no observados, cada uno de los cuales está asociado con una distribución de probabilidad sobre un conjunto de observaciones posibles, lo que permite modelar secuencias de eventos o símbolos cuya aparición está controlada por estos estados ocultos.')).

frame(deep_learning,subclase_de(machine_learning),
	  propiedades([
			puede(predecir_valores_continuos),
            usa(gradiente_descendente),
			puede(predecir_valores_continuos),
            necesita(poder_computacional)
	  ]),
	  descripcion('El Deep Learning es un subcampo del machine learning que utiliza redes neuronales con múltiples capas (deep networks) para modelar relaciones complejas en grandes conjuntos de datos. Estas redes son capaces de aprender jerarquías de características, desde las más simples hasta las más abstractas, lo que las hace extremadamente efectivas para tareas de percepción como el reconocimiento visual y auditivo, así como para aplicaciones que requieren la interpretación de grandes volúmenes de datos, como el procesamiento de lenguaje natural.')).
