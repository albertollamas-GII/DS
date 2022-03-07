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
    
    private Filtro filtros[];
    
    public void añadirCalcularVelocidad(){
        filtros[filtros.length] = new FiltroCalcularVelocidad();
    };
    
    public void añadirRepercutirRozamiento(){
        filtros[filtros.length] = new FiltroRepercutirRozamiento();
    };
    
    public double aplicarFiltros(double revoluciones, EstadoMotor estadoMotor){
        for(int i = 0; i<filtros.length; i++){
            filtros[i].ejecutar(revoluciones, estadoMotor);
        }
        return revoluciones;
    };
}
