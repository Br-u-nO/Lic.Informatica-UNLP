
La memoria es una de las cosas más importantes en el diseño del SO. Todos los programas y datos deben estar en memoria para ser ejecutados, o si quiera referenciarlos directamente.

El SO debe llevar un registro de las partes de la memoria que están siendo usadas y las que no, a la vez debe de poder asignar eficientemente espacio en memoria a los procesos que lo necesiten y a la vez sacarles el mismo una vez finalizados.

El SO debe garantizarle a los procesos seguridad a sus partes de memoria privada y brindarles acceso compartido a otras secciones de memorias, así como librerías. El programador no debe de porque conocer la alocación de los programas.

### Administración de Memoria

Para alojar múltiples procesos en memoria se realiza una división lógica de esta, así garantizando protección. Se trata de asignar el mayor numero de procesos para garantizar el mayor uso de la CPU por los mismos.

En la reubicación el programador no debe ocuparse de conocer donde será colocado en la memoria RAM, mientras un proceso se ejecuta puede ser sacado y traído a la memoria (swap) y, posiblemente colocarse en diferentes direcciones. Las referencias a la memoria deben traducirse según la ubicación actual del proceso.

Los procesos no deben referenciar a direcciones de memoria de otros procesos, salvo que tengan permiso. El chequeo se debe realizar durante la ejecución, no es posible anticipar todas la referencias.

### Abstracción

El rango direcciones que un proceso va a poder utilizar va a depender del tamaño de la arquitectura del procesador. Calculo del máximo de un procesador de x bits:

$$
 x bits = 2^x - 1
$$

Y la posición dentro de este será independiente con respecto a la ubicación real del proceso en memoria RAM.

### Direcciones

**Lógicas:** Referencia a una localidad de memoria independiente de la asignación actual de los datos en la memoria.

**Físicas:** Referencia una localidad en la memoria física (RAM) 



Al utilizar direcciones lógicas necesitamos un tipo de conversión para trasladarlas a direcciones físicas, una forma de hacer esto es usando registros auxiliares.

**Registro Base:** Dirección de comienzo del espacio de direcciones del proceso en la RAM.

**Registro Límite:** Dirección final del proceso o medida del proceso.

### MMU

Es un dispositivo de HW que mapea direcciones virtuales a físicas, es parte del procesador. El valor en el registro de realocación es sumado a cada dirección generada por el proceso de usuario al momento de acceder a memoria 

![[Pasted image 20251022194518.png]]

#### Tipos de Particiones

**Partición Fija:** La memoria se divide en particiones o regiones de tamaño fijo, esto no significa que deban de ser del mismo tamaño. Y en cada una de estas particiones se va a encontrar un proceso distinto.

**Particiones dinámicas:** Las particiones varían en tamaño y en número aunque siguen alojando un proceso cada una. Cada una se genera en base al tamaño justo que requiere el proceso.

### Fragmentación 

La fragmentación se da cuando tenemos espacio libre en memoria pero no podemos alojar nuestro proceso, esta situación se puede dar de dos maneras. Cuando nos queda espacio fuera de las particiones pero es tan pequeño que no alcanza, estamos hablando de fragmentación externa dada en un esquema de particiones dinámicas. Ahora cuando el espacio está dentro de una partición por utilizar el esquema de partición fija, hablamos de fragmentación interna.


Para solucionar estos problemas de fragmentación y otros dilemas más que dio el esquema de registro base se encontraron las siguientes Soluciones. 


### [[Segmentación y Paginación]]