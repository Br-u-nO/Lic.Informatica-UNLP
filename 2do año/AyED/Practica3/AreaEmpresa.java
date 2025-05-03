/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;


public class AreaEmpresa {
        
        private String Area;
        private int tiempo_mensaje;

    public AreaEmpresa(String Area, int tiempo_mensaje) {
        this.Area = Area;
        this.tiempo_mensaje = tiempo_mensaje;
    }

    public String getArea() {
        return Area;
    }

    private void setArea(String Area) {
        this.Area = Area;
    }

    public int getTiempo_mensaje() {
        return tiempo_mensaje;
    }

    private void setTiempo_mensaje(int tiempo_mensaje) {
        this.tiempo_mensaje = tiempo_mensaje;
    }
        
        
}
