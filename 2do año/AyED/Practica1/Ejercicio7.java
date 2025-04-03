package Practica1.tp1.ejercicio7;


import java.util.*;

public class Ejercicio7 {

    public static void main(String[] args) {
        int n;
        ArrayList<Integer> lista = new ArrayList<>();
        for (int i=0;i<=5;i++){
            lista.add((i+1)*3);
        }
        for (int i=0;i<=5;i++){
            System.out.println(lista.get(i));
        }
         System.out.println(lista.toString());
        Iterator<Integer> iterador = lista.iterator();
        while (iterador.hasNext()) {
        System.out.println(iterador.next());
        }
        for(Integer i:lista){
            System.out.println(i+" ");
        }
        
        System.out.println("_______________________________");
        
        
        LinkedList<Integer> lista2=new LinkedList<>();
        for (int i=0;i<=5;i++){
            lista2.add((i+1)*5);
        }
        for (int i=0;i<=5;i++){
            System.out.println(lista2.get(i));
        }
       
        System.out.println("_______________________________");
        
    }
    
}
