package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.common.MessageTypes;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;

import javax.swing.*;
import javax.swing.border.EtchedBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

/**
 * LoginRoom
 *
 * The LoginRoom represents and handles a room in which the user can log in.
 * The user can enter a name and password, and request Admin status.  This
 * information is sent to the server and the server responds with login
 * information.
 *
 * @author mitalub
 */
public class LoginRoom extends Room {
    /**
     * The constructor calls to super constructor to store the room holder
     * information and then calls init to put together the window.
     *
     * @param holder   The RoomHolder of the room.
     * @param mainApplet  The main applet
     */
    public LoginRoom(RoomHolder holder, MainApplet mainApplet) {
        super(holder, mainApplet);
        init();
    }

    /**
     * init makes the window components and lays them out.
     */
    public void init() {
        loginPanel = new JPanel();
        loginLayout = new GridBagLayout();
        mainLayout = new GridBagLayout();
        gbc = new GridBagConstraints();
        loginPanel.setLayout(loginLayout);
        setLayout(mainLayout);

        title = new JLabel("Login:");
        title.setFont(AppletConstants.HEADER_FONT);

        handleLabel = new JLabel("Handle:");
        handleLabel.setFont(AppletConstants.NORMAL_FONT);

        passwordLabel = new JLabel("Password:");
        passwordLabel.setFont(AppletConstants.NORMAL_FONT);

        statusLabel = new JLabel("  ");
        statusLabel.setFont(AppletConstants.NORMAL_FONT);

        handleField = new JTextField(15);
        passwordField = new JPasswordField();

        loginButton = new JButton("Login");

        gbc.insets = new Insets(5, 5, 5, 5);

        AppletConstants.buildConstraints(gbc, 1, 1, 2, 1, 0, 28);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.NONE;
        loginLayout.setConstraints(title, gbc);
        loginPanel.add(title);

        AppletConstants.buildConstraints(gbc, 1, 2, 1, 1, 40, 0);
        loginLayout.setConstraints(handleLabel, gbc);
        loginPanel.add(handleLabel);

        AppletConstants.buildConstraints(gbc, 2, 2, 1, 1, 60, 18);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        loginLayout.setConstraints(handleField, gbc);
        loginPanel.add(handleField);

        AppletConstants.buildConstraints(gbc, 1, 3, 1, 1, 0, 0);
        loginLayout.setConstraints(passwordLabel, gbc);
        loginPanel.add(passwordLabel);

        AppletConstants.buildConstraints(gbc, 2, 3, 1, 1, 0, 18);
        loginLayout.setConstraints(passwordField, gbc);
        loginPanel.add(passwordField);

        AppletConstants.buildConstraints(gbc, 1, 4, 2, 1, 0, 18);
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.CENTER;
        loginLayout.setConstraints(loginButton, gbc);
        loginPanel.add(loginButton);

        AppletConstants.buildConstraints(gbc, 1, 5, 2, 1, 0, 18);
        loginLayout.setConstraints(statusLabel, gbc);
        loginPanel.add(statusLabel);

        loginPanel.setBorder(new EtchedBorder());

        handleField.addActionListener(new AppletActionListener("login", this));
        passwordField.addActionListener(new AppletActionListener("login", this));
        loginButton.addActionListener(new AppletActionListener("login", this));

        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        mainLayout.setConstraints(loginPanel, gbc);
        add(loginPanel);
    }

    /**
     * login is called when the user presses the login button or hits enter when
     * editing a field.  The buttons and fields are deactivated, and a request
     * is sent to the server to login.
     *
     * @param e  The event of performed
     */
    public void login(ActionEvent e) {
        loginButton.grabFocus();
        loginButton.setEnabled(false);
        handleField.setEditable(false);
        passwordField.setEditable(false);
        statusLabel.setText("Sending handle and password to server...");
        roomHolder.updateView();

        ArrayList loginData = new ArrayList(3);
        loginData.add(new Integer(MessageTypes.LOGIN_RQ));
        loginData.add(handleField.getText());
        loginData.add(new String(passwordField.getPassword()));
        mainApplet.sendToServer(loginData);
    }

    /**
     * makeLoginSuccess is called when a succesful login occurs.  It changes the
     * message about the login status.
     */
    public void makeLoginSuccess() {
        statusLabel.setText("Login successful.  Loading main room...");
        roomHolder.updateView();
    }

    /**
     * makeLoginError is called when an unsuccesful login occurs.  It changes the
     * status message to an error and reenables the button and text fields.
     *
     * @param message   The error message.
     */
    public void makeLoginError(String message) {
        statusLabel.setText(message);
        loginButton.setEnabled(true);
        handleField.setEditable(true);
        passwordField.setEditable(true);
        roomHolder.updateView();
    }

    private GridBagLayout mainLayout; //the GridBagLayout used by the main room.
    private GridBagLayout loginLayout; //the GridBagLayout used by the login panel
    private GridBagConstraints gbc;  //and its corresponding constraings

    //components:
    private JPanel loginPanel;
    private JLabel title;
    private JLabel handleLabel;
    private JTextField handleField;
    private JLabel passwordLabel;
    private JPasswordField passwordField;
    private JButton loginButton;
    private JLabel statusLabel;
}
