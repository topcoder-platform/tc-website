package com.topcoder.mpsqas.mapplet.components;

import com.topcoder.mpsqas.mapplet.widgets.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import javax.swing.table.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.rooms.*;
import com.topcoder.mpsqas.mapplet.listener.*;

/** 
 * A panel through which an admin can schedule problems / problem testers to a 
 * contest.
 *
 * @author mitalub
 */
public class ContestSchedulePanel extends JPanel 
{
  /**
   * Stores some information, sets up the layout, and calls init to run 
   * everything.
   *
   * @param parentRoom The ViewContestRoom containing this panel
   * @param mainApplet The MainApplet.
   * @param availProblems All problems available for the contest (ProblemInformations)
   * @param availTesters All testers available for the contest. (UserInformations)
   * @param schedProblems The currently schedules problems. (ProblemInformations)
   */
  public ContestSchedulePanel(ViewContestRoom parentRoom, MainApplet mainApplet,
                              ArrayList availProblems, ArrayList availTesters, 
                              ArrayList schedProblems)
  {
    this.parentRoom = parentRoom;
    this.mainApplet = mainApplet;
    this.availProblems = availProblems;
    this.availTesters = availTesters;
    this.schedProblems = schedProblems;

    this.layout=new GridBagLayout();
    this.gbc=new GridBagConstraints();

    setLayout(layout); 

    init();
  }

  /**
   * Creates, lays out, and populates the components
   */
  private void init()
  {
    availProblemsLabel=new JLabel("Available Problems:");
    availProblemsLabel.setFont(AppletConstants.NORMAL_FONT);
    gbc.anchor=GridBagConstraints.WEST;
    gbc.insets=new Insets(5,5,5,5);
    AppletConstants.buildConstraints(gbc,0,0,2,1,0,1);
    layout.setConstraints(availProblemsLabel,gbc);
    add(availProblemsLabel);

    availProblemsT = new SortableTable(AppletConstants.AVAILABLE_PROBLEMS_COLS,
                               getAllProblems(),
                               AppletConstants.AVAILABLE_PROBLEMS_COLS_WIDTHS);
    availProblemsSP=new JScrollPane(availProblemsT);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,1,2,1,0,100);
    layout.setConstraints(availProblemsSP,gbc);
    add(availProblemsSP);

    addProblemButton=new JButton("Add");
    gbc.fill=GridBagConstraints.HORIZONTAL;
    AppletConstants.buildConstraints(gbc,0,2,1,1,100,1);
    layout.setConstraints(addProblemButton,gbc);
    add(addProblemButton);

    removeProblemButton=new JButton("Remove");
    AppletConstants.buildConstraints(gbc,1,2,1,1,100,0);
    layout.setConstraints(removeProblemButton,gbc);
    add(removeProblemButton);

