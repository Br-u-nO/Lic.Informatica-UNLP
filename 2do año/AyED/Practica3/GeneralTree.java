package Practica3;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.ArrayList;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	

        public int altura(){
            Queue<List> cola=new LinkedList<>();
            int altura=1;
            cola.offer(this.getChildren());
            cola.offer(null);
            while(!cola.isEmpty()){
                List<GeneralTree> ab=cola.poll();
                if(ab==null){
                    if(!cola.isEmpty()){
                        cola.offer(null);
                        altura+=1;
                    }
                }
                else{
                    for(GeneralTree<Integer> hijo:ab){
                        if(hijo.hasChildren())
                            cola.offer(hijo.getChildren());
                    }
                }
            }
            return altura;
        }
         
        public int nivel(T dato){
              Queue<List> cola=new LinkedList<>();
            int nivel=1;
            boolean ok=false;
            if(this.getData()==dato)
                return 0;
            cola.offer(this.getChildren());
            cola.offer(null);
            while( !cola.isEmpty() && (!ok) ){
                List<GeneralTree> ab=cola.poll();
                if(ab==null){
                    if(!cola.isEmpty()){
                        cola.offer(null);
                        nivel+=1;
                    }
                }
                else{
                    for(GeneralTree<Integer> hijo:ab){
                        if(hijo.getData()==dato)
                            ok=true;
                        if( (hijo.hasChildren()) && (!ok) )
                            cola.offer(hijo.getChildren());
                    }
                }
            }
            if(!ok)
                nivel=-1;
            return nivel;
        }
          
        
        public int ancho(){
            Queue<List> cola= new LinkedList<>();
            int max=0;
            if(!this.hasChildren())
                return 1;
            cola.offer(this.getChildren());
            while(!cola.isEmpty()){
                int ancho=0;
                List<GeneralTree> ab = cola.poll();
                for (GeneralTree<Integer> hijo : ab){
                    ancho+=1;
                    if(hijo.hasChildren())
                        cola.offer(hijo.getChildren());
                }
                if(ancho>max)
                    max=ancho;
            }
            return max;
        }
         
         public boolean esAncestro(T a, T b){
             boolean ok = false;
             GeneralTree<T> arbolA;
             arbolA = busquedaElemento(this,a);
             ok = busquedaAncestro(arbolA,b);
             return ok;
         }
         
         private boolean busquedaAncestro (GeneralTree<T> ab, T elem){
             boolean ok = false;
             if(ab!=null){
                if(ab.getData()==elem)
                    return true;
                else
                    if(ab.hasChildren())
                        for(GeneralTree<T> hijo : ab.getChildren())
                            if(!ok)
                                ok = busquedaAncestro(hijo,elem);
             }
             return ok;
         }
         
         private GeneralTree<T> busquedaElemento(GeneralTree<T> ab,T elem){
             GeneralTree arbol = null;
             boolean ok=false;
             if(ab==null)
                 return null;
             if(ab.getData()==elem)
                 return ab;
             else
                 for(GeneralTree<T> hijo : ab.getChildren())
                    if(!ok){
                        arbol = busquedaElemento(hijo,elem);
                        if(arbol!=null)
                           ok=arbol.getData()==elem;
                    }
             return arbol;
         }
         
         public void Imprimir(){
            Queue<List> cola=new LinkedList<>();
            if(this.hasChildren()){
                cola.offer(this.getChildren());
                cola.offer(null);
            }
            if(this.getData()!=null)
                System.out.println(this.getData());
            while(!cola.isEmpty()){
                List<GeneralTree> ab=cola.poll();
                if(ab==null){
                    if(!cola.isEmpty())
                        System.out.println();
                }
                else{
                    for(GeneralTree<Integer> hijo:ab){
                        System.out.print(hijo.getData());
                        if(hijo.hasChildren())
                            cola.offer(hijo.getChildren());
                    }
                    if(!cola.isEmpty())
                        cola.offer(null);
                }
            }
        }
}