
Básicamente se pueden considerar 3 tipos: 
1.  Emulación: 
	- Emulan hardware 
	- Tienen que implementar todas las instrucciones de la CPU 
	- Es muy costosa y poco eficiente 
	- Permite ejecutar arquitecturas diferentes a las soportadas por el hardware 
2. Virtualización completa: 
	- Permiten ejecutar SO huéspedes en un sistema anfitrión (host) 
	- Utilizan en el medio un hipervisor o monitor de máquinas virtuales 
	- El SO huésped debe estar soportado en la arquitectura anfitriona 
	- Es más eficiente que la emulación (Intel-VT y AMD-V)
3. Paravirtualización: 
	- Permite correr SOs modificados exclusivamente para actuar en entornos virtualizados 
	- Mayor eficiencia que la virtualización


