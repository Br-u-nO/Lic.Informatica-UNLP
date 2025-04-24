package Practica3;

import java.util.List;
import java.util.LinkedList;

public class Ejercicio2 {
    
     public static void main(String[] args) {
     GeneralTree<Integer> raiz=new GeneralTree<>(9);    
     GeneralTree<Integer> hijo1=new GeneralTree<>(11);    
     GeneralTree<Integer> hijo2=new GeneralTree<>(5);    
     GeneralTree<Integer> hijo3=new GeneralTree<>(3);    
     GeneralTree<Integer> hijo4=new GeneralTree<>(7);    
     GeneralTree<Integer> hijo5=new GeneralTree<>(17);    
     GeneralTree<Integer> hijo6=new GeneralTree<>(23); 
     GeneralTree<Integer> hijo7=new GeneralTree<>(79); 
     
     raiz.addChild(hijo1);
     raiz.addChild(hijo2);
     raiz.addChild(hijo5);
     hijo1.addChild(hijo3);
     hijo1.addChild(hijo4);
     hijo4.addChild(hijo7);
     hijo5.addChild(hijo6);
     
     
     RecorridosAG analizador=new RecorridosAG();
     System.out.println(analizador.numerosImparesMayoresQuePreOrden(raiz, 5));
     System.out.println();
     System.out.println(analizador.numerosImparesMayoresQueInOrden(raiz, 0));
     System.out.println();
     System.out.println(analizador.numerosImparesMayoresQuePostOrden(raiz, 0));
     System.out.println();
     System.out.println(analizador.numerosImparesMayoresQuePorNiveles(raiz, 0));
     }
     
     
}