/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica1.Ejercicio9;

import java.util.Stack;

public class TestdeBalanceo {

    
    public static void main(String[] args) {
        System.out.println(qbalanceado("{()[(])}"));
    }
    public static boolean qbalanceado(String s){
        Stack<Character> pila=new Stack<>();
        char ap,cie;
        for(int i=0;i<s.length();i++){
            if(s.charAt(i)!=' '){
                cie=s.charAt(i);
                if(cie==('(') || cie==('[') || cie==('{')){
                    pila.push(cie);
                }else {
                    if(pila.isEmpty()){
                        return false;
                    }
                    ap=pila.pop();
                    if(!qcoinciden(ap,cie)){
                        return false;
                    }
                }
            }
        }
        return pila.isEmpty();
    }
    public static boolean qcoinciden(char ap,char cie){
       return (ap=='(' && cie==')')||(ap=='[' && cie==']')||(ap=='{' && cie=='}');
    }
}
