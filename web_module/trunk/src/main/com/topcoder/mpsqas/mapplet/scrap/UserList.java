package com.topcoder.mpsqas.applet.components;

/*
 * UserList
 *
 * This class represents a panel containing a current list of users.
 *
 * @author mitalub
 */

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.topcoder.mpsqas.applet.*;
import com.topcoder.mpsqas.applet.rooms.*;

public class UserList extends RoomComponent
{
  /*
   * The constructor sets up the UserList, initializing everything
   * to empty.
   *
   * @params holder    The RoomHolder for the applet
   */
  /////////////////////////////////////////////////////////////////////////////
  public UserList(RoomHolder holder)
  /////////////////////////////////////////////////////////////////////////////
  {
    super(holder);

    Object[] columnNames={"Active Users"};
    list=new JTable(new Object[0][1],columnNames);
    add(list,BorderLayout.CENTER);
  }
  private JTable list;
}

