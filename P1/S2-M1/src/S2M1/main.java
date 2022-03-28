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
public class main {

    /**
     * @param args the command line arguments
     * @throws java.lang.InterruptedException
     */
    public static void main(String[] args) throws InterruptedException {
        // TODO code application logic here
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();
        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        
        Random rand = new Random();
        int numBicicletas = rand.nextInt(30)+15;
        System.out.println("Las carreras tienen un total de " + numBicicletas + " participantes.");
        
        Cliente cliente1 = new Cliente(factoriaCarretera, numBicicletas);
        Cliente cliente2 = new Cliente(factoriaMontana, numBicicletas);
        
        cliente1.start();
        cliente2.start();
        
        try{
            cliente1.getCarrera().join();
            cliente2.getCarrera().join();
        } catch (InterruptedException e){
            e.printStackTrace();
        }
        
        
    }
    
}
