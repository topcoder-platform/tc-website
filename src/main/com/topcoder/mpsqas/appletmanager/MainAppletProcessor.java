package com.topcoder.mpsqas.appletmanager;

import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import java.sql.Timestamp;
import java.io.*;
import java.net.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.ejb.MPSQASServices.*;
import javax.naming.*;
import java.util.*;
import com.topcoder.tcclasses.*;

/**
 * MainAppletProcessor is responsable for all applet server processing
 * and for keeping a small cache about the current state of everyone.
 * It extends Thread and the thread listens for broadcasts from the application
 * server processes the broadcasts, and sends the to the applet's communication
 * processors.
 *
 * @author mitalub
 *
 */
public class MainAppletProcessor extends Thread {
  private static Logger log = Logger.getLogger(MainAppletProcessor.class);
  /**
   * main creates the MainAppletProcessor.
   *
   * @param args[0] the port to which the ConnectionManager should listen.
   *
   * @throws NumberFormatException if port is not a valid int.
   */
  public static void main (String[]args)
  {
    if (args.length!=1)
    {
      log.debug("Usage: java mpsqas.appletmanager.MainAppletProcessor "
                            + "<port>");
      return;
    }

    int port=Integer.parseInt(args[0]);

    MainAppletProcessor map=new MainAppletProcessor(port);
  }

  /**
   * The constructor sets up the MainAppletProcessor and a ConnectionManager
   * to go along with it.
   *
   * @param port the port to which the ConnectionManager should listen.
   *
   */
  public MainAppletProcessor(int port)
  {
    try
    {
      InitialContext ctx=(InitialContext)TCContext.getInitial();
      mpsqasHome=(MPSQASServicesHome)ctx.lookup(ApplicationServer.MPSQAS_SERVICES);
      cm=new ConnectionManager(port,this);
      cm.start();
      bp = new BackgroundProcessor(this);
      bp.start();
      chatHistory = new ArrayList();
      activeUsers=new Matrix2D(5,0,true);
    }
    catch (Exception e)
    {
      log.error("Count not start Connection Manager: ");
      e.printStackTrace();
    }
    start();  
  }

  /**
   * addUser adds a user to the list of currently logged in users.
   * 
   * @param id         The processor id for the user
   * @param cp         The CommunicationProcessor of the user to add.
   * @param userName   The userName of the user to add
   */
  public void addUser(int id,CommunicationProcessor cp,String userName)
  {
    ArrayList user=new ArrayList(3);
    user.add(new Integer(id));  //user name
    user.add(cp);    //communication processor
    user.add(new Integer(-1));  //current room type
    user.add(new Integer(-1));  //current round id 
    user.add(userName);  //current round id 
    activeUsers.addCol();
    activeUsers.setCol(activeUsers.numCols()-1,user);
  }

  /**
   * removeUser removes a user from the list of currently logged in user.
   *
   * @param id The connection id of the user to remove
   */
  public void removeUser(int id)
  {
    int index=activeUsers.getRow(0).indexOf(new Integer(id));
    if(index!=-1) 
    { 
      moveUser(id,-1,-1); 
      activeUsers.removeCol(index);
    }
  }

  /**
   * Moves a user by changing the room type and round id
   *
   * @param id The processor id of the moving user
   * @param roomType new room type
   * @param roomId  new room id (round or problem id)
   */
  public void moveUser(int id, int roomType, int roomId)
  {
    log.debug("Moving User: connection="+id+"  roomType="+roomType+"  id= "+roomId);
    int index = activeUsers.getRow(0).indexOf(new Integer(id));
    if(index != -1)
    {
      int oldRoom = ((Integer)activeUsers.get(2,index)).intValue();;
      int oldId = ((Integer)activeUsers.get(3,index)).intValue();;
      activeUsers.set(2, index,new Integer(roomType));
      activeUsers.set(3, index,new Integer(roomId)); 

      if(oldRoom == MessageTypes.VIEW_CONTEST_ROOM ||
         oldRoom == MessageTypes.VIEW_PROBLEM_ROOM) //we have to broadcast his exit to users
      {
        ArrayList userListResponse = new ArrayList(2);
        userListResponse.add(new Integer(MessageTypes.NEW_USER_LIST_RS));
        userListResponse.add(getUserList(oldRoom,oldId));
        sendResponseToRoom(MessageTypes.NEW_USER_LIST_RS, userListResponse,
                           oldRoom, oldId, id); //everyone in room EXCEPT him

        ArrayList exitChat = new ArrayList(2);
        exitChat.add(new Integer(MessageTypes.CHAT_RS));
        exitChat.add("System> "+(String)activeUsers.get(4,index)+" left the room.\n");
        sendResponseToRoom(MessageTypes.CHAT_RS, exitChat, oldRoom, oldId, id);
      }
      if(roomType == MessageTypes.VIEW_CONTEST_ROOM ||
         roomType == MessageTypes.VIEW_PROBLEM_ROOM) //we have to broadcast his exit to users
      {
        ArrayList userListResponse=new ArrayList(2);
        userListResponse.add(new Integer(MessageTypes.NEW_USER_LIST_RS));
        userListResponse.add(getUserList(roomType,roomId));
        sendResponseToRoom(MessageTypes.NEW_USER_LIST_RS, userListResponse, roomType, roomId, id);

        ArrayList enterChat = new ArrayList(2);
        enterChat.add(new Integer(MessageTypes.CHAT_RS));
        enterChat.add("System> " + (String)activeUsers.get(4,index) + " entered the room.\n");
        sendResponseToRoom(MessageTypes.CHAT_RS, enterChat, roomType, roomId);  //the user does get this
      }

    }
  }

