package tp1.ejercicio7;


import java.util.*;

public class Ejercicio7 {

    public static void main(String[] args) {
        int n;
        List<Integer> lista = new ArrayList<>();
        for (int i=0;i<=5;i++){
            lista.add((i+1)*3);
        }
        
        for (int i=0;i<=5;i++){
            System.out.print(lista.get(i)+ " ");
        }
        System.out.println();
        
        
        System.out.println(lista.toString());
        
        
        Iterator<Integer> iterador = lista.iterator();
        while (iterador.hasNext()) {
        System.out.print(iterador.next()+" ");
        }
        System.out.println();
        
        
        lista.forEach((i) -> {
            System.out.print(i+" ");
        });
        System.out.println();
        
        
        System.out.println("_______________________________");
        
        
        List<Integer> lista2=new LinkedList<>();
        for (int i=0;i<=5;i++){
            lista2.add((i+1)*5);
        }
        for (int i=0;i<=5;i++){
            System.out.print(lista2.get(i)+" ");
        }
        System.out.println();
        
        
        System.out.println("_______________________________");
        
        List<Estudiante> estudiantes=new ArrayList<>();
        List<Estudiante> estudiantesCopia=new LinkedList<>();
        
        estudiantes.add(new Estudiante("Bruno","Bauly","noimporta@gmail.com",4,4323));
        estudiantes.add(new Estudiante("Gonzalo","Mollo","noimporta@gmail.com",7,3214));
        estudiantes.add(new Estudiante("Romina","Tittarelli","noimporta@gmail.com",4,2341));
        
        estudiantesCopia=estudiantes;
      
        System.out.println("Primer lista");
        imprimir(estudiantes,0);
        System.out.println("Segunda lista");
        imprimir(estudiantesCopia,0);
        
        Estudiante e=estudiantes.get(0);
        e=new Estudiante(e.getNombre(),"Gonzales",e.getEmail(),e.getComision(),e.getDireccion());
        estudiantes.remove(0);
        estudiantes.add(0,e);
        
        System.out.println("Primer lista cambiada");
        imprimir(estudiantes,0);
        System.out.println("Segunda lista");
        imprimir(estudiantesCopia,0);
        
        System.out.println("_______________________________");
        System.out.println();
        
        
        e=new Estudiante("Flor","Mendoza","noimporta@gmail.com",3,2133);
        for(int i=0;i<4;i++){
            if(!estudiantes.contains(e)){
                estudiantes.add(e);
        }
        }
        
        
        System.out.println("Punto e");
        imprimir(estudiantes,0);
    }
    
    public static void imprimir(List<Estudiante>lista,int index){
        if (index<lista.size()){
            Estudiante e=lista.get(index);
            System.out.println(e.toString());
            imprimir(lista,index+1);
        }
        
        
    }
}
