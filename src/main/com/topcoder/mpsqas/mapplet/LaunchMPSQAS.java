package com.topcoder.mpsqas.mapplet;


import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

/**
 * LaunchMPSQAS is the applet which will be displayed on the web page from which the
 * user can launch the MPSQAS applet window.
 *
 * @author mitalub
 *
 */
public class LaunchMPSQAS extends JApplet {

    /**
     * init initializes the applet by creating the lauch button and adding
     * it to the main container.
     *
     */
    public void init() {
        c = new ArrayList();
        launchButton = new JButton("Launch MPSQAS");
        launchButton.setFont(AppletConstants.NORMAL_FONT);
        launchButton.addActionListener(new AppletActionListener("launchButtonAction", this));
        getContentPane().add(launchButton, BorderLayout.CENTER);
    }

    /**
     * launchButtonApplet is called by the AppletActionListener when the button
     * is pressed. This method creates the MainApplet and, if there is an error
     * connecting to the server an error message is displayed.
     *
     * @param e   The event causing this method to be invoked
     */
    public void launchButtonAction(ActionEvent e) {
        try {
            mainApplet = new MainApplet(getParameter("HOST"), Integer.parseInt(getParameter("PORT")), this);
            launchButton.setEnabled(false);
        } catch (Exception exc) {
            System.out.println("Error launching MPSQAS applet.");
            exc.printStackTrace();
        }
    }

    /**
     * reActivate is called by the applet when its closing so the button
     * will be activated again
     */
    public void reActivate() {
        mainApplet = null;
        launchButton.setEnabled(true);
    }

    private JButton launchButton;  //the button to click
    private MainApplet mainApplet;  //the main mpsqas applet
    private ArrayList c;
}
