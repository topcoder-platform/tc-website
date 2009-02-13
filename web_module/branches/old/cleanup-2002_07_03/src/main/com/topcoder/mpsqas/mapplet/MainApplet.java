package com.topcoder.mpsqas.mapplet;

import com.topcoder.mpsqas.mapplet.*;
import com.topcoder.mpsqas.mapplet.listener.*;
import com.topcoder.mpsqas.mapplet.messaging.*;
import com.topcoder.mpsqas.mapplet.components.*;
import com.topcoder.mpsqas.mapplet.rooms.*;
import com.topcoder.mpsqas.common.*;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.net.*;

/**
 *
 * MainApplet is the MPSQAS Applet class.  It is responsible for setting up the
 * main window and the connections and sending information to and receiving 
 * information from the server.
 *
 * @author mitalub
 *
 */
public class MainApplet  extends JApplet
{
  /**
   * Main runs the applet as an application
   */
  public static void main(String[]args) throws Exception
  {
    new MainApplet(args[0],Integer.parseInt(args[1]),new LaunchMPSQAS()); 
  }

  /**
   *
   * The constructor starts up everything for the client: an InputProcessor,
   * a ServerConnection, etc.
   * 
   * @param host  ip address of server.
   * @param port  listeneing port on server.
   * @param ml    The launcher of the applet.
   *
   */
  public MainApplet(String host, int port, LaunchMPSQAS ml) throws Exception
  {
    launcher = ml;
    serverConnection = new ServerConnection(host,port,new InputProcessor(this));
    menuSelectionHandler = new MenuSelectionHandler(this, serverConnection);
    statusBox = new StatusBox(this);
    roomHolder = new RoomHolder("MPSQAS", serverConnection, this, statusBox);
    currentRoom = new LoginRoom(roomHolder,this);
    roomHolder.setRoom(currentRoom, false);
    roomHolder.addWindowListener(
            new AppletWindowListener("windowClosed","mainFrameClosed",this));
    roomHolder.addWindowListener(
            new AppletWindowListener("windowClosing","mainFrameClosed",this));
    currentRoomType=MessageTypes.LOGIN_ROOM;
    admin=false;
    serverConnection.start();
  }

