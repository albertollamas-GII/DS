/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Paquete;

/**
 *
 * @author luisg
 */
public class CadenaFiltros {
    
    FiltroCalcularVelocidad filtroVelocidad;
    FiltroRepercutirRozamiento filtroRozamiento;
    
    public void añadirCalcularVelocidad(){
        filtroVelocidad = new FiltroCalcularVelocidad();
    };
    
    public void añadirRepercutirRozamiento(){
        filtroRozamiento = new FiltroRepercutirRozamiento();
    };
    
    public double aplicarFiltros(double revoluciones, EstadoMotor estadoMotor){
        revoluciones = filtroVelocidad.ejecutar(revoluciones, estadoMotor);
        revoluciones = filtroRozamiento.ejecutar(revoluciones, estadoMotor);
        return revoluciones;
    };
}
