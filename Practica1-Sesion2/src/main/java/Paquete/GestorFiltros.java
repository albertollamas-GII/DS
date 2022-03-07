/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Paquete;

/**
 *
 * @author luisg
 */
public class GestorFiltros {
    
    Filtro filtros [];
    ObjetoSalpicadero salpicadero;
    
    public void crearCadenaFiltros(){
        
    };
    public void añadirFiltro(Filtro f){};
    public void peticionFiltros(double revoluciones, EstadoMotor estadoMotor){
        for(int i = 0; i<filtros.length; i++){
            revoluciones = filtros[i].ejecutar(revoluciones, estadoMotor);
        }
        salpicadero.ejecutar(revoluciones, estadoMotor);
    };
}