  /**
   * move creates a new room of the specified types, and puts it into the RoomHolder
   * and calls the RoomHolder to display it.
   *
   * @param roomType  The type of the room to which to move.
   * @param data      Data about the room to which to move.
   */
  public void move(int roomType,ArrayList data)
  {
    Room oldRoom=currentRoom;
    switch (roomType)
    {
      case MessageTypes.FOYER_ROOM:
        if(data.size() == 1)
        {
          currentRoom=new FoyerRoom(roomHolder,this,(String)data.get(0));
        }
        else
        {
          currentRoom=new FoyerRoom(roomHolder,this,(String)data.get(0), (ArrayList)data.get(1));
        }

        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.FOYER_ROOM;
        roomHolder.updateView();
        break;
      case MessageTypes.LOGIN_ROOM:
        currentRoom=new LoginRoom(roomHolder,this);
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, false);
        currentRoomType=MessageTypes.LOGIN_ROOM;
        roomHolder.updateView();
      case MessageTypes.PROPOSAL_ROOM:
        currentRoom=new ProposalRoom(roomHolder,this);
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.PROPOSAL_ROOM;
        roomHolder.updateView();
        break;
      case MessageTypes.PENDING_APPROVAL_ROOM:
        currentRoom = new PendingApprovalRoom(roomHolder,this,(ArrayList)data.get(0),
                                            (ArrayList)data.get(1));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.PENDING_APPROVAL_ROOM;
        break;
      case MessageTypes.MAIN_PROBLEM_ROOM:
        currentRoom=new MainProblemRoom(roomHolder,this,
                                        ((Boolean)data.get(0)).booleanValue(),
                                        ((Boolean)data.get(1)).booleanValue(),
                                        (ArrayList)data.get(2),(ArrayList)data.get(3));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.MAIN_PROBLEM_ROOM;
        break;
      case MessageTypes.VIEW_PROBLEM_ROOM:
        if(data.size() == 6)
        {
          currentRoom=new ViewProblemRoom(roomHolder,this,(ProblemInformation)data.get(0),
                                          (ArrayList)data.get(1),
                                          ((Boolean)data.get(2)).booleanValue(),
                                          ((Boolean)data.get(3)).booleanValue(),
                                          (String)data.get(4), (ArrayList)data.get(5));
        }
        else
        {
          currentRoom=new ViewProblemRoom(roomHolder,this,(ProblemInformation)data.get(0),
                                          (ArrayList)data.get(1),
                                          ((Boolean)data.get(2)).booleanValue(),
                                          ((Boolean)data.get(3)).booleanValue(),
                                          (String)data.get(4),
                                          (ArrayList)data.get(5), (ArrayList)data.get(6));
        }
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.VIEW_PROBLEM_ROOM;
        break;
      case MessageTypes.UPCOMING_CONTESTS_ROOM:
        currentRoom=new MainContestRoom(roomHolder,this,(ArrayList)data.get(0));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.UPCOMING_CONTESTS_ROOM;
        break;
      case MessageTypes.VIEW_CONTEST_ROOM:
        currentRoom=new ViewContestRoom(roomHolder, this, 
                                        (ContestInformation)data.get(0),
                                        (ArrayList)data.get(1));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.VIEW_CONTEST_ROOM;
        break; 
      case MessageTypes.APPLICATION_ROOM:
        currentRoom=new ApplicationRoom(roomHolder,this,(String)data.get(0));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.APPLICATION_ROOM;
        break; 
      case MessageTypes.MAIN_APPLICATION_ROOM:
        currentRoom=new MainApplicationRoom(roomHolder,this,(ArrayList)data.get(0));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.MAIN_APPLICATION_ROOM;
        break;
      case MessageTypes.VIEW_APPLICATION_ROOM:
        currentRoom = new ViewApplicationRoom(roomHolder,this,
                                            (ApplicationInformation)data.get(0));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType=MessageTypes.VIEW_APPLICATION_ROOM;
        break;
      case MessageTypes.MAIN_USER_ROOM:
        currentRoom = new MainUserRoom(roomHolder, this, (ArrayList)data.get(0));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType = MessageTypes.MAIN_USER_ROOM;
        break;
      case MessageTypes.VIEW_USER_ROOM:
        currentRoom = new ViewUserRoom(roomHolder, this, (UserInformation)data.get(0));
        if(currentRoomType==MessageTypes.MOVING_ROOM) ((MovingRoom)oldRoom).stopCounter();
        roomHolder.setRoom(currentRoom, true);
        currentRoomType = MessageTypes.MAIN_USER_ROOM;
        break;
      default:
        System.out.println("Invalid room type: "+roomType);
    }
    
  }

  /**
   * getCurrentRoomType returns the applet's current room's type.
   *
   * @return The current room.
   */
  public int getCurrentRoomType() 
  {
    return currentRoomType;
  }

  /**
   * getCurrentRoom returns the applet's current room.
   *
   * @return The current Room.
   */
  public Room getCurrentRoom()
  {
    return currentRoom;
  }

  /**
   * getRoomHolder returns the applet's room holder.
   *
   * @return The RoomHolder.
   */
  public RoomHolder getRoomHolder()
  {
    return roomHolder;
  }

  /**
   * kill stops the threads and cleans things in prepreation for the death of the applet.
   *
   */
  public void kill()
  {
    serverConnection.kill();
    roomHolder.kill();
    roomHolder.setVisible(false);
    if(popUp != null)
    {
      popUp.setVisible(false);
    }
    launcher.reActivate();
  }

  /**
   * Called by the AppletWindowListener when something happens to the
   * main window.  This calls the kill method to prepare for the applet's closing.
   *
   * @param e  The event causing this method to be called.
   */
  public void mainFrameClosed(WindowEvent e)
  {
    kill();
  }
 
  /**
   * loadMovingRoom puts the moving room up as the server waits for a move response
   */
  public void loadMovingRoom()
  {
    currentRoomType=MessageTypes.MOVING_ROOM;
    currentRoom=new MovingRoom(roomHolder,this);
    roomHolder.setRoom(currentRoom, false);
    roomHolder.updateView();
  }

  /**
   * Returns a handle on the MPSQAS launcher.
   */
  public LaunchMPSQAS getLauncher()
  {
    return launcher;
  }

  /**
   * sendToServer calls a the ServerConnection to send some data to the server
   *
   * @param type  Type of data
   * @param data  The data
   */
  public void sendToServer(ArrayList data)
  {
    serverConnection.sendObject(data);
  }

  /**
   * Returns true if the user is an admin, false otherwise.
   */
  public boolean isAdmin()
  {
    return admin;
  }

  /**
   * Sets the admin status of the user.
   *
   * @param in true if the user is an admin.
   */
  public void setAdmin(boolean in)
  {
    admin=in;
  }

  /**
   * Causes a pop up window to pop up with the passed message.
   *
   * @param message Message to pop up.
   */
  public void popUp(String message)
  {
    if(popUp!=null) popUp.dispose();

    popUp=new JFrame();
    Rectangle bounds=roomHolder.getBounds();
    Dimension winSize=roomHolder.getWinSize();
    popUp.setTitle("Results");
    popUp.setBounds((int)(bounds.x+bounds.width/2-winSize.getWidth()/4),
                    (int)(bounds.y+bounds.height/2-winSize.getHeight()/4),
                    (int)(winSize.getWidth()/2),
                    (int)(winSize.getHeight()/2));
    Container contentPane=popUp.getContentPane();
    GridBagLayout popUpLayout=new GridBagLayout();
    GridBagConstraints gbc=new GridBagConstraints();
    contentPane.setLayout(popUpLayout);

    JTextArea popUpArea=new JTextArea(message);
    popUpArea.setFont(AppletConstants.FIXED_WIDTH_FONT);
    JScrollPane popUpAreaScrollPane=new JScrollPane(popUpArea);
    popUpArea.setEditable(false);
    gbc.insets=new Insets(5,5,5,5);
    gbc.fill=GridBagConstraints.BOTH;
    AppletConstants.buildConstraints(gbc,0,0,1,1,1,100);
    popUpLayout.setConstraints(popUpAreaScrollPane,gbc);
    contentPane.add(popUpAreaScrollPane);

    JButton popUpOkButton=new JButton("OK");
    gbc.anchor=GridBagConstraints.CENTER;
    gbc.fill=GridBagConstraints.NONE;
    AppletConstants.buildConstraints(gbc,0,1,1,1,0,1);
    popUpLayout.setConstraints(popUpOkButton,gbc);
    contentPane.add(popUpOkButton);

    popUpOkButton.addActionListener(new AppletActionListener("closePopUp",this));

    popUp.setVisible(true);

    popUpArea.setCaretPosition(0);
    popUpOkButton.grabFocus();
  }

  /**
   * Closes the popUp window, if it exists.
   *
   * @param e The event of clicking OK or close
   */
  public void closePopUp(ActionEvent e)
  {
    if(popUp!=null) popUp.dispose();
    popUp=null;
  }

  /**
   * Returns a handle on the MenuSelectionHandler
   */
  public MenuSelectionHandler getMenuSelectionHandler()
  {
    return menuSelectionHandler;
  }

  /**
   * Returns the applet's status box.
   */
  public StatusBox getStatusBox()
  {
    return statusBox;
  }

  private StatusBox statusBox;
  private JFrame popUp;
  private int currentRoomType; 
  private Room currentRoom;
  private ServerConnection serverConnection;  //the connection to the applet server
  private RoomHolder roomHolder; //the main window which holds the rooms
  private LaunchMPSQAS launcher; //the launcher
  private boolean admin;
  private MenuSelectionHandler menuSelectionHandler;
}

