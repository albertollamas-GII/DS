/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Paquete;

/**
 * 
 * @author Luis Guerra
 * @author Óscar López
 */
public class Practica1Sesion2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws InterruptedException {
        // TODO code application logic here
        
        ObjetoSalpicadero salpicadero = new ObjetoSalpicadero();
        
        GestorFiltros gestor = new GestorFiltros();
        
        ClienteMotor motor = new ClienteMotor();
        
        ObjetoSalpicadero.aplicarMotor(motor);
        
        gestor.crearCadenaFiltros(salpicadero);
        
        motor.OfrecerGestor(gestor);
        
        salpicadero.setVisible(true);
        
        motor.run();
        
        
    }
    
}
