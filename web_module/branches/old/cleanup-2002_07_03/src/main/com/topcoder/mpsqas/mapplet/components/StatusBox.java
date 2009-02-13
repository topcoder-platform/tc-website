package com.topcoder.mpsqas.mapplet.components;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.event.*;
import javax.swing.border.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.rooms.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import java.util.*;

/**
 * A Panel containing a scrollable text area for status messages.
 *
 * @author mitalub
 */
public class StatusBox extends JPanel
{
  /**
   * The constructor creates the components and lays them out.
   * 
   * @param mainApplet The Main Applet.
   */
  public StatusBox(MainApplet mainApplet)
  {
    this.mainApplet = mainApplet;
    text = new StringBuffer(1024);

    layout = new GridBagLayout();
    gbc = new GridBagConstraints();

    setLayout(layout);

    textArea = new JEditorPane("text/html", "<HTML></HTML>");
    textArea.setEditable(false);
    textArea.setFont(AppletConstants.NORMAL_FONT);
    scrollPane = new JScrollPane(textArea,
                                 JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                 JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);

    gbc.insets = new Insets(5, 5, 5, 5);
    gbc.fill = GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
    layout.setConstraints(scrollPane, gbc);
    add(scrollPane);
    scrollPane.setBorder(new BevelBorder(BevelBorder.LOWERED));
  }

  /**
   * Adds a specified mouse listener to all components.
   */
  public void addMouseListenerToAll(AppletMouseListener mouseListener)
  {
    addMouseListener(mouseListener);
    scrollPane.addMouseListener(mouseListener);
    textArea.addMouseListener(mouseListener);
  }

  /**
   * Adds another message to the status window.
   *
   * @param message Status message to add.
   * @param urgent If urgent, status message displayed bold.
   */
  public void appendMessage(String message, boolean urgent)
  {
    for(int i = 0; i < message.length(); i++)
    {
      if(message.charAt(i) == '\n')
      {
        message = message.substring(0, i) + "<BR>" + message.substring(i+1);
      }
    }

    if(text.length() > AppletConstants.MAX_STRING_LENGTH)
    {
      int removeTo = text.toString().indexOf("<HR>", 
                        text.length() - AppletConstants.MAX_STRING_LENGTH);
      if(removeTo > 0)
      {
        text.delete(0, removeTo);
      }
    }

    if(text.length() > 0)
    {
      text.append("<HR>");
    }
    if(urgent)
    {
      text.append("<B>");
    }
    text.append("<FONT SIZE = ");
    text.append(AppletConstants.HTML_FONT_SIZE);
    text.append(" FACE = \"");
    text.append(AppletConstants.HTML_FONT_STRING);
    text.append("\">");
    text.append(message);
    text.append("</FONT>");
    if(urgent)
    {
      text.append("</B>");
    }
    textArea.setText("<HTML>" + text.toString() + "</HTML>");
    scrollDown();

  }

  /**
   * Sets the caret position of the text area to the very end so the
   * last line is displayed.
   */
  public void scrollDown()
  {
    //XXX: Puts the caret at the last character to scroll down.
    //     Can't do setCaretPosition(message.length()-1) because
    //     not all characters are displayed.
    int caretPosition = text.length();
    boolean exception = true;
    while(exception)
    { 
      exception = false;
      try
      {
        textArea.setCaretPosition(--caretPosition);
      }
      catch(IllegalArgumentException e)
      {
        exception = true;
      }
    }
  }

  /**
   * When mouse click is a double click, the current status is displayed
   * in a pop up window.
   *
   * @param e The event of clicking the mouse.
   */
  public void mouseClicked(MouseEvent e)
  {
    if (e.getClickCount() == 2 && SwingUtilities.isLeftMouseButton(e))
    {
      mainApplet.popUp(text.toString());
    }
  }

  private MainApplet mainApplet;
  private StringBuffer text;
  private GridBagLayout layout;
  private GridBagConstraints gbc;
  private JScrollPane scrollPane;
  private JEditorPane textArea;
}
