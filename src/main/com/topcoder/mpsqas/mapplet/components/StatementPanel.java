package com.topcoder.mpsqas.mapplet.components;

import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.mapplet.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import java.util.ArrayList;
import com.topcoder.mpsqas.common.*;

/**
 * The Statement is an panel in which a user can enter or
 * view all the generic information about the problem
 *
 * @author mitalub
 */
public class StatementPanel extends JPanel
{
  /**
   * The constructor stores calls init() to do
   * up the panel.
   *
   * @param editable  Boolean representing if the panel is to be editable
   */
  public StatementPanel(boolean editable)
  {
    layout=new GridBagLayout();
    setLayout(layout);
    gbc=new GridBagConstraints();
    init();
    changeComponentActive(editable);
  }

  /**
   * init lays out everything on the screen to prepare for action.
   */
  public void init()
  {

    title=new JLabel("Problem:");
    title.setFont(AppletConstants.HEADER_FONT);
    AppletConstants.buildConstraints(gbc,0,0,2,1,0,1);
    gbc.anchor=GridBagConstraints.WEST;
    gbc.insets=new Insets(5,5,5,5);
    layout.setConstraints(title,gbc);
    add(title);

    difficultyLevelLabel=new JLabel("Proposed Difficulty:");
    difficultyLevelLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,2,0,1,1,0,0);
    layout.setConstraints(difficultyLevelLabel,gbc);
    add(difficultyLevelLabel);

