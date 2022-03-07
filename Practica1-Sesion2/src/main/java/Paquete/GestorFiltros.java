
package Paquete;

/**
 *
 * @author luisg
 */
public class GestorFiltros {
    
    CadenaFiltros filtros;
    ObjetoSalpicadero salpicadero;
    
    public void crearCadenaFiltros( ObjetoSalpicadero salpi){
        filtros = new CadenaFiltros();
        añadirFiltros();
        salpicadero = salpi;
    };
    private void añadirFiltros(){
        filtros.añadirCalcularVelocidad();
        filtros.añadirRepercutirRozamiento();
    };
    public void peticionFiltros(double revoluciones, EstadoMotor estadoMotor){
        revoluciones = filtros.aplicarFiltros(revoluciones,estadoMotor);
        salpicadero.ejecutar(revoluciones, estadoMotor);
    };
}
