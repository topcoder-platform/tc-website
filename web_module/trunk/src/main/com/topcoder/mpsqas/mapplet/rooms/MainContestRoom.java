package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.common.ContestInformation;
import com.topcoder.mpsqas.common.MessageTypes;
import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.MainApplet;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;
import com.topcoder.mpsqas.mapplet.listener.AppletMouseListener;
import com.topcoder.mpsqas.mapplet.widgets.SortableTable;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

/**
 * MainContestRoom is a room in which users can view and select upcoming contests.
 *
 * @author mitalub
 */
public class MainContestRoom extends Room {

    /**
     * Store some information, sets up the layout, and
     * calls init() to put all the elements in the right place.
     *
     * @param roomHolder The holder holding this room
     * @param mainApplet The applet's mainApplet
     * @param contests ArrayList of upcoming contests ContestInformation
     */
    public MainContestRoom(RoomHolder roomHolder, MainApplet mainApplet, ArrayList contests) {
        super(roomHolder, mainApplet);

        this.contests = contests;

        this.layout = new GridBagLayout();
        this.gbc = new GridBagConstraints();

        setLayout(layout);

        init();
    }

    /**
     * Creates and lays out all of the components.
     */
    public void init() {
        title = new JLabel("Your Contests:");
        title.setFont(AppletConstants.HEADER_FONT);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.fill = GridBagConstraints.BOTH;
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        layout.setConstraints(title, gbc);
        add(title);

        Object[][] tableData;
        int i,j;
        ContestInformation contestInfo;
        tableData = new Object[contests.size()][3];
        for (i = 0; i < contests.size(); i++) {
            contestInfo = (ContestInformation) contests.get(i);
            tableData[i][0] = contestInfo.getContestName();
            tableData[i][1] = contestInfo.getStartCoding();
            tableData[i][2] = contestInfo.getRole();
        }

        contestTable = new SortableTable(AppletConstants.MAIN_CONTEST_COLS,
                tableData,
                AppletConstants.MAIN_CONTEST_COLS_WIDTHS);

        contestTablePane = new JScrollPane(contestTable,
                JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        AppletConstants.buildConstraints(gbc, 0, 1, 1, 1, 0, 100);
        layout.setConstraints(contestTablePane, gbc);
        add(contestTablePane);

        viewButton = new JButton("View Contest");
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.EAST;
        AppletConstants.buildConstraints(gbc, 0, 2, 1, 1, 0, 1);
        layout.setConstraints(viewButton, gbc);
        add(viewButton);

        mainApplet.getStatusBox().appendMessage("Select a contest to view.", false);

        contestTable.addMouseListener(new AppletMouseListener("contestRowClicked", this, "mouseClicked"));
        viewButton.addActionListener(new AppletActionListener("viewButtonClicked", this));
    }

    /**
     * Called when a user clicks one of the contests in the contest table.
     *
     * @param e The MouseEvent of the row being clicked.
     */
    public void contestRowClicked(MouseEvent e) {
        if (e.getClickCount() == 2)
            loadContest();
    }

    /**
     * Called when a user clickes the View Contest Button.
     *
     * @param e The ActionEvent of the button being clicked.
     */
    public void viewButtonClicked(ActionEvent e) {
        loadContest();
    }

    /**
     * Sends a request to the server to view the selected contest and puts up
     * the Loading... screen.
     */
    private void loadContest() {
        int row = contestTable.getSelectedRow();
        if (row >= 0) {
            mainApplet.loadMovingRoom();
            ArrayList viewContestRequest = new ArrayList(2);
            viewContestRequest.add(new Integer(MessageTypes.MOVE_RQ));
            viewContestRequest.add(new Integer(MessageTypes.VIEW_CONTEST_ROOM));
            viewContestRequest.add(new Integer(((ContestInformation) contests.get(row)).getRoundId()));
            mainApplet.sendToServer(viewContestRequest);
        }
    }

    private GridBagLayout layout;
    private GridBagConstraints gbc;

    //components
    private JLabel title;
    private JTable contestTable;
    private JScrollPane contestTablePane;
    private JButton viewButton;

    //data
    private ArrayList contests;
}
