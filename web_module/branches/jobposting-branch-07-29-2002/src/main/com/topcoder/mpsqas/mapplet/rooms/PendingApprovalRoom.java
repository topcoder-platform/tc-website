package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.mapplet.widgets.*;
import com.topcoder.mpsqas.mapplet.components.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.mapplet.messaging.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.border.*;
import java.util.*;

/**
 * PendingApprovalRoom is a class containing the information to control a rool
 * in which admins can view proposals / submissions that are pending approval
 *
 * @author mitalub 
 */
public class PendingApprovalRoom extends Room
{
  /**
   * The constructor calls to super constructor to store the room holder
   * information and then calls init to put together the window. And parses
   * the passed data
   *
   * @param holder   The RoomHolder of the room.
   * @param mainApplet The main applet
   * @param pprops  ArrayList of pending problems.
   * @param psubs ArrayList of pending submissions.
   */
  public PendingApprovalRoom(RoomHolder holder, MainApplet mainApplet,
                             ArrayList pprops, ArrayList psubs)
  {
    super(holder,mainApplet);
    proposals = pprops;
    submissions = psubs;
    init();
  }

  /**
   * init makes the window components and lays them out.
   */
  public void init()
  {
    int i,j;

    layout=new GridBagLayout();
    gbc=new GridBagConstraints();
    setLayout(layout);

    proposalTitleLabel=new JLabel("Proposals Pending Approval (" +
                                  proposals.size() + "):");
    proposalTitleLabel.setFont(AppletConstants.HEADER_FONT);
    gbc.insets=new Insets(5,5,5,5);
    gbc.anchor=GridBagConstraints.WEST;
    AppletConstants.buildConstraints(gbc,0,0,1,1,80,1);
    layout.setConstraints(proposalTitleLabel,gbc);
    add(proposalTitleLabel);

    proposalTable = new SortableTable(AppletConstants.PENDING_APPROVAL_COLS,
                                      getTableData(proposals),
                                      AppletConstants.PENDING_APPROVAL_COLS_WIDTHS);

    proposalPane=new JScrollPane(proposalTable,
                                 JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                 JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,1,2,1,0,100);
    layout.setConstraints(proposalPane,gbc);
    proposalPane.setBorder(new BevelBorder(BevelBorder.LOWERED));
    add(proposalPane);

    viewProposalButton=new JButton("View Proposal");
    gbc.fill=GridBagConstraints.HORIZONTAL;
    AppletConstants.buildConstraints(gbc,1,2,1,1,20,1);
    layout.setConstraints(viewProposalButton,gbc);
    add(viewProposalButton);

    submissionPendingLabel=new JLabel("Submissions Pending Approval ("+submissions.size()+"):");
    submissionPendingLabel.setFont(AppletConstants.HEADER_FONT);
    AppletConstants.buildConstraints(gbc,0,3,1,1,0,1);
    layout.setConstraints(submissionPendingLabel,gbc);
    add(submissionPendingLabel);

    submissionTable = new SortableTable(AppletConstants.PENDING_APPROVAL_COLS,
                                        getTableData(submissions),
                                        AppletConstants.PENDING_APPROVAL_COLS_WIDTHS);
    submissionPane=new JScrollPane(submissionTable,
                                   JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                   JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,4,2,1,0,100);
    layout.setConstraints(submissionPane,gbc);
    submissionPane.setBorder(new BevelBorder(BevelBorder.LOWERED));
    add(submissionPane);
     
    viewSubmissionButton=new JButton("View Submission");
    gbc.fill=GridBagConstraints.HORIZONTAL;
    AppletConstants.buildConstraints(gbc,1,5,1,1,0,1);
    layout.setConstraints(viewSubmissionButton,gbc);
    add(viewSubmissionButton);

    mainApplet.getStatusBox().appendMessage("Select a pending proposal or submission to view.", false);

    proposalTable.addMouseListener(new AppletMouseListener("proposalRowClicked",this,"mouseClicked"));
    viewProposalButton.addActionListener(new AppletActionListener("proposalButtonClicked",this));

    submissionTable.addMouseListener(new AppletMouseListener("submissionRowClicked",this,"mouseClicked"));
    viewSubmissionButton.addActionListener(new AppletActionListener("submissionButtonClicked",this));
  }

  /**
   * proposalRowClicked is called when a row in the proposal table is clicked.  If the click is
   * a double click, it tried to open the proposal
   *
   * @param e The mouse event causing the method to be called.
   */
  public void proposalRowClicked(MouseEvent e)
  {
    if(e.getClickCount()==2)
      loadProposal();
  }

