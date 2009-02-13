package com.topcoder.mpsqas.mapplet.components;

import java.util.ArrayList;
import javax.swing.border.*;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.rooms.*;
import com.topcoder.mpsqas.mapplet.listener.*;

/**
 * TestCasePanel is a Panel through which a user can view, edit, and test
 * test cases.
 *
 * @author mitalub
 */
public class TestCasePanel extends JPanel
{
  /**
   * The constructor stores some information about the problem and calls init
   * to lay everything out.
   *
   * @param parentRoom The ViewProblemRoom containing this panel.
   * @param editable   A boolean representing if a user can edit the test cases
   * @param paramTypes ArrayList of param types as Strings
   * @param returnType The return type.
   * @param testCases  An ArrayList of Object[] where the inner ArrayLists are
   *                   arguments / expected result for each test case.
   */
  public TestCasePanel(ViewProblemRoom parentRoom,boolean editable,ArrayList paramTypes,String returnType,ArrayList testCases)
  {
    this.parentRoom=parentRoom;
    this.editable=editable;
    this.paramTypes=paramTypes;
    this.returnType=returnType;
    this.testCases=testCases;
    this.currentCase=-1;

    this.layout=new GridBagLayout();
    this.gbc=new GridBagConstraints();
    setLayout(layout);
    init();
  }

  /**
   * init lays out all the panels and components and sets up all the listeners and everything.
   */
  private void init()
  {
    title=new JLabel("Test Cases ("+testCases.size()+"):");
    title.setFont(AppletConstants.HEADER_FONT);
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,1);
    gbc.insets=new Insets(5,5,5,5);
    gbc.anchor=GridBagConstraints.WEST;
    layout.setConstraints(title,gbc);
    add(title);

