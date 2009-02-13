package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.widgets.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.common.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import java.util.*;
import com.topcoder.mpsqas.mapplet.components.*;

/**
 * FoyerRoom
 *
 * The FoyerRoom is the room visited upon successfully loging in. The room contains
 * a list of problems with new correspondence, and a what's new message.  The 
 * room can also be blank, if the result of an error and the information is not
 * available.
 *
 * @author mitalub
 */
public class FoyerRoom extends Room
{
  /**
   * Sets up a simple, empty verson of the room displaying the status message.
   *
   * @param holder The RoomHolder of the room.
   * @param mainApplet The applet's main applet
   * @param message The status message to put
   */
  public FoyerRoom(RoomHolder holder,MainApplet mainApplet,String message)
  {
    super(holder,mainApplet);
    this.message=message;
    fullRoom = false;

    layout = new GridBagLayout();
    gbc = new GridBagConstraints();

    setLayout(layout); 

    init();
  }

  /**
   * Sets up the full version of the room with a list of new correspondence and
   * what's new box.
   *
   * @param holder The RoomHolder of the room.
   * @param mainApplet The applet's main applet
   * @param message The status message to put
   * @param problems List of ProblemInformation of problems containing unread messages.
   */
  public FoyerRoom(RoomHolder holder, MainApplet mainApplet, String message, 
                   ArrayList problems)
  {
    super(holder,mainApplet);
    this.message=message;
    this.problems=problems;
    fullRoom = true;

    layout=new GridBagLayout();
    gbc=new GridBagConstraints();

    setLayout(layout); 

    init();
  }

  

  /**
   * Lays out the window.  If fullRoom is true, lays window
   * out with the correspondence box and what's new, otherwise
   * just the MPSQAS title.
   */
  public void init()
  {
    titleL = new JLabel("MPSQAS");
    titleL.setFont(AppletConstants.HEADER_FONT);
    if(fullRoom)
    {
      AppletConstants.buildConstraints(gbc, 0, 0, 2, 1, 0, 1);
    }
    else
    {
      AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
    }
    gbc.insets = new Insets(5,5,5,5);
    gbc.anchor = GridBagConstraints.NORTHWEST;
    layout.setConstraints(titleL, gbc);
    add(titleL);

    descL=new JLabel("Member Problem Submission and Quality Assurance System.");
    descL.setFont(AppletConstants.NORMAL_FONT);
    if(fullRoom)
    {
      AppletConstants.buildConstraints(gbc, 0, 1, 2, 1, 0, 1);
    }
    else
    {
      AppletConstants.buildConstraints(gbc, 0, 1, 1, 1, 0, 100);
    }
    layout.setConstraints(descL, gbc);
    add(descL);

    if(fullRoom)
    {
      unreadCorrespondenceL = new JLabel("Problems with new correspondence (" 
                                         + problems.size() + "):");
      unreadCorrespondenceL.setFont(AppletConstants.BOLD_FONT);
      gbc.anchor = GridBagConstraints.WEST;
      AppletConstants.buildConstraints(gbc, 0, 2, 2, 1, 0, 1);
      layout.setConstraints(unreadCorrespondenceL, gbc);
      add(unreadCorrespondenceL);

      unreadCorrespondenceT = new SortableTable(AppletConstants.UNREAD_CORRESPONDENCE_COLS,
                                                getUnreadCorrespondence());
      unreadCorrespondenceSP = new JScrollPane(unreadCorrespondenceT,
                                               JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                               JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
      unreadCorrespondenceSP.setPreferredSize(new Dimension(300, 300));
      AppletConstants.buildConstraints(gbc, 0, 3, 1, 1, 1, 100);
      gbc.fill = GridBagConstraints.BOTH;
      layout.setConstraints(unreadCorrespondenceSP, gbc);
      add(unreadCorrespondenceSP);

      JPanel spacer = new JPanel();
      AppletConstants.buildConstraints(gbc, 1, 3, 1, 1, 2, 0);
      layout.setConstraints(spacer, gbc);
      add(spacer);

      viewProblemB = new JButton("View Problem");
      AppletConstants.buildConstraints(gbc, 0, 4, 1, 1, 0, 1);
      gbc.anchor = GridBagConstraints.EAST;
      gbc.fill = GridBagConstraints.NONE;
      layout.setConstraints(viewProblemB, gbc);
      add(viewProblemB);      

      JPanel spacer2 = new JPanel();
      AppletConstants.buildConstraints(gbc, 0, 5, 2, 1, 0, 50);
      gbc.fill = GridBagConstraints.BOTH;
      gbc.anchor = GridBagConstraints.WEST;
      layout.setConstraints(spacer2, gbc);
      add(spacer2);

      unreadCorrespondenceT.addMouseListener(
          new AppletMouseListener("problemRowClicked", this, "mouseClicked"));
      viewProblemB.addActionListener(
          new AppletActionListener("problemButtonClicked", this));
    }
 
    mainApplet.getStatusBox().appendMessage(message, false); 
  }

  /**
   * Returns a list of problems with new correspondence from problems
   * ArrayList in tabular form.
   */
  private Object[][] getUnreadCorrespondence()
  {
    Object[][] data = new Object[problems.size()][1];
    for(int i = 0; i < problems.size(); i++)
    {
      data[i][0] = ((ProblemInformation)problems.get(i)).getClassName();
    }
    return data;
  }

  /**
   * If a problem is double clicked, opens the problem.
   */
  public void problemRowClicked(MouseEvent e)
  {
    if(e.getClickCount()==2 && SwingUtilities.isLeftMouseButton(e))
    {
      loadCurrentProblem();
    }
  }

  /**
   * Loads the currently selected problem.
   */
  public void problemButtonClicked(ActionEvent e)
  {
    loadCurrentProblem();
  }

  /**
   * Sends a request to the server to view the current problem.
   */
  private void loadCurrentProblem()
  {
    if(unreadCorrespondenceT.getSelectedRow() >= 0)
    {
      ArrayList request = new ArrayList(2);
      request.add(new Integer(MessageTypes.MOVE_RQ));
      request.add(new Integer(MessageTypes.VIEW_PROBLEM_ROOM));
      request.add(new Integer(((ProblemInformation)problems.get(
              unreadCorrespondenceT.getSelectedRow())).getProblemId()));
      mainApplet.sendToServer(request);
    }
  }

  private GridBagConstraints gbc;
  private GridBagLayout layout;

  private boolean fullRoom;
  private ArrayList problems;
  private String message;

  private JLabel titleL;
  private JLabel descL;
  private JLabel unreadCorrespondenceL;
  private SortableTable unreadCorrespondenceT;
  private JScrollPane unreadCorrespondenceSP;
  private JButton viewProblemB;
  private JLabel whatsNewL;
  private JTextArea whatsNewTA;
  private JScrollPane whatsNewSP;

}