    problemsLabel=new JLabel("Scheduled Problems:");
    problemsLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,3,2,1,0,1);
    layout.setConstraints(problemsLabel,gbc);
    add(problemsLabel);

    schedProblemsT = new SortableTable(AppletConstants.SCHEDULED_PROB_COLS,
                              getCurrentProblems(),
                              AppletConstants.SCHEDULED_PROB_COLS_WIDTHS,
                              AppletConstants.SCHEDULED_PROB_COLS_EDIT);
    schedProblemsSP=new JScrollPane(schedProblemsT);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,4,2,2,0,0);
    layout.setConstraints(schedProblemsSP,gbc);
    add(schedProblemsSP);

    JComboBox divisions = new JComboBox();
    int i;
    for(i = 0; i < MessageTypes.DIVISION_NAMES.length; i++)
    {
      divisions.addItem(new HiddenValue(MessageTypes.DIVISION_NAMES[i],
                                        MessageTypes.DIVISION_IDS[i]));
    }
    DefaultCellEditor divisionEditor = new DefaultCellEditor(divisions);
    divisionEditor.setClickCountToStart(2);
    divisionEditor.addCellEditorListener(
            new AppletCellEditorListener("divisionChanged", this, "editingStopped"));
    schedProblemsT.getColumnModel().getColumn(2)
            .setCellEditor(divisionEditor); 
    JComboBox difficultyLevels = new JComboBox();
    for(i = 0; i < MessageTypes.DIFFICULTY_NAMES.length; i++)
    {
      difficultyLevels.addItem(new HiddenValue(MessageTypes.DIFFICULTY_NAMES[i],
                                               MessageTypes.DIFFICULTY_IDS[i]));
    }
    DefaultCellEditor difficultyEditor = new DefaultCellEditor(difficultyLevels);
    difficultyEditor.setClickCountToStart(2);
    difficultyEditor.addCellEditorListener(
            new AppletCellEditorListener("difficultyChanged", this, "editingStopped"));
    schedProblemsT.getColumnModel().getColumn(3) .setCellEditor(difficultyEditor);

    DefaultCellEditor pointsEditor = new DefaultCellEditor(new JTextField());
    pointsEditor.setClickCountToStart(2);
    pointsEditor.addCellEditorListener(
           new AppletCellEditorListener("pointsChanged", this, "editingStopped"));
    schedProblemsT.getColumnModel().getColumn(4).setCellEditor(pointsEditor);

    availTestersLabel=new JLabel("Available Testers:");
    availTestersLabel.setFont(AppletConstants.NORMAL_FONT);
    gbc.anchor=GridBagConstraints.WEST;
    gbc.insets=new Insets(5,5,5,5);
    AppletConstants.buildConstraints(gbc,2,0,2,1,0,0);
    layout.setConstraints(availTestersLabel,gbc);
    add(availTestersLabel);

    availTestersT = new SortableTable(AppletConstants.TESTER_INFO_COLS,
                                      getAllTesters(),
                                      AppletConstants.TESTER_INFO_COLS_WIDTHS);
    availTestersSP=new JScrollPane(availTestersT);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,2,1,2,1,0,0);
    layout.setConstraints(availTestersSP,gbc);
    add(availTestersSP);

    addTesterButton=new JButton("Add");
    gbc.fill=GridBagConstraints.HORIZONTAL;
    AppletConstants.buildConstraints(gbc,2,2,1,1,50,0);
    layout.setConstraints(addTesterButton,gbc);
    add(addTesterButton);

    removeTesterButton=new JButton("Remove");
    AppletConstants.buildConstraints(gbc,3,2,1,1,50,0);
    layout.setConstraints(removeTesterButton,gbc);
    add(removeTesterButton);

    testerOptions = new JComboBox();
    for(i = 0; i < TESTER_OPTIONS.length; i++)
    {
      testerOptions.addItem(TESTER_OPTIONS[i]);
    }
    AppletConstants.buildConstraints(gbc,2,3,2,1,0,0);
    layout.setConstraints(testerOptions,gbc);
    add(testerOptions);

    testersLabel=new JLabel("Scheduled Testers:");
    testersLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,2,4,2,1,0,1);
    layout.setConstraints(testersLabel,gbc);
    add(testersLabel);

    schedTestersT = new SortableTable(AppletConstants.TESTER_INFO_COLS,
                                      getCurrentTesters(),
                                      AppletConstants.TESTER_INFO_COLS_WIDTHS);
    schedTestersSP=new JScrollPane(schedTestersT);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,2,5,2,1,0,100);
    layout.setConstraints(schedTestersSP,gbc);
    add(schedTestersSP);

    submitButton=new JButton("Submit");
    gbc.fill=GridBagConstraints.NONE;
    gbc.anchor=GridBagConstraints.CENTER;
    AppletConstants.buildConstraints(gbc,0,6,4,1,0,1);
    layout.setConstraints(submitButton,gbc);
    add(submitButton);

    schedProblemsT.getSelectionModel().addListSelectionListener(
            new AppletListListener("problemSelected",this));

    addProblemButton.addActionListener(
            new AppletActionListener("addProblem",this));
    removeProblemButton.addActionListener(
            new AppletActionListener("removeProblem",this));
    addTesterButton.addActionListener(
            new AppletActionListener("addTester",this));
    removeTesterButton.addActionListener(
            new AppletActionListener("removeTester",this));
    submitButton.addActionListener(
            new AppletActionListener("submit",this));
  }

  /**
   */
  private Object[][] getCurrentProblems()
  {
    int i;
    Object[][] probs = new Object[schedProblems.size()][5];
    int diffId, divId;

    for(i=0;i<schedProblems.size();i++)
    {
      diffId = ((ProblemInformation)schedProblems.get(i)).getDifficultyLevel(); 
      divId = ((ProblemInformation)schedProblems.get(i)).getDivision(); 
      probs[i][0]=((ProblemInformation)schedProblems.get(i)).getClassName(); 
      probs[i][1]=((ProblemInformation)schedProblems.get(i)).getWriter().getHandle(); 
      probs[i][2]=MessageTypes.getDivisionName(divId);
      probs[i][3]=MessageTypes.getDifficultyName(diffId);
      probs[i][4]=new Double(((ProblemInformation)schedProblems.get(i)).getPoints()); 
    }

    return probs;
  }

  /**
   * Returns an Object[][] to put in the current scheduled testers tables.  Looks through
   * the boolean in the testers ArrayList to see which testers are scheduled.
   */
  private Object[][] getCurrentTesters()
  {
    Object[][] probs;
    int current = schedProblemsT.getSelectedRow();
    if(current == -1)
    {
      probs = new Object[0][1];
    }
    else
    {
      ArrayList testers = ((ProblemInformation)schedProblems.get(current)).getTesters();
      probs = new Object[testers.size()][1];
      for(int i = 0; i < testers.size(); i++)
      {
        probs[i][0] = ((UserInformation)testers.get(i)).getHandle();
      }
    }
    return probs;
  }

  /**
   */
  public void problemSelected(ListSelectionEvent e)
  {
    schedTestersT.setData(getCurrentTesters());
  }

  /**
   * Adds a problem to the currently scheduled problems list.
   */
  public void addProblem(ActionEvent e)
  { 
    int index = availProblemsT.getSelectedRow();
    System.out.println("Row: " + index);
    System.out.println(availProblems);
    if (index >= 0)
    {
      schedProblems.add(((ProblemInformation)availProblems.get(index)).clone());
      ((ProblemInformation)schedProblems.get(schedProblems.size()-1)).getTesters().clear();
      schedProblemsT.setData(getCurrentProblems()); 
    }
  }

  /**
   * Adds the currently selected tester in the available problems 
   * table to the problem(s) specified by the drop down box.
   */
  public void addTester(ActionEvent e)
  {
    int index = availTestersT.getSelectedRow();
    if(index >= 0) 
    {
      int option = testerOptions.getSelectedIndex();
      ProblemInformation problemInfo;
      if(option == THIS_PROBLEM)
      {
        int problem = schedProblemsT.getSelectedRow();
   
        if(problem >= 0)
        {
          problemInfo = ((ProblemInformation)schedProblems.get(problem));
          if(!problemInfo.getTesters().contains(availTesters.get(index)))
          {
            problemInfo.getTesters().add(availTesters.get(index));
          }
        } 
      }
      else if(option == DIVISION_ONE || option == DIVISION_TWO)
      {
        int divId = (option == DIVISION_ONE)
                      ? MessageTypes.DIVISION_ONE
                      : MessageTypes.DIVISION_TWO;
        for(int i = 0; i < schedProblems.size(); i++)
        {
          problemInfo = (ProblemInformation)schedProblems.get(i);
          if(problemInfo.getDivision() == divId 
             && !problemInfo.getTesters().contains(availTesters.get(index)))
          {
            problemInfo.getTesters().add(availTesters.get(index));
          }
        }
      }
      else if(option == ALL_PROBLEMS)
      {
        for(int i = 0; i < schedProblems.size(); i++)
        {
          problemInfo = (ProblemInformation)schedProblems.get(i);
          if(!problemInfo.getTesters().contains(availTesters.get(index)))
          {
            problemInfo.getTesters().add(availTesters.get(index));
          }
        }
      }
    }
    checkTesterConsistency(ADD_ON_INCONSISTENT);
    schedTestersT.setData(getCurrentTesters());
  }

  /**
   * Removes the currently selected problem in the scheduled problems 
   * table from the scheduled problems list.
   */
  public void removeProblem(ActionEvent e)
  {
    int index = schedProblemsT.getSelectedRow();
    if(index >= 0)
    {
      schedProblems.remove(index);
      schedProblemsT.setData(getCurrentProblems());
    }
  }

  /**
   * Removes the currently selected tester in the scheduled tester
   * table from the problem(s) specificified in the drop down
   * box.
   */
  public void removeTester(ActionEvent e)
  {
    int tindex = schedTestersT.getSelectedRow();
    int pindex = schedProblemsT.getSelectedRow();
    if(tindex >= 0 && pindex >= 0)
    {
      
      UserInformation toRemove = (UserInformation)
                                   ((ProblemInformation)schedProblems.get(pindex))
                                     .getTesters().get(tindex);

      int option = testerOptions.getSelectedIndex();
      ProblemInformation problemInfo;
      if(option == THIS_PROBLEM)
      {
        problemInfo = ((ProblemInformation)schedProblems.get(pindex));
        problemInfo.getTesters().remove(problemInfo.getTesters().indexOf(toRemove));
      }
      else if(option == DIVISION_ONE || option == DIVISION_TWO)
      {
        int divId = (option == DIVISION_ONE)
                      ? MessageTypes.DIVISION_ONE
                      : MessageTypes.DIVISION_TWO;
        for(int i = 0; i < schedProblems.size(); i++)
        {
          problemInfo = (ProblemInformation)schedProblems.get(i);
          if(problemInfo.getDivision() == divId
             && problemInfo.getTesters().contains(toRemove))
          {
            problemInfo.getTesters().remove(problemInfo.getTesters().indexOf(toRemove));
          }
        }
      }
      else if(option == ALL_PROBLEMS)
      {
        for(int i = 0; i < schedProblems.size(); i++)
        {
          problemInfo = (ProblemInformation)schedProblems.get(i);
          if(problemInfo.getTesters().contains(toRemove))
          {
            problemInfo.getTesters().remove(problemInfo.getTesters().indexOf(toRemove));
          }
        }
      }
    }
    checkTesterConsistency(DELETE_ON_INCONSISTENT);
    schedTestersT.setData(getCurrentTesters());
  }

  /**
   * Verifies that two occurrences of the same problem have the same
   * problem testers.  Recursively calls itself until all inconsitencies
   * resolved.
   *
   * boolean ifInconsistency If DELETE_ON_INCONSISTENT, testers are deleted
   *                         until consistent, otherwise testers are added.
   */
  private void checkTesterConsistency(boolean ifInconsistency)
  {
    ProblemInformation problemInfo1;
    ProblemInformation problemInfo2;
    ArrayList testers1;
    ArrayList testers2;
    boolean wasInconsistent = false;
    int i, j, k;

    for(i = 0; i < schedProblems.size(); i++)
    {
      problemInfo1 = (ProblemInformation)schedProblems.get(i);
      for(j = i + 1; j < schedProblems.size(); j++)
      {
        problemInfo2 = (ProblemInformation)schedProblems.get(j);
        if(problemInfo1.getProblemId() == problemInfo2.getProblemId())
        {
          testers1 = problemInfo1.getTesters(); 
          testers2 = problemInfo2.getTesters();
          for(k = 0; k < testers1.size(); k++)
          {
            if(!testers2.contains(testers1.get(k)))
            {
              wasInconsistent = true;
              if(ifInconsistency == DELETE_ON_INCONSISTENT)
              {
                testers1.remove(k--);
              }
              else 
              {
                testers2.add(testers1.get(k));
              }
            }
          }
          for(k = 0; k < testers2.size(); k++)
          {
            if(!testers1.contains(testers2.get(k)))
            {
              wasInconsistent = true;
              if(ifInconsistency == DELETE_ON_INCONSISTENT)
              {
                testers2.remove(k--);
              }
              else 
              {
                testers1.add(testers2.get(k));
              }
            }
          } 
        }
      }
    }
    if(wasInconsistent)
    {
      checkTesterConsistency(ifInconsistency);
    }
  }

  /**
   * Sends the information to the server that the admin has specified here.
   */
  public void submit(ActionEvent e)
  {
    ArrayList submitRequest=new ArrayList(3);
    submitRequest.add(new Integer(MessageTypes.SCHEDULE_PROBLEMS_RQ));
    submitRequest.add(schedProblems);
    parentRoom.updateStatus("Sending schedule information to server...", false);
    mainApplet.sendToServer(submitRequest);
  }

  /**
   * Updates the information displayed in the table to match these new ArrayLists.
   */
  public void update(ArrayList availProblems, ArrayList availTesters, ArrayList schedProblems)
  {
    this.availProblems = availProblems;
    this.availTesters = availTesters;
    this.schedProblems = schedProblems;
    availProblemsT.setData(getAllProblems());
    availTestersT.setData(getAllTesters());
    schedProblemsT.setData(getCurrentProblems()); 
    schedTestersT.setData(getCurrentTesters());
  }

  /**
   * Returns an Object[][] representing a table of all the problems.
   */
  private Object[][] getAllProblems()
  {
    Object[][]tableData=new Object[availProblems.size()][4];
    for(int i=0;i<availProblems.size();i++)
    {
      tableData[i][0] = ((ProblemInformation)availProblems.get(i)).getClassName();
      tableData[i][1] = ((ProblemInformation)availProblems.get(i)).getWriter().getHandle();
      tableData[i][2] = MessageTypes.getDivisionName(
              ((ProblemInformation)availProblems.get(i)).getDivision());
      tableData[i][3] = MessageTypes.getDifficultyName(
              ((ProblemInformation)availProblems.get(i)).getDifficultyLevel());
    }
    return tableData;
  }

  /**
   * Returns an Object[][] representing a table of all the testers.
   */
  private Object[][] getAllTesters()
  {
    Object[][] tableData=new Object[availTesters.size()][1];
    for(int i=0;i<availTesters.size();i++)
      tableData[i][0]=((UserInformation)availTesters.get(i)).getHandle();
    return tableData;
  }

  /**
   * When the table cell for division is updated, stores the new
   * division value in the ProblemInformation for the problem.
   */
  public void divisionChanged(ChangeEvent e)
  {
    int row = schedProblemsT.getSelectedRow();

    ((ProblemInformation)schedProblems.get(row)).setDivision(
            ((HiddenValue)schedProblemsT.getAbsoluteValueAt(row, 2)).getValue());
  }

  /**
   * When the table cell for difficulty is updated, stores the new
   * difficulty value in the ProblemInformation for the problem.
   */
  public void difficultyChanged(ChangeEvent e)
  {
    int row = schedProblemsT.getSelectedRow();

    ((ProblemInformation)schedProblems.get(row)).setDifficultyLevel(
            ((HiddenValue)schedProblemsT.getAbsoluteValueAt(row, 3)).getValue());
  }

  /**
   * When the table cell for points is updated, stores the new
   * point value in the ProblemInformation for the problem.  If
   * the value is not a number, an error is printed and the value
   * is set to 0.
   */
  public void pointsChanged(ChangeEvent e)
  {
    int row = schedProblemsT.getSelectedRow();

    try
    {
      ((ProblemInformation)schedProblems.get(row)).setPoints(
              Double.parseDouble((String)schedProblemsT.getAbsoluteValueAt(row, 4)));
      schedProblemsT.setAbsoluteValueAt(
            new Double((String)schedProblemsT.getAbsoluteValueAt(row, 4)), row, 4);
    }
    catch(Exception pointsNotDouble)
    {
      parentRoom.updateStatus("Points must be a decimal value.", true);
      schedProblemsT.setAbsoluteValueAt(new Double(0), row, 4);
    }
  }

  private ViewContestRoom parentRoom;
  private MainApplet mainApplet;
  private ArrayList availProblems;
  private ArrayList availTesters;
  private ArrayList schedProblems;

  private JLabel availProblemsLabel;
  private JLabel availTestersLabel;
  private JLabel problemsLabel;
  private JLabel testersLabel;
  private JLabel statementLabel;

  private SortableTable availProblemsT;
  private SortableTable schedProblemsT;
  private SortableTable availTestersT;
  private SortableTable schedTestersT;

  private JScrollPane availProblemsSP;
  private JScrollPane schedProblemsSP;
  private JScrollPane availTestersSP;
  private JScrollPane schedTestersSP;

  private JTextArea statementArea;
  private JScrollPane statementPane;

  private JButton addProblemButton;
  private JButton removeProblemButton;
  private JButton addTesterButton;
  private JButton removeTesterButton;
  private JButton submitButton;
  private JComboBox testerOptions;

  private GridBagLayout layout;
  private GridBagConstraints gbc;

  /**Tester Options*/
  private static int THIS_PROBLEM = 0;
  private static int DIVISION_ONE = 1;
  private static int DIVISION_TWO = 2;
  private static int ALL_PROBLEMS = 3;

  private static String[] TESTER_OPTIONS = 
    {"Selected Problem", "Division 1", "Division 2", "All Problems"};

  private static boolean DELETE_ON_INCONSISTENT = false; 
  private static boolean ADD_ON_INCONSISTENT = true;
}
