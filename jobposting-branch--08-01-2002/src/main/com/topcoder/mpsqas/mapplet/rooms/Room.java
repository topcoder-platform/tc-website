package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.mapplet.MainApplet;

import javax.swing.*;

/**
 * Room
 *
 * A Room class for all other rooms to extend.
 *
 * @author mitalub
 */
public class Room extends JPanel {
    /**
     * The constructor stores information about the room.
     *
     * @param holder     The room's RoomHolder
     * @param maina      The applet's mainHolder
     */
    public Room(RoomHolder holder, MainApplet maina) {
        roomHolder = holder;
        mainApplet = maina;
    }

    /**
     * Rooms can override if there are any special focus issues.
     */
    public void giveFocus() {
    }

    /**
     * Rooms can override if there are any special kill issues.
     */
    public void kill() {
    }

    /**
     * Appends a message to the status box.
     *
     * @param message The message to append.
     * @param urgent  true if the message is urgent.
     */
    public void updateStatus(String message, boolean urgent) {
        mainApplet.getStatusBox().appendMessage(message, urgent);
    }

    protected RoomHolder roomHolder;  //the holder of the room
    protected MainApplet mainApplet;  //the main applet
}
