package com.topcoder.mpsqas.appletmanager;

import com.topcoder.mpsqas.common.*;
import java.io.*;
import java.net.*;
import com.topcoder.common.*;

/**
 * ClientConnection
 *
 * This class is responsible for communication with
 * a particular client.
 *
 * @author talub
 *
 */
public class ClientConnection extends Thread
{
  /**
   * The constructor sets up the ClietConnection so it 
   * will be all set to deal with the client when the Thread
   * is started.
   *
   * @param socket The socket to the client
   * @param id A unique id for thie ClientConnection
   * @param map A handle on this servers MainAppletProcessor
   *
   */
  public ClientConnection(Socket socket, int id, MainAppletProcessor map) throws Exception
  {
    Log.msg("Creating new ClientConnection with Id "+id);

    clientSocket=socket;
    connectionId=id;
    communicationProcessor=new CommunicationProcessor(this,id,map);
    resetObjectStreams();
  }

  /**
   * resetObjectStreams closes any current Input/Output Streams and 
   * creates a new Input and a new Output Stream.
   *
   */
  public void resetObjectStreams() throws IOException
  {
    if (inputStream!=null)
    {
      try
      {
        inputStream.close();
      }
      catch(Exception e)
      {  //ignore error closing stream
      }
      inputStream=null;
    }
    if (outputStream!=null)
    {
      try
      {
        outputStream.close();
      }
      catch(Exception e)
      {  //ignore error closing stream
      }
      outputStream=null;
    }
    outputStream=new ObjectOutputStream(
                  new BufferedOutputStream(clientSocket.getOutputStream()));
    outputStream.flush();
    inputStream=new ObjectInputStream(clientSocket.getInputStream());
  }

  /**
   * run continuosly listens for requests from the
   * client and sends the requests to the CommunicationProcessor
   *
   */
  public void run()
  {
    Object o;

    Log.msg("ClientConnection with id "+connectionId+" is starting to listen.");
    while(!isInterrupted())
    {
      try
      {
        clientSocket.setSoTimeout(5000);
        o=((ZippedObject)inputStream.readObject()).getObject();
        communicationProcessor.processInputObject(o);
      }
      catch(StreamCorruptedException sce)
      {
        Log.msg("Bad Object in ClientConnection "+connectionId);
      }
      catch(InterruptedIOException iioe)
      {
      }
      catch(EOFException eofe)        
      {
        Log.msg("Client no longer available in ClientConnection "+connectionId);
        kill();
      }
      catch(IOException ioe)
      {
        Log.msg("Client no longer available in ClientConnection "+connectionId);
        kill();
      }
      catch(Exception e)
      {
        Log.msg("Unknown exception in ClientConnection "+connectionId);
        e.printStackTrace();
      }
    }
    Log.msg("This is ClientConnection.run(), signing off. "+connectionId);
  }

  /**
   * sendObject sends an Object to the client through the output stream.
   *
   * @param o Object to send
   */
  public void sendObject(Object o)
  {
    try
    {
      outputStream.writeObject(new ZippedObject(o));
      outputStream.flush();
    }
    catch(IOException ioe)
    {
      //Try to reset pipes
      try
      {
        resetObjectStreams();
        outputStream.writeObject(new ZippedObject(o));
        outputStream.flush();
      }
      catch(Exception e)
      { //give up
        Log.msg("Lost connection to " + connectionId + ".");
        kill();
      }
    }
    catch(Exception e)
    {
      Log.msg("Unknown exception sending object:");
      e.printStackTrace();
    }
  }

  /**
   * kill interrupts the thread to stop and and closes everything.
   *
   */
  public void kill()
  {
    interrupt();
    
    try
    {
      if(communicationProcessor!=null)communicationProcessor.kill();
    }
    catch (Exception e0)
    {
      Log.msg("Error killing communicationProcessor: ");
      e0.printStackTrace();
    }

    try
    {
      inputStream.close();
    }
    catch (Exception e1)
    {
    }
    try
    {
      outputStream.close();
    }
    catch (Exception e2)
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

  Socket clientSocket;  //the socket to the client
  int connectionId; //unique id of the client
  CommunicationProcessor communicationProcessor; 
                                  //communicationProcessor for client
  ObjectInputStream inputStream;  //input stream from client
  ObjectOutputStream outputStream; //output stream to client
}
