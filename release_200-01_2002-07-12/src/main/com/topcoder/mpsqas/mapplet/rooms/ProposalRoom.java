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
import java.util.*;

/**
 * The ProposalRoom is the room a user can propose a problem statement
 * idea through. The user will enter some general information
 * about the problem, and then wil submit it for approval.
 *
 * @author mitalub
 */
public class ProposalRoom extends Room
{
  /**
   * The constructor stores a little information and calls init() to do
   * up the room.
   *
   * @param holder     The RoomHolder of the room.
   * @param mainApplet The MainApplet
   */
  public ProposalRoom(RoomHolder holder,MainApplet mainApplet)
  {
    super(holder,mainApplet);
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
    problemPanel=new StatementPanel(true);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,100);
    layout.setConstraints(problemPanel,gbc);
    problemPanel.setTitle("Propose Problem:");
    add(problemPanel);

    gbc.insets=new Insets(5,5,5,5);

    submitButton=new JButton("Submit");
    cancelButton=new JButton("Cancel");
    buttonBox=Box.createHorizontalBox();
    buttonBox.add(submitButton);
    buttonBox.add(Box.createHorizontalStrut(20));
    buttonBox.add(cancelButton);
    AppletConstants.buildConstraints(gbc,0,1,1,1,0,1);
    gbc.fill=GridBagConstraints.NONE;
    gbc.anchor=GridBagConstraints.CENTER;
    layout.setConstraints(buttonBox,gbc);
    add(buttonBox);

    mainApplet.getStatusBox().appendMessage(
            "Enter information about your problem proposal.", false);

    submitButton.addActionListener(new AppletActionListener("sendProposal",this));
  }

  /**
   * When room is displayed, this method is called to give focus
   * to the correct place (the classNameField).
   */
  public void giveFocus()
  {
    problemPanel.giveFocus();
  }

  /**
   * sendProposal puts together the proposal information and sends the information to the server.
   * It is called when the submitButton is pressed.
   *
   * @param e The event causing this method to be called.
   */
  public void sendProposal(ActionEvent e)
  {
    boolean valid = true;
    updateStatus("Sending proposal to server...",false);
    roomHolder.updateView();
    ProblemInformation proposal=new ProblemInformation(problemPanel.getClassName());
    proposal.setMethodName(problemPanel.getMethodName());
    proposal.setParamTypes(problemPanel.getParamTypes());
    proposal.setReturnType(problemPanel.getReturnType());
    proposal.setProblemStatement(problemPanel.getProblemStatement());
    try
    {
      proposal.setDifficultyLevel(problemPanel.getDifficultyLevel());
      proposal.setDivision(problemPanel.getDivision());
    }
    catch(Exception noDiffSelection)
    {
      //difficulty level not seleted
      valid = false;
      updateStatus("Please select a difficulty.", true);
    }

    if(valid)
    {
      ArrayList data=new ArrayList();
      data.add(new Integer(MessageTypes.PROPOSAL_RQ));
      data.add(proposal);
      mainApplet.sendToServer(data);
    }
  }

  //layout
  private GridBagLayout layout;
  private GridBagConstraints gbc;
 
  //components 
  private JButton submitButton;
  private JButton cancelButton;
  private Box buttonBox;
  StatementPanel problemPanel;

  //data
}
