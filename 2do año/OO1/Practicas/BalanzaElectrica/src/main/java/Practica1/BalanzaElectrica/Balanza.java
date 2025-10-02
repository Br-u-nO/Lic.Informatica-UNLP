package Practica1.BalanzaElectrica;

import java.time.LocalDate;
import java.util.List;
import java.util.LinkedList;
import java.util.Iterator;

public class Balanza {
	private Integer cantidadDeProductos;
	private List<Producto> productos;
	
	
	public Balanza() {
		super();
		this.cantidadDeProductos = 0;
		this.productos = new LinkedList<Producto>();
	}
	
	public Balanza(Integer cantidadDeProductos, Double precioTotal, Double pesoTotal) {
		super();
		this.cantidadDeProductos = cantidadDeProductos;
		this.productos = new LinkedList<Producto>();
	}



	public void ponerEnCero() {
		this.cantidadDeProductos = 0;
		this.productos = new LinkedList<Producto>();
	}
	
	public void agregarProducto(Producto prod) {
		this.cantidadDeProductos ++;
		this.productos.add(prod);

	}

	public Ticket emitirTicket() {
		LocalDate date = LocalDate.now();
		return new Ticket(date,this.cantidadDeProductos,this.getPesoTotal(),this.getPrecioTotal(),this.productos);
	}



	public Integer getCantidadDeProductos() {
		return cantidadDeProductos;
	}



	public Double getPrecioTotal() {
		double precioTotal = 0;
		Iterator<Producto> it = productos.iterator();
		while(it.hasNext()) {
			precioTotal += it.next().getPrecio();
		}
		return precioTotal;
	}



	public Double getPesoTotal() {
		double pesoTotal = 0;
		Iterator<Producto> it = productos.iterator();
		while(it.hasNext()) {
			pesoTotal += it.next().getPeso();
		}
		return pesoTotal;
	}



	private void setCantidadDeProductos(Integer cantidadDeProductos) {
		this.cantidadDeProductos = cantidadDeProductos;
	}

	public List<Producto> getProductos(){
		return this.productos;
	}
	
}
