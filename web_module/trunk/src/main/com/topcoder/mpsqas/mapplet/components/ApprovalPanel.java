package com.topcoder.mpsqas.mapplet.components;

import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;
import com.topcoder.mpsqas.mapplet.rooms.ViewProblemRoom;

import javax.swing.*;
import javax.swing.border.BevelBorder;
import java.awt.*;

/**
 * ApprovalRoom is a room through which admins can approve or disapprove problems, and give a reason.
 *
 * @author mitalub
 */
public class ApprovalPanel extends JPanel {
    /**
     * The constructor stores some information about the room and calls the
     * super constructor.  It then calls init to put together the components.
     *
     * @param  parentRoom The ViewProblemRoom holding this panel.
     */
    public ApprovalPanel(ViewProblemRoom parentRoom) {
        this.parentRoom = parentRoom;
        layout = new GridBagLayout();
        setLayout(layout);
        gbc = new GridBagConstraints();
        init();
    }

    /**
     * init draws the window and lays everything out.
     */
    public void init() {
        gbc.insets = new Insets(5, 5, 5, 5);

        replyLabel = new JLabel("Reply:");
        replyLabel.setFont(AppletConstants.HEADER_FONT);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.NONE;
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        layout.setConstraints(replyLabel, gbc);
        add(replyLabel);

        approveCheck = new JCheckBox("Approve");
        approveCheck.setFont(AppletConstants.NORMAL_FONT);
        approveCheck.setSelected(true);
        gbc.anchor = GridBagConstraints.EAST;
        AppletConstants.buildConstraints(gbc, 1, 0, 1, 1, 1, 0);
        layout.setConstraints(approveCheck, gbc);
        add(approveCheck);

        replyCommentsArea = new JTextArea();
        replyCommentsArea.setFont(AppletConstants.NORMAL_FONT);
        replyCommentsArea.setLineWrap(true);
        replyCommentsArea.setWrapStyleWord(true);
        replyCommentsPanel = new JScrollPane(replyCommentsArea,
                JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        gbc.fill = GridBagConstraints.BOTH;
        AppletConstants.buildConstraints(gbc, 0, 1, 2, 1, 0, 30);
        layout.setConstraints(replyCommentsPanel, gbc);
        replyCommentsPanel.setBorder(new BevelBorder(BevelBorder.LOWERED));
        add(replyCommentsPanel);

        submitButton = new JButton("Submit");
        submitButton.addActionListener(new AppletActionListener("sendReplyToProposal", parentRoom));
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.CENTER;
        AppletConstants.buildConstraints(gbc, 0, 2, 2, 1, 0, 1);
        layout.setConstraints(submitButton, gbc);
        add(submitButton);

    }

    /**
     * Returns any text in the comments section, if any
     */
    public String getComments() {
        return replyCommentsArea.getText();
    }

    /**
     * Returns true if the approve button is checked.
     */
    public boolean isApproved() {
        return approveCheck.isSelected();
    }

    //Layout
    GridBagLayout layout;
    GridBagConstraints gbc;

    //Components
    private JLabel replyLabel;
    private JCheckBox approveCheck;
    private JTextArea replyCommentsArea;
    private JScrollPane replyCommentsPanel;
    private JButton submitButton;

    private ViewProblemRoom parentRoom;
}
