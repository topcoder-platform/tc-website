package com.topcoder.mpsqas.mapplet;

import java.awt.event.*;
import javax.swing.*;
import com.topcoder.mpsqas.mapplet.messaging.*;
import com.topcoder.mpsqas.common.*;
import java.util.*;
import java.net.*;

/**
 * A class to handle all menu selections.
 */
public class MenuSelectionHandler
{
  /**
   * The constructor stores some global information about the applet.
   *
   * @param mainApplet The MainApplet.
   * @param serverConnection Connection to the server.
   */
  public MenuSelectionHandler(MainApplet mainApplet, ServerConnection serverConnection)
  {
    this.mainApplet = mainApplet;
    this.serverConnection = serverConnection;
  }

  /**
   * exit is called when the exit menu option is choosen. It kills the thread
   * and exits the applet.
   *
   * @param e   The ActionEvent causing this method to be called.
   */
  public void exit(ActionEvent e)
  {
    mainApplet.kill();
  }

  /**
   * Puts up the moving window and requests the applet server to move to a 
   * problem writer application room.
   *
   * @param e The ActionEvent causing the method to be called.
   */
  public void loadWriterApplication(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList request=new ArrayList();
    request.add(new Integer(MessageTypes.MOVE_RQ));
    request.add(new Integer(MessageTypes.APPLICATION_ROOM));
    request.add(new Integer(MessageTypes.WRITER_APPLICATION));
    serverConnection.sendObject(request);
  }

  /**
   * Puts up the moving window and request the applet server to move to a problem
   * problem tester application room.
   *
   * @param e The ActionEvent causing the method to be called.
   */
  public void loadTesterApplication(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList request=new ArrayList();
    request.add(new Integer(MessageTypes.MOVE_RQ));
    request.add(new Integer(MessageTypes.APPLICATION_ROOM));
    request.add(new Integer(MessageTypes.TESTER_APPLICATION));
    serverConnection.sendObject(request);
  }

  /**
   * loadProposalRoom changes the current room to an empty problem propsal room so the
   * user can propose a problem.
   *
   * @param e The ActionEvent causing the method to be called.
   */
  public void loadProposalRoom(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList moveRequest=new ArrayList();
    moveRequest.add(new Integer(MessageTypes.MOVE_RQ));
    moveRequest.add(new Integer(MessageTypes.PROPOSAL_ROOM));
    serverConnection.sendObject(moveRequest);
  }

  /**
   * loadFoyer moves a user to the Foyer Room by calling move.
   *
   * @param e The ActionEvent causing the method to be called
   */
  public void loadFoyer(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList moveRequest=new ArrayList();
    moveRequest.add(new Integer(MessageTypes.MOVE_RQ));
    moveRequest.add(new Integer(MessageTypes.FOYER_ROOM));
    serverConnection.sendObject(moveRequest);
  }

  /**
   * loadPendingApproval is called when an admin wants to go
   * to the room to view pending proposals.  It sends a move request to
   * the server and pops up a moving room.
   *
   * @param e The ActionEvent causing the method to be called
   */
  public void loadPendingApproval(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList moveRequest=new ArrayList();
    moveRequest.add(new Integer(MessageTypes.MOVE_RQ));
    moveRequest.add(new Integer(MessageTypes.PENDING_APPROVAL_ROOM));
    serverConnection.sendObject(moveRequest);
  }

  /**
   * Sends a move request to the applet server for a MAIN_APPLICATION_ROOM and puts up
   * the loading room window.
   *
   * @param e The ActionEvent causing the method to be called.
   */
  public void loadPendingApplication(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList moveRequest=new ArrayList();
    moveRequest.add(new Integer(MessageTypes.MOVE_RQ));
    moveRequest.add(new Integer(MessageTypes.MAIN_APPLICATION_ROOM));
    serverConnection.sendObject(moveRequest);
  }

  /**
   * loadMainProblemRoom puts up the moving room as the client waits for a move response
   * and sends a move request to the server
   *
   * @param ActionEvent e The event causing the method to be called.
   */
  public void loadMainProblemRoom(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList moveRequest=new ArrayList();
    moveRequest.add(new Integer(MessageTypes.MOVE_RQ));
    moveRequest.add(new Integer(MessageTypes.MAIN_PROBLEM_ROOM));
    serverConnection.sendObject(moveRequest);
  }

  /**
   * loadUpcomingContestsRoom puts up the moving room as the client waits for a move
   * response and sends a move request to the server.
   *
   * @param ActionEvent e The event causing the method to be called.
   */
  public void loadUpcomingContestsRoom(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList moveRequest=new ArrayList();
    moveRequest.add(new Integer(MessageTypes.MOVE_RQ));
    moveRequest.add(new Integer(MessageTypes.UPCOMING_CONTESTS_ROOM));
    serverConnection.sendObject(moveRequest);
  }

  /**
   * Sends a request to the server to view all problems.
   *
   * @param ActionEvent e The event causing the method to be called.
   */
  public void loadAllProblems(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList moveRequest=new ArrayList();
    moveRequest.add(new Integer(MessageTypes.MOVE_RQ));
    moveRequest.add(new Integer(MessageTypes.MAIN_PROBLEM_ROOM));
    moveRequest.add(new Integer(MessageTypes.ALL_PROBLEMS));
    serverConnection.sendObject(moveRequest);
  }

  /**
   * Opens the about window.
   *
   * @param ActionEvent e The event causing the method to be called.
   */
  public void about(ActionEvent e)
  {
    mainApplet.popUp(AppletConstants.ABOUT);
  }

  /**
   * Opens the change log window.
   *
   * @param ActionEvent e The event causing the method to be called.
   */
  public void loadChangeLog(ActionEvent e)
  {
    mainApplet.popUp(AppletConstants.CHANGE_LOG);
  }

  /**
   * Opens an HTML browser showing the help contents.
   *
   * @param ActionEvent e The event causing the method to be called.
   */
  public void loadHelp(ActionEvent e)
  {
    try
    {
      mainApplet.getLauncher().getAppletContext().showDocument(
                               new URL(AppletConstants.HELP_CONTENTS_URL), "_blank");
    }
    catch (Exception ue)
    {
      System.out.println("Error loading help:");
      ue.printStackTrace();
    }
  }

  /**
   * Puts up the moving room and sends a move request to the server 
   * for a MAIN_USER_ROOM.
   *
   * @param e The action of clicking the Payment menu.
   */
  public void loadUsers(ActionEvent e)
  {
    mainApplet.loadMovingRoom();
    ArrayList moveRequest=new ArrayList();
    moveRequest.add(new Integer(MessageTypes.MOVE_RQ));
    moveRequest.add(new Integer(MessageTypes.MAIN_USER_ROOM));
    serverConnection.sendObject(moveRequest);
  }

  private MainApplet mainApplet;
  private ServerConnection serverConnection;
}
