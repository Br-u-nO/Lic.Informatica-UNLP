package Practica1.BalanzaElectrica;

import java.time.LocalDate;
import java.util.List;

public class Ticket {
	
	private LocalDate fecha;
	private int cantidadDeProductos; 
	private List<Producto> productos;
	private double pesoTotal;
	private double precioTotal;
	
	
	public Ticket(LocalDate fecha, int cantidadDeProductos, double pesoTotal, double precioTotal,List<Producto> productos) {
		this.fecha = fecha;
		this.cantidadDeProductos = cantidadDeProductos;
		this.pesoTotal = pesoTotal;
		this.precioTotal = precioTotal;
		this.productos = productos;
	}



	public double impuesto() {
		return this.precioTotal * 0.21;
	}



	public LocalDate getFecha() {
		return fecha;
	}



	public int getCantidadDeProductos() {
		return cantidadDeProductos;
	}



	public double getPesoTotal() {
		return pesoTotal;
	}



	public double getPrecioTotal() {
		return precioTotal;
	}



	private void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}



	private void setCantidadDeProductos(int cantidadDeProductos) {
		this.cantidadDeProductos = cantidadDeProductos;
	}



	private void setPesoTotal(double pesoTotal) {
		this.pesoTotal = pesoTotal;
	}



	private void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}
	
	
	public List<Producto> getProductos(){
		return this.productos;
	}
	
}
