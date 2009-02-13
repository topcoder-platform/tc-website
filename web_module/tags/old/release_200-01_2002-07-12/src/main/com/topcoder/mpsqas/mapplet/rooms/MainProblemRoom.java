package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.mapplet.components.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.mapplet.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import java.util.ArrayList;
import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.widgets.*;

/**
 * The main problem room is the room in which a user can view all
 * his active problems.  That include those he has written and those
 * he is assigned to test
 *
 * @author mitalub
 */
public class MainProblemRoom extends Room
{
  /**
   * The constructor stores a little information and calls init() to do
   * up the room.
   *
   * @param holder     The RoomHolder of the room.
   * @param mainApplet The MainApplet
   * @param writer     Indicates it the user gets a writer table
   * @param tester     Indicates if the user gets a testing table
   * @param wProblems  ArrayList of active writing problems.
   * @param tProblems  ArrayList of active testint problems.
   */
  public MainProblemRoom(RoomHolder holder,MainApplet mainApplet,boolean writer,
                         boolean tester,ArrayList wProblems,ArrayList tProblems)
  {
    super(holder,mainApplet);
    getsWriterTable=writer;
    getsTesterTable=tester;
    writingProblems=wProblems;
    testingProblems=tProblems;
    layout=new GridBagLayout();
    setLayout(layout);
    gbc=new GridBagConstraints();
    init();
  }