    divisionBox = new JComboBox();
    divisionBox.addItem("-----------------");
    for(int i=0; i<MessageTypes.DIVISION_NAMES.length; i++)
    {
      divisionBox.addItem(MessageTypes.DIVISION_NAMES[i]);
    }
    divisionBox.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,3,0,1,1,50,0);
    layout.setConstraints(divisionBox,gbc);
    add(divisionBox);

    difficultyLevelBox=new JComboBox();
    difficultyLevelBox.addItem("-----------------");
    for(int i=0; i<MessageTypes.DIFFICULTY_NAMES.length; i++)
    {
      difficultyLevelBox.addItem(MessageTypes.DIFFICULTY_NAMES[i]);
    }
    difficultyLevelBox.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,4,0,1,1,50,0);
    layout.setConstraints(difficultyLevelBox,gbc);
    add(difficultyLevelBox);


    classNameLabel=new JLabel("Class Name:");
    classNameLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,1,1,1,1,1);
    layout.setConstraints(classNameLabel,gbc);
    add(classNameLabel);

    methodNameLabel=new JLabel("Method Name:");
    methodNameLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,2,1,1,0,1);
    layout.setConstraints(methodNameLabel,gbc);
    add(methodNameLabel);

    paramTypeLabel=new JLabel("Param Types:");
    paramTypeLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,2,1,1,1,1,0);
    layout.setConstraints(paramTypeLabel,gbc);
    add(paramTypeLabel);
 
    returnTypeLabel=new JLabel("Return Type:");
    returnTypeLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,2,2,1,1,0,0);
    layout.setConstraints(returnTypeLabel,gbc);
    add(returnTypeLabel);

    classNameField=new JTextField();
    classNameField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,1,1,1,1,100,0);
    gbc.fill=GridBagConstraints.HORIZONTAL;
    layout.setConstraints(classNameField,gbc);
    add(classNameField);

    methodNameField=new JTextField();
    methodNameField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,1,2,1,1,0,0);
    layout.setConstraints(methodNameField,gbc);
    add(methodNameField);

    paramTypesField=new JTextField();
    paramTypesField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,3,1,2,1,0,0);
    layout.setConstraints(paramTypesField,gbc);
    add(paramTypesField);

    returnTypeField=new JTextField();
    returnTypeField.setFont(AppletConstants.FIXED_WIDTH_FONT);
    AppletConstants.buildConstraints(gbc,3,2,2,1,0,0);
    layout.setConstraints(returnTypeField,gbc);
    add(returnTypeField);

    problemStatementLabel=new JLabel("Problem Statement:");
    problemStatementLabel.setFont(AppletConstants.NORMAL_FONT);
    AppletConstants.buildConstraints(gbc,0,3,4,1,0,1);
    layout.setConstraints(problemStatementLabel,gbc);
    add(problemStatementLabel);

    problemStatementArea=new JTextArea();
    problemStatementArea.setFont(AppletConstants.FIXED_WIDTH_FONT);
    problemStatementArea.setLineWrap(true);
    problemStatementArea.setWrapStyleWord(true);
    problemStatementPanel=new JScrollPane(problemStatementArea,
                                          JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                          JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,4,5,1,0,100);
    layout.setConstraints(problemStatementPanel,gbc);
    add(problemStatementPanel);
    problemStatementPanel.setBorder(new BevelBorder(BevelBorder.LOWERED));

  }

  /**
   * When the panel is displayed, this method can be called to give focus
   * to the correct place (the classNameField).
   */
  public void giveFocus()
  {
    classNameField.grabFocus();
  }

  /**
   * changeComponentActive changes the enablement of all the components.
   *
   * @param status boolean indicating whether the components should or should not be active
   */
  public void changeComponentActive(boolean status)
  {
    difficultyLevelBox.setEnabled(status);
    divisionBox.setEnabled(status);
    classNameField.setEditable(status);
    methodNameField.setEditable(status);
    paramTypesField.setEditable(status);
    returnTypeField.setEditable(status);
    problemStatementArea.setEditable(status);
  }
  public void setTitle(String in)
  {
    title.setText(in);
  }

  public int getDifficultyLevel()
  {
    return MessageTypes.DIFFICULTY_IDS[
                       difficultyLevelBox.getSelectedIndex()-1];
  }

  public void setDifficultyLevel(int in)
  {
    int index;
    for(index = 0; index < MessageTypes.DIFFICULTY_IDS.length
                   && MessageTypes.DIFFICULTY_IDS[index] != in; index++);

    if (index >= MessageTypes.DIFFICULTY_IDS.length)
    {  //in is not a recognized difficulty id
       index = -1;
    }

    difficultyLevelBox.setSelectedIndex(index + 1);
  }

  public void setDivision(int in)
  {
    int index;
    for(index = 0; index < MessageTypes.DIVISION_IDS.length
                   && MessageTypes.DIVISION_IDS[index] != in; index++);

    if (index >= MessageTypes.DIVISION_IDS.length)
    {  //in is not a recognized divisionid
       index = -1;
    }

    divisionBox.setSelectedIndex(index + 1);
  }

  public int getDivision()
  {
    return MessageTypes.DIVISION_IDS[
                   divisionBox.getSelectedIndex() - 1];
  }

  public String getClassName()
  {
    return classNameField.getText();
  }

  public void setClassName(String in)
  {
    classNameField.setText(in);
  }

  public String getMethodName()
  {
    return methodNameField.getText();
  }
  
  public void setMethodName(String in)
  {
    methodNameField.setText(in);
  }

  public String getParamTypes()
  {
    return paramTypesField.getText();
  }

  public void setParamTypes(String in)
  {
    paramTypesField.setText(in);
  }

  public String getReturnType()
  {
    return returnTypeField.getText();
  }

  public void setReturnType(String in)
  {
    returnTypeField.setText(in);
  }

  public String getProblemStatement()
  {
    return problemStatementArea.getText();
  }

  public void setProblemStatement(String in)
  {
    problemStatementArea.setText(in);
  }  

  //layout
  private GridBagLayout layout;
  private GridBagConstraints gbc;
 
  //components 
  private JLabel title;
  private JLabel difficultyLevelLabel;
  private JLabel classNameLabel;
  private JLabel methodNameLabel;
  private JLabel paramTypeLabel;
  private JLabel returnTypeLabel;
  private JLabel statusLabel;
  private JComboBox difficultyLevelBox;
  private JComboBox divisionBox;
  private JTextField classNameField;
  private JTextField methodNameField;
  private JTextField paramTypesField;
  private JTextField returnTypeField;
  private JLabel problemStatementLabel;
  private JTextArea problemStatementArea;
  private JScrollPane problemStatementPanel;
}
