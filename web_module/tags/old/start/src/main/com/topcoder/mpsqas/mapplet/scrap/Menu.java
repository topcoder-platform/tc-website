package com.topcoder.mpsqas.applet.components;

/*
 * Menu
 *
 * This class represents a menu - it holds the menu items and the menu name and menu item listeners.
 *
 * @author mitalub
 */

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.topcoder.mpsqas.applet.messaging.*;

public class Menu
{
  /*
   * The constructor sets up the menu.
   *
   * @params menuName   The name of the menu.
   */
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  public Menu(String menuName)
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  {
    name=menuName;
    items=new ArrayList();
    listeners=new ArrayList();
  }

  /*
   * addMenuItem adds a menu item, seperator, or another menu to the menu.
   *
   * @params item      The menu item, seperator, or other menu.
   * @params listener  The menu item's action listener, or null if there is no listener.
   */
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  public void addMenuItem(Object item,AppletActionListener listener)
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  {
    items.add(item);
    listeners.add(listener);  
  }

  private ArrayList items;
  private Arraylist listeners;
  private String name;
}
