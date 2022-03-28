/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

import java.util.Random;

/**
 *
 * @author Alberto Llamas
 * @author Óscar López
 */
public class Cliente {
    private Carrera carrera;
    
    Cliente(FactoriaCarreraYBicicleta factoria, int numBicicletas) {

        this.carrera = factoria.crearCarrera(numBicicletas);
        
        for(int i=0; i<numBicicletas; i++) {
            this.carrera.addBicicleta(factoria.crearBicicleta(i));
        }
        
    }
    public Carrera getCarrera(){
        return carrera;
    }
    void start() {      
        carrera.start();
    }
}
