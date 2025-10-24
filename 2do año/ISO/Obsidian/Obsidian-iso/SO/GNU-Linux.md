GNU/Linux es el término correcto para referenciar al SO, cuando hablamos de Linux a secas debemos hablar del núcleo(kernel).

## Distribución 

Una distribución Linux o GNU/LINUX es un conjunto de aplicaciones reunidas que permiten brindar mejoras para instalar fácilmente un sistema operativo. en general se diferencian entre si por las herramientas para configuración y sistemas de administración de paquetes de software para instalar. 

Cada una puede incluir cualquier cantidad de software adicional y una enorme variedad de aplicaciones.

La base de cada distribución incluye el núcleo Linux, las bibliotecas y herramientas del proyecto GNU y otros proyectos/grupos de software. 

## Estructura 

**Kernel:** Es la parte fundamental de un sistema operativo, el encargado de que el software y el hardware puedan trabajar juntos.

**Shell:** Recibe lo que se escribe en la terminal y lo convierte en instrucciones para el sistema operativo.

**FileSystem:** Es la forma en que dentro de un SO se organizan y se administran los archivos.

## Kernel

Linux es un núcleo monolítico híbrido, los controladores de dispositivos y las extensiones del núcleo normalmente se ejecutan en un espacio privilegiado, aunque algunos se ejecutan en espacio de usuario. 

A diferencia de los núcleos monolíticos tradicionales, los controladores de dispositivos y las extensiones al sistema operativo se pueden cargar y descargar con facilidad como módulos mientras el sistema sigue funcionando. También los controladores pueden ser detenidos momentáneamente bajo ciertas condiciones.

#### Lenguajes de programación

Linux esta escrito en C apoyado por GCC junto a pequeñas secciones de lenguaje ensamblador. Se usan muchos otros lenguajes en la conexión con el proceso de construcción del kernel, entre ellos:

- Perl
- Python
- Múltiples lenguajes de Shell scripting


#### Portabilidad 

Si bien no se ideó originalmente como un sistema portable, Linux es ahora de hecho uno de los núcleos de sistema operativo más portados y funciona en sistemas muy diversos.

#### Arquitectura de maquina virtual

El kernel de Linux puede correr sobre muchas arquitecturas de máquina virtual, tanto como anfitrión como cliente. La máquina virtual usualmente emula procesadores Intel x86.

#### Numeración 

La versión del kernel de Linux consta de cuatro numero, A.B.C.D.

- El número A denota la versión del kernel, es el que cambia con un gran cambio en el código o en el concepto del kernel.
- El número B denota la revisión del kernel
- El número C indica una revisión menor del kernel.
- El número D indica parches de seguridad o Bug-fixes.

Algunas veces luego de las versiones puede haber algunas letras como "rc1" o "mm2". El "rc" indica un lanzamiento no oficial, otras letras suelen hacer referencia a las iniciales de la persona.

#### Términos de Licencia

Los términos de esta licencia permiten la distribución y venta de copias o incluso modificaciones, pero todas las copias del trabajo original y trabajos de autoría derivados deben ser publicados bajo los mismos términos, y su código fuente siempre debe de poder obtenerse por el mismo medio que el programa licenciado.

## Shell

El Shell es un programa que actúa como interfaz para comunicar al usuario con el sistema operativo mediante una ventana que espera comandos textuales ingresados por el usuario en el teclado. 

Es posible que un sistema operativo tenga varios intérpretes de comandos, dentro de GNU/LINUX y UNIX existen tres grandes familias:

1. Bourne Shell
2. Korn Shell
3. Bourne Again Shell (Bash)

El Shell no forma parte del kernel, sino que dialoga con él. 
El Shell es iniciado por un proceso denominado login, este se realiza cada vez que un usuario comienza a trabajar en su estación de trabajo

#### Funcionamiento 

Se muestra un prompt donde el usuario teclea una orden y la computadora ejecuta la orden proporcionando una salida de texto.

