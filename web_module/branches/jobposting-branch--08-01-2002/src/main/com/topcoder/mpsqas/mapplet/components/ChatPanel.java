package com.topcoder.mpsqas.mapplet.components;

/**
 * The ChatPanel is a Panel supporting live chat.  It contains a list of users and a
 * chat area.
 *
 * @author mitalub
 */

import com.topcoder.mpsqas.common.MessageTypes;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

public class ChatPanel extends JPanel {
    /**
     * The constructor sets up the ChatPannel, and initializes everything to empty.
     *
     * @params mainApplet The MainApplet
     * @param users An ArrayList of currently logged in users (user names)
     */
    public ChatPanel(MainApplet mainApplet, ArrayList users) {
        this.mainApplet = mainApplet;
        this.text = new StringBuffer(256);

        layout = new GridBagLayout();
        gbc = new GridBagConstraints();
        setLayout(layout);

        userList = new UserList(users);
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.fill = GridBagConstraints.BOTH;
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 2, 20, 100);
        layout.setConstraints(userList, gbc);
        userList.setPreferredSize(new Dimension(300, 10000));
        add(userList);

        chatText = new JEditorPane();
        chatPane = new JScrollPane(chatText);
        chatPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        AppletConstants.buildConstraints(gbc, 1, 0, 3, 1, 0, 100);
        layout.setConstraints(chatPane, gbc);
        add(chatPane);

        userMessage = new JTextField();
        userMessage.addActionListener(new AppletActionListener("chat", this));
        gbc.fill = GridBagConstraints.HORIZONTAL;
        AppletConstants.buildConstraints(gbc, 1, 1, 1, 1, 80, 1);
        layout.setConstraints(userMessage, gbc);
        add(userMessage);

        sendButton = new JButton("Send");
        sendButton.addActionListener(new AppletActionListener("chat", this));
        AppletConstants.buildConstraints(gbc, 2, 1, 1, 1, 1, 0);
        layout.setConstraints(sendButton, gbc);
        add(sendButton);

        historyButton = new JButton("History");
        historyButton.addActionListener(new AppletActionListener("history", this));
        AppletConstants.buildConstraints(gbc, 3, 1, 1, 1, 1, 0);
        layout.setConstraints(historyButton, gbc);
        add(historyButton);

    }

    /**
     * chat is called when the user hits the send button or presses enter.
     * Then it sends a chat request to the server.
     *
     * @params e   The ActionEvent resulting in this method being called
     */
    public void chat(ActionEvent e) {
        ArrayList toServer = new ArrayList(2);
        toServer.add(new Integer(MessageTypes.CHAT_RQ));
        toServer.add(userMessage.getText());
        mainApplet.sendToServer(toServer);
        userMessage.setText("");
    }

    /**
     * Appends message to the chat window, and if there is too much chat on the screen
     * the top line is removed.
     *
     * @params message   The message to append
     */
    public void addChat(String message) {
        if (text.length() > AppletConstants.MAX_STRING_LENGTH) {
            int removeTo = text.toString().indexOf('\n',
                    text.length() - AppletConstants.MAX_STRING_LENGTH);
            if (removeTo > 0) {
                text.delete(0, removeTo + 1);
            }
        }

        text.append(message);
        chatText.setText(text.toString());
        chatText.setCaretPosition(text.length() - 1);
    }

    /**
     * Updates the names displayed in the user list.
     *
     * @param users The new list of users.
     */
    public void setUserList(ArrayList users) {
        userList.setUserList(users);
    }

    /**
     * Sends a request to the server for the chat history of the round.
     *
     * @params e The event of clicking the "History" button
     */
    public void history(ActionEvent e) {
        ArrayList toServer = new ArrayList(1);
        toServer.add(new Integer(MessageTypes.CHAT_HISTORY_RQ));
        mainApplet.sendToServer(toServer);
    }

    private JEditorPane chatText;
    private JScrollPane chatPane;
    private JTextField userMessage;
    private JButton sendButton;
    private JButton historyButton;
    private UserList userList;

    private GridBagLayout layout;
    private GridBagConstraints gbc;

    private MainApplet mainApplet;

    private StringBuffer text;
}
