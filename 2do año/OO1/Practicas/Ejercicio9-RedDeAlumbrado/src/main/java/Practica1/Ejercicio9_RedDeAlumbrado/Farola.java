package Practica1.Ejercicio9_RedDeAlumbrado;

import java.util.List;
import java.util.LinkedList;
import java.util.Iterator;

public class Farola {
	
	private boolean prendida;
	private List<Farola> vecinas;
	
	
	
	public boolean isPrendida() {
		return prendida;
	}

	public List<Farola> getVecinas() {
		return vecinas;
	}

	public void setPrendida(boolean prendida) {
		this.prendida = prendida;
	}

	public void setVecinas(List<Farola> vecinas) {
		this.vecinas = vecinas;
	}

	/*
	* Crear una farola. Debe inicializarla como apagada
	*/
	public Farola () {
		prendida = false;
		vecinas = new LinkedList<>();
	}

	/*
	* Crea la relación de vecinos entre las farolas. La relación de vecinos entre las farolas es recíproca, es decir el receptor del mensaje será vecino de otraFarola, al igual que otraFarola también se convertirá en vecina del receptor del mensaje
	*/
	public void pairWithNeighbor(Farola otraFarola ) {
		if(!vecinas.contains(otraFarola)) {
			vecinas.add(otraFarola);
			otraFarola.pairWithNeighbor(this);
		}
	}

	/*
	* Retorna sus farolas vecinas
	*/
	public List<Farola> getNeighbors (){
		return vecinas;
	}


	/*
	* Si la farola no está encendida, la enciende y propaga la acción.
	*/
	public void turnOn() {
	    if (!prendida) {
	        prendida = true;
	        for (Farola vecina : vecinas) {
	            vecina.turnOn();
	        }
	    }
	}


	/*
	* Si la farola no está apagada, la apaga y propaga la acción.
	*/
	public void turnOff() {
	    if (prendida) {
	        prendida = false;
	        for (Farola vecina : vecinas) {
	            vecina.turnOff();
	        }
	    }
	}


	/*
	* Retorna true si la farola está encendida.
	*/
	public boolean isOn() {
		return prendida;
	}

	/*
	* Retorna true si la farola está apagada.
	*/
	public boolean isOff() {
		return !prendida;
	}

	
}
