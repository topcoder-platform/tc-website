package com.topcoder.mpsqas.mapplet.components;

/*
 * This class represents a panel containing a current list of users.
 *
 * @author mitalub
 */

import com.topcoder.mpsqas.mapplet.AppletConstants;
import com.topcoder.mpsqas.mapplet.widgets.SortableTable;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;

public class UserList extends JPanel {
    /*
     * The constructor sets up the UserList, initializing everything
     * to empty.
     *
     * @param users A List of current users.
     */
    public UserList(ArrayList users) {
        this.users = users;

        gbc = new GridBagConstraints();
        layout = new GridBagLayout();
        setLayout(layout);

        userList = new SortableTable(AppletConstants.USER_LIST_COLS,
                getUserArray(),
                AppletConstants.USER_LIST_COLS_WIDTHS);
        userListPane = new JScrollPane(userList);
        AppletConstants.buildConstraints(gbc, 0, 0, 1, 1, 1, 1);
        gbc.fill = GridBagConstraints.BOTH;
        layout.setConstraints(userListPane, gbc);
        add(userListPane);
    }

    /**
     * Returns an Object[][1] whose column is a list of user names (Strings)
     */
    private Object[][] getUserArray() {
        Object[][] userArray = new Object[users.size()][1];
        for (int i = 0; i < users.size(); i++)
            userArray[i][0] = users.get(i);
        return userArray;
    }

    /**
     * Updates the names displayed in the user list.
     *
     * @param users The new list of users.
     */
    public void setUserList(ArrayList users) {
        this.users = users;
        userList.setData(getUserArray());
    }

    private GridBagConstraints gbc;
    private GridBagLayout layout;
    private SortableTable userList;
    private JScrollPane userListPane;
    private ArrayList users;
}

