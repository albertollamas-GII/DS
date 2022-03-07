
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
        salpicadero = salpi;
    };
    public void añadirFiltro(Filtro f){
        filtros.añadirCalcularVelocidad();
        filtros.añadirRepercutirRozamiento();
    };
    public void peticionFiltros(double revoluciones, EstadoMotor estadoMotor){
        revoluciones = filtros.aplicarFiltros(revoluciones,estadoMotor);
        salpicadero.ejecutar(revoluciones, estadoMotor);
    };
}
