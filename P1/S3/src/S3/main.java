/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S3;

import Controlador_SCACV.Controlador;
import Modelo_SCACV.Motor;
import Vista_SCACV.Salpicadero;

/**
 *
 * @author Luis Guerra
 * @author Jose Jiménez
 * @author Alberto Llamas
 * @author Óscar López
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Motor motor = new Motor();
        Salpicadero salpicadero = new Salpicadero();
        Controlador controlador = new Controlador(motor);
        salpicadero.setReferencias(controlador);
        motor.setReferencias(controlador, salpicadero);
        salpicadero.setVisible(true);
        motor.run();
    }
    
}