Cuando la Shell recibe la orden, lo primero que hace es ver si está dentro de sus ordenes interna, luego mira en los alias de comandos y busca el comando en cada ubicación indicada en la variable PATH. Los comandos propios son reconocidos y ejecutados directamente y sin ayuda de ningún otro ejecutable.

Es posible que un nombre de comando coincida con uno interno y con uno externo, en este tipo de casos se ejecutará el comando interno. Si uno quiere forzar el comando externo se debe indicar su path completo.

## FileSystem

Es la forma en que se organizan y se administran los archivos. Esa administración comprende:

- Métodos de acceso: Cómo se accede los datos contenidos en el archivo. 
- Manejo de archivos: Cómo actúan los mecanismos para almacenar, referenciar, compartir y proteger los archivos.
- Manejo de la memoria secundaria: Cómo se administra el espacio para los archivos en memoria secundaria. 
- Mecanismos de integridad: Métodos que garantizan la incorruptibilidad del archivo.

La mayoría de los sistemas operativos poseen su propio sistema de archivos, estructuran la información que luego será representada textual o gráficamente.

Los FileSystem más comunes utilizan dispositivos de almacenamiento que permiten el acceso como una cadena de bloques, a veces llamados sectores. El software del sistema es responsable de la organización de estos y mantiene un registro de qué sectores pertenecen a qué archivos u cuáles no han sido utilizados.

Generalmente un FileSystem tiene directorios que asocian nombres de archivos con nombres de archivos, usualmente conectando el nombre a un índice. La estructura puede ser plana o jerárquica. 

En algunos sistemas de archivos los nombres de archivos son estructurados, en otros son simplemente cadenas de texto.

En sistemas de archivos jerárquicos se declara la ubicación precisa con una cadena de texto llamada "ruta" (path).

Una ruta viene dada por una sucesión de nombres ordenados jerárquicamente de izquierda a derecha y separados por algún carácter especial, y puede terminar en el nombre de un archivo presente en la última rama de directorios especificada.

Los sistemas de archivos tradicionales proveen métodos para crear, mover y eliminar tanto archivos como directorios, pero carecen de métodos para crear, enlaces adicionales o renombrar enlaces padres entre otras cosas.

FileSystems usados hoy en día:

- ext3
- ext4
- ReiserFS
- XFS

En el momento de instalación GNU/Linux crea una estructura de directorios básica, definida FileSystem Hierarchy Standard (FHS). FHS define los directorios principales y sus contenidos en el sistema operativo GNU/Linux y otros sistemas de la familia Unix. Se diseño para estandarizar el sistema de archivos de las distribuciones GNU/Linux

Ejemplos de directorios (FHS):

- **/bin:** Abreviación de binaries, aquí residen la mayoría de los programas esenciales.
- **/dev:** Los archivos son device drivers usados para acceder a los dispositivos del sistema y distintos recursos.
- **/etc:** Serie de archivos de configuración del sistema.
- **/sbin:** Programas esenciales del sistema que usará el administrador.
- **/home:** Directorios "home" de los usuarios.
- **/lib:** imágenes de las librerías compartidas.
- **/proc:** Es un "sistema de ficheros virtual" los ficheros que contiene realmente residen en la memoria. Estos hacen referencia a varios procesos que corren en el sistema y permiten obtener información acerca de que procesos están corriendo.
- **/root:** Directorio home de root.
- **/tmp:** Información temporal de varios programas.
- **/var:** Contiene directorios que a menudo cambian su tamaño o tienden a crecer.
- **/var/log:** Archivos de interés específicamente históricos del sistema, los cuales recogen errores o problemas con el sistema.
- **/var/spool:** Archivos que van a ser pasados a otro programa.
- **/usr:** Serie de subdirectorios que contienen algunos de los más importantes y útiles programas y archivos de configuración.

La mayoría de las cosas que se encuentran en el /usr son opcionales para el sistema, pero son estas cosas las que hacen al sistema interesante.



[[Conceptos para la instalación]]