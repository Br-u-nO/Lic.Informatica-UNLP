package Practica1.Ejercicio11_CuentaConGanchos;

public class CajaDeAhorro extends Cuenta{
	
	
	
	public CajaDeAhorro() {
		super();
	}

	@Override
	public boolean puedeExtraer(double monto) {
		return this.getSaldo() - (monto * 0.02 + monto) > 0;
	}
	
}
