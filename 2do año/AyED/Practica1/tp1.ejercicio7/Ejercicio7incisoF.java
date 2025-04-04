package Practica1.tp1.ejercicio7;

import java.util.*;

public class Ejercicio7incisoF {

    
    public static void main(String[] args) {
        List<Integer> numeros=new LinkedList<>();
        
        numeros.add(2);
        numeros.add(3);
        numeros.add(9);
        numeros.add(3);
        numeros.add(2);
        numeros.add(2);
        numeros.add(3);
        numeros.add(9);
        numeros.add(3);
        numeros.add(2);
        
        System.out.println(capicua(numeros));
    }
    
    public static boolean capicua (List<Integer> num){
        int i=0;
        boolean ok=true;
        while (i<=num.size()/2){
             if (num.get(i) != num.get(num.size()-1-i)){
                 ok=false;
            }
             i+=1;            
        }
        return ok;
    }
}