  /**
   * init lays out everything on the screen to prepare for action.
   */
  public void init()
  {
    int y=0;
    gbc.insets=new Insets(5,5,5,5);
    int i,j;
    Object[][] tableData;
    ProblemInformation problemInfo;
    if(getsWriterTable)
    {
      writerLabel=new JLabel("Developing Problems ("+writingProblems.size()+"):");
      writerLabel.setFont(AppletConstants.HEADER_FONT);
      gbc.fill=GridBagConstraints.NONE;
      gbc.anchor=GridBagConstraints.WEST;
      AppletConstants.buildConstraints(gbc,0,y++,1,1,1,1);
      layout.setConstraints(writerLabel,gbc);
      add(writerLabel);

      tableData = new Object[writingProblems.size()][6];
      for(i=0;i<writingProblems.size();i++)
      {
        problemInfo = (ProblemInformation)writingProblems.get(i);
        tableData[i][0] = problemInfo.getTimestamp();
        tableData[i][1] = problemInfo.getClassName();
        tableData[i][2] = problemInfo.getClassName();
        tableData[i][3] = MessageTypes.getDivisionName(problemInfo.getDivision());
        tableData[i][4] = MessageTypes.getDifficultyName(problemInfo.getDifficultyLevel());
        tableData[i][5] = MessageTypes.getStatusName(problemInfo.getStatus());
      }

      writerTable = new SortableTable(AppletConstants.MAIN_WRITING_PROBLEM_COLS, 
                                      tableData,
                                      AppletConstants.MAIN_WRITING_PROBLEM_COLS_WIDTHS);

      writerTablePane=new JScrollPane(writerTable,
                                      JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                      JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
      gbc.fill=GridBagConstraints.BOTH;
      AppletConstants.buildConstraints(gbc,0,y++,1,1,0,100);
      layout.setConstraints(writerTablePane,gbc);
      add(writerTablePane);

      writerButtonBox=Box.createHorizontalBox();
      viewWriterButton=new JButton("View Problem");
      writerButtonBox.add(viewWriterButton);
      AppletConstants.buildConstraints(gbc,0,y++,1,1,0,1);
      gbc.fill=GridBagConstraints.NONE;
      gbc.anchor=GridBagConstraints.EAST;
      layout.setConstraints(writerButtonBox,gbc);
      add(writerButtonBox);

      writerTable.addMouseListener(
            new AppletMouseListener("writerProblemsRowClicked",this,"mouseClicked"));
      viewWriterButton.addActionListener(
            new AppletActionListener("writerProblemsButtonClicked",this)); 
    }

    if(getsTesterTable)
    {
      testerLabel=new JLabel("Testing Problems ("+testingProblems.size()+"):");
      testerLabel.setFont(AppletConstants.HEADER_FONT);
      gbc.fill=GridBagConstraints.NONE;
      gbc.anchor=GridBagConstraints.WEST;
      AppletConstants.buildConstraints(gbc,0,y++,1,1,1,1);
      layout.setConstraints(testerLabel,gbc);
      add(testerLabel);

      tableData=new Object[testingProblems.size()][7];
      for(i=0;i<testingProblems.size();i++)
      {
        problemInfo = (ProblemInformation)testingProblems.get(i);
        tableData[i][0] = problemInfo.getWriter().getHandle();
        tableData[i][1] = problemInfo.getTimestamp();
        tableData[i][2] = problemInfo.getClassName();
        tableData[i][3] = problemInfo.getMethodName();
        tableData[i][4] = MessageTypes.getDivisionName(problemInfo.getDivision());
        tableData[i][5] = MessageTypes.getDifficultyName(problemInfo.getDifficultyLevel());
        tableData[i][6] = MessageTypes.getStatusName(problemInfo.getStatus());;
      }

      testerTable = new SortableTable(AppletConstants.MAIN_TESTING_PROBLEM_COLS,
                                      tableData,
                                      AppletConstants.MAIN_TESTING_PROBLEM_COLS_WIDTHS);

      testerTablePane=new JScrollPane(testerTable,
                                      JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                      JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
      gbc.fill=GridBagConstraints.BOTH;
      AppletConstants.buildConstraints(gbc,0,y++,1,1,0,100);
      layout.setConstraints(testerTablePane,gbc);
      add(testerTablePane);

      testerButtonBox=Box.createHorizontalBox();
      viewTesterButton=new JButton("View Problem");
      testerButtonBox.add(viewTesterButton);
      AppletConstants.buildConstraints(gbc,0,y++,1,1,0,1);
      gbc.fill=GridBagConstraints.NONE;
      gbc.anchor=GridBagConstraints.EAST;
      layout.setConstraints(testerButtonBox,gbc);
      add(testerButtonBox);

      testerTable.addMouseListener(
          new AppletMouseListener("testerProblemsRowClicked",this,"mouseClicked"));
      viewTesterButton.addActionListener(
          new AppletActionListener("testerProblemsButtonClicked",this)); 
    }

    mainApplet.getStatusBox().appendMessage(
                             "Select a problem with which to work.",
                              false);
  }

  /**
   * When a row in the Writer Problems table is clicked, this
   * method is called.  This method checks to see if the click 
   * is a double click, and if so, calls a method to load the problem.
   *
   * @param e The MouseEvent of clicking the table row
   */
  public void writerProblemsRowClicked(MouseEvent e)
  {
    if(e.getClickCount()==2 && SwingUtilities.isLeftMouseButton(e))
      loadWriterProblem();
  }

  /**
   * When the View Problem under the writer table button is clicked,
   * this method is called to load the problem.
   *
   * @param e The ActionEvent of clicking the button.
   */
  public void writerProblemsButtonClicked(ActionEvent e)
  {
    loadWriterProblem();
  }

  /**
   * loadWriterProblem loads the currently selected writer problem by 
   * telling the mainApplet to put up the loading... window and by sending
   * a request to the server. 
   */
  public void loadWriterProblem()
  {
    int  row = writerTable.getSelectedRow();
    if(row >= 0)
    {
      mainApplet.loadMovingRoom();
      ArrayList viewProblemRequest=new ArrayList(2);
      viewProblemRequest.add(new Integer(MessageTypes.MOVE_RQ));
      viewProblemRequest.add(new Integer(MessageTypes.VIEW_PROBLEM_ROOM));
      viewProblemRequest.add(new Integer(((ProblemInformation)
              writingProblems.get(row)).getProblemId()));
      mainApplet.sendToServer(viewProblemRequest);
    }
  }
    
  /**
   * When a row in the Tester Problems table is clicked, this
   * method is called.  This method checks to see if the click 
   * is a double click, and if so, calls a method to load the problem.
   *
   * @param e The MouseEvent of clicking the table row
   */
  public void testerProblemsRowClicked(MouseEvent e)
  {
    if(e.getClickCount()==2)
      loadTesterProblem();
  }

  /**
   * When the View Problem under the tester table button is clicked,
   * this method is called to load the problem.
   *
   * @param e The ActionEvent of clicking the button.
   */
  public void testerProblemsButtonClicked(ActionEvent e)
  {
    loadTesterProblem();
  }

  /**
   * loadTesterProblem loads the currently selected tester problem by 
   * telling the mainApplet to put up the loading... window and by sending
   * a request to the server. 
   */
  public void loadTesterProblem()
  {
    int row=testerTable.getSelectedRow();
    if(row >= 0)
    {
      mainApplet.loadMovingRoom();
      ArrayList viewProblemRequest=new ArrayList(2);
      viewProblemRequest.add(new Integer(MessageTypes.MOVE_RQ));
      viewProblemRequest.add(new Integer(MessageTypes.VIEW_PROBLEM_ROOM));
      viewProblemRequest.add(new Integer(((ProblemInformation)
              testingProblems.get(row)).getProblemId()));
      mainApplet.sendToServer(viewProblemRequest);
    }
  }
    
  //layout
  private GridBagLayout layout;
  private GridBagConstraints gbc;
 
  //components 
  private JTable writerTable;
  private JTable testerTable;
  private JScrollPane writerTablePane;
  private JScrollPane testerTablePane;
  private JLabel writerLabel;
  private JLabel testerLabel;
  private Box writerButtonBox;
  private Box testerButtonBox;
  private JButton viewWriterButton;
  private JButton viewTesterButton;

  //data
  private boolean getsWriterTable;
  private boolean getsTesterTable;
  private ArrayList writingProblems;
  private ArrayList testingProblems;
}
