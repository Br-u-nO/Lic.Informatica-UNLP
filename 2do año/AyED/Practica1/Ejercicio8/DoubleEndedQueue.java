package Practica1.Ejercicio8;

import java.util.*;
public class DoubleEndedQueue<T> extends Queue<T>{
    public void enqueueFirst(T data){
        LinkedList<T> lista;
        lista=(LinkedList<T>) super.getData();
        lista.add(0, data);
        super.setData(lista);
    }
}