  /**
   * sendResponseToEveryone sends a response to all the active users.  
   *
   * @param type    The response type.
   * @param data    The response data.
   */
  public void sendResponseToEveryone(int type,Object data)
  {
    for(int i=0;i<activeUsers.numCols();i++)
      ((CommunicationProcessor)activeUsers.get(1,i)).processOutputObject(type,data);
  }

  /**
   * sendResponseToRoom sends a response to everyone in a current type of room, and, if the 
   * room is a VIEW_*_ROOM only to a particular id of that room
   *
   * @param type The response type.
   * @param data The response data.
   * @param roomType The room type.
   * @param id  The id of the room (ignored unless roomType is id sensitive);
   */
  public void sendResponseToRoom(int type,Object data,int roomType,int id)
  {
    for(int i=0;i<activeUsers.numCols();i++)
    {
      if(((Integer)activeUsers.get(2,i)).intValue()==roomType 
            && ((roomType!=MessageTypes.VIEW_CONTEST_ROOM 
            && roomType!=MessageTypes.VIEW_PROBLEM_ROOM)
            || ((Integer)activeUsers.get(3,i)).intValue()==id))
      {
        ((CommunicationProcessor)activeUsers.get(1,i)).processOutputObject(type,data);
      }
    }
  }

  /**
   * sendResponseToRoom sends a response to everyone in a current type of room except 1 
   * user, and, if the room is a VIEW_*_ROOM only to a particular id of that room
   *
   * @param type The response type.
   * @param data The response data.
   * @param roomType The room type.
   * @param id  The id of the room (ignored unless roomType is id sensitive);
   * @param connectionId  The connectionId not to send the message to
   */
  public void sendResponseToRoom(int type,Object data,int roomType,int id,int connectionId)
  {
    for(int i=0;i<activeUsers.numCols();i++)
    {
      if( ((Integer)activeUsers.get(2,i)).intValue()==roomType 
          && ((roomType!=MessageTypes.VIEW_CONTEST_ROOM 
          && roomType!=MessageTypes.VIEW_PROBLEM_ROOM) 
          || ((Integer)activeUsers.get(3,i)).intValue()==id))
      {
        if(((Integer)activeUsers.get(0,i)).intValue()!=connectionId)
          ((CommunicationProcessor)activeUsers.get(1,i)).processOutputObject(type,data);
      }
    }
  }

  /**
   * Returns an ArrayList of users in the current room type/ round Id.  The roundId is 
   * ignored if it is not a VIEW_CONTEST_ROOM
   *
   * @param roomType The room type for which to get the users.
   * @param id The id for which to get the users.
   */
  public ArrayList getUserList(int roomType, int id)
  {
    ArrayList userNames=new ArrayList();
    for(int i=0;i<activeUsers.numCols();i++)
    {
      if(((Integer)activeUsers.get(2, i)).intValue() == roomType 
           && ((roomType != MessageTypes.VIEW_CONTEST_ROOM 
                && roomType != MessageTypes.VIEW_PROBLEM_ROOM)
           || ((Integer)activeUsers.get(3, i)).intValue() == id))
      {
        userNames.add(activeUsers.get(4, i));
      }
    }
    return userNames;
  }

