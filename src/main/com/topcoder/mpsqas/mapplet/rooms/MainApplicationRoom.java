package com.topcoder.mpsqas.mapplet.rooms;

import com.topcoder.mpsqas.mapplet.widgets.*;
import com.topcoder.mpsqas.mapplet.components.*;
import com.topcoder.mpsqas.common.MessageTypes;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.common.*;

/**
 * A room through which admins can see a quick summary of all pending applications and can
 * choose an application to view in detail and respond to.
 *
 * @author mitalub
 */
public class MainApplicationRoom extends Room
{
  /**
   * The constructor stores some information and lays out the room.
   *
   * @param roomHolder The applet's roomHolder.
   * @param mainApplet The applet's mainApplet.
   * @param apps       List of ApplicationInformation.
   */
  public MainApplicationRoom(RoomHolder roomHolder, MainApplet mainApplet,ArrayList apps)
  {
    super(roomHolder,mainApplet);

    this.apps=apps;

    layout=new GridBagLayout();
    gbc=new GridBagConstraints();
    setLayout(layout);

    titleLabel=new JLabel("Pending Applications ("+apps.size()+"):");
    titleLabel.setFont(AppletConstants.HEADER_FONT);
    gbc.anchor=gbc.WEST;
    gbc.fill=gbc.BOTH;
    gbc.insets=new Insets(5,5,5,5);
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,1);
    layout.setConstraints(titleLabel,gbc);
    add(titleLabel);

    Object[]columnNames={"Handle","Type","Rating","Events"};

    appTable = new SortableTable(AppletConstants.MAIN_APPLICATION_COLS,
                                 getApplicationsTable(),
                                 AppletConstants.MAIN_APPLICATION_COLS_WIDTHS);

    appTablePane=new JScrollPane(appTable,
                                 JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
                                 JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    AppletConstants.buildConstraints(gbc,0,1,1,1,0,100);
    layout.setConstraints(appTablePane,gbc);
    add(appTablePane);

    viewButton=new JButton("View Application");
    gbc.fill=gbc.NONE;
    gbc.anchor=gbc.EAST;
    AppletConstants.buildConstraints(gbc,0,2,1,1,0,1);
    layout.setConstraints(viewButton,gbc);
    add(viewButton);

    mainApplet.getStatusBox().appendMessage("Choose an application to view.",
                                            false); 

    appTable.addMouseListener(
                    new AppletMouseListener("appRowClicked",this,"mouseClicked"));
    viewButton.addActionListener(
                    new AppletActionListener("viewButtonClicked",this));
  }

  /**
   * Called when a user clicks one of the applications in the application table.
   *
   * @param e The MouseEvent of the row being clicked.
   */
  public void appRowClicked(MouseEvent e)
  {
    if(e.getClickCount()==2)
      loadApplication();
  }

  /**
   * Called when a user clickes the View Application Button.
   *
   * @param e The ActionEvent of the button being clicked.
   */
  public void viewButtonClicked(ActionEvent e)
  {
    loadApplication();
  }

  /**
   * Sends a request to the server to view the selected applicaiton and puts up
   * the Loading... screen.
   */
  private void loadApplication()
  {
    int row=appTable.getSelectedRow();
    if (row >= 0)
    {
      mainApplet.loadMovingRoom();
      ArrayList request=new ArrayList(2);
      request.add(new Integer(MessageTypes.MOVE_RQ));
      request.add(new Integer(MessageTypes.VIEW_APPLICATION_ROOM));
      request.add(new Integer(((ApplicationInformation)apps.get(row)).getId()));
      mainApplet.sendToServer(request);
    }
  }

  /**
   * Changes the list of applications displayed in the table.
   *
   * @param apps New application table.
   */
  public void updateApplications(ArrayList apps)
  {
    this.apps=apps;
    appTable.setData(getApplicationsTable());
    titleLabel.setText("Pending Applications ("+apps.size()+"):");
  }

  /**
   * Returns an Object[][] representing the applications table.
   */
  private Object[][] getApplicationsTable()
  {
    Object[][]tableData=new Object[apps.size()][4];
    ApplicationInformation appInfo;
    int i,j;
    for(i=0;i<apps.size();i++)
    {
      appInfo = (ApplicationInformation)apps.get(i);
      tableData[i][0] = appInfo.getHandle();
      tableData[i][1] = appInfo.getApplicationType();
      tableData[i][2] = new Integer(appInfo.getRating());
      tableData[i][3] = new Integer(appInfo.getEvents());
    }
    return tableData;
  }

  private GridBagLayout layout;
  private GridBagConstraints gbc;

  private JLabel titleLabel;
  private SortableTable appTable;
  private JScrollPane appTablePane;
  private JButton viewButton;

  private ArrayList apps;
}
