package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.components.*;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

/**
 * ViewProblemRoom is a powerful room in which the problem writer can edit,
 * submit, and resubmit the problem, and admins / problem testers can test the
 * problem.
 *
 * @author mitalub
 */
public class ViewProblemRoom extends Room {
    /**
     * The constructor stores some information and then calls init to do up the window.
     *
     * @param holder The applet's RoomHolder.
     * @param ma     The applet's MainApplet.
     * @param info   ProblemInformation for the problem
     * @param panels An ArrayList of Integers (from MessageTypes) representing which panels the user gets
     * @param pseditable boolean whether the user should be able to edit problem statement
     * @param soeditable boolean whether the user should be able to edit solution (and get submit button)
     * @param statusMessage The initial status message
     * @param users List of current users logged into problem.
     */
    public ViewProblemRoom(RoomHolder holder, MainApplet ma, ProblemInformation info,
                           ArrayList panels, boolean pseditable, boolean soeditable,
                           String status, ArrayList users) {
        super(holder, ma);
        this.statusMessage = status;
        this.problemInformation = info;
        this.displayedPanels = panels;
        this.pseditable = pseditable;
        this.soeditable = soeditable;
        this.users = users;
        layout = new GridBagLayout();
        gbc = new GridBagConstraints();
        setLayout(layout);
        init();
    }

    /**
     * This constuctor is called if it is going to have an admin panel, stores a bit more info.
     *
     * @param holder The applet's RoomHolder.
     * @param ma     The applet's MainApplet.
     * @param info   ProblemInformation for the problem
     * @param panels An ArrayList of Integers (from MessageTypes) representing which panels the user gets
     * @param pseditable boolean whether the user should be able to edit problem statement
     * @param soeditable boolean whether the user should be able to edit solution
     *                                            (and get submit button)
     * @param statusMessage The initial status message
     * @param testers A list of all possible testers, and some info about them. (handle, scheduled, id)
     * @param users List of current users logged into problem.
     */
    public ViewProblemRoom(RoomHolder holder, MainApplet ma, ProblemInformation info,
                           ArrayList panels, boolean pseditable, boolean soeditable, String statusMessage,
                           ArrayList testers, ArrayList users) {
        super(holder, ma);
        this.statusMessage = statusMessage;
        this.problemInformation = info;
        this.displayedPanels = panels;
        this.pseditable = pseditable;
        this.soeditable = soeditable;
        this.users = users;
        this.testers = testers;
        layout = new GridBagLayout();
        gbc = new GridBagConstraints();
        setLayout(layout);
        init();
    }


