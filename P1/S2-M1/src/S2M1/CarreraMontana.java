/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author albertollamasgonzalez
 */
public class CarreraMontana extends Carrera{

    CarreraMontana(int numBicicletas){
        super(numBicicletas, TipoCarrera.MONTANA);
    }
    
    @Override
    public void run() {
            this.comienzaCarrera(TipoCarrera.MONTANA, 0.2);
            for (int i = 0; i < this.bicicletas.size(); i++){
                        System.out.println("\tEl ciclista " + this.bicicletas.get(i).getNumeroBicicleta() + " ha acabado la carrera de MONTANA.");
            }
              
                
                System.out.println("\tSe ha acabado la carrera de MONTANA!!");
    }
    
}
