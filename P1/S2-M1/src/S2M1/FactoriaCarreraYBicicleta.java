/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

/**
 *
 * @author Alberto Llamas
 * @author Óscar López
 */
public interface FactoriaCarreraYBicicleta {
    abstract Carrera crearCarrera(int numCarrera);
    abstract Bicicleta crearBicicleta(int id);
}
