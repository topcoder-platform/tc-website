package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.widgets.SortableTable;

import javax.swing.*;
import java.awt.*;

/**
 * A Room to display detailed information about a user.
 *
 * @author mitalub
 */
public class ViewUserRoom extends Room {
    /**
     * The constructor stores the information and lays everything out.
     *
     * @param roomHolder the applet's room holder
     * @param mainApplet the applet's main applet
     * @param userInfo UserInformation about the user.
     */
    public ViewUserRoom(RoomHolder roomHolder, MainApplet mainApplet,
                        UserInformation userInfo) {
        super(roomHolder, mainApplet);
        this.userInfo = userInfo;

        layout = new GridBagLayout();
        gbc = new GridBagConstraints();

        setLayout(layout);

        titleL = new JLabel("User Information: ");
        titleL.setFont(AppletConstants.HEADER_FONT);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);
        AppletConstants.buildConstraints(gbc, 0, 0, 4, 1, 0, 1);
        add(titleL);

        handleL = new JLabel("Handle: ");
        handleL.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 0, 1, 1, 1, 1, 1);
        layout.setConstraints(handleL, gbc);
        add(handleL);

        handleTF = new JTextField(userInfo.getHandle());
        handleTF.setFont(AppletConstants.FIXED_WIDTH_FONT);
        handleTF.setEditable(false);
        AppletConstants.buildConstraints(gbc, 1, 1, 1, 1, 100, 0);
        layout.setConstraints(handleTF, gbc);
        add(handleTF);

        nameL = new JLabel("Name: ");
        nameL.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 2, 1, 1, 1, 1, 0);
        layout.setConstraints(nameL, gbc);
        add(nameL);

        nameTF = new JTextField(userInfo.getFirstName() + " " + userInfo.getLastName());
        nameTF.setEditable(false);
        nameTF.setFont(AppletConstants.FIXED_WIDTH_FONT);
        AppletConstants.buildConstraints(gbc, 3, 1, 1, 1, 100, 0);
        layout.setConstraints(nameTF, gbc);
        add(nameTF);

        userTypeL = new JLabel("User Type: ");
        userTypeL.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 0, 2, 1, 1, 0, 1);
        layout.setConstraints(userTypeL, gbc);
        add(userTypeL);

        StringBuffer userType = new StringBuffer(100);
        if (userInfo.isWriter()) {
            userType.append("Writer");
        }
        if (userInfo.isTester()) {
            if (userInfo.isWriter()) {
                userType.append(" and ");
            }
            userType.append("Tester");
        }

        userTypeTF = new JTextField(userType.toString());
        userTypeTF.setFont(AppletConstants.FIXED_WIDTH_FONT);
        userTypeTF.setEditable(false);
        AppletConstants.buildConstraints(gbc, 1, 2, 1, 1, 0, 0);
        layout.setConstraints(userTypeTF, gbc);
        add(userTypeTF);

        emailL = new JLabel("Email: ");
        emailL.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 2, 2, 1, 1, 0, 1);
        layout.setConstraints(emailL, gbc);
        add(emailL);

        emailTF = new JTextField(userInfo.getEmail());
        emailTF.setFont(AppletConstants.FIXED_WIDTH_FONT);
        emailTF.setEditable(false);
        AppletConstants.buildConstraints(gbc, 3, 2, 1, 1, 0, 0);
        layout.setConstraints(emailTF, gbc);
        add(emailTF);

        paidL = new JLabel("Paid to Date:");
        paidL.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 0, 3, 1, 1, 0, 1);
        layout.setConstraints(paidL, gbc);
        add(paidL);

        paidTF = new JTextField("$" + userInfo.getPaid());
        paidTF.setFont(AppletConstants.FIXED_WIDTH_FONT);
        paidTF.setEditable(false);
        AppletConstants.buildConstraints(gbc, 1, 3, 1, 1, 0, 0);
        layout.setConstraints(paidTF, gbc);
        add(paidTF);

        pendingL = new JLabel("Pending Payment:");
        pendingL.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 2, 3, 1, 1, 0, 0);
        layout.setConstraints(pendingL, gbc);
        add(pendingL);

        pendingTF = new JTextField("$" + userInfo.getPendingPayment());
        pendingTF.setFont(AppletConstants.FIXED_WIDTH_FONT);
        pendingTF.setEditable(false);
        AppletConstants.buildConstraints(gbc, 3, 3, 1, 1, 0, 0);
        layout.setConstraints(pendingTF, gbc);
        add(pendingTF);

        writingProblemsL = new JLabel("Writing Problems: ");
        writingProblemsL.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 0, 4, 1, 1, 0, 1);
        layout.setConstraints(writingProblemsL, gbc);
        add(writingProblemsL);

        writingProblemsT = new SortableTable(AppletConstants.VIEW_USER_WRITING_COLS,
                getWritingProblems(),
                AppletConstants.VIEW_USER_WRITING_COLS_WIDTHS);
        writingProblemsSP = new JScrollPane(writingProblemsT,
                JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        AppletConstants.buildConstraints(gbc, 0, 5, 4, 1, 0, 100);
        gbc.fill = GridBagConstraints.BOTH;
        layout.setConstraints(writingProblemsSP, gbc);
        add(writingProblemsSP);

        testingProblemsL = new JLabel("Testing Problems: ");
        testingProblemsL.setFont(AppletConstants.NORMAL_FONT);
        AppletConstants.buildConstraints(gbc, 0, 6, 1, 1, 0, 1);
        layout.setConstraints(testingProblemsL, gbc);
        gbc.fill = GridBagConstraints.NONE;
        add(testingProblemsL);

        testingProblemsT = new SortableTable(AppletConstants.VIEW_USER_TESTING_COLS,
                getTestingProblems(),
                AppletConstants.VIEW_USER_TESTING_COLS_WIDTHS);
        testingProblemsSP = new JScrollPane(testingProblemsT,
                JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        AppletConstants.buildConstraints(gbc, 0, 7, 4, 1, 0, 100);
        gbc.fill = GridBagConstraints.BOTH;
        layout.setConstraints(testingProblemsSP, gbc);
        add(testingProblemsSP);
    }

    /**
     * Returns the problems the user is writing in tabular form.
     */
    private Object[][] getWritingProblems() {
        Object[][] data = new Object[userInfo.getWritingProblems().size()][7];
        ProblemInformation problemInfo;
        for (int i = 0; i < userInfo.getWritingProblems().size(); i++) {
            problemInfo = (ProblemInformation) userInfo.getWritingProblems().get(i);
            data[i][0] = problemInfo.getTimestamp();
            data[i][1] = problemInfo.getClassName();
            data[i][2] = MessageTypes.getDivisionName(problemInfo.getDivision());
            data[i][3] = MessageTypes.getDifficultyName(problemInfo.getDifficultyLevel());
            data[i][4] = MessageTypes.getStatusName(problemInfo.getStatus());
            data[i][5] = "" + problemInfo.getPaid();
            data[i][6] = "" + problemInfo.getPendingPayment();
        }
        return data;
    }

    /**
     * Returns the problems the user is testing in tabular form.
     */
    private Object[][] getTestingProblems() {
        Object[][] data = new Object[userInfo.getTestingProblems().size()][8];
        ProblemInformation problemInfo;
        for (int i = 0; i < userInfo.getTestingProblems().size(); i++) {
            problemInfo = (ProblemInformation) userInfo.getTestingProblems().get(i);
            data[i][0] = problemInfo.getTimestamp();
            data[i][1] = problemInfo.getWriter().getHandle();
            data[i][2] = problemInfo.getClassName();
            data[i][3] = MessageTypes.getDivisionName(problemInfo.getDivision());
            data[i][4] = MessageTypes.getDifficultyName(problemInfo.getDifficultyLevel());
            data[i][5] = MessageTypes.getStatusName(problemInfo.getStatus());
            data[i][6] = "" + problemInfo.getPaid();
            data[i][7] = "" + problemInfo.getPendingPayment();
        }
        return data;
    }

    private GridBagLayout layout;
    private GridBagConstraints gbc;

    private JLabel titleL;
    private JLabel handleL;
    private JLabel nameL;
    private JLabel emailL;
    private JLabel paidL;
    private JLabel pendingL;
    private JLabel userTypeL;
    private JLabel writingProblemsL;
    private JLabel testingProblemsL;

    private JTextField handleTF;
    private JTextField nameTF;
    private JTextField emailTF;
    private JTextField paidTF;
    private JTextField pendingTF;
    private JTextField userTypeTF;

    private SortableTable writingProblemsT;
    private JScrollPane writingProblemsSP;

    private SortableTable testingProblemsT;
    private JScrollPane testingProblemsSP;

    private UserInformation userInfo;
}
