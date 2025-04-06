package Practica1.Ejercicio8;

import java.util.*;

public class Queue<T> {
    private LinkedList<T> data=null;

   
    Queue(){
        this.data=new LinkedList<>();
    }

    public List getData() {
        return data;
    }

    public void setData(LinkedList data) {
        this.data = data;
    }
    
    public void enqueue(T data){
        this.data.add(data);
    }
    
    public T deque(){
        T dato=this.data.get(0);
        this.data.remove(0);
        return dato;
    }
    public T head(){
        return this.data.get(0);
    }
    public boolean isEmpty(){
        return this.data.isEmpty();
    }
    public int size(){
        return this.data.size();
    }
    
    @Override
    public String toString(){
        return this.data.toString();
    }
}
