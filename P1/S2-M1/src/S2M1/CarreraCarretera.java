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
 * @author Alberto Llamas
 * @author Óscar López
 */
public class CarreraCarretera extends Carrera{
    
    CarreraCarretera(int numBicicletas){
        super(numBicicletas, TipoCarrera.CARRETERA);
    }
    
    @Override
    @SuppressWarnings("empty-statement")
    public void run() {
            
            this.comienzaCarrera(TipoCarrera.CARRETERA, 0.1);
            for (int i = 0; i < this.bicicletas.size(); i++){
                System.out.println("El ciclista " + this.bicicletas.get(i).getNumeroBicicleta() + " ha acabado la carrera de CARRETERA.");
            }               
            System.out.println("Se ha acabado la carrera de CARRETERA!!");

    }
}
