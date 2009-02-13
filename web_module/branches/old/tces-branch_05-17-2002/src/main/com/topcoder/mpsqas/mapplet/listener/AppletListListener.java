package com.topcoder.mpsqas.mapplet.listener;

import java.awt.event.*;
import java.lang.reflect.*;
import javax.swing.event.*;
/**
 * AppletListListener implements ListListener and calls a method in a
 * class when an list selection action is performed.
 *
 * @author mitalub
 */
public class AppletListListener implements ListSelectionListener
{
  /**
   *  Constructor - sets up the AppletListListener by 
   *  storing information on the name of the method / class to call when the action is
   *  performed.
   *
   *  @param parentMethod   Method in parent to call when the action is performed.
   *  @param parent         The Object in which to call the method when the action is performed. 
   */
  public AppletListListener(String parentMethod, Object parent)
  {
    super();
    this.parentMethod = parentMethod;
    this.parent = parent;
  }

  /**
   *  valueChanged invokes the method in the parent when the action is performed.
   *
   *  @param e              The action performed.
   */
  public void valueChanged(ListSelectionEvent e)
  {
    try
    {
      Class [] parameterTypes={ListSelectionEvent.class};
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
