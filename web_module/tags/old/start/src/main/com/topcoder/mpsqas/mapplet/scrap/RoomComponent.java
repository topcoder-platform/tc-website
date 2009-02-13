package com.topcoder.mpsqas.applet.components;

/*
 * RoomComponent
 *
 * A generic component for all compenents to extend containing 
 * methods to retreive information useful to all components.
 */

import java.awt.*;
import javax.swing.*;
import com.topcoder.mpsqas.applet.*;
import com.topcoder.mpsqas.applet.rooms.*;

public class RoomComponent extends JPanel
{
  /*
   * The constructor stores the information about the component.
   *
   * @params holder   The room holder containing this component.
   */
  /////////////////////////////////////////////////////////
  public RoomComponent(RoomHolder holder)
  /////////////////////////////////////////////////////////
  {
    roomHolder=holder;
  }

  /*
   * getWidth returns the width of the window
   */
  /////////////////////////////////////////////////////////
  public int getWidth()
  /////////////////////////////////////////////////////////
  {
    return roomHolder.getWindowSize().width;
  }

  /*
   * getHeight returns the height of the window
   */
  /////////////////////////////////////////////////////////
  public int getHeight()
  /////////////////////////////////////////////////////////
  {
    return roomHolder.getWindowSize().height;
  }

  /*
   * getRoomHolder returns the applet's RoomHolder
   */
  /////////////////////////////////////////////////////////
  public RoomHolder getRoomHolder()
  /////////////////////////////////////////////////////////
  {
    return roomHolder;
  }

  private RoomHolder roomHolder;
}
