package com.topcoder.mpsqas.mapplet.components;

import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;
import com.topcoder.mpsqas.mapplet.rooms.ViewProblemRoom;
import com.topcoder.mpsqas.mapplet.widgets.SortableTable;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

/**
 * A panel through which admins can view and change the status of problems,
 * and the problem testers for the problem only, as opposed to the entire
 * contest.
 *
 * @author mitalub
 */
public class AdminProblemPanel extends JPanel {
    /**
     * The constructor stores some information and lays out the panel.
     *
     * @param mainApplet The MainApplet.
     * @param parentRoom The ViewProblemRoom for which this is a component.
     * @param problemInfo The ProblemInformation for the problem.
     * @param testers    ArrayList of problem testers available for the problem.
     */
    public AdminProblemPanel(MainApplet mainApplet, ViewProblemRoom parentRoom,
                             ProblemInformation problemInfo, ArrayList testers) {
        this.problemInfo = problemInfo;
        this.mainApplet = mainApplet;
        this.parentRoom = parentRoom;
        this.testers = testers;

        layout = new GridBagLayout();
        tlayout = new GridBagLayout();
        gbc = new GridBagConstraints();
        testerPanel = new JPanel();

        setLayout(layout);
        testerPanel.setLayout(tlayout);

        statusTitleLabel = new JLabel("Status:");
        statusTitleLabel.setFont(AppletConstants.HEADER_FONT);
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = gbc.WEST;
        gbc.fill = gbc.NONE;
        layout.setConstraints(statusTitleLabel, gbc);
        add(statusTitleLabel, gbc);

        statusSelection = new JComboBox();
        int index = -1;
        for (int i = 0; i < MessageTypes.STATUS_IDS.length; i++) {
            if (MessageTypes.STATUS_IDS[i] == problemInfo.getStatus()) {
                index = i;
            }
            statusSelection.addItem(MessageTypes.getStatusName(MessageTypes.STATUS_IDS[i]));
        }
        statusSelection.setSelectedIndex(index);
        AppletConstants.buildConstraints(gbc, 0, 1, 1, 1, 0, 1);
        layout.setConstraints(statusSelection, gbc);
        add(statusSelection);

        primaryTitleLabel = new JLabel("Primary Solution: ");
        primaryTitleLabel.setFont(AppletConstants.HEADER_FONT);
        AppletConstants.buildConstraints(gbc, 1, 0, 1, 1, 1, 0);
        layout.setConstraints(primaryTitleLabel, gbc);
        add(primaryTitleLabel);

        primarySelection = new JComboBox();
        primarySelection.addItem(new HiddenValue("-------------", -1));
        index = 0;
        SolutionInformation solutionInfo;
        for (int i = 0; i < problemInfo.getAllSolutions().size(); i++) {
            solutionInfo = (SolutionInformation) problemInfo.getAllSolutions().get(i);
            if (solutionInfo.isPrimary()) {
                index = i + 1;
            }
            primarySelection.addItem(new HiddenValue(solutionInfo.getHandle(),
                    solutionInfo.getSolutionId()));
        }
        primarySelection.setSelectedIndex(index);
        AppletConstants.buildConstraints(gbc, 1, 1, 1, 1, 0, 0);
        layout.setConstraints(primarySelection, gbc);
        add(primarySelection);

        testerTitleLabel = new JLabel("Problem Testers:");
        testerTitleLabel.setFont(AppletConstants.HEADER_FONT);
        AppletConstants.buildConstraints(gbc, 0, 2, 2, 1, 0, 1);
        layout.setConstraints(testerTitleLabel, gbc);
        add(testerTitleLabel);

        availTestersLabel = new JLabel("Available Testers:");
        availTestersLabel.setFont(AppletConstants.NORMAL_FONT);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 100, 1);
        tlayout.setConstraints(availTestersLabel, gbc);
        testerPanel.add(availTestersLabel);