    selectCaseLabel=new JLabel("Test Case:");
    selectCaseLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,1,0,1,1,1,0);
    gbc.anchor=GridBagConstraints.EAST;
    layout.setConstraints(selectCaseLabel,gbc);
    add(selectCaseLabel);

    selectCaseBox=new JComboBox();
    int i;
    for(i=0;i<testCases.size();i++)
      selectCaseBox.addItem(i+"");
    selectCaseBox.setFont(AppletConstants.NORMAL_FONT);
    selectCaseBox.setSelectedIndex(-1);
    AppletConstants.buildConstraints(gbc,2,0,1,1,1,0);
    gbc.anchor=GridBagConstraints.WEST;
    gbc.fill=GridBagConstraints.NONE;
    layout.setConstraints(selectCaseBox,gbc);
    add(selectCaseBox);

    makeCasePanel();

    buttonBox=Box.createHorizontalBox();
    if(editable)
    {
      deleteButton=new JButton("Delete");
      deleteButton.addActionListener(new AppletActionListener("delete",this));
      buttonBox.add(deleteButton);
      buttonBox.add(Box.createHorizontalStrut(5));
      newButton=new JButton("New");
      newButton.addActionListener(new AppletActionListener("newCase",this));
      buttonBox.add(newButton);
      buttonBox.add(Box.createHorizontalStrut(5));
    }
    testButton=new JButton("Test");
    testButton.addActionListener(new AppletActionListener("test",this));
    buttonBox.add(testButton);
    AppletConstants.buildConstraints(gbc,0,2,3,1,0,1);
    gbc.anchor=GridBagConstraints.CENTER;
    gbc.fill=GridBagConstraints.NONE;
    layout.setConstraints(buttonBox,gbc);
    add(buttonBox);

    comboChangeListener=new AppletActionListener("selectCase",this); 
    selectCaseBox.addActionListener(comboChangeListener);
  }

  /**
   * Sets up the panel to display a single case, the currentCase
   */
  private void makeCasePanel()
  {
    if(casePanel!=null) 
    {
      remove(casePanel);
      layout.removeLayoutComponent(casePanel);
    }
    casePanel=new JPanel();
    casePanelLayout=new GridBagLayout();
    casePanel.setLayout(casePanelLayout);

    //put on fields to fill
    if(currentCase>=0)  
    {
      int y=0;

      paramValueField=new JTextField[paramTypes.size()];
      paramTypeLabel=new JLabel[paramTypes.size()];
      int i=0;
      gbc.anchor=GridBagConstraints.WEST;
      gbc.fill=GridBagConstraints.HORIZONTAL;
      //make a type: value for each param type
      for(i=0;i<paramTypes.size();i++)
      {
        paramTypeLabel[i]=new JLabel(paramTypes.get(i).toString());
        paramTypeLabel[i].setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc,0,y,1,1,1,1);
        casePanelLayout.setConstraints(paramTypeLabel[i],gbc);
        casePanel.add(paramTypeLabel[i]);

        paramValueField[i]=new JTextField();
        paramValueField[i].setFont(AppletConstants.FIXED_WIDTH_FONT);
        paramValueField[i].setEditable(editable);
        AppletConstants.buildConstraints(gbc,1,y++,1,1,100,1);
        casePanelLayout.setConstraints(paramValueField[i],gbc);
        casePanel.add(paramValueField[i]);
      }

      JLabel spaceLabel=new JLabel("");
      AppletConstants.buildConstraints(gbc,0,y++,2,1,0,100);
      gbc.fill=GridBagConstraints.BOTH;
      casePanelLayout.setConstraints(spaceLabel,gbc);
      casePanel.add(spaceLabel);

      //put default values in fields 
      try
      {
        if(currentCase<testCases.size()) 
        {
          Object[]acase=(Object[])testCases.get(currentCase);
          ArrayList acaseStrings=AppletConstants.uncastArgs(paramTypes,acase);
          for(i=0;i<paramTypes.size();i++)
            paramValueField[i].setText((String)acaseStrings.get(i));
        }
      }
      catch(Exception e)
      {
        if(paramValueField.length>0)
        {
          paramValueField[0].setText(e.toString());
        }
      }
    } 
  
    AppletConstants.buildConstraints(gbc,0,1,3,1,0,100);
    gbc.fill=GridBagConstraints.BOTH;
    layout.setConstraints(casePanel,gbc);
    casePanel.setBorder(new EtchedBorder());
    add(casePanel);
  }

  /**
   * Allows the user to enter information about a new test case
   *
   * @param e The ActionEvent of clicking the "New" test case button.
   */
  public void newCase(ActionEvent e)
  {
    try
    {
      if(currentCase>=0) saveCurrentCase();
    }
    catch(IllegalArgumentException iae)
    {
      parentRoom.updateStatus("Illegal Arguments: "+iae.toString().substring(iae.toString().indexOf(" ")+1),true);
      return;
    }
    title.setText("Test Cases ("+(testCases.size()+1)+"):");
    selectCaseBox.removeActionListener(comboChangeListener);
    currentCase=testCases.size();
    selectCaseBox.addItem(currentCase+"");
    selectCaseBox.setSelectedIndex(currentCase);
    makeCasePanel();    
    parentRoom.reDraw();
    selectCaseBox.addActionListener(comboChangeListener);
  }

  /**
   * Saves the case the user is currently working on in the ArrayList in this class,
   * not the server.  Throws an exception if any of the parameters do not cast too well.
   */
  private void saveCurrentCase()
  {
    if (currentCase<0) return;
    ArrayList args=new ArrayList();
    for(int i=0;i<paramValueField.length;i++)
      args.add(paramValueField[i].getText());
    Object[]castedArgs;
    castedArgs=AppletConstants.castArgs(paramTypes,args);

    if(currentCase<testCases.size())
    {
      testCases.set(currentCase,castedArgs);
    }
    else
    {
      testCases.add(castedArgs);
    }
  }

  /**
   * Called when the user chooses a different case to view / edit from the ComboBox
   *
   * @param e The ComboBox choose event
   */
  public void selectCase(ActionEvent e)
  {
    try
    {
      if(currentCase>=0&&currentCase!=selectCaseBox.getSelectedIndex()) saveCurrentCase();
    }
    catch(IllegalArgumentException iae)
    {
      selectCaseBox.setSelectedIndex(currentCase);
      parentRoom.updateStatus("Illegal Arguments: "+iae.toString().substring(iae.toString().indexOf(" ")+1),true);
      return;
    }

    title.setText("Test Cases ("+testCases.size()+"):");
    currentCase=selectCaseBox.getSelectedIndex();
    makeCasePanel();
    parentRoom.reDraw();
  }

  /**
   * Deletes the current test case.
   *
   * @param e The action of the user pressing the delete button
   */
  public void delete(ActionEvent e)
  {
    selectCaseBox.removeActionListener(comboChangeListener);
    if(currentCase<0||currentCase>testCases.size()) 
    {
      parentRoom.updateStatus("There is nothing to delete.",true);
      return;
    }

    if(currentCase<testCases.size())  //if equal, it means user is deleting a new test case, not in arraylist
    {
      testCases.remove(currentCase);
    }
    title.setText("Test Cases ("+testCases.size()+"):");
    selectCaseBox.removeItemAt(testCases.size()); 
    currentCase=-1;
    selectCaseBox.setSelectedIndex(currentCase);
    parentRoom.updateStatus("Test case deleted.",false);
    makeCasePanel();    
    parentRoom.reDraw();
    selectCaseBox.addActionListener(comboChangeListener);
  }

  /**
   * Sends a test request to the server to test the current test case.
   *
   * @param ActionEvent e  The user clicking the Test button.
   */
  public void test(ActionEvent e)
  {
    if(currentCase<0||currentCase>testCases.size()) 
    {
      parentRoom.updateStatus("There is nothing to test.",true);
      return;
    }

    try
    {
      saveCurrentCase();
    }
    catch(IllegalArgumentException iae)
    {
      parentRoom.updateStatus("Illegal Arguments: "+iae.toString().substring(iae.toString().indexOf(" ")+1),true);
      return;
    }

    parentRoom.submitTest((Object[])testCases.get(currentCase));
  }

  /**
   * Returns the ArrayList of test cases, with all the changes the user has made since
   * they have been set.
   *
   * @throws IllegalArgumentException if the current viewed test case does not have legal args
   */
  public ArrayList getTestCases()
  {
    try
    {
      saveCurrentCase();
    }
    catch(IllegalArgumentException iae)
    {
      parentRoom.updateStatus("Illegal Test Case Arguments: "+iae.toString().substring(iae.toString().indexOf(" ")+1),true);
      throw iae;
    }
    return testCases;
  }

  private GridBagLayout layout;
  private GridBagConstraints gbc;

  private JLabel title;
  private JLabel selectCaseLabel;
  private JComboBox selectCaseBox;
  private AppletActionListener comboChangeListener;
  private JPanel casePanel;
  private GridBagLayout casePanelLayout;
  private JLabel[] paramTypeLabel;
  private JTextField[] paramValueField;
  private Box buttonBox;
  private JButton deleteButton;
  private JButton testButton;
  private JButton newButton;

  private ViewProblemRoom parentRoom;
  private boolean editable;
  private ArrayList paramTypes;
  private String returnType;
  private ArrayList testCases;
  private int currentCase;
}
