/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

import java.util.Queue;
import java.util.List;
import java.util.LinkedList;

public class AnalizadorArbol {
        
    
     public double devolverMaximoPromedio (GeneralTree<AreaEmpresa> arbol){
         Queue<List> cola = new LinkedList<>();
         double max = 0;
         double suma = 0;
         int cant = 0;
         if(arbol.getData()!=null)
           max = arbol.getData().getTiempo_mensaje();
         if(arbol.hasChildren()){
            cola.offer(arbol.getChildren());
            cola.offer(null);
         }
         while (!cola.isEmpty()){
             List<GeneralTree> temp = cola.poll();
             if(temp==null){
                 suma = suma/cant;
                 if(suma>max)
                     max = suma;
                 suma = 0;
                 cant = 0;
             }
             else{
                 for(GeneralTree<AreaEmpresa> hijo: temp){
                     suma+=hijo.getData().getTiempo_mensaje();
                     cant+=1;
                     if(hijo.hasChildren()) 
                         cola.offer(hijo.getChildren());
                 }
                 cola.offer(null);
             }
         }
         return max;
     }
}
