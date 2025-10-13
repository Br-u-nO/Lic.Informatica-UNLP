
En estos se describe la interacción del mismo y los eventos alternativos

#### Componentes

- Nombre del caso de uso: Debe comenzar con un verbo y representar la meta de CU.
- Descripción: Explicación breve del propósito del CU.
- Actores: Actores principal que se beneficia del CU.
- Precondiciones: Condiciones necesarias para la realización del CU.
- Curso normal: Desenlace normal esperado, detallando las acciones del actor y las del sistema por separado.
- Curso alterno: Describe el comportamiento si ocurre algo atípico.
- Postcondiciones: Restricciones del estado del sistema después de la finalización exitosa del CU.


#### Pasos

1. Identificar los actores

	Los actores los podemos buscar en documentaciones o manuales existentes, minutas de reunión o documentos de requerimientos.
       
	Debe responder:
	¿Quién o qué proporciona las entradas al sistema?
	¿Quién o qué recibe las salidas del sistema?
	¿Se requieren interfaces con otros sistemas?
    ¿Quién mantendrá la información en el sistema?
    
2. Identificar los CU para los requerimientos
     
	Debe responder:
	¿Cuáles son las principales tareas del actor?
    ¿Qué información necesita el actor del sistema?
    ¿Qué información proporciona el actor al sistema?
    ¿Necesita el sistema informar al actor de eventos o cambios ocurridos?
    ¿Necesita el actor informar al sistema de  eventos o cambios ocurridos?
    
3. Construir el diagrama
4. Realizar los escenarios


### CARACTERISTICAS IMPORTANTAS

- Un CU debe representar una funcionalidad concreta.     

- La descripción de los pasos en los escenarios debe contener más de un paso, para representar la interacción entre los componentes.

- El uso de condicionales en el curso normal, es limitado a la invocación de excepciones, ya que este flujo representa la ejecución del caso sin alteraciones.

- Las pre-condiciones no deben representarse en los cursos alternativos, ya que al ser una pre-condición no va a ocurrir.

- Los “uses” deben ser accedidos por lo menos desde dos CU.

