package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.common.MessageTypes;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;

import javax.swing.*;
import javax.swing.border.EtchedBorder;
import java.awt.*;
import java.util.ArrayList;

/**
 * Moving room is a room that is displayed when waiting for a move
 * response from the server
 *
 * @author talub
 */
public class MovingRoom extends Room implements Runnable {
    /**
     * The constructor calls to super constructor to store the room holder
     * information and then calls init to put together the window.
     *
     * @param holder   The RoomHolder of the room.
     * @param mainApplet The MainApplet
     */
    public MovingRoom(RoomHolder holder, MainApplet mainApplet) {
        super(holder, mainApplet);
        init();
        counter = new Thread(this);
        counter.start();
    }

    /**
     * init makes the window components and lays them out.
     */
    public void init() {
        movePanel = new JPanel();
        moveLayout = new GridBagLayout();
        mainLayout = new GridBagLayout();
        gbc = new GridBagConstraints();
        movePanel.setLayout(moveLayout);
        setLayout(mainLayout);

        title = new JLabel("Moving:");
        title.setFont(AppletConstants.HEADER_FONT);

        statusLabel = new JLabel("Waiting for move response from server...");

        gbc.insets = new Insets(5, 5, 5, 5);

        AppletConstants.buildConstraints(gbc, 1, 0, 1, 1, 1, 1);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.NONE;
        moveLayout.setConstraints(title, gbc);
        movePanel.add(title);

        gbc.anchor = GridBagConstraints.CENTER;

        AppletConstants.buildConstraints(gbc, 1, 1, 1, 1, 1, 1);
        moveLayout.setConstraints(statusLabel, gbc);
        movePanel.add(statusLabel);

        movePanel.setBorder(new EtchedBorder());

        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        mainLayout.setConstraints(movePanel, gbc);
        add(movePanel);
    }

    /**
     * Stops the counter.
     */
    public void stopCounter() {
        counter.interrupt();
    }

    /**
     * Counts for TIME_OUT_MILLIS and then, if the room is still around, times out the move.
     */
    public void run() {
        try {
            Thread.sleep(AppletConstants.TIME_OUT_MILLIS);
        } catch (InterruptedException e) {
            return;
        }

        ArrayList moveData = new ArrayList(1);
        moveData.add("Timed out waiting for move request.");
        mainApplet.move(MessageTypes.FOYER_ROOM, moveData);
    }

    private GridBagLayout mainLayout; //the GridBagLayout used by the main room.
    private GridBagLayout moveLayout; //the GridBagLayout used by the login panel
    private GridBagConstraints gbc;  //and its corresponding constraings

    //components:
    private JLabel statusLabel;
    private JPanel movePanel;
    private JLabel title;
    private Thread counter;
}
