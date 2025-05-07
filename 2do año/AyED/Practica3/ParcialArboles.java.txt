package Practica3;

import java.util.LinkedList;
import java.util.List;

public class ParcialArboles {
		
	public static List<Integer> resolver(GeneralTree<Integer> arbol){
		if(arbol.isEmpty())
			return null;
		List <Integer> lista= busqueda(arbol,0);
		for (int i=0;i<lista.size();i++) {
			lista.set(i, 1);
		}
		return lista;
	}
	
	private static List<Integer> busqueda (GeneralTree<Integer> ab,int index){
		List<Integer> lista = new LinkedList<>();
		if(ab.getData()==1)
			lista.add(ab.getData()*index);
		if(ab.hasChildren()) {
			List<Integer> max = new LinkedList<>();
			for(GeneralTree<Integer> hijo : ab.getChildren()) {
				List<Integer> temp = new LinkedList<>();
				temp.addAll(busqueda(hijo,index+1));
				if(calcularMaximo(max)<calcularMaximo(temp)) {
					max=temp;
				}
			}
			lista.addAll(max);
		}
		return lista;
		
	}
	
	private static Integer calcularMaximo (List<Integer> lista) {
		Integer max=0;
		for(Integer num : lista) {
			max+=num;
		}
		return max;
	}
}
