package Practica2;


public class Ejercicio2 {

    
    public static void main(String[] args) {
        BinaryTree<Integer> arbol=new BinaryTree<>(3);
        BinaryTree<Integer> hijo1=new BinaryTree<>(5);
        BinaryTree<Integer> hijo2=new BinaryTree<>(7);
        BinaryTree<Integer> hijo3=new BinaryTree<>(9);
        hijo2.addRightChild(hijo3);
        arbol.addLeftChild(hijo1);
        arbol.addRightChild(hijo2);
        imprimir(arbol);
        
        System.out.println();
        arbol=arbol.espejo();
        imprimir(arbol);
        
        System.out.println();
        System.out.println(arbol.contarHojas());
        
        System.out.println();
        arbol.entreNiveles(1, 1);
    }
    
    public static void imprimir (BinaryTree arbol){
        if(arbol!=null){
            System.out.println(arbol.toString());
            imprimir(arbol.getLeftChild());
            imprimir(arbol.getRightChild());
        }
    }
}
