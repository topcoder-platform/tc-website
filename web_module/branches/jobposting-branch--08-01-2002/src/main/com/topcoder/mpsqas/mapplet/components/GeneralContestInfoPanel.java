package com.topcoder.mpsqas.mapplet.components;

import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;
import com.topcoder.mpsqas.mapplet.rooms.ViewContestRoom;

import javax.swing.*;
import javax.swing.border.BevelBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

/**
 * A panel in which a user can view some general information about a contest
 * such as the contest name, times, problem writers, and problem testers.
 *
 * @author mitalub
 */
public class GeneralContestInfoPanel extends JPanel {
    /**
     * The constructor stores the information and calls init to lay out the
     * components on the panel.
     *
     * @param mainApplet  The Applet's main applet.
     * @param parentRoom  The ViewContestRoom containing this panel
     * @param contestInfo The information of the contest this pane should display.
     */
    public GeneralContestInfoPanel(MainApplet mainApplet,
                                   ViewContestRoom parentRoom, ContestInformation contestInfo) {
        this.mainApplet = mainApplet;
        this.parentRoom = parentRoom;
        this.contestInfo = contestInfo;
        this.layout = new GridBagLayout();
        this.gbc = new GridBagConstraints();

        setLayout(layout);

        init();
    }

    /**
     * Creates, sets the constraints, and adds all the components to the panel.
     * Also, populates components with information in contestInfo.
     */
    private void init() {
        contestNameLabel = new JLabel("Contest Name:");
        contestNameLabel.setFont(AppletConstants.NORMAL_FONT);
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.anchor = GridBagConstraints.WEST;
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        layout.setConstraints(contestNameLabel, gbc);
        add(contestNameLabel);

        roundNameLabel = new JLabel("Round Name:");
        roundNameLabel.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 2, 0, 1, 1, 1, 0);
        layout.setConstraints(roundNameLabel, gbc);
        add(roundNameLabel);

