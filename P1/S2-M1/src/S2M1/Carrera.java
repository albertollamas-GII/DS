/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author albertollamasgonzalez
 */
public abstract class Carrera extends Thread implements Runnable {
    
    protected ArrayList<Bicicleta> bicicletas;
    protected TipoCarrera tipo;
    protected int numBicicletas;
    
    
    Carrera(int numBicicletas, TipoCarrera tipo){
        this.tipo = tipo;
        this.bicicletas = new ArrayList<>();
        this.numBicicletas = numBicicletas;
    }
    
    TipoCarrera getTipo(){
        return this.tipo;
    }
    
    public void addBicicleta(Bicicleta bici){
        this.bicicletas.add(bici);
    }
    
    @Override
    public abstract void run();
    
        
    public synchronized void comienzaCarrera(TipoCarrera tipo, double porcentajeRetirados){
        try {
                String indent = "";
                if (tipo == TipoCarrera.MONTANA)
                    indent = "\t";
                    
                Random random = new Random();
                
                System.out.println(indent + "Comienza la carrera de " + tipo.toString() + " !");
                int retirados = (int) (this.numBicicletas * porcentajeRetirados);
                int ciclistaAleatorio;
                
                for (int i = 0; i < retirados; i++){ 
                    int aleatorio = random.nextInt(3);
                    
                    switch (aleatorio){
                        case 0 -> {
                            //Tiron
                            ciclistaAleatorio = random.nextInt(this.bicicletas.size());
                            System.out.println(indent + "Se retira el ciclista " + ciclistaAleatorio + " porque le ha dado un tirón.");
                            this.bicicletas.remove(ciclistaAleatorio);
                            this.sleep(2000);
                        }
                        case 1 -> {
                            //Cansancio
                            ciclistaAleatorio = random.nextInt(this.bicicletas.size());
                            System.out.println(indent + "Se retira el ciclista " + ciclistaAleatorio + " porque se ha cansado.");
                            this.bicicletas.remove(ciclistaAleatorio);
                            this.sleep(1000);
                        }
                            
                        case 2 -> {
                            //Roto bicicleta
                            ciclistaAleatorio = random.nextInt(this.bicicletas.size());
                            System.out.println(indent + "Se retira el ciclista " + ciclistaAleatorio + " porque se le ha roto la bicicleta.");
                            this.bicicletas.remove(ciclistaAleatorio);
                            this.sleep(3000);
                        }
                    }                 
                }
                
                    
        } catch (InterruptedException ex) {
                    Logger.getLogger(CarreraMontana.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
}
