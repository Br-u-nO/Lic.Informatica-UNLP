/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;


public class Ejercicio3 {


    public static void main(String[] args) {
        GeneralTree raiz=new GeneralTree<>(2);
        GeneralTree hijo1=new GeneralTree<>(4);
        GeneralTree hijo2=new GeneralTree<>(12);
        GeneralTree hijo3=new GeneralTree<>(5);
        GeneralTree hijo4=new GeneralTree<>(3);
        GeneralTree hijo5=new GeneralTree<>(1);
        GeneralTree hijo6=new GeneralTree<>(7);
        GeneralTree hijo7=new GeneralTree<>(6);
        GeneralTree hijo8=new GeneralTree<>(65);
        GeneralTree hijo9=new GeneralTree<>(17);
        GeneralTree hijo10=new GeneralTree<>(24);
        GeneralTree hijo11=new GeneralTree<>(42);
        
        raiz.addChild(hijo1);
        raiz.addChild(hijo2);
        hijo2.addChild(hijo3);
        hijo3.addChild(hijo4);
        hijo3.addChild(hijo5);
        hijo3.addChild(hijo9);
        hijo3.addChild(hijo10);
        hijo3.addChild(hijo11);
        hijo5.addChild(hijo8);
        hijo1.addChild(hijo6);
        hijo1.addChild(hijo7);
        
        
        System.out.println(raiz.altura());
        System.out.println(raiz.nivel(3));
        System.out.println(raiz.ancho());
    }
    
}