    /**
     * init creates all the components and lays it all out on the window.
     */
    public void init() {
        int yIndex = 0; //keep track of current y stop in grid
        title = new JLabel("View Problem (" + problemInformation.getClassName() + "):");
        title.setFont(AppletConstants.HEADER_FONT);
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.NONE;
        AppletConstants.buildConstraints(gbc, 0, yIndex++, 1, 1, 1, 1);
        layout.setConstraints(title, gbc);
        add(title);

        problemPane = new JTabbedPane();
        problemPane.setFont(AppletConstants.NORMAL_FONT);

        int i,panelType;
        JPanel toAdd;
        String panelTitle;
        for (i = 0; i < displayedPanels.size(); i++) {
            panelType = ((Integer) displayedPanels.get(i)).intValue();
            toAdd = null;
            panelTitle = null;
            switch (panelType) {
                case MessageTypes.PROBLEM_STATEMENT_PANEL:
                    this.statementPanel = new StatementPanel(pseditable);
                    this.statementPanel.setClassName(problemInformation.getClassName());
                    this.statementPanel.setMethodName(problemInformation.getMethodName());
                    this.statementPanel.setParamTypes(problemInformation.getParamTypesString());
                    this.statementPanel.setReturnType(problemInformation.getReturnType());
                    this.statementPanel.setProblemStatement(problemInformation.getProblemStatement());
                    this.statementPanel.setDifficultyLevel(problemInformation.getDifficultyLevel());
                    this.statementPanel.setDivision(problemInformation.getDivision());
                    toAdd = this.statementPanel;
                    panelTitle = "Problem Statement";
                    break;
                case MessageTypes.SOLUTION_PANEL:
                    String solutionString = "";
                    if (problemInformation.getSolution() != null) {
                        solutionString = problemInformation.getSolution().getText();
                    }
                    this.solutionPanel = new SolutionPanel(this, soeditable,
                            problemInformation.getClassName() + ".java",
                            solutionString);
                    toAdd = this.solutionPanel;
                    panelTitle = "Solution";
                    break;
                case MessageTypes.ALL_SOLUTION_PANEL:
                    this.allSolutionPanel = new AllSolutionPanel(this, mainApplet,
                            problemInformation.getAllSolutions(), soeditable);
                    toAdd = this.allSolutionPanel;
                    panelTitle = "All Solutions";
                    break;
                case MessageTypes.TEST_CASES_PANEL:
                    this.testCasePanel = new TestCasePanel(this, soeditable, problemInformation.getParamTypes(),
                            problemInformation.getReturnType(), problemInformation.getTestCases());
                    toAdd = this.testCasePanel;
                    panelTitle = "Test Cases";
                    break;
                case MessageTypes.CORRESPONDENCE_PANEL:
                    this.correspondencePanel = new CorrespondencePanel(this,
                            problemInformation.getCorrespondence());
                    toAdd = this.correspondencePanel;
                    panelTitle = "Correspondence";
                    break;
                case MessageTypes.APPROVAL_PANEL:
                    this.approvalPanel = new ApprovalPanel(this);
                    toAdd = this.approvalPanel;
                    panelTitle = "Approval";
                    break;
                case MessageTypes.ADMIN_PROBLEM_PANEL:
                    this.adminProblemPanel = new AdminProblemPanel(mainApplet, this, problemInformation, testers);
                    toAdd = this.adminProblemPanel;
                    panelTitle = "Admin";
                    break;
                case MessageTypes.CHAT_PANEL:
                    this.chatPanel = new ChatPanel(mainApplet, users);
                    toAdd = this.chatPanel;
                    panelTitle = "Chat";
                    break;
                default:
            }
            if (toAdd != null) problemPane.addTab(panelTitle, toAdd);
        }

        gbc.fill = GridBagConstraints.BOTH;
        AppletConstants.buildConstraints(gbc, 0, yIndex++, 1, 1, 0, 100);
        layout.setConstraints(problemPane, gbc);
        add(problemPane);

        buttonBox = Box.createHorizontalBox();

        if (soeditable) {
            if (pseditable) {
                submitStatementButton = new JButton("Save Statement Only");
                buttonBox.add(submitStatementButton);
                buttonBox.add(Box.createHorizontalStrut(5));
                submitStatementButton.addActionListener(new AppletActionListener("submitStatement", this));
            }

            submitButton = new JButton("Submit");
            submitButton.addActionListener(new AppletActionListener("submitProblem", this));
            buttonBox.add(submitButton);
        }

        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.EAST;
        AppletConstants.buildConstraints(gbc, 0, yIndex++, 1, 1, 0, 1);
        layout.setConstraints(buttonBox, gbc);
        add(buttonBox);

        mainApplet.getStatusBox().appendMessage(statusMessage, false);

    }

    /**
     * sendMessage sends a correspondence message to the server.
     *
     * @param message The message to send
     */
    public void sendMessage(Correspondence message) {
        updateStatus("Sending message to server...", false);
        ArrayList messageRequest = new ArrayList(2);
        messageRequest.add(new Integer(MessageTypes.SEND_CORRESPONDENCE_RQ));
        messageRequest.add(message);
        mainApplet.sendToServer(messageRequest);
    }

    /**
     * submitProblem is called when the user clicks the Submit Problem button.  It makes
     * a ProblemInformation of the current screen and submits it to the server
     *
     * @param e The event of clicking the button
     */
    public void submitProblem(ActionEvent e) {
        updateStatus("Sending problem to server...", false);
        ProblemInformation info;
        try {
            info = getProblemInformation();
            if (info == null) {
                throw new NullPointerException();
            }
            ArrayList submitProblemRequest = new ArrayList(2);
            submitProblemRequest.add(new Integer(MessageTypes.SUBMIT_PROBLEM_RQ));
            submitProblemRequest.add(info);
            mainApplet.sendToServer(submitProblemRequest);
        } catch (IllegalArgumentException iae) {
            //if the user currently has illegal arguements as test cases, they must be fixed.
        } catch (NullPointerException npe) {
            //user must select difficult level
        }
    }

    /**
     * Called when user clicks Save Statement Only. It sends a SAVE_PROBLEM_STATEMENT_RQ
     * to the server.
     *
     * @param e The event of clicking the button
     */
    public void submitStatement(ActionEvent e) {
        updateStatus("Sending statement to server...", false);
        String problemStatement = statementPanel.getProblemStatement();
        ArrayList request = new ArrayList();
        request.add(new Integer(MessageTypes.SUBMIT_PROBLEM_STATEMENT_RQ));
        request.add(problemStatement);
        mainApplet.sendToServer(request);
    }

