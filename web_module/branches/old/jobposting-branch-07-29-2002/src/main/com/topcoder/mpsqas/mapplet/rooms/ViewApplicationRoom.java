package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.mapplet.components.*;
import com.topcoder.mpsqas.common.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import javax.swing.border.*;

/**
 * A panel through which an admin can view all the information about
 * an application and can accept or reject the application.
 *
 * @author mitalub
 */
public class ViewApplicationRoom extends Room
{
  /**
   * The constructor stores some information and lays out the room.
   *
   * @param roomHolder The applet's roomHolder.
   * @param mainApplet The applet's mainApplet.
   * @param info       An ApplicationInformation containing all the information about the application.
   */
  public ViewApplicationRoom(RoomHolder roomHolder,MainApplet mainApplet,ApplicationInformation info)
  {
    super(roomHolder,mainApplet);

    this.info=info;

    layout=new GridBagLayout();
    gbc=new GridBagConstraints();
    setLayout(layout);

    titleLabel=new JLabel(info.getApplicationType());
    titleLabel.setFont(AppletConstants.HEADER_FONT);
    gbc.anchor=gbc.WEST;
    gbc.insets=new Insets(5,5,5,5);
    AppletConstants.buildConstraints(gbc,0,0,2,1,0,1);
    layout.setConstraints(titleLabel,gbc);
    add(titleLabel);

    handleLabel=new JLabel("Handle:");
    handleLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,1,1,1,1,1);
    layout.setConstraints(handleLabel,gbc);
    add(handleLabel);

    ratingLabel=new JLabel("Rating:");
    ratingLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,2,1,1,0,1);
    layout.setConstraints(ratingLabel,gbc);
    add(ratingLabel);

    eventsLabel=new JLabel("Events:");
    eventsLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,3,1,1,0,1);
    layout.setConstraints(eventsLabel,gbc);
    add(eventsLabel);

    nameLabel=new JLabel("Name:");
    nameLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,4,1,1,0,1);
    layout.setConstraints(nameLabel,gbc);
    add(nameLabel);

    emailLabel=new JLabel("Email:");
    emailLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,5,1,1,0,1);
    layout.setConstraints(emailLabel,gbc);
    add(emailLabel);

    messageLabel=new JLabel("Message:");
    messageLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,6,1,1,0,1);
    layout.setConstraints(messageLabel,gbc);
    add(messageLabel);

    handleField=new JTextField(20);
    handleField.setEditable(false);
    handleField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,1,1,1,1,100,0);
    layout.setConstraints(handleField,gbc);
    add(handleField);

    ratingField=new JTextField(10);
    ratingField.setEditable(false);
    ratingField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,1,2,1,1,0,0);
    layout.setConstraints(ratingField,gbc);
    add(ratingField);

    eventsField=new JTextField(10);
    eventsField.setEditable(false);
    eventsField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,1,3,1,1,0,0);
    layout.setConstraints(eventsField,gbc);
    add(eventsField);

    nameField=new JTextField(30);
    nameField.setEditable(false);
    nameField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,1,4,1,1,0,0);
    layout.setConstraints(nameField,gbc);
    add(nameField);

    emailField=new JTextField(30);
    emailField.setEditable(false);
    emailField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,1,5,1,1,0,0);
    layout.setConstraints(emailField,gbc);
    add(emailField);

    messageArea=new JTextArea();
    messageArea.setEditable(false);
    messageArea.setFont(AppletConstants.FIXED_WIDTH_FONT);
    messageArea.setLineWrap(true);
    messageArea.setWrapStyleWord(true);
    messagePane=new JScrollPane(messageArea,JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    gbc.fill=gbc.BOTH;
    AppletConstants.buildConstraints(gbc,0,7,2,1,0,100);
    layout.setConstraints(messagePane,gbc);
    messagePane.setBorder(new BevelBorder(BevelBorder.LOWERED));
    add(messagePane);

    replyLabel=new JLabel("Reply:");
    replyLabel.setFont(AppletConstants.HEADER_FONT);
    AppletConstants.buildConstraints(gbc,0,8,1,1,0,1);
    layout.setConstraints(replyLabel,gbc);
    add(replyLabel);

    acceptCheck=new JCheckBox("Accept");
    acceptCheck.setFont(AppletConstants.NORMAL_FONT);
    acceptCheck.setSelected(true);
    gbc.fill=gbc.NONE;
    gbc.anchor=gbc.EAST;
    AppletConstants.buildConstraints(gbc,1,8,1,1,0,0);
    layout.setConstraints(acceptCheck,gbc);
    add(acceptCheck);

    replyArea=new JTextArea();
    replyArea.setFont(AppletConstants.FIXED_WIDTH_FONT);
    replyArea.setLineWrap(true);
    replyArea.setWrapStyleWord(true);
    replyPane=new JScrollPane(replyArea,JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    gbc.fill=gbc.BOTH;
    AppletConstants.buildConstraints(gbc,0,9,2,1,0,100);
    layout.setConstraints(replyPane,gbc);
    replyPane.setBorder(new BevelBorder(BevelBorder.LOWERED));
    add(replyPane);

    submitButton=new JButton("Submit");
    gbc.fill=gbc.NONE;
    gbc.anchor=gbc.CENTER;
    AppletConstants.buildConstraints(gbc,0,10,2,1,0,1);
    layout.setConstraints(submitButton,gbc);
    add(submitButton);

    mainApplet.getStatusBox().appendMessage("Reply to the application.", false);
   
    handleField.setText(info.getHandle());
    ratingField.setText(""+info.getRating());
    eventsField.setText(""+info.getEvents());
    nameField.setText(info.getName());
    emailField.setText(info.getEmail());
    messageArea.setText(info.getMessage());
    messageArea.setCaretPosition(0);

    submitButton.addActionListener(new AppletActionListener("submitReply",this));
  }

  /**
   * Puts together a submit application reply request and sends the application to the server.
   *
   * @param e The event of clicking the submit button.
   */
  public void submitReply(ActionEvent e)
  {
    ArrayList request=new ArrayList();
    request.add(new Integer(MessageTypes.APPLICATION_REPLY_RQ));
    request.add(new Boolean(acceptCheck.isSelected()));
    request.add(replyArea.getText());
    updateStatus("Sending reply to server.",false);
    mainApplet.sendToServer(request);
  }

  private ApplicationInformation info;
  private GridBagLayout layout;
  private GridBagConstraints gbc;
  private JLabel titleLabel;
  private JLabel handleLabel;
  private JLabel ratingLabel;
  private JLabel eventsLabel;
  private JLabel nameLabel;
  private JLabel emailLabel;
  private JLabel messageLabel;
  private JLabel replyLabel;
  private JTextField handleField;
  private JTextField ratingField;
  private JTextField eventsField;
  private JTextField nameField;
  private JTextField emailField;
  private JTextArea messageArea;
  private JScrollPane messagePane;
  private JTextArea replyArea;
  private JScrollPane replyPane;
  private JCheckBox acceptCheck;
  private JButton submitButton;
}
