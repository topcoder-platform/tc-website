package com.topcoder.mpsqas.mapplet.components;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import java.util.*;
import javax.swing.border.*;
import com.topcoder.mpsqas.mapplet.widgets.*;

/**
 * A panel on which a user can view some quick info about round problems, such as the writer, 
 * difficulty, and problem statement.  From this panel, a user can also go the the main  
 * problem panel for the problem.
 *
 * @author mitalub
 */
public class RoundProblemsPanel extends JPanel
{
  /**
   * Stores some information about the problems and calls init() to do create everything.
   *
   * @param mainApplet The MainAPplet
   * @param problems An ArrayList of ProblemInformation containing
   *                 information on the problems.
   */
  public RoundProblemsPanel(MainApplet mainApplet, ArrayList problems)
  {
    this.mainApplet=mainApplet;
    this.problems=problems;

    this.layout=new GridBagLayout();
    this.gbc=new GridBagConstraints();
    setLayout(layout);
    init();
  } 

  /**
   * Init creates, lays out, and populizes the components.
   */
  private void init()
  {
    problemsLabel=new JLabel("Problems:");
    problemsLabel.setFont(AppletConstants.NORMAL_FONT); 
    gbc.insets=new Insets(5,5,5,5);
    gbc.fill=GridBagConstraints.BOTH;
    gbc.anchor=GridBagConstraints.WEST;
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,1);
    layout.setConstraints(problemsLabel,gbc);
    add(problemsLabel);

    statementLabel=new JLabel("Problem Statement:");
    statementLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,1,0,1,1,1,0);
    layout.setConstraints(statementLabel,gbc);
    add(statementLabel);

    problemsTable = new SortableTable(AppletConstants.SCHEDULED_PROB_COLS,
                                      getProblemsTable(),
                                      AppletConstants.SCHEDULED_PROB_COLS_WIDTHS);
    problemsTablePane=new JScrollPane(problemsTable);
    AppletConstants.buildConstraints(gbc,0,1,1,2,0,0);
    layout.setConstraints(problemsTablePane,gbc);
    problemsTablePane.setPreferredSize(new Dimension(300,10000));
    add(problemsTablePane);

    problemStatementArea=new JTextArea();
    problemStatementArea.setEditable(false);
    problemStatementArea.setFont(AppletConstants.FIXED_WIDTH_FONT);
    problemStatementArea.setLineWrap(true);
    problemStatementArea.setWrapStyleWord(true);
    problemStatementPane=new JScrollPane(problemStatementArea,
                                         JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                         JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    AppletConstants.buildConstraints(gbc,1,1,1,1,0,100);
    layout.setConstraints(problemStatementPane,gbc);
    add(problemStatementPane);

    viewProblemButton=new JButton("View Full Problem");
    gbc.fill=GridBagConstraints.NONE;
    gbc.anchor=GridBagConstraints.CENTER;
    AppletConstants.buildConstraints(gbc,1,2,1,1,0,1);
    layout.setConstraints(viewProblemButton,gbc);
    add(viewProblemButton);  

    problemsTable.getSelectionModel().addListSelectionListener(
            new AppletListListener("problemSelected",this));
    viewProblemButton.addActionListener(
            new AppletActionListener("viewProblemButtonClicked",this));
    problemsTable.addMouseListener(
            new AppletMouseListener("problemClicked",this,"mouseClicked"));
  }

  /**
   * Updates the problem statement in the text area.  The method is called when a user 
   * changes the selection in the problem table.
   *
   * @param e  The event of the problem changing
   */
  public void problemSelected(ListSelectionEvent e)
  {
    int index=problemsTable.getSelectedRow();
    if(index<0 || index>=problems.size())
    {
      problemStatementArea.setText("");
    }
    else
    {
      problemStatementArea.setText(((ProblemInformation)problems.get(index)).getProblemStatement());
    }
    problemStatementArea.setCaretPosition(0);
  }

  /**
   * Calls loadProblem when the View Full Problem button is clicked.
   *
   * @param e The clicking of the button
   */
  public void viewProblemButtonClicked(ActionEvent e)
  {
    loadProblem();
  }

  /**
   * Calls loadProblem when a problem in the table is double clicked.
   * 
   * @param e The mouse click
   */
  public void problemClicked(MouseEvent e)
  {
    if(e.getClickCount()==2)
      loadProblem();
  }

  /**
   * Loads a problem room for the request problem.  It puts up a moving window and sends 
   * a request to the server to load the problem.
   */
  private void loadProblem()
  {
    int index = problemsTable.getSelectedRow();
    if(index >= 0)
    {
      mainApplet.loadMovingRoom();
      ArrayList viewProblemRequest=new ArrayList(3);
      viewProblemRequest.add(new Integer(MessageTypes.MOVE_RQ));
      viewProblemRequest.add(new Integer(MessageTypes.VIEW_PROBLEM_ROOM));
      viewProblemRequest.add(new Integer(
              ((ProblemInformation)problems.get(index)).getProblemId()));
      mainApplet.sendToServer(viewProblemRequest);    
    }
  }

  /**
   * Updates the problems being displayed.
   * 
   * @param problems ArrayList of the new problems.
   */
  public void update(ArrayList problems)
  {
    this.problems=problems;
    problemsTable.setData(getProblemsTable());
  }

  /**
   * Returns an Object[][] of the problems to put in the table.
   */
  private Object[][] getProblemsTable()
  {
    Object[][] tableData=new Object[problems.size()][5];
    for(int i=0;i<problems.size();i++)
    {
      tableData[i][0]=((ProblemInformation)problems.get(i)).getClassName();
      tableData[i][1]=((ProblemInformation)problems.get(i)).getWriter().getHandle();
      tableData[i][2]=MessageTypes.getDivisionName(
                     ((ProblemInformation)problems.get(i)).getDivision());
      tableData[i][3]=MessageTypes.getDifficultyName(
                     ((ProblemInformation)problems.get(i)).getDifficultyLevel());
      tableData[i][4]="" + ((ProblemInformation)problems.get(i)).getPoints();
    }
    return tableData;
  }

  private MainApplet mainApplet;

  private GridBagLayout layout;
  private GridBagConstraints gbc;
  private ArrayList problems;

  private JLabel problemsLabel;
  private JLabel statementLabel;
  private SortableTable problemsTable;
  private JScrollPane problemsTablePane;
  private JTextArea problemStatementArea;
  private JScrollPane problemStatementPane;
  private JButton viewProblemButton;
}
