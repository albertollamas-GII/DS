/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloObservable;
import java.util.Observable;
import java.util.Random;

/**
 *
 * @author Jose Jiménez
 * @author Alberto Llamas
 */
public class ObservableClima extends Observable implements Runnable {
    private float temperatura;
    private Thread miHilo;
    private static Random rdn = new Random();
    
    public ObservableClima(){
        this.temperatura = (rdn.nextFloat() * 100) % 39;
        this.miHilo = new Thread("THREAD1");
    }
    
    public float getTemperatura(){
        return temperatura;
    }
    
    public void setTemperatura(float temp){
        this.temperatura = temp;
        this.setChanged();  //Antes del notifyObservers hay que dejar constancia del cambio
        this.notifyObservers(this.temperatura); // Comunicación push con observadores suscritos
        System.out.println(this.temperatura);
    }
    
    public void start(){
        miHilo = new Thread(this);
        miHilo.start();
    }
    
    @Override
    public void run() {
        while (true) {
            try {
                miHilo.sleep(3000);
                this.setTemperatura((rdn.nextFloat() * 100) % 39);
            } catch (InterruptedException ex) {
                System.err.println(ex.getMessage());
            }
        }
    }
    
}
