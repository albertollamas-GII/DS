/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

/**
 *
 * @author Alberto Llamas
 * @author Óscar López
 */
public class FactoriaMontana implements FactoriaCarreraYBicicleta {
            
        @Override
        public CarreraMontana crearCarrera(int numCarrera){
            return new CarreraMontana(numCarrera);
        }
        
        @Override
        public BicicletaMontana crearBicicleta(int id){
            return new BicicletaMontana(id);
        }
}
