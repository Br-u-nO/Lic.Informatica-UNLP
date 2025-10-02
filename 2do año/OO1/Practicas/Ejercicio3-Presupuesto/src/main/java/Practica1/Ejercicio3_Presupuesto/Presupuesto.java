package Practica1.Ejercicio3_Presupuesto;

import java.time.LocalDate;
import java.util.List;
import java.util.LinkedList;
import java.util.Iterator;

public class Presupuesto {

	private String cliente;
	private LocalDate fecha;
	private List<Item> total;
	
	
	
	public Presupuesto(String cliente) {
		this.cliente = cliente;
		this.fecha =  LocalDate.now();
		this.total = new LinkedList<Item>();
	}
	
	public String getCliente() {
		return cliente;
	}
	public LocalDate getFecha() {
		return fecha;
	}
	private void setCliente(String cliente) {
		this.cliente = cliente;
	}
	private void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	
	public void agregarItem(Item obj){
		total.add(obj);
	}
	
	public double calcularTotal() {
		double tot = 0;
		Iterator<Item> it = total.iterator();
		while(it.hasNext()) {
			tot += it.next().costo();
		}
		return tot;
	}
}
