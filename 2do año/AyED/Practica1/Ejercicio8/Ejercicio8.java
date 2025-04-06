package Practica1.Ejercicio8;


public class Ejercicio8 {

    
    public static void main(String[] args) {
        CircularQueue<Integer> cola=new CircularQueue<>();
        cola.enqueue(3);
        cola.enqueue(6);
        
        System.out.println(cola.toString());
        cola.shift();
        System.out.println(cola.toString());
        DoubleEndedQueue<Integer> cola2=new DoubleEndedQueue<>();
        cola2.enqueue(9);
        cola2.enqueue(23);
        cola2.enqueueFirst(2);
        System.out.println(cola2.toString());
    }
    
}
