package com.topcoder.mpsqas.tester;

import java.util.*;
import java.net.*;
import java.io.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.common.*;

/**
 * TesterQueue is class which holds all pending tests.  Tests can be added to the queue through a socket.
 * Testers register themselves with the Queue as they are created / freed up.  When there is a free tester
 * and a pending test, the queue creates a TesterConnection, which takes care of the test.  
 *
 * @author mitalub
 */
public class TesterQueue extends Thread
{
  /**
   * Starts up the TesterQueue.
   */
  public static void main(String[] args)
  {
    TesterQueue t=new TesterQueue();
  }

  /**
   * The constructor starts up the queue, first to listen to connections to add to the queue, and second to listen
   * to connections to take from the queue.
   */
  public TesterQueue()
  {
    pendingTestSockets=new Vector();
    availableTesters=new Vector();
    start();
    listenForGetTest();
  }

  /**
   * Starts the queue listening for PutTests.
   */
  public void run()
  {
    listenForPutTest();
  }

  /**
   * Starts a ServerSocket to listen for GetTests and then continuously waits for tester connections, puts
   * the tester on the Vector, and distribute's a test.
   */
  private void listenForGetTest()
  {
    ServerSocket listener=null;
    Socket socket;
 
    try
    {
      listener=new ServerSocket(ApplicationConstants.GET_TEST_PORT);
    }
    catch(Exception e)
    {
      Log.msg("Error setting up ServerSocket for GetTests.");
      e.printStackTrace();
      return;
    }

    Log.msg("Beginning to listen for testers.");
    while(!isInterrupted())
    {
      try
      {
        socket=listener.accept();
        availableTesters.add(socket);
        Log.msg("Adding Tester to Queue.");
        distributeTest();
      }
      catch(Exception e2)
      {
        Log.msg("Error getting GetTest:");
        e2.printStackTrace();
      }
    }
  }

  /**
   * Starts a ServerSocket to listen for PutTests and then continously waits for tests.
   */
  private void listenForPutTest()
  {
    ServerSocket listener=null;
    Socket socket;

    try
    {
      listener=new ServerSocket(ApplicationConstants.PUT_TEST_PORT);
    }
    catch(Exception e)
    {
      Log.msg("Error initiating PutTest socket.");
      e.printStackTrace(); 
      return;
    }

    Log.msg("Beginning to listen for tests.");
    while(!isInterrupted())
    {
      try
      {
        socket=listener.accept();
        Log.msg("Adding Pending Test to Queue.");
        pendingTestSockets.addElement(socket);
        distributeTest();
      }
      catch(Exception e2)
      {
        Log.msg("Error getting PutTest:");
        e2.printStackTrace();
      }
    } 
  }

  /**
   * If there is a waiting test and a waiting tester, sets up a TesterConnection to
   * do the test.  Otherwise, does nothing.  Recusively calls itself if there 
   * was a test to ensure one of the queue's is left empty.
   */
  private synchronized void distributeTest()
  {
    if(availableTesters.isEmpty() || pendingTestSockets.isEmpty()) return;

    Log.msg("Distributing Test.");

    Socket tester=(Socket)availableTesters.remove(0);
    Socket waiter=(Socket)pendingTestSockets.remove(0);

    TesterConnection ts=new TesterConnection(waiter,tester);
    ts.start();

    distributeTest();
  }
 
  private Vector availableTesters; 
  private Vector pendingTestSockets;  
}
