package Practica3;


public class Ejercicio2 {
    
     public static void main(String[] args) {
     GeneralTree<Integer> raiz=new GeneralTree<>(null);    
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
     
     
     System.out.println(RecorridosAG.numerosImparesMayoresQuePreOrden(raiz, 5));
     System.out.println();
     System.out.println(RecorridosAG.numerosImparesMayoresQueInOrden(raiz, 0));
     System.out.println();
     System.out.println(RecorridosAG.numerosImparesMayoresQuePostOrden(raiz, 0));
     System.out.println();
     System.out.println(RecorridosAG.numerosImparesMayoresQuePorNiveles(raiz, -1));
     
     }
     
     public static void romper(Integer n){
         n=0;
     }
     
}