  /**
   * Returns an ArrayList of users in the current room type/ round Id.  The roundId is 
   * ignored if it is not a VIEW_CONTEST_ROOM.  Guarantees the user who has the specified
   * connection id shows up in the list.
   *
   * @param roomType The room type for which to get the users.
   * @param id The id for which to get the users.
   */
  public ArrayList getUserList(int roomType, int id, int connectionId)
  {
    ArrayList userNames=new ArrayList();
    for(int i=0;i<activeUsers.numCols();i++)
    {
      if((((Integer)activeUsers.get(2, i)).intValue() == roomType 
           && ((roomType != MessageTypes.VIEW_CONTEST_ROOM 
                && roomType != MessageTypes.VIEW_PROBLEM_ROOM)
           || ((Integer)activeUsers.get(3, i)).intValue() == id))
         ||((Integer)activeUsers.get(0, i)).intValue() == connectionId)
      {
        userNames.add(activeUsers.get(4,i));
      }
    }
    return userNames;
  }

  /**
   * Continuously listens for connections from the application server.  When it gets a 
   * connection, it sends out the broadcast (the appropriate message) and goes back to 
   * listening.
   */
  public void run()
  {
    ServerSocket listener=null;
    Socket aSocket=null;
    ObjectOutputStream outputStream;
    ObjectInputStream inputStream;

    try
    {
      listener=new ServerSocket(ApplicationConstants.INTERNAL_COMMUNICATION_PORT);
    }
    catch(Exception e)
    {
      log.error("Error creating port to communication with application server:");
      e.printStackTrace();
    }

    while(!isInterrupted())
    {
      try
      {
        aSocket=listener.accept();

        outputStream=new ObjectOutputStream(
                              new BufferedOutputStream(aSocket.getOutputStream()));
        outputStream.flush();
        inputStream=new ObjectInputStream(aSocket.getInputStream());

        //get the data (only wait so long, there might be others waiting)
        aSocket.setSoTimeout((int)ApplicationConstants.TIME_OUT_MILLIS);
        ArrayList data=(ArrayList)((ZippedObject)inputStream.readObject()).getObject();

        try
        {
          outputStream.close();
        }
        catch(Exception e1)
        {
        }
        try
        {
          inputStream.close();
        }
        catch(Exception e2)
        {
        }
        try
        {
          aSocket.close();
        }
        catch(Exception e3)
        {
        }

        processBroadcast(((Integer)data.remove(0)).intValue(),data);
      }
      catch(Exception e)
      {
        log.error("Error getting Broadcast information from application server: ");
        e.printStackTrace();
      }
    } 
    log.debug("This is MainAppletServer.run(), signing off."); 
  }

