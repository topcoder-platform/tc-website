package com.topcoder.mpsqas.mapplet.listener;

import java.awt.event.*;
import java.lang.reflect.*;

/**
 * AppletActionListener implements ActionListener and calls a method in a
 * class when an action is performed.
 *
 * @author Alex Roman & mitalub
 */
public class AppletActionListener implements ActionListener 
{
  /**
   *  Constructor - sets up the AppletActionListener by calling the ActionListener constructor
   *  and storing information on the name of the method / class to call when the action is
   *  performed.
   *
   *  @param parentMethod   Method in parent to call when the action is performed.
   *  @param parent         The Object in which to call the method when the action is performed. 
   */
  public AppletActionListener(String parentMethod, Object parent)
  {
    super();
    this.parentMethod = parentMethod;
    this.parent = parent;
  }

  /**
   *  actionPerformed invokes the method in the parent when the action is performed.
   *
   *  @param e              The action performed.
   */
  public void actionPerformed(ActionEvent e)
  {
    try
    {
      Class [] parameterTypes={ActionEvent.class};
      Object [] parameterValues={e};
      Method method=parent.getClass().getMethod(parentMethod,parameterTypes);
      method.invoke(parent,parameterValues);
    }
    catch(Exception ex)
    {
      System.out.println("Error invokating method when action performed:");
      System.out.println(parent.getClass()+", "+parentMethod);
      ex.printStackTrace();
    }
  }

  private String parentMethod;
  private Object parent;
}
