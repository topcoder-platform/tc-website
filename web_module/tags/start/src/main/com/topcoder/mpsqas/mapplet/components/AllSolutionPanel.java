package com.topcoder.mpsqas.mapplet.components;

import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.mapplet.rooms.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.topcoder.mpsqas.mapplet.widgets.*;
import java.util.ArrayList;

/**
 * Allows the user to view all the solutions (Writer's and tester's) to a problem, and test all of them with the same arguments.
 *
 * @author mitalub
 */
public class AllSolutionPanel extends JPanel
{
  /**
   * The constructor lays out and populates all the components.
   *
   * @param viewProblemRoom The parent room.
   * @param mainApplet      The mainApplet
   * @param solutions       ArrayList of ArrayList of solutions of form solutionName, 
   *                        primary,solutionText.
   * @param editable        Can the primary solution be set (if the user is an admin)
   */
  public AllSolutionPanel(ViewProblemRoom viewProblemRoom, MainApplet mainApplet,ArrayList solutions,
                          boolean editable)
  {
    this.solutions=solutions;
    this.parentRoom=viewProblemRoom;
    this.mainApplet=mainApplet;
    this.editable = editable;
    this.layout=new GridBagLayout();
    this.gbc=new GridBagConstraints();
    setLayout(layout);

    JPanel panel1=new JPanel();
    JPanel panel2=new JPanel();
    GridBagLayout layout1=new GridBagLayout();
    GridBagLayout layout2=new GridBagLayout();
    panel1.setLayout(layout1);
    panel2.setLayout(layout2);
  
    solutionsTitle=new JLabel("Solutions:");
    solutionsTitle.setFont(AppletConstants.HEADER_FONT);
    gbc.insets=new Insets(5,5,5,5);
    gbc.fill=GridBagConstraints.NONE;
    gbc.anchor=GridBagConstraints.WEST;
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,1);
    layout1.setConstraints(solutionsTitle,gbc);
    panel1.add(solutionsTitle);

    Object[][]tableData=new Object[solutions.size()][2];
    int i;
    for(i=0;i<solutions.size();i++)
    {
      tableData[i][0] = ((SolutionInformation)solutions.get(i)).getHandle();
      tableData[i][1] = new Boolean(((SolutionInformation)solutions.get(i)).isPrimary());
    }

    solutionsTable = new SortableTable(AppletConstants.ALL_SOLUTIONS_COLS,
                                       tableData,
                                       AppletConstants.ALL_SOLUTIONS_COLS_WIDTHS);
    solutionsTableScrollPane=new JScrollPane(solutionsTable,
                                        JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                        JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,1,1,1,0,100);
    layout1.setConstraints(solutionsTableScrollPane,gbc);
    panel1.add(solutionsTableScrollPane);

    solutionText=new JTextArea();
    solutionText.setFont(AppletConstants.FIXED_WIDTH_FONT);
    solutionText.setEditable(false);
    solutionScrollPane=new JScrollPane(solutionText,
                              JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                              JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,100);
    layout2.setConstraints(solutionScrollPane,gbc);
    panel2.add(solutionScrollPane);

    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,0,1,1,20,100);
    layout.setConstraints(panel1,gbc);
    panel1.setPreferredSize(new Dimension(300,10000));
    add(panel1);

    AppletConstants.buildConstraints(gbc,1,0,1,1,100,0);
    layout.setConstraints(panel2,gbc);
    add(panel2);

    buttonBox=Box.createHorizontalBox();
    testButton=new JButton("Test All");
    compareButton=new JButton("System Test All");

    buttonBox.add(testButton);
    buttonBox.add(Box.createHorizontalStrut(5));
    buttonBox.add(compareButton);
    gbc.anchor=GridBagConstraints.CENTER;
    gbc.fill=GridBagConstraints.NONE;
    AppletConstants.buildConstraints(gbc,0,1,2,1,0,1); 
    layout.setConstraints(buttonBox,gbc);
    add(buttonBox);

    testButton.addActionListener(new AppletActionListener("test",this));
    compareButton.addActionListener(new AppletActionListener("compare",this));
    solutionsTable.getSelectionModel().addListSelectionListener(new AppletListListener
                                                             ("solutionSelected",this));
  }

  /**
   * Called when a solution in the solution table is selected.  It 
   * updates the solution view area to add the message.
   *
   * @param e  The mouse clicking event
   */
  public void solutionSelected(ListSelectionEvent e)
  {
    int index = solutionsTable.getSelectedRow();
    if(index<0 || index>=solutions.size())
    {
      solutionText.setText("");
    }
    else
    {
      solutionText.setText(((SolutionInformation)solutions.get(index)).getText());
      solutionText.setCaretPosition(0);
    }
  }

  /**
   * Called when the user hits a test button.  Calls the parent window to perform the test
   * by getting the args.
   *
   * @params e The ActionEvent of clicking the Test button.
   */
  public void test(ActionEvent e)
  {
    parentRoom.test(MessageTypes.TEST_ALL);
  }

  /**
   * Sends a message to the server to compare all the solutions, and return the results.
   *
   * @params e Clicking of the compare button.
   */
  public void compare(ActionEvent e)
  {
    parentRoom.updateStatus("Testing...",false);
    ArrayList compareRequest=new ArrayList();
    compareRequest.add(new Integer(MessageTypes.COMPARE_SOLUTIONS_RQ));
    mainApplet.sendToServer(compareRequest);
  }

  private GridBagLayout layout;
  private GridBagConstraints gbc;
  private ViewProblemRoom parentRoom;
  private MainApplet mainApplet;
  private boolean editable;
  private ArrayList solutions;
  private JLabel solutionsTitle;
  private SortableTable solutionsTable;
  private JScrollPane solutionsTableScrollPane;
  private JTextArea solutionText;
  private JScrollPane solutionScrollPane;
  private JButton testButton;
  private JButton compareButton;
  private Box buttonBox;
}
