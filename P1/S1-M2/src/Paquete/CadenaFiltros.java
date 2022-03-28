/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Paquete;

/**
 *
 * @author Luis Guerra
 * @author Óscar López
 */
public class CadenaFiltros {
    
    private Filtro filtros[];
    private int n_filtros;
    private ObjetoSalpicadero salpicadero;

    public CadenaFiltros(ObjetoSalpicadero salpi) {
    
        filtros = new Filtro[2];
        n_filtros = 0;
        salpicadero = salpi;
    }
    
    
    
    public void añadirCalcularVelocidad(){
        filtros[n_filtros++] = new FiltroCalcularVelocidad();
    };
    
    public void añadirRepercutirRozamiento(){
        filtros[n_filtros++] = new FiltroRepercutirRozamiento();
    };
    
    public double aplicarFiltros(double revoluciones, EstadoMotor estadoMotor){
        for(int i = 0; i<n_filtros; i++){
            revoluciones = filtros[i].ejecutar(revoluciones, estadoMotor);
        }
        System.out.println("salen : " + revoluciones);
        salpicadero.ejecutar(revoluciones, estadoMotor);
        return revoluciones;
    };
}
