package Practica1.ejercicio7;

import java.util.*;

public class Ejercicio7incisoGHI {

  
    public static void main(String[] args) {
        List<Integer> lista=new LinkedList<>();
        
        Scanner s=new Scanner(System.in);
        int n=s.nextInt();
        lista=sucesionLista(n);
        
        System.out.println(lista.toString());
        
        
        
       System.out.println("Punto H");
       System.out.println();
       
       List <Integer> listaAlRevez=new ArrayList<>();
       listaAlRevez=invertirArrayList(lista,0);
       System.out.println(listaAlRevez.toString());
       
       System.out.println("Punto I");
       System.out.println();
       
       System.out.println(sumarLinkedList(lista,0));
    }
    
    
    public static List<Integer> sucesionLista (int n){
         List<Integer> lista=new LinkedList<>();
         lista.add(n);
         if(n!=1){
                lista.addAll(sucesionLista(sucesion(n)));
         }
         return lista;
     }
    public static Integer sucesion (int n){
            if(n%2==0){
                return n/2;
            }else{
                return(3*n+1);
            }
    }
    
    // Punto H
    public static List<Integer> invertirArrayList(List<Integer>numeros,int index){
        List<Integer> lista= new ArrayList<>();
        if(index<numeros.size()){
            lista.add(numeros.get(numeros.size()-1-index));
            lista.addAll(invertirArrayList(numeros,index+1));
            
        }
        return lista;
    }
    
    //Punto I
    public static int sumarLinkedList(List<Integer>numeros,int index){
        int suma=0;
        if(index<numeros.size()){
            suma=numeros.get(index)+sumarLinkedList(numeros,index+1);
        }
        return suma;
    }
    
}

