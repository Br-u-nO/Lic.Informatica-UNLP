package Practica1;

import java.util.Random;

public class Ejercicio3 {
	public static void main(String[]args) {
		  Random rand=new Random();
          String [] vec={"Jose","Felipe","Gonzalo","Romina","Bruno"};
          String [] vec1={"Gonzales","Mendoza","Hernandez","Lavie","Bauly"};
          Estudiante [] vecE=new Estudiante[2];
          Profesor [] vecP=new Profesor[3];
          
          for(int j=0;j<=1;j++) {
          vecE[j]=new Estudiante(vec[rand.nextInt(5)],vec1[rand.nextInt(5)],"NoImporta@gmail.com",rand.nextInt(15)+1,rand.nextInt(15));
          System.out.println(vecE[j].toString());
         }
          
          for(int j=0;j<=2;j++) {
              vecP[j]=new Profesor(vec[rand.nextInt(5)],vec1[rand.nextInt(5)],"NoImporta@gmail.com",rand.nextInt(15)+1,"Informatica");
              System.out.println(vecP[j].toString());
             }
	}
}
