package com.topcoder.mpsqas.mapplet.components;

import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;
import com.topcoder.mpsqas.mapplet.rooms.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.widgets.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import java.util.*;
import com.topcoder.mpsqas.common.*;

/**
 * The CorrespondencePanel is a panel through which users can read or compose correspondence
 * about a particular problem.
 *
 * @author mitalub
 */
public class CorrespondencePanel extends JPanel
{
  /**
   * The constructor stores some information, sets up the layout, and
   * then calls init to do it up.
   *
   * @param parentRoom The ViewProblemRoom containing this panel
   * @param messages An ArrayList of Correspondence representing the messages to be shown
   */
  public CorrespondencePanel(ViewProblemRoom parentRoom,ArrayList messages)
  {
    this.messages=messages;
    this.parentRoom=parentRoom;
    composingMessage=false;
    layout=new GridBagLayout();
    gbc=new GridBagConstraints();
    setLayout(layout);
    init();
  }

  /**
   * init() creates all the components and puts the on the screen.  It also sets up
   * the listeners.
   */
  public void init()
  {
    JPanel panel1=new JPanel();
    JPanel panel2=new JPanel();
    GridBagLayout layout1=new GridBagLayout();
    GridBagLayout layout2=new GridBagLayout();
    panel1.setLayout(layout1);
    panel2.setLayout(layout2);
  
    correspondenceTitle=new JLabel("Correspondence:");
    correspondenceTitle.setFont(AppletConstants.HEADER_FONT);
    gbc.insets=new Insets(5,5,5,5);
    gbc.fill=GridBagConstraints.NONE;
    gbc.anchor=GridBagConstraints.WEST;
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,1);
    layout1.setConstraints(correspondenceTitle,gbc);
    panel1.add(correspondenceTitle);

    composeMessageButton=new JButton("Compose Message");
    sendMessageButton=new JButton("Send Message");
    correspondenceButtonBox=Box.createHorizontalBox();
    correspondenceButtonBox.add(composeMessageButton);
    correspondenceButtonBox.add(Box.createHorizontalStrut(5));
    correspondenceButtonBox.add(sendMessageButton);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,0,1,1,0,1);
    layout2.setConstraints(correspondenceButtonBox,gbc);
    panel2.add(correspondenceButtonBox);

    correspondenceTable = new SortableTable(AppletConstants.CORRESPONDENCE_COLS,
                                            getCorrespondenceTable(),
                                            AppletConstants.CORRESPONDENCE_COLS_WIDTHS);
    correspondenceTableScrollPane=new JScrollPane(correspondenceTable,
                                        JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                        JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,1,1,1,0,100);
    layout1.setConstraints(correspondenceTableScrollPane,gbc);
    panel1.add(correspondenceTableScrollPane);

    correspondenceMessage=new JTextArea();
    correspondenceMessage.setFont(AppletConstants.FIXED_WIDTH_FONT);
    correspondenceMessage.setLineWrap(true);
    correspondenceMessage.setWrapStyleWord(true);
    correspondenceMessage.setEditable(false);
    correspondenceMessageScrollPane=new JScrollPane(correspondenceMessage,
                                                  JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                                  JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,1,1,1,1,100);
    layout2.setConstraints(correspondenceMessageScrollPane,gbc);
    panel2.add(correspondenceMessageScrollPane);

    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,0,1,1,30,1);
    layout.setConstraints(panel1,gbc);
    panel1.setPreferredSize(new Dimension(300,10000));
    add(panel1);

    AppletConstants.buildConstraints(gbc,1,0,1,1,100,1);
    layout.setConstraints(panel2,gbc);
    add(panel2);

    correspondenceTable.getSelectionModel().addListSelectionListener(new AppletListListener("messageSelected",this));
    sendMessageButton.setEnabled(false);
    composeMessageButton.addActionListener(new AppletActionListener("composeMessage",this));
    sendMessageButton.addActionListener(new AppletActionListener("sendMessage",this));
  }

  /**
   * messageSelected is called when a message in the correspondence table is selected.  It updates the message
   * view area to add the message.
   *
   * @param e  The mouse clicking event
   */
  public void messageSelected(ListSelectionEvent e)
  {
    composingMessage=false;
    int index=correspondenceTable.getSelectedRow();
    if(index<0||index>=messages.size())
    {
      correspondenceMessage.setText("");
    }
    else
    {
      correspondenceMessage.setText(((Correspondence)messages.get(index)).getMessage());
      correspondenceMessage.setCaretPosition(0);
    }
    sendMessageButton.setEnabled(false);
    correspondenceMessage.setEditable(false);
  }

  /**
   * composeMessage turns the view correspondence frame into a compose correspondence frame.
   *
   * @param e The button click calling this method to be called.
   */
  public void composeMessage(ActionEvent e)
  {
    correspondenceMessage.setText("");
    correspondenceMessage.setEditable(true);
    correspondenceTable.getSelectionModel().clearSelection();
    composingMessage=true;
    sendMessageButton.setEnabled(true);
    correspondenceMessage.setEditable(true);
    correspondenceMessage.grabFocus();
  }

  /**
   * sendMessage sends a correspondence message to the server.
   *
   * @param e The event causing the Send Message button to be clicked.
   */
  public void sendMessage(ActionEvent e)
  {
    if(!composingMessage)return;
    Correspondence message=new Correspondence();
    message.setMessage(correspondenceMessage.getText());
    parentRoom.sendMessage(message);
  }

  /**
   * Adds a correspondence message to the list.
   *
   * @param message Correspondence to add.
   */
  public void addCorrespondence(Correspondence message)
  {
    messages.add(message);
    correspondenceTable.setData(getCorrespondenceTable());
  }

  /**
   * Puts the correspondence messages into an Object[][] to add to the table model.
   */
  private Object[][] getCorrespondenceTable()
  {
    Object[][] tableData=new Object[messages.size()][2];
    int i;
    for(i=0;i<messages.size();i++)
    {
      tableData[i][0]=((Correspondence)messages.get(i)).getDate();
      tableData[i][1]=((Correspondence)messages.get(i)).getSender();
    }
    return tableData;
  }

  private ArrayList messages;
  private ViewProblemRoom parentRoom;

  private GridBagLayout layout;
  private GridBagConstraints gbc;

  private JLabel correspondenceTitle;
  private SortableTable correspondenceTable;
  private JScrollPane correspondenceTableScrollPane;
  private JTextArea correspondenceMessage;
  private JScrollPane correspondenceMessageScrollPane;
  private JButton composeMessageButton;
  private JButton sendMessageButton;
  private Box correspondenceButtonBox;

  private boolean composingMessage;
}