        testersLabel = new JLabel("Scheduled Testers:");
        testersLabel.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 2, 0, 1, 1, 100, 1);
        tlayout.setConstraints(testersLabel, gbc);
        testerPanel.add(testersLabel);

        availTestersT = new SortableTable(AppletConstants.TESTER_INFO_COLS,
                getAllTesters(),
                AppletConstants.TESTER_INFO_COLS_WIDTHS);
        availTestersSP = new JScrollPane(availTestersT);
        gbc.fill = GridBagConstraints.BOTH;
        AppletConstants.buildConstraints(gbc, 0, 1, 1, 3, 0, 0);
        tlayout.setConstraints(availTestersSP, gbc);
        testerPanel.add(availTestersSP);

        addTesterButton = new JButton("Add ->");
        gbc.fill = GridBagConstraints.HORIZONTAL;
        AppletConstants.buildConstraints(gbc, 1, 1, 1, 1, 1, 1);
        tlayout.setConstraints(addTesterButton, gbc);
        testerPanel.add(addTesterButton);

        removeTesterButton = new JButton("<- Remove");
        AppletConstants.buildConstraints(gbc, 1, 2, 1, 1, 0, 1);
        tlayout.setConstraints(removeTesterButton, gbc);
        testerPanel.add(removeTesterButton);


        schedTestersT = new SortableTable(AppletConstants.TESTER_INFO_COLS,
                getCurrentTesters(),
                AppletConstants.TESTER_INFO_COLS_WIDTHS);
        schedTestersSP = new JScrollPane(schedTestersT);
        gbc.fill = GridBagConstraints.BOTH;
        AppletConstants.buildConstraints(gbc, 2, 1, 1, 3, 0, 0);
        tlayout.setConstraints(schedTestersSP, gbc);
        testerPanel.add(schedTestersSP);

        JLabel spacer2 = new JLabel("");
        AppletConstants.buildConstraints(gbc, 1, 3, 1, 1, 0, 100);
        tlayout.setConstraints(spacer2, gbc);
        testerPanel.add(spacer2);

        AppletConstants.buildConstraints(gbc, 0, 3, 2, 1, 0, 100);
        gbc.fill = gbc.BOTH;
        layout.setConstraints(testerPanel, gbc);
        add(testerPanel);

        submitButton = new JButton("Save Changes");
        gbc.fill = gbc.NONE;
        gbc.anchor = gbc.CENTER;
        AppletConstants.buildConstraints(gbc, 0, 4, 2, 1, 0, 1);
        layout.setConstraints(submitButton, gbc);
        add(submitButton);

        addTesterButton.addActionListener(new AppletActionListener("addTester", this));
        removeTesterButton.addActionListener(new AppletActionListener("removeTester", this));
        submitButton.addActionListener(new AppletActionListener("submit", this));
    }

    /**
     * Returns an Object[][] to put in the current scheduled testers tables.  Looks through
     * the boolean in the testers ArrayList to see which testers are scheduled.
     */
    private Object[][] getCurrentTesters() {
        int i;
        Object[][] data = new Object[problemInfo.getTesters().size()][1];
        for (i = 0; i < problemInfo.getTesters().size(); i++) {
            data[i][0] = ((UserInformation) problemInfo.getTesters().get(i)).getHandle();
        }
        return data;
    }

    /**
     * Adds a tester to the currently selected tester list.
     */
    public void addTester(ActionEvent e) {
        int index = availTestersT.getSelectedRow();
        if (index >= 0) {
            if (!problemInfo.getTesters().contains(testers.get(index))) {
                problemInfo.getTesters().add(testers.get(index));
            }
        }
        schedTestersT.setData(getCurrentTesters());
    }

    /**
     * Removes the selected tester from the currently selected tester.
     */
    public void removeTester(ActionEvent e) {
        int index = schedTestersT.getSelectedRow();
        if (index >= 0) {
            problemInfo.getTesters().remove(index);
        }
        schedTestersT.setData(getCurrentTesters());
    }

    /**
     * Returns an Object[][] representint a table of all the testers.
     */
    private Object[][] getAllTesters() {
        Object[][] tableData = new Object[testers.size()][1];
        for (int i = 0; i < testers.size(); i++) {
            tableData[i][0] = ((UserInformation) testers.get(i)).getHandle();
        }
        return tableData;
    }

    /**
     * Sends the information to the server that the admin has specified here.
     */
    public void submit(ActionEvent e) {
        parentRoom.updateStatus("Sending information to server...", false);
        ArrayList saveProblemRequest = new ArrayList();
        saveProblemRequest.add(new Integer(MessageTypes.ADMIN_SAVE_PROBLEM_RQ));
        problemInfo.setStatus(((HiddenValue) statusSelection.getSelectedItem()).getValue());
        problemInfo.setPrimarySolutionId(((HiddenValue) primarySelection
                .getSelectedItem()).getValue());
        saveProblemRequest.add(problemInfo);
        mainApplet.sendToServer(saveProblemRequest);
    }

    private GridBagLayout layout;
    private GridBagConstraints gbc;
    private JPanel testerPanel;
    private JPanel primaryPanel;
    private GridBagLayout tlayout;

    private JLabel statusTitleLabel;
    private JLabel primaryTitleLabel;
    private JLabel testerTitleLabel;
    private JComboBox statusSelection;
    private JComboBox primarySelection;

    private JScrollPane availTestersSP;
    private JScrollPane schedTestersSP;
    private JButton removeTesterButton;
    private SortableTable availTestersT;
    private SortableTable schedTestersT;

    private JLabel testersLabel;
    private JLabel availTestersLabel;
    private JButton addTesterButton;
    private JButton submitButton;

    private JTextArea statementArea;
    private JScrollPane statementPane;

    private ViewProblemRoom parentRoom;
    private ArrayList testers;
    private MainApplet mainApplet;
    private ProblemInformation problemInfo;
}
