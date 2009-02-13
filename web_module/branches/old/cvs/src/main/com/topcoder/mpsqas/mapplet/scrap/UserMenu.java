package com.topcoder.mpsqas.applet.components;

/* 
 * UserMenu represents the normal menu a user sees.  It keeps track of the 
 * listener on the menu items, etc.
 *
 * @author mitalub
 */

import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;
import com.topcoder.mpsqas.applet.*;
import java.util.*;

public class UserMenu extends JMenuBar
{
  /*
   * The constructor stores information about the menu and calls
   * init to actually build the menu.
   *
   * @params data   An ArrayList of menu items and data.
   */
  //////////////////////////////////////////////////////////////////////////////////
  public UserMenu(ArrayList data)
  //////////////////////////////////////////////////////////////////////////////////
  {
    menuInfo=data;
    int numMenus=0;
    init();
  }

  /*
   * init builds and puts together the menu.
   */
  //////////////////////////////////////////////////////////////////////////////////
  public void init()
  //////////////////////////////////////////////////////////////////////////////////
  {
    JMenu tempMenu;
    JMenuItem tempMenuItem;

    tempMenu=new JMenu("Main");
    tempMenuItem=new JMenuItem("Exit");
    tempMenu.add(tempMenuItem);
    add(tempMenu);
    numMenus++; 
  }

  private int numMenus;
  private ArrayList menuInfo;
}
