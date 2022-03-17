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
public class CarreraCarretera extends Carrera{
    
    CarreraCarretera(int numBicicletas){
        super(numBicicletas, TipoCarrera.CARRETERA);
    }
    
    @Override
    public void run() {
        
            try {
                
                Random random = new Random();
                
                System.out.println("Comienza la carrera de CARRETERA!");
                int retirados = (int) (this.numBicicletas * 0.1);
                int ciclistaAleatorio;
                
                for (int i = 0; i < retirados; i++){ 
                    int aleatorio = random.nextInt(3);
                    
                    switch (aleatorio){
                        case 0 -> {
                            //Tiron
                            ciclistaAleatorio = random.nextInt(this.bicicletas.size());
                            System.out.println("Se retira el ciclista " + ciclistaAleatorio + " porque le ha dado un tirón.");
                            this.bicicletas.remove(ciclistaAleatorio);
                            this.sleep(2000);
                        }
                        case 1 -> {
                            //Cansancio
                            ciclistaAleatorio = random.nextInt(this.bicicletas.size());
                            System.out.println("Se retira el ciclista " + ciclistaAleatorio + " porque se ha cansado.");
                            this.bicicletas.remove(ciclistaAleatorio);
                            this.sleep(1000);
                        }
                            
                        case 2 -> {
                            //Roto bicicleta
                            ciclistaAleatorio = random.nextInt(this.bicicletas.size());
                            System.out.println("Se retira el ciclista " + ciclistaAleatorio + " porque se le ha roto la bicicleta.");
                            this.bicicletas.remove(ciclistaAleatorio);
                            this.sleep(3000);
                        }
                    }                 
                }
                
                for (int i = 0; i < this.bicicletas.size(); i++){
                    System.out.println("El ciclista " + this.bicicletas.get(i).getNumeroBicicleta() + " ha acabado la carrera de CARRETERA.");
                }
                
                System.out.println("Se ha acabado la carrera de CARRETERA!!");
            } catch (InterruptedException ex) {
                    Logger.getLogger(CarreraMontana.class.getName()).log(Level.SEVERE, null, ex);
            }

    }
}
