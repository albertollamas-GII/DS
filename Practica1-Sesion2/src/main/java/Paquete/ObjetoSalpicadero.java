/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Paquete;

import static java.lang.Math.PI;

/**
 *
 * @author luisg
 */
public class ObjetoSalpicadero extends javax.swing.JFrame {

    private static ClienteMotor motor;
    /**
     * Creates new form FramePrincipal
     */
    public ObjetoSalpicadero() {
        initComponents();
        Freno.setEnabled(false);
        Acelerador.setEnabled(false);
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        EncendidoApagado = new javax.swing.JToggleButton();
        Acelerador = new javax.swing.JToggleButton();
        Freno = new javax.swing.JToggleButton();
        Informacion = new javax.swing.JLabel();
        Velocimetro = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        EncendidoApagado.setText("Encendido");
        EncendidoApagado.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                EncendidoApagadoActionPerformed(evt);
            }
        });

        Acelerador.setText("Acelerador");
        Acelerador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AceleradorActionPerformed(evt);
            }
        });

        Freno.setText("Freno");
        Freno.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                FrenoActionPerformed(evt);
            }
        });

        Informacion.setText("Informacion");

        Velocimetro.setText("KM/H");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(EncendidoApagado, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Acelerador, javax.swing.GroupLayout.PREFERRED_SIZE, 205, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(Informacion, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Freno, javax.swing.GroupLayout.DEFAULT_SIZE, 98, Short.MAX_VALUE)
                    .addComponent(Velocimetro, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(24, 24, 24))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Velocimetro, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Informacion, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(12, 12, 12)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(EncendidoApagado)
                    .addComponent(Acelerador, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Freno))
                .addGap(47, 47, 47))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void EncendidoApagadoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_EncendidoApagadoActionPerformed
        if(EncendidoApagado.isSelected()){
            Acelerador.setEnabled(true);
            Freno.setEnabled(true);
            EncendidoApagado.setText("Apagar");
            Informacion.setText("Encendido");
            motor.estado = EstadoMotor.ENCENDIDO;
        } else{
            if(Acelerador.isSelected()) Acelerador.doClick();
            Acelerador.setEnabled(false);
            if(Freno.isSelected())Freno.doClick();
            Freno.setEnabled(false);
            EncendidoApagado.setText("Encender");
            Informacion.setText("Apagado");
            motor.estado = EstadoMotor.APAGADO;
        }
    }//GEN-LAST:event_EncendidoApagadoActionPerformed

    private void AceleradorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_AceleradorActionPerformed
        // TODO add your handling code here:
        if(Acelerador.isSelected()){
            Acelerador.setText("Soltar acelerador");
            if(Freno.isSelected())Freno.doClick();
            Informacion.setText("Acelerando");
            motor.estado = EstadoMotor.ACELERANDO;
        }else{
            Acelerador.setText("Acelerar");
            Informacion.setText("Encendido");
            motor.estado = EstadoMotor.ENCENDIDO;
        }
    }//GEN-LAST:event_AceleradorActionPerformed

    private void FrenoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_FrenoActionPerformed
        if( Freno.isSelected() ){
            Freno.setText("Soltar freno");
            if(Acelerador.isSelected())Acelerador.doClick();
            Informacion.setText("Frenando");
            motor.estado = EstadoMotor.FRENANDO;
        }else{
            Freno.setText("Frenar");
            Informacion.setText("Encendido");
            motor.estado = EstadoMotor.ENCENDIDO;
            
        }
    }//GEN-LAST:event_FrenoActionPerformed

    public void ejecutar(double revoluciones, EstadoMotor estadoMotor){
        Velocimetro.setText( (2 * PI * 0.15 * revoluciones * (60f/1000f)) + " KM/H");
        //Velocimetro.repaint();
    }
    
    public static void aplicarMotor(ClienteMotor mot){
        motor = mot;
    }
    


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton Acelerador;
    private javax.swing.JToggleButton EncendidoApagado;
    private javax.swing.JToggleButton Freno;
    private javax.swing.JLabel Informacion;
    private javax.swing.JLabel Velocimetro;
    // End of variables declaration//GEN-END:variables
}
