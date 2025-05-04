package Practica3;

import java.util.List;
import java.util.LinkedList;
import java.util.Queue;
	public class RecorridosAG {
           
        
	public static List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree<Integer> ab,Integer n){
            List<Integer> lista=new LinkedList<>();
            if((!ab.isEmpty())){
                lista=busquedaPreOrden(ab,n);
            }
            return lista;
        }
        
        private static List<Integer> busquedaPreOrden (GeneralTree<Integer> ab,Integer n){
            List<Integer> lista=new LinkedList<>();
            if(ab.getData()!=null){
                if((ab.getData()%2==1)&&(ab.getData()>n)){
                    lista.add(ab.getData());
                }
            }
            for(GeneralTree<Integer> hijos:ab.getChildren()){
                lista.addAll(busquedaPreOrden(hijos,n));
            }    
            return lista;
        }
        
	public static List<Integer> numerosImparesMayoresQueInOrden (GeneralTree<Integer> ab,Integer n){
		List<Integer> lista=new LinkedList<>();
		if((!ab.isEmpty())){
                    lista=busquedaInOrden(ab,n);
                     
                }
                return lista;
	}
        
        private static List<Integer> busquedaInOrden (GeneralTree<Integer> ab,Integer n){
            List<Integer> lista=new LinkedList<>();
                
            if(ab.hasChildren()){
                List<GeneralTree<Integer>> hijos=new LinkedList(ab.getChildren());
                lista.addAll(busquedaInOrden(hijos.get(0),n));
                if(ab.getData()!=null){
                    if((ab.getData()%2==1)&&(ab.getData()>n)){
                        lista.add(ab.getData());
                    }
                }
                for(Integer i=1;i<hijos.size();i++){
                    lista.addAll(busquedaInOrden(hijos.get(i),n));
                }
                }else 
                    if((ab.getData()%2==1)&&(ab.getData()>n)){
                        lista.add(ab.getData());
                    }
            return lista;
        }
        
	public static List<Integer>numerosImparesMayoresQuePostOrden (GeneralTree<Integer> ab,Integer n){
            List<Integer> lista=new LinkedList<>();
            if((!ab.isEmpty())){
                lista=busquedaPostOrden(ab,n);      
            }
            return lista;
	}
        
        private static List<Integer> busquedaPostOrden (GeneralTree<Integer> ab,Integer n){
            List<Integer> lista=new LinkedList<>();   
            for(GeneralTree<Integer> hijos:ab.getChildren()){
                lista.addAll(busquedaPostOrden(hijos,n));
            }
            if(ab.getData()!=null){
                if((ab.getData()%2==1)&&(ab.getData()>n)){
                    lista.add(ab.getData());
                }
            }
            return lista;
        }
        
	public static List<Integer> numerosImparesMayoresQuePorNiveles (GeneralTree<Integer> ab,Integer n){
		List<Integer> lista=new LinkedList<>();
		if((!ab.isEmpty())){
                    lista = (busquedaPorNiveles(ab,n));
                     
                }
                return lista;
	}
	
	private static List<Integer> busquedaPorNiveles (GeneralTree<Integer> ab,Integer n){
            List<Integer> lista=new LinkedList<>();
            if(ab.getData()!=null && ((ab.getData()%2==1) && (ab.getData()>n)))
                lista.add(ab.getData());
            Queue<List> cola=new LinkedList<>();
            if(ab.hasChildren())
                cola.offer(ab.getChildren());
            while(!cola.isEmpty()){
                List<GeneralTree> temp=cola.poll();
                for(GeneralTree<Integer> hijo:temp){
                    if(hijo.getData()!=null){
                        if((hijo.getData()%2==1)&&(hijo.getData()>n)){
                            lista.add(hijo.getData());
                        }
                    }
                    if(hijo.hasChildren())
                        cola.offer(hijo.getChildren());
                }
                
            }
            
            return lista;
        }
}