        codingStartLabel = new JLabel("Coding Start:");
        codingStartLabel.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 0, 1, 1, 1, 0, 1);
        layout.setConstraints(codingStartLabel, gbc);
        add(codingStartLabel);

        codingEndLabel = new JLabel("Coding End:");
        codingEndLabel.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 2, 1, 1, 1, 0, 0);
        layout.setConstraints(codingEndLabel, gbc);
        add(codingEndLabel);

        challengeStartLabel = new JLabel("Challenge Start:");
        challengeStartLabel.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 0, 2, 1, 1, 0, 1);
        layout.setConstraints(challengeStartLabel, gbc);
        add(challengeStartLabel);

        challengeEndLabel = new JLabel("Challenge End:");
        challengeEndLabel.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 2, 2, 1, 1, 0, 0);
        layout.setConstraints(challengeEndLabel, gbc);
        add(challengeEndLabel);

        contestNameField = new JTextField(contestInfo.getContestName());
        contestNameField.setFont(AppletConstants.FIXED_WIDTH_FONT);
        contestNameField.setEditable(false);
        AppletConstants.buildConstraints(gbc, 1, 0, 1, 1, 100, 0);
        layout.setConstraints(contestNameField, gbc);
        add(contestNameField);

        roundNameField = new JTextField(contestInfo.getRoundName());
        roundNameField.setFont(AppletConstants.FIXED_WIDTH_FONT);
        roundNameField.setEditable(false);
        AppletConstants.buildConstraints(gbc, 3, 0, 1, 1, 100, 0);
        layout.setConstraints(roundNameField, gbc);
        add(roundNameField);

        codingStartField = new JTextField(contestInfo.getStartCoding());
        codingStartField.setFont(AppletConstants.FIXED_WIDTH_FONT);
        codingStartField.setEditable(false);
        AppletConstants.buildConstraints(gbc, 1, 1, 1, 1, 0, 0);
        layout.setConstraints(codingStartField, gbc);
        add(codingStartField);

        codingEndField = new JTextField(contestInfo.getEndCoding());
        codingEndField.setFont(AppletConstants.FIXED_WIDTH_FONT);
        codingEndField.setEditable(false);
        AppletConstants.buildConstraints(gbc, 3, 1, 1, 1, 0, 0);
        layout.setConstraints(codingEndField, gbc);
        add(codingEndField);

        challengeStartField = new JTextField(contestInfo.getStartChallenge());
        challengeStartField.setFont(AppletConstants.FIXED_WIDTH_FONT);
        challengeStartField.setEditable(false);
        AppletConstants.buildConstraints(gbc, 1, 2, 1, 1, 0, 0);
        layout.setConstraints(challengeStartField, gbc);
        add(challengeStartField);

        challengeEndField = new JTextField(contestInfo.getEndChallenge());
        challengeEndField.setFont(AppletConstants.FIXED_WIDTH_FONT);
        challengeEndField.setEditable(false);
        AppletConstants.buildConstraints(gbc, 3, 2, 1, 1, 0, 0);
        layout.setConstraints(challengeEndField, gbc);
        add(challengeEndField);

        problemWritersLabel = new JLabel("Problem Writers:");
        problemWritersLabel.setFont(AppletConstants.NORMAL_FONT);
        gbc.anchor = GridBagConstraints.NORTHWEST;
        gbc.fill = GridBagConstraints.NONE;
        AppletConstants.buildConstraints(gbc, 0, 3, 1, 1, 0, 0);
        layout.setConstraints(problemWritersLabel, gbc);
        add(problemWritersLabel);

        problemTestersLabel = new JLabel("Problem Testers:");
        problemTestersLabel.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 2, 3, 1, 1, 0, 0);
        layout.setConstraints(problemTestersLabel, gbc);
        add(problemTestersLabel);

        problemWritersList = new JList(getWritersArray());
        problemWritersPane = new JScrollPane(problemWritersList);
        AppletConstants.buildConstraints(gbc, 1, 3, 1, 1, 0, 100);
        gbc.fill = GridBagConstraints.BOTH;
        layout.setConstraints(problemWritersPane, gbc);
        add(problemWritersPane);
        problemWritersPane.setBorder(new BevelBorder(BevelBorder.LOWERED));

        problemTestersList = new JList(getTestersArray());
        problemTestersPane = new JScrollPane(problemTestersList);
        AppletConstants.buildConstraints(gbc, 3, 3, 1, 1, 0, 0);
        layout.setConstraints(problemTestersPane, gbc);
        add(problemTestersPane);
        problemTestersPane.setBorder(new BevelBorder(BevelBorder.LOWERED));

        verifyContestButton = new JButton("Verify Contest");
        gbc.fill = gbc.NONE;
        gbc.anchor = gbc.CENTER;
        AppletConstants.buildConstraints(gbc, 0, 4, 4, 1, 0, 1);
        layout.setConstraints(verifyContestButton, gbc);
        add(verifyContestButton);

        verifyContestButton.addActionListener(new AppletActionListener("verifyContest", this));
    }

    /**
     * Returns an Object[] of problem writers for the contest.
     */
    private Object[] getWritersArray() {
        ArrayList writers = new ArrayList();
        int i;
        ProblemInformation problemInfo;
        for (i = 0; i < contestInfo.getScheduledProblems().size(); i++) {
            problemInfo = (ProblemInformation) contestInfo.getScheduledProblems().get(i);
            if (!writers.contains(problemInfo.getWriter().getHandle())) {
                writers.add(problemInfo.getWriter().getHandle());
            }
        }
        return writers.toArray();
    }

    private Object[] getTestersArray() {
        ArrayList testers = new ArrayList();
        ArrayList probTesters;
        int i, j;
        ProblemInformation problemInfo;

        for (i = 0; i < contestInfo.getScheduledProblems().size(); i++) {
            probTesters = ((ProblemInformation) contestInfo.getScheduledProblems().get(i)).getTesters();
            for (j = 0; j < probTesters.size(); j++) {
                if (!testers.contains(((UserInformation) probTesters.get(j)).getHandle())) {
                    testers.add(((UserInformation) probTesters.get(j)).getHandle());
                }
            }
        }
        return testers.toArray();
    }

    /**
     * Updates the data represented in the panel.
     *
     * @param info ContestInformation holding new data.
     */
    public void update(ContestInformation info) {
        this.contestInfo = info;
        contestNameField.setText(contestInfo.getContestName());
        roundNameField.setText(contestInfo.getRoundName());
        codingStartField.setText(contestInfo.getStartCoding());
        codingEndField.setText(contestInfo.getEndCoding());
        challengeStartField.setText(contestInfo.getStartChallenge());
        challengeEndField.setText(contestInfo.getEndChallenge());
        problemWritersList.setListData(getWritersArray());
        problemTestersList.setListData(getTestersArray());
    }

    /**
     * Sends a request to the server to verify the contest.
     *
     * @param e The event of clicking the Verify Contest Button
     */
    public void verifyContest(ActionEvent e) {
        ArrayList request = new ArrayList();
        request.add(new Integer(MessageTypes.CONTEST_VERIFY_RQ));
        parentRoom.updateStatus("Verifying contest...", false);
        mainApplet.sendToServer(request);
    }

    private GridBagLayout layout;
    private GridBagConstraints gbc;
    private ContestInformation contestInfo;
    private ViewContestRoom parentRoom;
    private MainApplet mainApplet;

    private JLabel contestNameLabel;
    private JLabel roundNameLabel;
    private JLabel codingStartLabel;
    private JLabel codingEndLabel;
    private JLabel challengeStartLabel;
    private JLabel challengeEndLabel;
    private JLabel problemWritersLabel;
    private JLabel problemTestersLabel;
    private JTextField contestNameField;
    private JTextField roundNameField;
    private JTextField codingStartField;
    private JTextField codingEndField;
    private JTextField challengeStartField;
    private JTextField challengeEndField;
    private JTextField problemWritersField;
    private JTextField problemTestersField;
    private JList problemWritersList;
    private JList problemTestersList;
    private JScrollPane problemWritersPane;
    private JScrollPane problemTestersPane;
    private JButton verifyContestButton;
}
