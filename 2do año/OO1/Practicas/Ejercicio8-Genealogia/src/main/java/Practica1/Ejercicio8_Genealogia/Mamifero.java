package Practica1.Ejercicio8_Genealogia;

import java.time.LocalDate;
import java.util.List;
import java.util.LinkedList;
import java.util.Iterator;

public class Mamifero {

	private String identificador;
	private String especie;
	private LocalDate fNacimiento;
	private Mamifero padre;
	private Mamifero madre;
	private Mamifero abueloMaterno;
	private Mamifero abuelaMaterna;
	private Mamifero abueloPaterno;
	private Mamifero abuelaPaterna;
	
	public Mamifero() {
		super();
		this.identificador = "";
	}
	
	public Mamifero(String identificador) {
		super();
		this.identificador = identificador;
	}
	
	public String getIdentificador() {
		return identificador;
	}
	public String getEspecie() {
		return especie;
	}
	public LocalDate getfNacimiento() {
		return fNacimiento;
	}
	public Mamifero getPadre() {
		return padre;
	}
	public Mamifero getMadre() {
		return madre;
	}
	
	public Mamifero getAbueloMaterno() {
		return abueloMaterno;
	}
	
	public Mamifero getAbuelaMaterna() {
		return abuelaMaterna;
	}
	
	public Mamifero getAbueloPaterno() {
		return abueloPaterno;
	}
	
	public Mamifero getAbuelaPaterna() {
		return abuelaPaterna;
	}
	
	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}
	public void setEspecie(String especie) {
		this.especie = especie;
	}
	public void setfNacimiento(LocalDate fNacimiento) {
		this.fNacimiento = fNacimiento;
	}
	public void setPadre(Mamifero padre) {
		this.padre = padre;
	}
	public void setMadre(Mamifero madre) {
		this.madre = madre;
	}
	
	public boolean tieneComoAncestroA(Mamifero a) {
		String q = a.getIdentificador();
		boolean ok = false;
		
		if(q == "") {
			return ok;
		}else {
			
			List<Mamifero> ancestros = new LinkedList<>();
			
			
			ancestros.add(padre);
			ancestros.add(madre);
			ancestros.add(abuelaMaterna);
			ancestros.add(abueloMaterno);
			ancestros.add(abuelaPaterna);
			ancestros.add(abueloPaterno);
			Iterator<Mamifero> it = ancestros.iterator(); 
			
			while(!ok) {
				if(it.hasNext()) {
					Mamifero act = it.next();
					if (act.getIdentificador() == q) {
						ok = true;
					}else {
						ok = tieneComoAncestroA(act);
					}
				}
			}
			return ok;
		}
	}
	
	
}