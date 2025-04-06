package Practica1.ejercicio7;

import java.util.*;
public class Ejercicio7incisoJ {

    
    public static void main(String[] args) {
        ArrayList<Integer> lista1=new ArrayList<>();
        ArrayList<Integer> lista2=new ArrayList<>();
        for(int i=0;i<5;i++){
            lista1.add(i+6);
            lista2.add(i*3);
        }
        List<Integer> lista3= new ArrayList<>();
        lista3=combinarOrdenado(lista1,lista2);
        System.out.println(lista3.toString());
    }
    
    public static ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1, ArrayList<Integer> lista2){
        ArrayList<Integer> Lista=new ArrayList<>();
        int i=0,j=0;
        while((i<lista1.size())|(j<lista2.size())){
            if((i<lista1.size())&&(lista1.get(i)<lista2.get(j))){
                Lista.add(lista1.get(i));
                i+=1;
            }else if(j<lista2.size()){
                Lista.add(lista2.get(j));
                j+=1;
            }
        }
        return Lista;
    }
}
