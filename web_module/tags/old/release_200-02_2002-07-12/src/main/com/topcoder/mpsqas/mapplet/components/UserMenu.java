package com.topcoder.mpsqas.mapplet.components;

import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.listener.AppletActionListener;

import javax.swing.*;

/**
 * UserMenu represents the normal menu a user sees.  It keeps track of the
 * listener on the menu items, etc.
 *
 * @author mitalub
 */
public class UserMenu extends JMenuBar {
    /**
     * The constructor stores information about the menu and calls
     * init to actually build the menu.
     *
     * @param ma     The main applet.
     */
    public UserMenu(MainApplet ma) {
        mainApplet = ma;
        menuSelectionHandler = mainApplet.getMenuSelectionHandler();
        init();
    }

    /**
     * init builds and puts together the menu based on the constants in applet constants.
     */
    public void init() {
        JMenu tempMenu;
        JMenuItem tempMenuItem;

        int i, j;
        for (i = 0; i < AppletConstants.MENU_STRINGS.length; i++) {
            if (i == AppletConstants.ADMIN_MENU_INDEX && !mainApplet.isAdmin()) {
                //non-admins don't get an admin menu
                continue;
            }

            tempMenu = new JMenu(AppletConstants.MENU_STRINGS[i]);
            tempMenu.setFont(AppletConstants.NORMAL_FONT);

            for (j = 0; j < AppletConstants.MENU_ITEMS[i].length; j++) {
                tempMenuItem = new JMenuItem(AppletConstants.MENU_ITEMS[i][j][0]);
                tempMenuItem.setFont(AppletConstants.NORMAL_FONT);
                tempMenuItem.addActionListener(
                        new AppletActionListener(AppletConstants.MENU_ITEMS[i][j][1],
                                menuSelectionHandler));
                tempMenu.add(tempMenuItem);
            }
            add(tempMenu);
        }
    }

    private MainApplet mainApplet;
    private MenuSelectionHandler menuSelectionHandler;
}