  /**
   * proposalButtonClicked is called when a row in the proposal button is clicked. 
   * It tried to open the proposal
   *
   * @param e The action event causing the method to be called.
   */
  public void proposalButtonClicked(ActionEvent e)
  {
    loadProposal();
  }

  /**
   * loadProposal loads the currently selected proposal.
   */
  private void loadProposal()
  {
    mainApplet.loadMovingRoom();
    int row=proposalTable.getSelectedRow();
    if(row >= 0)
    {
      ArrayList proposalRequest=new ArrayList();
      proposalRequest.add(new Integer(MessageTypes.MOVE_RQ));
      proposalRequest.add(new Integer(MessageTypes.VIEW_PROBLEM_ROOM));
      //XXX: -problemId to applet server knows to give the proposal reply panel
      proposalRequest.add(new Integer(-((ProblemInformation)
                                proposals.get(row)).getProblemId()));
      mainApplet.sendToServer(proposalRequest);
   } 
  }

  /**
   * submissionRowClicked is called when a row in the submission table is clicked.  If the click is
   * a double click, it tried to open the proposal
   *
   * @param e The mouse event causing the method to be called.
   */
  public void submissionRowClicked(MouseEvent e)
  {
    if(e.getClickCount()==2)
    {
      loadSubmission();
    }
  }

  /**
   * submissionButtonClicked is called when a row in the submission button is clicked. 
   * It tried to open the submission. 
   *
   * @param e The action event causing the method to be called.
   */
  public void submissionButtonClicked(ActionEvent e)
  {
    loadSubmission();
  }

  /**
   * loadSubmission loads the currently selected submission.
   */
  private void loadSubmission()
  {
    mainApplet.loadMovingRoom();
    int row=submissionTable.getSelectedRow();
    if(row >= 0)
    {
      ArrayList submissionRequest=new ArrayList();
      submissionRequest.add(new Integer(MessageTypes.MOVE_RQ));
      submissionRequest.add(new Integer(MessageTypes.VIEW_PROBLEM_ROOM));
      //XXX: -problemId so server knows to give reply panel
      submissionRequest.add(new Integer(-((ProblemInformation)
                                submissions.get(row)).getProblemId()));
      mainApplet.sendToServer(submissionRequest);
    }
  }

  /**
   * Updates the pending approval table.
   * 
   * @param info New pending approval table.
   */
  public void addProposal(ArrayList info)
  {
    proposals=info;
    proposalTable.setData(getTableData(proposals));
    updateStatus("Proposal Table Update!",false);
    proposalTitleLabel.setText("Proposals Pending Approval ("+proposals.size()+"):");
  }

  /**
   * Updates the pending submission table.
   *
   * @param info New pending submission table.
   */
  public void addSubmission(ArrayList info)
  {
    submissions=info;
    submissionTable.setData(getTableData(submissions));
    updateStatus("Submission Table Update!",false);
    submissionPendingLabel.setText("Submissions Pending Approval ("+submissions.size()+"):");
  }

  /**
   * Returns an Object[][] containing the table data from the ArrayList
   * of ProblemInformation Objects.
   */
  private Object[][] getTableData(ArrayList problemInfos)
  {
    int i,j;
    Object[][]tableData=new Object[problemInfos.size()][6];
    ProblemInformation problemInfo;
    for(i=0;i<problemInfos.size();i++)
    {
      problemInfo = (ProblemInformation)problemInfos.get(i);
      tableData[i][0] = problemInfo.getWriter().getHandle();
      tableData[i][1] = problemInfo.getTimestamp();
      tableData[i][2] = problemInfo.getClassName();
      tableData[i][3] = problemInfo.getMethodName();
      tableData[i][4] = MessageTypes.getDivisionName(problemInfo.getDivision());
      tableData[i][5] = MessageTypes.getDifficultyName(problemInfo.getDifficultyLevel());
    }

    return tableData;
  }

  private GridBagLayout layout; //the GridBagLayout used by the main room.
  private GridBagConstraints gbc;  //and its corresponding constraings

  //components:
  private JLabel proposalTitleLabel;
  private JLabel submissionPendingLabel;
  private SortableTable proposalTable;
  private SortableTable submissionTable;
  private JButton viewProposalButton;
  private JButton viewSubmissionButton;
  private JScrollPane proposalPane;
  private JScrollPane submissionPane;

  //data
  ArrayList proposals;
  ArrayList submissions;
}