    /**
     * getProblemInformation turns the values on the current screen into a ProblemInformation.
     * It gets as much information as it can from all the panel which are not null.  It may
     * throw an Exception if any panels do not want to give up their data (Illegal Test Case
     * arguments, for example)
     */
    private ProblemInformation getProblemInformation() {
        ProblemInformation info = new ProblemInformation(statementPanel.getClassName());
        boolean valid = true;

        if (statementPanel != null) {
            info.setMethodName(statementPanel.getMethodName());
            info.setParamTypes(statementPanel.getParamTypes());
            info.setReturnType(statementPanel.getReturnType());
            info.setProblemStatement(statementPanel.getProblemStatement());
            try {
                info.setDifficultyLevel(statementPanel.getDifficultyLevel());
                info.setDivision(statementPanel.getDivision());
            } catch (Exception noDiffSelected) {
                //no difficulty level selected
                updateStatus("Please select a difficulty level.", true);
                valid = false;
                info = null;
            }
        }
        if (solutionPanel != null && valid) {
            SolutionInformation solutionInfo = new SolutionInformation();
            solutionInfo.setText(solutionPanel.getCode());
            info.setSolution(solutionInfo);
        }
        if (testCasePanel != null && valid) {
            info.setTestCases(testCasePanel.getTestCases());
        }

        return info;
    }

    /**
     * compile is called when the user tries to complile their code. It puts together
     * a problem information and sends it to the server for processing.
     *
     * @param e The ActionEvent of the button press causing this method to be called
     */
    public void compile(ActionEvent e) {
        updateStatus("Compiling...", false);
        ArrayList compileRequest = new ArrayList();
        compileRequest.add(new Integer(MessageTypes.COMPILE_RQ));
        ProblemInformation info = getProblemInformation();
        if (info != null) {
            compileRequest.add(getProblemInformation());
            mainApplet.sendToServer(compileRequest);
        }  //else, user has to select valid difficulty level
    }

