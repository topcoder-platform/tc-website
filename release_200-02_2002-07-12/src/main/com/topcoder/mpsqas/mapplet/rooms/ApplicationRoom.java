package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.common.MessageTypes;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;

import javax.swing.*;
import javax.swing.border.BevelBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

/**
 * A panel through which a user can fill out an application to be a problem developed or
 * an admin can approve / disprove of a memebers application.
 *
 * @author mitalub
 */
public class ApplicationRoom extends Room {
    /**
     * The constructor stores some information and lays out the room.
     *
     * @param roomHolder The applet's roomHolder.
     * @param mainApplet The applet's mainApplet.
     * @param title  The title of the application (so the user can see the application type.
     */
    public ApplicationRoom(RoomHolder roomHolder, MainApplet mainApplet, String title) {
        super(roomHolder, mainApplet);

        this.title = title;

        layout = new GridBagLayout();
        gbc = new GridBagConstraints();
        setLayout(layout);

        titleLabel = new JLabel(title);
        titleLabel.setFont(AppletConstants.HEADER_FONT);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        layout.setConstraints(titleLabel, gbc);
        add(titleLabel);

        messageLabel = new JLabel("Enter any comments you have about your application:");
        messageLabel.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 0, 1, 1, 1, 0, 1);
        layout.setConstraints(messageLabel, gbc);
        add(messageLabel);

        messageArea = new JTextArea();
        messageArea.setFont(AppletConstants.FIXED_WIDTH_FONT);
        messageArea.setLineWrap(true);
        messageArea.setWrapStyleWord(true);
        messagePane = new JScrollPane(messageArea, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        gbc.fill = GridBagConstraints.BOTH;
        AppletConstants.buildConstraints(gbc, 0, 2, 1, 1, 0, 100);
        layout.setConstraints(messagePane, gbc);
        messagePane.setBorder(new BevelBorder(BevelBorder.LOWERED));
        add(messagePane);

        submitButton = new JButton("Submit Application");
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.CENTER;
        AppletConstants.buildConstraints(gbc, 0, 3, 1, 1, 0, 1);
        layout.setConstraints(submitButton, gbc);
        add(submitButton);

        mainApplet.getStatusBox().appendMessage(
                "Please fill the requested information and submit your application.",
                false);

        submitButton.addActionListener(new AppletActionListener("submitApplication", this));
    }

    /**
     * Puts together a submit application request and sends the application to the server.
     *
     * @param e The event of clicking the submit button.
     */
    public void submitApplication(ActionEvent e) {
        ArrayList request = new ArrayList();
        request.add(new Integer(MessageTypes.SUBMIT_APPLICATION_RQ));
        request.add(messageArea.getText());
        updateStatus("Sending application to server...", false);
        mainApplet.sendToServer(request);
    }

    private String title;

    private GridBagLayout layout;
    private GridBagConstraints gbc;
    private JLabel titleLabel;
    private JLabel messageLabel;
    private JTextArea messageArea;
    private JScrollPane messagePane;
    private JButton submitButton;
}
