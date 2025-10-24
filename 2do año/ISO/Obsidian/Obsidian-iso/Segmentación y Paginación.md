
### Segmentación

Este esquema soluciono el problema de tener que tener todos las particiones una al lado de la otra, pero seguía dividiéndose en partes y generando fragmentaciones. 

Las direcciones lógicas consisten en 2 partes, el selector de segmento y el desplazamiento dentro del segmento. Por cada proceso tenemos una tabla de segmentos que contiene la dirección donde comienza el segmento (Base), y la longitud del mismo (Limite)

Ej.: 

|     | Limite | Base |
| --- | ------ | ---- |
| 0   | 1000   | 1400 |
| 1   | 400    | 6300 |
| 2   | 400    | 4300 |
| 3   | 1100   | 3200 |
| 4   | 1000   | 4700 |
![[Pasted image 20251022200848.png]]


### Paginación

La memoria física es dividida lógicamente en pequeños trozos de igual tamaño que llamamos Marcos, y la memoria lógica es dividida en trozos de igual tamaño que los marcos. El SO debe mantener una tabla de páginas por cada proceso, donde cada entrada contiene el Marco en la que se coloca.

La dirección lógica se interpreta como un numero de página y un desplazamiento dentro de la misma

![[Pasted image 20251023184535.png]]

#### Tabla de Páginas

Cada proceso tiene su tabla de páginas y debe residir en la RAM, su tamaño no depende del espacio de direcciones del proceso.

![[Pasted image 20251023184931.png]]