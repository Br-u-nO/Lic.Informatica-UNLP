/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

public class Ejercicio4 {

    
    public static void main(String[] args) {
        AreaEmpresa area1= new AreaEmpresa("los",2);
        GeneralTree raiz=new GeneralTree<>(area1);
        AreaEmpresa area2= new AreaEmpresa("los",12);
        GeneralTree hijo1=new GeneralTree<>(area2);
        AreaEmpresa area3= new AreaEmpresa("los",6);
        GeneralTree hijo2=new GeneralTree<>(area3);
        AreaEmpresa area4= new AreaEmpresa("los",8);
        GeneralTree hijo3=new GeneralTree<>(area4);
        
        raiz.addChild(hijo1);
        raiz.addChild(hijo2);
        hijo2.addChild(hijo3);
             
        System.out.println(AnalizadorArbol.devolverMaximoPromedio(raiz));
    }
    
}
