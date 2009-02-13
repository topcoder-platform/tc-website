package com.topcoder.mpsqas.applet.components;

/*
 * ChatPanel
 *
 * The ChatPanel is a Panel supporting live chat.  It contains a list of users and a
 * chat area.
 *
 * @author mitalub
 */

import com.topcoder.mpsqas.applet.*;
import com.topcoder.mpsqas.applet.rooms.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.applet.listener.*;
import com.topcoder.mpsqas.applet.messaging.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import java.util.*;

public class ChatPanel extends RoomComponent
{
  /*
   * The constructor sets up the ChatPannel, and initializes everything to empty.
   *
   * @params holder   The RoomHolder for the applet
   * @params sc       The Applet's server connection
   */
  /////////////////////////////////////////////////////////////////////////////////////
  public ChatPanel(RoomHolder holder,ServerConnection sc)
  /////////////////////////////////////////////////////////////////////////////////////
  {
    super(holder);
    serverConnection=sc;

    layout=new GridBagLayout();
    gbc=new GridBagConstraints();
    setLayout(layout);

    title=new JLabel("Chat");
    title.setFont(AppletConstants.HEADER_FONT);
      gbc.anchor=GridBagConstraints.WEST;
      gbc.gridx=0;
      gbc.gridy=0;
      gbc.gridwidth=2;
      gbc.gridheight=1;
      layout.setConstraints(title,gbc);
    add(title);

    gbc.insets=new Insets(getHeight()/200,getWidth()/200,getHeight()/200,getWidth()/200);

    chatText=new JEditorPane();
    chatPane=new JScrollPane(chatText); 
    chatPane.setPreferredSize(new Dimension((int)(getWidth()/1.33),getHeight()/3));
    chatPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
      gbc.anchor=GridBagConstraints.CENTER;
      gbc.fill=GridBagConstraints.BOTH;
      gbc.gridx=0;
      gbc.gridy=1;
      gbc.gridwidth=2;
      gbc.gridheight=1;
      layout.setConstraints(chatPane,gbc);
    add(chatPane);

    userMessage=new JTextField();
    userMessage.addActionListener(new AppletActionListener("chat",this));
      userMessage.setPreferredSize(new Dimension((int)(getWidth()/1.33),0));
      gbc.gridy=2;
      gbc.gridwidth=1;
      layout.setConstraints(userMessage,gbc);
    add(userMessage);

    sendButton=new JButton("Send");
    sendButton.addActionListener(new AppletActionListener("chat",this));
      gbc.gridx=1;
      layout.setConstraints(sendButton,gbc);
    add(sendButton);

    userList=new UserList(getRoomHolder());


//    gbc.gridx=0;
//    gbc.gridy=1;
//    gbc.gridwidth=1;
//    gbc.gridheight=2;
//    layout.setConstraints(userList,gbc);
//    add(userList);


//    gbc.gridy=2;
//    gbc.gridwidth=1;
//    layout.setConstraints(userMessage,gbc);
//    add(userMessage);

//    gbc.gridx=2;
//    layout.setConstraints(sendButton,gbc);
//    add(sendButton);
  }

  /*
   * chat is called when the user hits the send button or presses enter.   
   * Then it sends a chat request to the server.
   *
   * @params e   The ActionEvent resulting in this method being called
   */
  /////////////////////////////////////////////////////////////////////////////////////
  public void chat(ActionEvent e)
  /////////////////////////////////////////////////////////////////////////////////////
  {
    ArrayList toServer=new ArrayList();
    toServer.add(new Integer(MessageTypes.CHAT_RQ));
    toServer.add(userMessage.getText());
    serverConnection.sendObject(toServer);
    userMessage.setText("");
  }

  /*
   * addChat appends message to the chat window, and if there is too much chat on the screen
   * the top line is removed.
   *
   * @params message   The message to append
   */
  /////////////////////////////////////////////////////////////////////////////////////
  public void addChat(String message)
  /////////////////////////////////////////////////////////////////////////////////////
  {
    String text=chatText.getText();
    text=text+message;
    chatText.setText(text);
    chatText.setCaretPosition(text.length()-1);
  }

  private JLabel title;
  private JEditorPane chatText;
  private JScrollPane chatPane;
  private JTextField userMessage;
  private JButton sendButton;
  private UserList userList;

  private GridBagLayout layout;
  private GridBagConstraints gbc;

  private ServerConnection serverConnection; 
}
