package Practica1.Ejercicio11_CuentaConGanchos;


import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CuentaTest {

    @Test
    public void testDepositoCajaDeAhorro() {
        CajaDeAhorro caja = new CajaDeAhorro();
        caja.depositar(100);
        assertEquals(98, caja.getSaldo(), 0.01);
    }

    @Test
    public void testExtraccionCajaDeAhorroConFondos() {
        CajaDeAhorro caja = new CajaDeAhorro();
        caja.depositar(100);
        caja.extraer(50);
        assertEquals(98 - 50 * 1.02, caja.getSaldo(), 0.01);
    }

    @Test
    public void testTransferenciaCajaDeAhorro() {
        CajaDeAhorro origen = new CajaDeAhorro();
        CuentaCorriente destino = new CuentaCorriente();
        origen.depositar(100);
        origen.transferirACuenta( 50,destino);
        assertEquals(50, destino.getSaldo(), 0.01);
        assertEquals(98 - 50 * 1.02, origen.getSaldo(), 0.01);
    }

    @Test
    public void testCuentaCorrienteDescubierto() {
        CuentaCorriente cc = new CuentaCorriente();
        cc.setDescubierto(100);
        cc.extraer(50);
        assertEquals(-50, cc.getSaldo(), 0.01);
    }

    @Test
    public void testTransferenciaCuentaCorriente() {
        CuentaCorriente origen = new CuentaCorriente();
        origen.setDescubierto(100);
        CajaDeAhorro destino = new CajaDeAhorro();
        origen.transferirACuenta(50,destino);
        assertEquals(-50, origen.getSaldo(), 0.01);
        assertEquals(50 * 0.98, destino.getSaldo(), 0.01);
    }
}
