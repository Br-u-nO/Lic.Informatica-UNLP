
- **Formales:** El equipo de desarrolladores debe conducir al cliente, explicando las implicaciones de cada requerimiento.
- **Informales:** Los desarrolladores deben tratar los requerimientos con tantos stakeholders como sea posible.

Pueden ser manuales o automatizadas y se recomienda que antes de una revisión formal se haga una informal.


## Caso de Uso


Proceso de modelado de las “funcionalidades” del sistema en término de los eventos que interactúan entre los usuarios y el sistema.
Se compone por un diagrama que ilustra las interacciones entre el sistema y los actores, y por los escenarios que son las descripciones de estas interacciones.

### Beneficios

![[Pasted image 20251011152506.png]]


La siguiente imagen representa un objetivo individual del sistema y describe la secuencia de actividades/interacciones para alcanzarlo.
Debe estar acompañado de su respectivo escenario.

![[Pasted image 20251011153242.png]]

La siguiente imagen representa a un actor, estos inician las actividades bajo el rol de un usuario que interactúa con el sistema.
Puede ser una persona, sistema externo o dispositivo externo lo que dispare el evento.

### Tipos de Relaciones

- **Asociaciones:** Relación entre un actor y un CU en el que interactúan entre si. 

  ![[Pasted image 20251011153919.png]]

- **Extensiones:** Un CU extiende la funcionalidad de otro. Un CU puede tener muchas extensiones pero estas solo son iniciadas por un CU.

  ![[Pasted image 20251011154311.png]]

- **Uso o inclusión:** Reduce la redundancia entre dos o más CU al combinar los pasos comunes de los CU.

  ![[Pasted image 20251011154416.png]]

- **Herencia:** Relación entre actores donde uno hereda las funcionalidades de otro o varios.

  ![[Pasted image 20251011154624.png]]


## [[Escenarios]] 

