package com.topcoder.mpsqas.tester;

import com.topcoder.mpsqas.common.*;
import com.topcoder.common.*;
import java.util.ArrayList;
import java.net.*;
import java.io.*;

/**
 * TesterConnection manages communication between a tester and a testerwaiter via sockets.
 * It sends the test information to the tester, waits for a response, and then sends the 
 * response to the testerwaiter.
 *
 * @author mitalub
 */
public class TesterConnection extends Thread
{
  /**
   * The constructor stores some information about the test and sockets.
   *
   * @param testWaiterSocket The socket connection to the TesterWaiter.
   * @param testerSocket The socket connection to the tester
   */
  public TesterConnection(Socket testWaiterSocket, Socket testerSocket)
  {
    this.testWaiterSocket=testWaiterSocket;
    this.testerSocket=testerSocket;
  }

  /**
   * Sets up the sockets and performs the test.
   */
  public void run()
  {
    ObjectOutputStream testerOut=null;
    ObjectInputStream testerIn=null;
    ObjectOutputStream waiterOut=null;
    ObjectInputStream waiterIn=null;
    Object testResponse;
    Object testObject;
    boolean doTest=true;

    //try setting up the streams.
    try
    {
      testerOut=new ObjectOutputStream(new BufferedOutputStream(testerSocket.getOutputStream()));
      testerOut.flush();
      testerIn=new ObjectInputStream(testerSocket.getInputStream());
      testerSocket.setSoTimeout((int)(2*ApplicationConstants.TIME_OUT_MILLIS));

      waiterOut=new ObjectOutputStream(new BufferedOutputStream(testWaiterSocket.getOutputStream()));
      waiterOut.flush();
      waiterIn=new ObjectInputStream(testWaiterSocket.getInputStream());
      testWaiterSocket.setSoTimeout(2*(int)ApplicationConstants.TIME_OUT_MILLIS);
    }
    catch(Exception e1)
    {
      Log.msg("Error setting up test: ");
      e1.printStackTrace(); 
      doTest=false;
    }

    //perform the test
    if(doTest)
    {
      try
      {
        testObject=waiterIn.readObject();
        Log.msg("Got test from TesterWaiter.");
        
        testerOut.writeObject(testObject);
        testerOut.flush();
  
        testResponse=testerIn.readObject();
        Log.msg("Got test results from Tester.");
  
        waiterOut.writeObject(testResponse);
        waiterOut.flush();
      }
      catch(Exception e2)
      {
        Log.msg("Error performing test: ");
        e2.printStackTrace();
      }
    } 


    //close everything
    try
    {
      testerOut.close();
    }
    catch(Exception e3)
    {
    }

    try
    {
      testerIn.close();
    }
    catch(Exception e4)
    {
    }

    try
    {
      testerSocket.close();
    }
    catch(Exception e5)
    {
    }
 
    try
    {
      waiterOut.close();
    }
    catch(Exception e6)
    {
    }

    try
    {
      waiterIn.close();
    }
    catch(Exception e7)
    {
    }

    try
    {
      testWaiterSocket.close();
    }
    catch(Exception e8)
    {
    }
  }

  private Socket testerSocket;
  private Socket testWaiterSocket;
}

    


