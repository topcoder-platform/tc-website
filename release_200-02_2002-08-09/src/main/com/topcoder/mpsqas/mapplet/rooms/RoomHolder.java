package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.common.MessageTypes;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.components.StatusBox;
import com.topcoder.mpsqas.mapplet.components.UserMenu;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.mapplet.messaging.ServerConnection;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;

/**
 * RoomHolder
 *
 * This class holds any room the user is in and handles the
 * room's messaging.
 *
 * @author mitalub
 */
public class RoomHolder extends JFrame {
    /**
     * The Constructor creates get some environment info, creates the frame and gets the
     * current system look and feel.
     *
     * @param title      The title of the window
     * @param sc         The applet processor's ServerConnection
     * @param ma         The MainApplet
     * @param sb         The applet's status box
     */
    public RoomHolder(String title, ServerConnection sc, MainApplet ma, StatusBox sb) {
        serverConnection = sc;
        mainApplet = ma;
        statusBox = sb;
        Toolkit winInfo = getToolkit();
        winSize = winInfo.getScreenSize();
        splitHasResized = false;

        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
        }

        mainRoom = null;

        setTitle(title);
        setBounds(0, 0, 800, 600);

        splitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT);
        splitPane.setBorder(null);
        topPanel = new JPanel();
        bottomPanel = new JPanel();

        splitPane.setTopComponent(topPanel);
        splitPane.setBottomComponent(bottomPanel);

        getContentPane().setLayout(new BorderLayout());
        topPanel.setLayout(new BorderLayout());
        bottomPanel.setLayout(new BorderLayout());
        bottomPanel.add(statusBox, BorderLayout.CENTER);


        //create menu and toolbar
        menu = null;

        backButton = new JButton("Back");
        reloadButton = new JButton("Reload");
        forwardButton = new JButton("Forward");

        toolBar = new JMenuBar();
        GridBagLayout toolBarLayout = new GridBagLayout();
        GridBagConstraints gbc = new GridBagConstraints();
        toolBar.setLayout(toolBarLayout);

        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.WEST;

        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        toolBarLayout.setConstraints(backButton, gbc);
        toolBar.add(backButton);

        AppletConstants.buildConstraints(gbc, 1, 0, 1, 1, 1, 0);
        toolBarLayout.setConstraints(reloadButton, gbc);
        toolBar.add(reloadButton);

        AppletConstants.buildConstraints(gbc, 2, 0, 1, 1, 1, 0);
        toolBarLayout.setConstraints(forwardButton, gbc);
        toolBar.add(forwardButton);

        JPanel spacer = new JPanel();
        AppletConstants.buildConstraints(gbc, 3, 0, 1, 1, 100, 0);
        toolBarLayout.setConstraints(spacer, gbc);
        toolBar.add(spacer);

        //add listeners to buttons
        backButton.addActionListener(new AppletActionListener(
                "goBack", this));
        reloadButton.addActionListener(new AppletActionListener(
                "reload", this));
        forwardButton.addActionListener(new AppletActionListener(
                "goForward", this));

        //make the pop up window for the status, but keep it hidden
        statusPopUp = new JFrame();
        statusPopUp.setBounds(winSize.width - 300, 0, 300, 300);
        statusPopUp.getContentPane().setLayout(new BorderLayout());
        statusPopUp.setTitle("Status Messages");
        statusPopUp.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
        popUpListener1 =
                new AppletWindowListener("windowClosed", "statusPopUpClosing", this);
        popUpListener2 =
                new AppletWindowListener("windowClosing", "statusPopUpClosing", this);
        statusPopUp.addWindowListener(popUpListener1);
        statusPopUp.addWindowListener(popUpListener2);

        statusPopUp.setVisible(false);

        statusPoppedUp = false;
        statusBox.addMouseListenerToAll(
                new AppletMouseListener("statusBoxClicked", this, "mouseClicked"));

        setVisible(true);
    }

    /**
     * setRoom puts a room into the RoomHolder, replacing any previous room
     * that may have been there.
     *
     * @param room  Room to set as main room
     * @param withExtras If true, status box and menu shown
     */
    public void setRoom(Room room, boolean withExtras) {
        this.withExtras = withExtras;
        getContentPane().removeAll();

        if (mainRoom != null) {
            topPanel.remove(mainRoom);
        }

        mainRoom = room;

        topPanel.add(mainRoom, BorderLayout.CENTER);

        if (withExtras) {
            if (menu == null) {
                menu = new UserMenu(mainApplet);
            }
            setJMenuBar(menu);
            getContentPane().add(toolBar, BorderLayout.NORTH);
            if (statusPoppedUp) {
                mainComponent = mainRoom;
            } else {
                mainComponent = splitPane;
            }
        } else {
            setJMenuBar(null);
            mainComponent = mainRoom;
        }


        getContentPane().add(mainComponent, BorderLayout.CENTER);

        setVisible(true);
        if (!splitHasResized && withExtras) {
            splitHasResized = true;
            splitPane.setDividerLocation(.87);
        }

        room.giveFocus();
    }

    /**
     * updateView repaints the screen.
     */
    public void updateView() {
        setVisible(true);
    }

    /**
     * getWinSize returns the computer's window size.
     */
    public Dimension getWinSize() {
        return winSize;
    }

    /**
     * Puts together and sends a RELATIVE_MOVE_RQ for going
     * back.
     *
     * @param e The action of clicking the back button.
     */
    public void goBack(ActionEvent e) {
        ArrayList request = new ArrayList(2);
        request.add(new Integer(MessageTypes.RELATIVE_MOVE_RQ));
        request.add(new Integer(-1));
        mainApplet.loadMovingRoom();
        mainApplet.sendToServer(request);
    }

    /**
     * Puts together and sends a RELATIVE_MOVE_RQ for going
     * reload.
     *
     * @param e The action of clicking the back button.
     */
    public void reload(ActionEvent e) {
        ArrayList request = new ArrayList(2);
        request.add(new Integer(MessageTypes.RELATIVE_MOVE_RQ));
        request.add(new Integer(0));
        mainApplet.loadMovingRoom();
        mainApplet.sendToServer(request);
    }

    /**
     * Puts together and sends a RELATIVE_MOVE_RQ for going
     * forward.
     *
     * @param e The action of clicking the forward button.
     */
    public void goForward(ActionEvent e) {
        ArrayList request = new ArrayList(2);
        request.add(new Integer(MessageTypes.RELATIVE_MOVE_RQ));
        request.add(new Integer(1));
        mainApplet.loadMovingRoom();
        mainApplet.sendToServer(request);
    }

    /**
     * When the status box is double clicked, it switches locations.
     */
    public void statusBoxClicked(MouseEvent e) {
        if (e.getClickCount() == 2 && SwingUtilities.isLeftMouseButton(e)) {
            reverseStatusWindow();
        }
    }

    /**
     * When the status box pop up is closed, this causes the status box
     * to be displayed as the bottom of a split pane.
     */
    public void statusPopUpClosing(WindowEvent e) {
        reverseStatusWindow();
    }

    /**
     * Swaps the location of the status box from pop up to split pane
     * bottom.
     */
    private void reverseStatusWindow() {
        statusPoppedUp = !statusPoppedUp;
        if (statusPoppedUp) {
            splitPane.remove(statusBox);
            statusPopUp.getContentPane().add(statusBox, BorderLayout.CENTER);
            statusPopUp.setVisible(true);
        } else {
            statusPopUp.getContentPane().remove(statusBox);
            bottomPanel.add(statusBox, BorderLayout.CENTER);
            statusPopUp.setVisible(false);
        }
        setRoom(mainRoom, this.withExtras);
        statusBox.scrollDown();
    }

    /**
     * Kills itself and anything stemming from it.
     */
    public void kill() {
        statusPopUp.removeWindowListener(popUpListener1);
        statusPopUp.removeWindowListener(popUpListener2);
        statusPopUp.setVisible(false);
        mainRoom.kill();
    }

    private Dimension winSize;

    private UserMenu menu;

    private JMenuBar toolBar;
    private JButton backButton;
    private JButton reloadButton;
    private JButton forwardButton;

    private JSplitPane splitPane;
    private JPanel topPanel;
    private JPanel bottomPanel;

    private StatusBox statusBox;
    private JFrame statusPopUp; //the pop up for the status
    private boolean splitHasResized;  //has the split pane been resized yet
    private boolean statusPoppedUp;  //if status box is in a pop up or split pane
    private AppletWindowListener popUpListener1;
    private AppletWindowListener popUpListener2;

    private Component mainComponent;  //the current main component
    private Room mainRoom;  //the current room
    private boolean withExtras;  //if currently a menu / toolbar / status box is displayed

    private ServerConnection serverConnection;  //the applet's ServerConnection
    private MainApplet mainApplet;  //the MainApplet
}
