package com.topcoder.mpsqas.mapplet.rooms;

import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.table.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.widgets.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.mapplet.components.*;

/**
 * A room through which admins can view which members deserve 
 * payment, and to check members who have been paid, and other
 * user information.
 *
 * @author mitalub
 */
public class MainUserRoom extends Room
{
  /**
   * Contructor stores data and sets up window.
   *
   * @param roomHolder The applet's room holder.
   * @param mainApplet The applet's main applet.
   * @param data List of UserInformation for all users.
   */
  public MainUserRoom(RoomHolder roomHolder, MainApplet mainApplet, ArrayList data)
  {
    super(roomHolder, mainApplet);
    this.data = data;

    layout = new GridBagLayout();
    gbc = new GridBagConstraints();
    setLayout(layout);    

    title = new JLabel("Users (" + data.size() + "):");
    title.setFont(AppletConstants.HEADER_FONT);
    AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
    gbc.insets = new Insets(5, 5, 5, 5);
    gbc.anchor = GridBagConstraints.WEST;
    layout.setConstraints(title, gbc);
    add(title);

    Object[][] tableData = new Object[data.size()][(5)];
    UserInformation userInfo;
    int i, j;
    for(i = 0; i<data.size(); i++)
    {
      userInfo = (UserInformation)data.get(i);
      tableData[i][0] = userInfo.getHandle();
      tableData[i][1] = userInfo.getFirstName() + " " + userInfo.getLastName();
      tableData[i][2] = new Double(userInfo.getPaid());
      tableData[i][3] = new Double(userInfo.getPendingPayment());
      tableData[i][4] = new Boolean(false);
    }

    dataT = new SortableTable(AppletConstants.MAIN_USER_COLS,
                              tableData,
                              AppletConstants.MAIN_USER_COLS_WIDTHS,
                              AppletConstants.MAIN_USER_COLS_EDIT);

    dataSP = new JScrollPane(dataT,
                             JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                             JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    AppletConstants.buildConstraints(gbc, 0, 1, 1, 1, 0, 100);
    gbc.fill = GridBagConstraints.BOTH;
    layout.setConstraints(dataSP, gbc);
    add(dataSP);

    buttonBox = Box.createHorizontalBox();
    userInfoButton = new JButton("Details");
    payButton = new JButton("Pay");
    buttonBox.add(userInfoButton);
    buttonBox.add(Box.createHorizontalStrut(5));
    buttonBox.add(payButton);

    gbc.fill = GridBagConstraints.NONE;
    gbc.anchor = GridBagConstraints.EAST;
    AppletConstants.buildConstraints(gbc, 0, 2, 1, 1, 0, 1);
    layout.setConstraints(buttonBox, gbc);
    add(buttonBox);

    payButton.addActionListener(new AppletActionListener("pay", this));
    userInfoButton.addActionListener(new AppletActionListener("getUserInfoButton", this));
    dataT.addMouseListener(new AppletMouseListener("getUserInfoMouse", this, "mouseClicked"));

  }

  /**
   * Puts together a SUBMIT_PAYMENT_RQ request to send to the server and sends it given the information
   * in the table and what is currently checked.
   *
   * @params e The ActionEvent corresponding to the button being clicked.
   */
  public void pay(ActionEvent e)
  {
    ArrayList request = new ArrayList(3);
    request.add(new Integer(MessageTypes.SUBMIT_PAYMENT_RQ));

    //get list of paid people
    ArrayList paid = new ArrayList();
    for(int i=0; i<data.size(); i++)
    {
      if (((Boolean)dataT.getAbsoluteValueAt(i, 4)).booleanValue())
      {
        // coder_id to paid
        paid.add(new Integer(((UserInformation)data.get(i)).getUserId()));
      }
    }
    request.add(paid);
    mainApplet.sendToServer(request);
    updateStatus("Sending payment request to server.", false);
  }

  /**
   * Calls getUserInfo when the "Details" button is clicked.
   */
  public void getUserInfoButton(ActionEvent e)
  {
    getUserInfo();
  }

  /**
   * Calls getUserInfo when the table is double clicked.
   */
  public void getUserInfoMouse(MouseEvent e)
  {
    if (e.getClickCount() == 2 && SwingUtilities.isLeftMouseButton(e))
    {
      getUserInfo();
    } 
  }

  /**
   * Puts together a GET_USER_INFO_RQ request for the currently selected user and sends it to the server. 
   */
  private void getUserInfo()
  {
    if (dataT.getSelectedRow() >= 0)
    {
      ArrayList request = new ArrayList(3);
      request.add(new Integer(MessageTypes.MOVE_RQ));
      request.add(new Integer(MessageTypes.VIEW_USER_ROOM));
      request.add(new Integer(((UserInformation)data.get(dataT.getSelectedRow())).getUserId()));
      mainApplet.loadMovingRoom();
      mainApplet.sendToServer(request);
    }
  }

  private GridBagConstraints gbc;
  private GridBagLayout layout;

  private JLabel title;
  private SortableTable dataT;
  private JScrollPane dataSP;
  private JButton payButton;
  private JButton userInfoButton;
  private Box buttonBox;

  private ArrayList data;
}
