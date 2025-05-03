/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;


public class Ejercicio6 {

    
    public static void main(String[] args) {
        GeneralTree<Character> raiz=new GeneralTree<>('A');
        GeneralTree<Character> hijo1=new GeneralTree<>('B');
        GeneralTree<Character> hijo2=new GeneralTree<>('C');
        GeneralTree<Character> hijo3=new GeneralTree<>('D');
        GeneralTree<Character> hijo4=new GeneralTree<>('E');
        GeneralTree<Character> hijo5=new GeneralTree<>('F');
        GeneralTree<Character> hijo6=new GeneralTree<>('G');
        GeneralTree<Character> hijo7=new GeneralTree<>('H');
        GeneralTree<Character> hijo8=new GeneralTree<>('I');
        GeneralTree<Character> hijo9=new GeneralTree<>('J');
        GeneralTree<Character> hijo10=new GeneralTree<>('K');
        GeneralTree<Character> hijo11=new GeneralTree<>('L');
        GeneralTree<Character> hijo12=new GeneralTree<>('M');
        GeneralTree<Character> hijo13=new GeneralTree<>('N');
        
        raiz.addChild(hijo1);
        raiz.addChild(hijo2);
        hijo2.addChild(hijo3);
        hijo3.addChild(hijo4);
        hijo3.addChild(hijo5);
        hijo3.addChild(hijo9);
        hijo3.addChild(hijo10);
        hijo3.addChild(hijo11);
        hijo5.addChild(hijo8);
        hijo5.addChild(hijo12);
        hijo5.addChild(hijo13);
        hijo1.addChild(hijo6);
        hijo1.addChild(hijo7);
        
        RedDeAguaPotable red = new RedDeAguaPotable(raiz);
        
        System.out.println(red.minimoCaudal(1000));
        red.getRedAgua().Imprimir();
    }
    
    
    
}
