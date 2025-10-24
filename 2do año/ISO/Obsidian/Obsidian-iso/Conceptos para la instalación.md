
### MBR

Es un sector reservado del disco físico (cilindro 0, cabeza 0, sector 1), hay uno en todos los discos. Si existiese más de un disco rígido en la máquina solo uno es designado como el Primary Master Disk.

El tamaño del MBR coincide con el tamaño estándar de sector (512 bytes), los primeros bytes corresponden al Master Boot Code (MBC). A partir del byte 446 se encuentra la tabla de particiones que consta de 64 bytes, y al final 2 bytes libres.

El MBC es un pequeño código que permite arrancar el SO, es más, la última acción del BIOS es leer el MBC (lo lleva a memoria y lo ejecuta). 

### Particiones

Es una manera de dividir lógicamente el disco físico:

- DOS y W95 no pueden manejar FileSystems mayores a 2 GB.
- Cada sistema operativo es instalado en una partición separada.
- Cada partición se formatea con un tipo de FileSystem distinto.
- Particionar demasiado un disco puede tener desventajas.

Debido al tamaño acotado en el MBR la cantidad de particiones se restringe a 3 primarias y una extendida con sus respectivas particiones lógicas. 

- Partición primaria : División cruda del disco (puede haber 4 por disco). Se almacena información de la misma en el MBR.
- Partición extendida: Sirve para contener unidades lógicas en su interior. Solo puede existir una partición de este tipo por disco. No se define un tipo de FS directamente sobre ella.
- Partición lógica: Ocupa la totalidad o parte de la partición extendida y se le define un tipo de FS. Las particiones de este tipo se conectan como una lista enlazada.

Como mínimo es necesario una partición (para el /) pero es recomendable crear al menos 2 (/ y SWAP).

Para crearlas se utiliza software denominado particionador, y existen dos tipos:

1. Destructivos: Permiten crear y eliminar particiones (fdisk).
2. No destructivo: Permiten crear, eliminar y modificar particiones (fips. gparted).

Vamos a trabajar en un ambiente controlado

### Verificando la configuración de nuestro disco

• Desde Windows: utilizamos el administrador de discos 
• Desde DOS: usamos fdisk

Para instalar un nuevo SO necesitamos espacio libre sin particionar, si no lo tenemos debemos generarlo. Para esto existen diversos escenarios:

- Eliminar una partición existente 
- Redimensionar una partición 


[[Virtualizadores - Emuladores]]

### Gestor de arranque 

La finalidad del bootloader es la de cargar una imagen de Kernel (SO) de alguna partición para su ejecución, esta se ejecuta luego del BIOS. 

Existen dos modos de instalación, en el MBR o en el sector de arranque de la partición raíz o activa. 

#### Grub Legacy

Es el gestor de arranque múltiple más utilizado. 

En el MBR solo se encuentra la fase 1 del que solo se encarga de cargar la fase 1.5. 
Esta última ubicada en los siguientes 30 kb del disco (MBR gap), carga la fase 2.
La fase 2 se encarga del interfaz de usuario y carga el kernel.

### Proceso de arranque

Es el proceso de inicio de una máquina y carga del SO y es denominado Bootstrap. En las arquitecturas x86 el BIOS es el responsable de iniciar la carga del SO a través del MBC, carga el programa de booteo desde el MBR y el gestor de arranque (MBC) carga el Kernel.


#### EFI 

Estándar para comunicación entre el SO y el firmware, utiliza el sistema GPT para solucionar limitaciones del MBR como la cantidad de particiones. GPT se encarga de especificar la ubicación y formato de la tabla de particiones en un disco duro. 

Con GPT remplazando al MBR, al utilizar un modo de direccionamiento lógico llamado LBA la tabla queda de la siguiente manera. En la posición LBA 0 se almacena un MBR heredado para mantener compatibilidad con la BIOS, en LBA 1 está la cabecera GPT y la tabla de particiones en sí está en los bloques sucesivos.

La cabecera y la tabla de particiones están escritas al principio y al final del disco.

![[Pasted image 20251019205105.png]]\


### UEFI 

Es una alianza entre varias compañías con el objetivo de modernizar el proceso de arranque.

EFI es propiedad de Intel, UEFI es propiedad del UEFI Fórum.

Características: 

- UEFI aporta criptografía, autenticación de red y una interface gráfica.
- Define la ubicación de gestor de arranque.
- Define la interfaz entre el gestor de arranque y el firmware.
- Expone información para los gestores de arranque.


### Secure Boot

Propone mecanismos para un arranque libre de código malicioso, se utilizan pares de claves asimétricas y se almacenan en el firmware una serie de claves públicas que sirven para validar que las imágenes están firmadas por un proveedor autorizado. Si la clave privada está vencida o fue revocada, la verificación puede fallar. 

