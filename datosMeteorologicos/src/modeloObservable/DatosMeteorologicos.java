/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloObservable;

/**
 *
 * @author albertollamasgonzalez
 */
public class DatosMeteorologicos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ObservableClima temperatura = new ObservableClima();
        
        //Observador 1
        
        //Observador 2 (no siscrito comunicacion pull)
        ObserverPantallaTemperatura pantalla = new ObserverPantallaTemperatura(temperatura);
        temperatura.start();
        pantalla.start();

    }
    
}
