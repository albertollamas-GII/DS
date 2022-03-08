
package Paquete;

/**
 *
 * @author luisg
 */
public class GestorFiltros {
    
    CadenaFiltros filtros;
    
    public void crearCadenaFiltros( ObjetoSalpicadero salpi){
        filtros = new CadenaFiltros(salpi);
        añadirFiltros();
       
    };
    private void añadirFiltros(){
        filtros.añadirCalcularVelocidad();
        filtros.añadirRepercutirRozamiento();
    };
    public double peticionFiltros(double revoluciones, EstadoMotor estadoMotor){
        return filtros.aplicarFiltros(revoluciones,estadoMotor);
    };
}
