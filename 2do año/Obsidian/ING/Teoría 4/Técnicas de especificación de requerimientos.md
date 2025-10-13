
## Estáticas

Se describe el sistema a través de las entidades u objetos, sus atributos y sus relaciones con otros (no describe como como las relaciones cambian con el tiempo). 
Estas son útiles cuando el tiempo no es un factor mayor en el sistema.
## Dinámicas

Se considera un sistema en función de los cambios que ocurren a lo largo del tiempo. Se considera que el sistema se encuentra en un estado en particular hasta que un estimulo lo obliga a cambiar.

### Máquinas de estado finito

Describe al sistema como un conjunto de estados donde el sistema reacciona a ciertos eventos posibles

![[{7BB1A323-F408-4444-8FD1-B0CA205DCD69}.png]]

Formalmente, un autómata finito (AF) puede ser descrito como una 5-tupla (S,Σ,T,s,A) donde: 
◦ Σ es un alfabeto; 
◦ S un conjunto de estados; 
◦ T es la función de transición; 
◦ s es el estado inicial;
◦ A es un conjunto de estados de aceptación o finales.

#### Notación UML de DTE

![[Pasted image 20251013184258.png]]


#### Evento

Es un suceso significativo que debe tenerse en cuenta, influye tanto en el comportamiento como en la evolución del sistema.

#### Transición

Las transiciones se producen como consecuencias de eventos. Pueden o no tener un procesamiento asociado.

- Evento: obligatorio 
- Condición: opcional, depende del problema, puede haber transiciones sin condiciones 
- Acción: opcional, puede haber transiciones sin acciones

### Construcción de un DTE

1. Identificar los estados
2. Si hay un estado complejo se puede explotar
3. Identificar el estado inicial
4. se identifican los cambios de estado con flechas
5. Se analizan las condiciones y las acciones
6. Se verifica la consistencia
	- Se han definido todos los estados 
	- Se pueden alcanzar todos los estados 
	- Se pueden salir de todos los estados 
	- En cada estado, el sistema responde a todas las condiciones posibles (normales y anormales



| Ventajas              | Desventajas               |
| --------------------- | ------------------------- |
| Mejora la comprensión | Complejidad               |
| Previene errores      | Enfoque en un solo objeto |
| Valida el diseño      | No modela la concurrencia |
| Facilita las pruebas  |                           |

El DTE es recomendado con **sistemas de tiempo real**,**aplicaciones con interfaces de usuario**,**sistemas con un número finito de estados** y **algoritmos de control**