package com.topcoder.mpsqas.appletmanager;

import com.topcoder.shared.util.logging.Logger;
import java.net.*;
import java.io.*;
/**
 * ConnectionManager.java
 *
 * ConnectionManager listens for clients trying to connect 
 * and gives the client a threaded ClientConnection
 *
 * @author mitalub
 */
public class ConnectionManager extends Thread
{
  private static Logger log = Logger.getLogger(ConnectionManager.class);
  /**
   * The Constructor sets up a ConnectionManager and prepares
   * it to listen to connections.
   *
   * @param port The port the ConnectionManager listens to. 
   * @param map  The MainAppletProcessor on this server.
   *
   * @throws UnknownHostException if the host ip is not known.
   */
  public ConnectionManager(int port,MainAppletProcessor map) throws UnknownHostException
  {
    serverPort=port;
    serverIP = InetAddress.getLocalHost().getHostAddress();
    mainAppletProcessor=map;
  }

  /**
   * run continuosly listens for clients and when a client is found it sets the client up.
   * stops running when thread has been interuppted by kill
   *
   */
  public void run()
  {
    ServerSocket listener=null;
    Socket clientSocket;
    ClientConnection connection;
    int nextConnectionId=100000;  //a counter so each ClientConnection has a unique id
    log.debug("ConnectionManager starting to listen.");

    try
    {
      listener=new ServerSocket(serverPort);
    }
    catch(IOException ioe)
    {
      log.error("Error creating ConnectionManager listener ServerSocket:");
      ioe.printStackTrace();
      log.error("Returning from ConnectionManager.run");
      return;
    }

    while (!isInterrupted())
    {
      try
      {
        listener.setSoTimeout(2000);
        clientSocket=listener.accept();
      }
      catch (InterruptedIOException iioe)
      {
        continue;
      }
      catch (Exception e1)
      {
        log.error("Error listening for client connections:");
        e1.printStackTrace();
        continue;
      }

      log.debug("Got new client");
      try
      {
        connection=new ClientConnection(clientSocket,nextConnectionId,mainAppletProcessor);
        connection.start();
        connection=null; 
      }
      catch(Exception e2)
      {
        log.error("Error setting up new ClientConnnection:");
        e2.printStackTrace(); 
      }

      nextConnectionId++;
    }

    log.debug("This is ConnectionManager.run, signing off.");
  }

  /**
   * kill kills the ConnectionManger by interuppting the thread
   *
   */
  public void kill()
  {
    log.debug("Killing ConnectionManager.");
    try
    {
      interrupt();
    }
    catch (Exception e)
    {
      log.error("Could not interrupt ConnectionManager run method:");
      e.printStackTrace();
    }
  }

  int serverPort; //listening port of server
  String serverIP;  //ip address of server
  MainAppletProcessor mainAppletProcessor; //the MainAppletProcessor on this applet server.
}
    
