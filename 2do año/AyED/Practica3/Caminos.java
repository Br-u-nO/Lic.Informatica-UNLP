package Practica3;

import java.util.List;
import java.util.LinkedList;

public class Caminos {

		private GeneralTree<Integer> dato;
		
		
		
		public Caminos(GeneralTree<Integer> dato) {
			this.setDato(dato);
		}

		public GeneralTree<Integer> getDato() {
			return dato;
		}

		private void setDato(GeneralTree<Integer> dato) {
			this.dato = dato;
		}

		public List<Integer> caminoAHojaMasLejana (){
			return busquedaCamino(this.getDato());
			
		}
		
		private List<Integer> busquedaCamino (GeneralTree<Integer> ab){
			List<Integer> act = new LinkedList();
			if(ab==null)
				return null;
			act.add(ab.getData());
			if(ab.hasChildren()) {
				List<Integer> max = new LinkedList();
				for(GeneralTree<Integer> hijo : ab.getChildren()) {
					List<Integer> temp = new LinkedList();
					temp.addAll(busquedaCamino(hijo));
					if(temp.size()>max.size())
						max = temp;
				}
				act.addAll(max);
			}
			return act;
		}
}