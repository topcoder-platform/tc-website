package com.topcoder.mpsqas.mapplet.messaging;

import java.security.*;
import com.topcoder.mpsqas.common.*;
import java.net.*;
import java.io.*;

/**
 * ServerConnection is the class responsable for talking
 * to the server.  This class sends and receives objects
 * to and from the server.
 *
 */
public class ServerConnection extends Thread
{
  /**
   * The constructor sets up the connection and 
   * prepares it to run.
   *
   * @param ip        ip address of server 
   * @param port      port on server for connection
   * @param handler   processor to which any objects coming from the server are sent
   *
   */
  public ServerConnection (String ip, int port,InputProcessor handler) throws Exception
  {
      try
      {
      clientSocket=new Socket(ip,port); 
      }
      catch(AccessControlException e1)
      {
        e1.printStackTrace();
        System.out.println(e1.getPermission().toString());
      }
      inputProcessor=handler;
      resetObjectStreams();
  }

  /**
   * resetObjectStreams closes any current Input/Output Streams
   * and creats a new Input and a new Output Stream
   *
   */
  public void resetObjectStreams() throws IOException
  {
    if(inputStream!=null)
    {
      inputStream.close();
      inputStream=null;
    }
    if(outputStream!=null)
    {
      outputStream.close();
      outputStream=null;
    }
    outputStream=new ObjectOutputStream(new BufferedOutputStream(clientSocket.getOutputStream()));
    outputStream.flush();
    inputStream=new ObjectInputStream(clientSocket.getInputStream());
  }

  /**
   *  run constantly listens for input and sends any objects that come in
   *  to the InputProcessor.
   *
   */
  public void run()
  {
    Object o;
    while(!isInterrupted())
    {
      try
      {
        clientSocket.setSoTimeout(5000);
        o=((ZippedObject)inputStream.readObject()).getObject();
        inputProcessor.processObject(o);
      }
      catch(InterruptedIOException iioe)
      {
      }
      catch(SocketException se)
      {
      }
      catch(EOFException eof)
      {
        System.out.println("Unexpected eof exception:");
        eof.printStackTrace();
        inputProcessor.shutDown();
      }
      catch(Exception e)
      {
        System.out.println("Unknown exception getting Object in ServerConnection:");
        e.printStackTrace();
      }
    }
  }

  /**
   *  sendObject sends a zipped version of an Object to the server
   *  through the output stream.
   *
   *  @param o   Object to send
   */
  public void sendObject(Object o)
  {
    try
    {
      outputStream.writeObject(new ZippedObject(o));
      outputStream.flush();
    }
    catch(Exception e)
    {
      System.out.println("Unknown Exception sending Object in ServerConnection:");
      e.printStackTrace();
    }
  }
   
  /**
   * kill interrupts the thread to stop and and closes everything.
   *
   */
  public void kill()
  {
    try
    {
      interrupt();
    } 
    catch(Exception e0) 
    {
    }

    try
    {
      inputStream.close();
    }
    catch(Exception e1)
    {
    }
    try
    {
      outputStream.close();
    }
    catch(Exception e2)
    {
    }
    try
    {
      clientSocket.close();
    }
    catch(Exception e3)
    {
    }
  } 

  ObjectInputStream inputStream;  //stream to get objects from server
  ObjectOutputStream outputStream;  //stream to send object to server
  InputProcessor inputProcessor;  //processor to handle input Objects.
  Socket clientSocket; //socket connection to server
}
