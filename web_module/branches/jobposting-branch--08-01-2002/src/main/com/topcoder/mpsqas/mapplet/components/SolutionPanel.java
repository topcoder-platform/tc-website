package com.topcoder.mpsqas.mapplet.components;

import com.topcoder.mpsqas.common.MessageTypes;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;
import com.topcoder.mpsqas.mapplet.rooms.ViewProblemRoom;

import javax.swing.*;
import javax.swing.border.BevelBorder;
import java.awt.*;
import java.awt.event.ActionEvent;

/**
 * The SolutionPanel is a panel through which a user can view, edit,
 * compile, and test a solution to a problem.
 */
public class SolutionPanel extends JPanel {
    /**
     * The constructor sets up the layout and calls init to lay everything out.
     *
     * @param parentRoom The room in which this solution panel lives
     * @param editable  Boolean representing if the solution is to be editable, and if there is to be a compile button.
     * @param title     The title to be displayed
     * @param code      The text to be orignally in the text area
     */
    public SolutionPanel(ViewProblemRoom parentRoom, boolean editable, String title, String code) {
        this.editable = editable;
        this.parentRoom = parentRoom;
        this.title = title;
        this.code = code;
        layout = new GridBagLayout();
        gbc = new GridBagConstraints();
        setLayout(layout);
        init();
        changeComponentActive(editable);
    }

    /**
     * init() lays out everything in the solution panel and sets up the listeners
     */
    private void init() {

        solutionTitle = new JLabel(title);
        solutionTitle.setFont(AppletConstants.HEADER_FONT);
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.NONE;
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        layout.setConstraints(solutionTitle, gbc);
        add(solutionTitle);

        solutionTextArea = new JTextArea();
        solutionTextArea.setFont(AppletConstants.FIXED_WIDTH_FONT);
        solutionTextArea.setLineWrap(true);
        solutionTextArea.setText(code);
        solutionTextScrollPane = new JScrollPane(solutionTextArea, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        gbc.fill = GridBagConstraints.BOTH;
        AppletConstants.buildConstraints(gbc, 0, 1, 1, 1, 0, 100);
        layout.setConstraints(solutionTextScrollPane, gbc);
        add(solutionTextScrollPane);
        solutionTextScrollPane.setBorder(new BevelBorder(BevelBorder.LOWERED));

        solutionButtonBox = Box.createHorizontalBox();
        if (editable) {
            compileButton = new JButton("Compile");
            compileButton.addActionListener(new AppletActionListener("compile", parentRoom));
            solutionButtonBox.add(compileButton);
            solutionButtonBox.add(Box.createHorizontalStrut(5));
        }
        testButton = new JButton("Test");
        testButton.addActionListener(new AppletActionListener("test", this));
        solutionButtonBox.add(testButton);
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.CENTER;
        AppletConstants.buildConstraints(gbc, 0, 2, 1, 1, 0, 1);
        layout.setConstraints(solutionButtonBox, gbc);
        add(solutionButtonBox);
    }

    /**
     * changeComponentActive changes whether or not things on the panel are editable.
     *
     * @param editable  Boolean representing if things should be editable
     */
    public void changeComponentActive(boolean editable) {
        solutionTextArea.setEditable(editable);
    }

    /**
     * Returns the current code in the solutionTextArea.
     */
    public String getCode() {
        return solutionTextArea.getText();
    }

    /**
     * Called when the user hits the test button.  Calls the parent method to get the args and test the problem.
     *
     * @param e The event of clicking the test button.
     */
    public void test(ActionEvent e) {
        parentRoom.test(MessageTypes.TEST_ONE);
    }

    private boolean editable;
    private ViewProblemRoom parentRoom;
    private GridBagLayout layout;
    private GridBagConstraints gbc;
    private JLabel solutionTitle;
    private JTextArea solutionTextArea;
    private JScrollPane solutionTextScrollPane;
    private JButton testButton;
    private JButton compileButton;
    private Box solutionButtonBox;
    private String title;
    private String code;
}
