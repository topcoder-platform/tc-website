package com.topcoder.mpsqas.mapplet.rooms;

import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.mapplet.components.*;

/**
 * A room in which users can view (and possibly edit) information about a contest.
 * This room will also contain a chat room for the contest.  Admins can schedule testers
 * and problems.  Testers can see the problem they are testing.  Problem writers can 
 * just check everything out.
 *
 * @author mitalub
 */
public class ViewContestRoom extends Room
{
  /**
   * The constructor stores some information and sets up the layout.  It then calls init() to make
   * all the components.
   *
   * @param roomHolder The room's holder.
   * @param mainApplet The mainApplet.
   * @param contestInfo The contest information about the contest being displayed.
   * @param users A list of currently logged in users. 
   */
  public ViewContestRoom(RoomHolder roomHolder, MainApplet mainApplet,
                         ContestInformation contestInfo, ArrayList users)
  {
    super(roomHolder,mainApplet);

    this.users=users;
    this.contestInfo=contestInfo;

    this.layout=new GridBagLayout();
    this.gbc=new GridBagConstraints();
    setLayout(layout);

    init();
  }

  /**
   * Creates and lays out all of the components.
   */
  private void init()
  {
    titleLabel=new JLabel("Contest Information ("+contestInfo.getContestName()+"):");
    titleLabel.setFont(AppletConstants.HEADER_FONT);
    gbc.insets=new Insets(5,5,5,5);
    gbc.anchor=GridBagConstraints.WEST;
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,1);
    layout.setConstraints(titleLabel,gbc);
    add(titleLabel);

    tabbedPane=new JTabbedPane();
    tabbedPane.setFont(AppletConstants.NORMAL_FONT);
   
    generalContestInfoPanel=new GeneralContestInfoPanel(mainApplet,this,contestInfo);
    tabbedPane.addTab("General Information",generalContestInfoPanel);

    roundProblemsPanel=new RoundProblemsPanel(mainApplet,
                           contestInfo.getScheduledProblems());
    tabbedPane.addTab("Problems",roundProblemsPanel);

    chatPanel=new ChatPanel(mainApplet,users);
    tabbedPane.addTab("Chat",chatPanel);

    if(mainApplet.isAdmin())
    {
      contestSchedulePanel=new ContestSchedulePanel(this,mainApplet,
                               contestInfo.getAvailableProblems(),
                               contestInfo.getAvailableTesters(),
                               contestInfo.getScheduledProblems());
      tabbedPane.addTab("Admin", contestSchedulePanel);
    }

    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,1,1,1,1,100);
    layout.setConstraints(tabbedPane,gbc);
    add(tabbedPane);

  }

  /**
   * Adds a chat message to the chat panel.
   *
   * @param message Chat to add
   */
  public void addChat(String message)
  {
    chatPanel.addChat(message);
  }

  /**
   * Calls the ChatPanel to change the user list.
   *
   * @param users The new user list.
   */
  public void setUserList(ArrayList users)
  {
    chatPanel.setUserList(users);
  }

  /**
   * Repopulates the tables and text areas to represent any changes to problems which 
   * may have occurred.
   *
   * @param info       contestInformation representing the the round
   */
  public void updateSchedule(ContestInformation info)
  {

    this.contestInfo=info;
    generalContestInfoPanel.update(info);
    roundProblemsPanel.update(contestInfo.getScheduledProblems());
    if(mainApplet.isAdmin())
    {
      contestSchedulePanel.update(contestInfo.getAvailableProblems(), 
                                  contestInfo.getAvailableTesters(),
                                  contestInfo.getScheduledProblems());
    }
    updateStatus("Update contest information received from server!",true);
  }

  private GridBagLayout layout;
  private GridBagConstraints gbc;

  private ContestInformation contestInfo;
  private ArrayList users;

  private JLabel titleLabel;
  private JTabbedPane tabbedPane;
  private GeneralContestInfoPanel generalContestInfoPanel;
  private RoundProblemsPanel roundProblemsPanel;
  private ContestSchedulePanel contestSchedulePanel;
  private ChatPanel chatPanel;
}