    /**
     * test pops up a window in which the user can enter arguments to test the code for the
     * problem.
     *
     * @param howMany Whether to test the user's one solution, or all the solutions.
     */
    public void test(int howMany) {
        if (popUp != null) popUp.dispose();
        popUp = new JFrame();
        Rectangle bounds = roomHolder.getBounds();
        Dimension winSize = roomHolder.getWinSize();
        boolean areArrays = false;
        popUp.setTitle("Test");
        popUp.setBounds((int) (bounds.x + bounds.width / 2 - winSize.getWidth() / 6),
                (int) (bounds.y + bounds.height / 2 - winSize.getHeight() / 6),
                (int) (winSize.getWidth() / 3),
                (int) (winSize.getHeight() / 3));
        contentPane = popUp.getContentPane();
        popUpLayout = new GridBagLayout();
        contentPane.setLayout(popUpLayout);

        paramValueField = new JTextField[problemInformation.getParamTypes().size()];
        paramTypeLabel = new JLabel[problemInformation.getParamTypes().size()];
        int i = 0;
        for (i = 0; i < problemInformation.getParamTypes().size(); i++) {
            if (problemInformation.getParamTypes().get(i).toString().indexOf("[]") != -1) areArrays = true;

            paramTypeLabel[i] = new JLabel(problemInformation.getParamTypes().get(i).toString());
            paramTypeLabel[i].setFont(AppletConstants.NORMAL_FONT);
            gbc.anchor = GridBagConstraints.WEST;
            gbc.fill = GridBagConstraints.HORIZONTAL;
            AppletConstants.buildConstraints(gbc, 0, i, 1, 1, 1, 1);
            popUpLayout.setConstraints(paramTypeLabel[i], gbc);
            contentPane.add(paramTypeLabel[i]);

            paramValueField[i] = new JTextField();
            paramValueField[i].setFont(AppletConstants.FIXED_WIDTH_FONT);
            AppletConstants.buildConstraints(gbc, 1, i, 1, 1, 100, 1);
            popUpLayout.setConstraints(paramValueField[i], gbc);
            contentPane.add(paramValueField[i]);
        }

        if (areArrays) {
            JTextArea help = new JTextArea(AppletConstants.ARRAY_HELP);
            help.setEditable(false);
            help.setLineWrap(true);
            help.setWrapStyleWord(true);
            help.setFont(AppletConstants.NORMAL_FONT);
            JScrollPane helpPane = new JScrollPane(help, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
            gbc.fill = GridBagConstraints.BOTH;
            AppletConstants.buildConstraints(gbc, 0, i++, 2, 1, 0, 100);
            popUpLayout.setConstraints(helpPane, gbc);
            contentPane.add(helpPane);
        } else {
            JPanel spacer = new JPanel();
            AppletConstants.buildConstraints(gbc, 0, i++, 2, 1, 0, 100);
            gbc.fill = GridBagConstraints.BOTH;
            popUpLayout.setConstraints(spacer, gbc);
            contentPane.add(spacer);
        }

        popUpOkButton = new JButton("Test");
        gbc.anchor = GridBagConstraints.CENTER;
        gbc.fill = GridBagConstraints.NONE;
        AppletConstants.buildConstraints(gbc, 0, i, 2, 1, 0, 1);
        popUpLayout.setConstraints(popUpOkButton, gbc);
        contentPane.add(popUpOkButton);

        popUpOkButton.addActionListener(new AppletActionListener("submitTest", this));
        this.testHowMany = howMany;

        popUp.setVisible(true);
    }

    /**
     * submiTest is called after a user enters the test arguments and sends the test to the server.
     *
     * @param e The actionevent of the user hitting the test button.
     */
    public void submitTest(ActionEvent e) {
        popUp.dispose();
        if (popUp == null) return;
        ArrayList args = new ArrayList();
        for (int i = 0; i < paramValueField.length; i++)
            args.add(paramValueField[i].getText());
        Object[] castedArgs;
        try {
            castedArgs = AppletConstants.castArgs(problemInformation.getParamTypes(), args);
        } catch (Exception ex) {
            updateStatus("Error casting args:\n " + ex.toString(), true);
            return;
        }
        submitTest(castedArgs);
    }

    /**
     * Submits a test request to the server with the data passed as arguments.
     *
     * @param args  The arguements with which to test.
     */
    public void submitTest(Object[] args) {
        updateStatus("Testing...", false);
        ArrayList testRequest = new ArrayList();
        testRequest.add(new Integer(MessageTypes.TEST_RQ));
        testRequest.add(args);
        testRequest.add(new Integer(testHowMany));
        mainApplet.sendToServer(testRequest);
    }

    /**
     * sendReplyToProposal puts together a proposal reply request to send to the server.
     *
     * @param e The ActionEvent causing this method to be called.
     */
    public void sendReplyToProposal(ActionEvent e) {
        updateStatus("Sending reply to server...", false);

        ArrayList proposalReplyRequest = new ArrayList();
        proposalReplyRequest.add(new Integer(MessageTypes.PENDING_REPLY_RQ));
        proposalReplyRequest.add(new Boolean(approvalPanel.isApproved()));
        proposalReplyRequest.add(approvalPanel.getComments());
        mainApplet.sendToServer(proposalReplyRequest);
    }

    /**
     * Calls the correspondencePanel to add a correspondence message to the problem.
     *
     * @param message Correspondence to add.
     */
    public void addCorrespondence(Correspondence message) {
        updateStatus("New Correspondence!", true);
        correspondencePanel.addCorrespondence(message);
    }

    /**
     * Updates the status to let the user know the problem was modified and
     * disallows submissions until the room is reloaded.
     *
     * @param message Message with which to update status window.
     */
    public void problemWasModified(String message) {
        updateStatus(message, true);
        if (submitButton != null) submitButton.setEnabled(false);
        if (submitStatementButton != null) submitStatementButton.setEnabled(false);
    }

    /**
     * Adds a chat message to the chat panel.
     *
     * @param message Chat to add
     */
    public void addChat(String message) {
        chatPanel.addChat(message);
    }

    /**
     * Calls the ChatPanel to change the user list.
     *
     * @param users The new user list.
     */
    public void setUserList(ArrayList users) {
        chatPanel.setUserList(users);
    }

    /**
     * Calls the room holder to redraw the screen.
     */
    public void reDraw() {
        roomHolder.updateView();
    }

    /**
     * Closes the pop up if it exists.
     */
    public void kill() {
        if (popUp != null) {
            popUp.setVisible(false);
        }
    }

    //layout:
    private GridBagLayout layout;
    private GridBagConstraints gbc;

    //components:
    private JLabel title;
    private JTabbedPane problemPane;
    private JButton submitStatementButton;
    private JButton submitButton;
    private Box buttonBox;
    private StatementPanel statementPanel;
    private SolutionPanel solutionPanel;
    private CorrespondencePanel correspondencePanel;
    private ApprovalPanel approvalPanel;
    private TestCasePanel testCasePanel;
    private AllSolutionPanel allSolutionPanel;
    private AdminProblemPanel adminProblemPanel;
    private ChatPanel chatPanel;

    //pop up window
    private GridBagLayout popUpLayout;
    private JFrame popUp;
    private JTextArea popUpArea;
    private JScrollPane popUpAreaScrollPane;
    private JButton popUpOkButton;
    private Container contentPane;
    private JTextField[] paramValueField;
    private JLabel[] paramTypeLabel;

    //data:
    private ArrayList users;
    private ArrayList displayedPanels;
    private ProblemInformation problemInformation;
    private String statusMessage;
    private boolean soeditable;
    private boolean pseditable;
    private int testHowMany;
    private ArrayList testers;
}