  /**
   * Processes broadcast information from application server, and sends out broadcast to 
   * correct users.
   *
   * @param type Type of broadcast.
   * @param data Data corresponding to broadcast.
   */
  private void processBroadcast(int type,ArrayList data)
  {
    switch(type)
    {
      case ApplicationConstants.CORRESPONDENCE_BROADCAST_IN:
        log.debug("MainAppletProcessor got CORRESPONDENCE_BROADCAST_IN.");
        ArrayList newCorrespondenceResponse=new ArrayList();
        newCorrespondenceResponse.add(new Integer(MessageTypes.NEW_CORRESPONDENCE_RS));
        newCorrespondenceResponse.add(data.get(0));
        sendResponseToRoom(MessageTypes.NEW_CORRESPONDENCE_RS,
                           newCorrespondenceResponse,
                           MessageTypes.VIEW_PROBLEM_ROOM,
                           ((Integer)data.get(1)).intValue());
        break;
      case ApplicationConstants.ROUND_SCHEDULE_BROADCAST_IN:
        log.debug("MainAppletProcessor got ROUND_SCHEDULE_BROADCAST_IN.");
        ArrayList newRoundScheduleResponse=new ArrayList();
        newRoundScheduleResponse.add(new Integer(MessageTypes.NEW_ROUND_SCHEDULE_RS));
        newRoundScheduleResponse.add(data.get(0));
        sendResponseToRoom(MessageTypes.NEW_ROUND_SCHEDULE_RS,
                           newRoundScheduleResponse,
                           MessageTypes.VIEW_CONTEST_ROOM,
                           ((Integer)data.get(1)).intValue());
        break;
      case ApplicationConstants.PENDING_PROPOSAL_BROADCAST_IN:
        log.debug("MainAppletProcessor got PENDING_PROPOSAL_BROADCAST_IN.");
        ArrayList newProposalResponse=new ArrayList();
        newProposalResponse.add(new Integer(MessageTypes.NEW_PENDING_PROPOSAL_RS));
        newProposalResponse.add(data.get(0));
        sendResponseToRoom(MessageTypes.NEW_PENDING_PROPOSAL_RS,
                           newProposalResponse,
                           MessageTypes.PENDING_APPROVAL_ROOM,
                           -1);
        break; 
      case ApplicationConstants.PENDING_SUBMISSION_BROADCAST_IN:
        log.debug("MainAppletProcessor got PENDING_SUBMISSION_BROADCAST_IN.");
        ArrayList newSubmissionResponse=new ArrayList();
        newSubmissionResponse.add(new Integer(MessageTypes.NEW_PENDING_SUBMISSION_RS));
        newSubmissionResponse.add(data.get(0));
        sendResponseToRoom(MessageTypes.NEW_PENDING_SUBMISSION_RS,
                           newSubmissionResponse,
                           MessageTypes.PENDING_APPROVAL_ROOM,
                           -1);
        break; 
      case ApplicationConstants.PROBLEM_MODIFIED_BROADCAST_IN:
        log.debug("MainAppletProcessor got PROBLEM_MODIFIED_BROADCAST_IN.");
        ArrayList genBroadcastResponse=new ArrayList();
        genBroadcastResponse.add(new Integer(MessageTypes.PROBLEM_MODIFIED_RS));
        genBroadcastResponse.add(data.get(0));
        sendResponseToRoom(MessageTypes.PROBLEM_MODIFIED_RS,
                           genBroadcastResponse,
                           MessageTypes.VIEW_PROBLEM_ROOM,
                           ((Integer)data.get(1)).intValue(),
                           ((Integer)data.get(2)).intValue());
        break;
      case ApplicationConstants.PENDING_APPLICATION_BROADCAST_IN:
        log.debug("MainAppletProcessor got PENDING_APPLICATION_BROADCAST_IN.");
        ArrayList pendingAppResponse=new ArrayList();
        pendingAppResponse.add(new Integer(MessageTypes.NEW_PENDING_APPLICATION_RS));
        pendingAppResponse.add(data.get(0));
        sendResponseToRoom(MessageTypes.NEW_PENDING_APPLICATION_RS,
                            pendingAppResponse,
                            MessageTypes.MAIN_APPLICATION_ROOM,
                            -1);
        break;
      default:
        log.debug("Got invalid internal broadcast type: "+type);
    }
  }

  /**
   * Adds a message to the chat_history list.
   *
   * @param roundId The round_id of the room the coder is in.
   * @param problemId The problem_id of the room the coder is in. 
   *                  Note: one of roundId, problemId has to be -1.
   * @param coderId The coder id of the one who said the message.
   * @param message The chat message.
   */
  public void logChatMessage(int roundId, int problemId, int coderId, String message)
  {
    ArrayList chatInfo = new ArrayList(4);
    chatInfo.add(new Integer(roundId));
    chatInfo.add(new Integer(problemId));
    chatInfo.add(new Integer(coderId));
    chatInfo.add(new Timestamp(System.currentTimeMillis()));
    chatInfo.add(message);
    chatHistory.add(chatInfo);
  }

  /**
   * Returns the chat history without clearing it.
   */
  public ArrayList getChatHistory()
  {
    ArrayList copy = (ArrayList)chatHistory.clone();
    return copy;
  }

  /**
   * Clears the chat queue and returns a copy of it.
   */
  public ArrayList clearChatHistory()
  {
    ArrayList copy = (ArrayList)chatHistory.clone();
    chatHistory.clear();
    return copy;
  }

  /**
   * Sends a PING_RS to all the users currently logged so everyone keeps their connections. 
   */
  public void pingUsers()
  {
    ArrayList pingResponse = new ArrayList();
    pingResponse.add(new Integer(MessageTypes.PING_RS));
    sendResponseToEveryone(MessageTypes.PING_RS, pingResponse);
  }

  ConnectionManager cm; 
         //the ConnectionManager to listen for clients on this applet server.

  private MPSQASServicesHome mpsqasHome; //MPSQAS bean home

  private Matrix2D activeUsers;  
              //array of active users  rows are id, communication processor,
              // current room type, current round id

  private ArrayList chatHistory; 
              //chat history, of inner arraylists where each element is of form
              //round_id, coder_id, timestamp, message

  private BackgroundProcessor bp;
}
