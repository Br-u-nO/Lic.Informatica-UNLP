package Practica1.Ejercicio8;

import java.util.*;


public class CircularQueue<T> extends Queue<T> {
    public T shift(){
        int i=0;
        super.setData(invertir((LinkedList<T>) super.getData(),i));
        return super.head();
    }
    
    private LinkedList<T> invertir(LinkedList<T>numeros,int index){
        LinkedList<T> lista = new LinkedList<>();
        if(index<numeros.size()){
            lista.add(numeros.get(numeros.size()-1-index));
            lista.addAll(invertir(numeros,index+1));
            
        }
        return lista;
    }
}
