package Practica3;

import java.util.List;
import java.util.LinkedList;

public class Navidad<T> {

		private GeneralTree<T> dato;

		
		
		 public Navidad(GeneralTree<T> dato) {
			 	this.dato = dato;
		}

		public String esAbetoNavidenio() {
			 String result = "No";
			 if(this.dato.hasChildren()) {
				 if(busquedaAbeto(this.dato))
			 		result = "Yes";		 		
			 }
			 return result;
		 }
		 
		 public boolean busquedaAbeto (GeneralTree<T> ab) {
			 boolean ok= true;
			 int cont=0;
			 List<GeneralTree<T>> temp=ab.getChildren();
			 for (GeneralTree<T> hijo : temp) {
				 if(ok) {
					 if(!hijo.hasChildren())
							 cont+=1;
					 else
						 ok = busquedaAbeto(hijo);
				 }
			 }
			 if(cont<3)
				 ok=false;
			 return ok;
		 }
			 
}

