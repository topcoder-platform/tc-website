package com.topcoder.server.messaging;

import java.util.*;
import java.io.*;
import javax.jms.*;
import javax.naming.*;

import com.topcoder.common.*;

public class ReceiverController extends Thread {

  InitialContext ctx;
  QueueConnectionFactory qconFactory;
  QueueConnection qcon;
  Queue queue;
  QueueSession qsession;
  QueueReceiver qreceiver;

  String factoryName;
  String queueName;
  String selector;

  int errorTime;
  int pollTime;
  int consoleMessageTime;

  long timeStamp;

  boolean receiverReady;
  boolean active;
  boolean initInProgress;
  boolean transacted;
  boolean VERBOSE = true;

  ////////////////////////////////////////////////////////////////////////////////
  public ReceiverController (String factoryName, String queueName, boolean isTransacted) throws NamingException
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.transacted = isTransacted;
    this.ctx = TCContext.getInitial();
    initObject(factoryName, queueName, "");
    initJMS();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public ReceiverController (String factoryName, String queueName, boolean isTransacted, InitialContext ctx)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.transacted = isTransacted;
    this.ctx = ctx;
    initObject(factoryName, queueName, "");
    initJMS();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public ReceiverController (String factoryName, String queueName, boolean isTransacted, InitialContext ctx, String selector)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.transacted = isTransacted;
    this.ctx = ctx;
    initObject(factoryName, queueName, selector);
    initJMS();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public void run() {
  ////////////////////////////////////////////////////////////////////////////////
    //if(VERBOSE) Log.msg(this.queueName + " - In run.");
    while (active)
    {
      //Log.msg(this.queueName + " - Run looping.");
      if (this.receiverReady || this.initInProgress)
      {
        //Log.msg(this.queueName + " - Everything seems fine.");
        try{
          Thread.sleep(this.pollTime);
        }catch (Exception e) {}
        continue;
      }

      if (!this.receiverReady && !this.initInProgress)
      {
        Log.msg(VERBOSE,this.queueName + " - Houston... we have a problem... attempting to resolve.");
        while (this.active && !initJMS())
        {
          Log.msg(VERBOSE,this.queueName + " - Could not resolve problem... trying again...");
          try{
            Thread.sleep(this.errorTime);
          }catch (Exception e) {}
        }
        Log.msg(VERBOSE,this.queueName + " - Houston... the problem has been resolved.");
      }

    }
    Log.msg(VERBOSE,this.queueName + " - Finished running.");
    close();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public boolean isReady ()
  ////////////////////////////////////////////////////////////////////////////////
  {
    return this.receiverReady;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setConsoleMessageTime (int in)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.consoleMessageTime = in;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setErrorTime (int in)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.errorTime = in;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setPollTime (int in)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.pollTime = in;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void deactivate ()
  ////////////////////////////////////////////////////////////////////////////////
  {
    if (this.active = false)
      { return; }

    //Log.msg(VERBOSE,this.queueName + " - Deactivated.");
    this.active = false;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized ObjectMessage getMessage(int blockTime, boolean autoCommit)
  ////////////////////////////////////////////////////////////////////////////////
  {

    boolean retVal = false;
    ObjectMessage msg = null;
    boolean alreadyWaited = false;

    while (true)
    {
      if (this.receiverReady)
      {
        try{
          if (System.currentTimeMillis()-timeStamp > consoleMessageTime)
          {
            Log.msg(VERBOSE,this.queueName + " - Listening... " + (System.currentTimeMillis()-timeStamp));
            timeStamp = System.currentTimeMillis();
          }
          
          try {
          	msg = (ObjectMessage) qreceiver.receive(blockTime);
          } catch (Exception e) 
          {	
                  Log.msg("ERROR: Error retreiving next message.");
	          while(!initJMS())
	          {
	            System.out.println("A queue connection could not be established. Retrying...");
	            try {
	              Thread.sleep(5000);
	            } catch (Exception ex) { ex.printStackTrace(); }
	          }
	        }	

          if (qsession.getTransacted() && autoCommit)
          //if (this.transacted && autoCommit)
            { qsession.commit(); }
          break;
        }catch (Exception e) {
          try{
            Log.msg("ERROR: could not get next message... rolling back QMR.");
            e.printStackTrace();
            qsession.rollback();
            msg = null;
          }catch (Exception e1) {e1.printStackTrace();}
          this.receiverReady = false;
          Log.msg("ReceiverController failed while receiving a message from the queue.");
          break;
        }
      }
      else
      {
        if (alreadyWaited)
        {
          break;
        }
        else
        {
          try{
            Thread.sleep(1000);
          }catch(Exception e) {}
          alreadyWaited = true;
          continue;
        }
      }
    }
    return msg;

  }

  ////////////////////////////////////////////////////////////////////////////////
  protected synchronized void commit () throws JMSException
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.qsession.commit();
  }

  ////////////////////////////////////////////////////////////////////////////////
  //protected synchronized void setTransacted(boolean value)
  ////////////////////////////////////////////////////////////////////////////////
  //{
  //  this.transacted = value;
  //}

  ////////////////////////////////////////////////////////////////////////////////
  protected synchronized void rollback () throws JMSException
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.qsession.rollback();
  }

  ////////////////////////////////////////////////////////////////////////////////
  private synchronized void initObject (String factoryName, String queueName, String selector)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.receiverReady = false;
    this.factoryName = factoryName;
    this.queueName = queueName;
    this.active = true;
    this.initInProgress = false;
    this.pollTime = 500;
    this.errorTime = 2000;
    this.consoleMessageTime = 15000;
    this.timeStamp = 0;
    this.selector = selector;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private synchronized boolean initJMS ()
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.initInProgress = true;
    close();

    boolean retVal = false;

    try {
      this.qconFactory = (QueueConnectionFactory) this.ctx.lookup(this.factoryName);
      this.qcon = this.qconFactory.createQueueConnection();
      this.qsession = this.qcon.createQueueSession(this.transacted, Session.AUTO_ACKNOWLEDGE);
      this.queue = (Queue) ctx.lookup(this.queueName);
      if((selector == null) || (selector.equals(""))) {
        this.qreceiver = this.qsession.createReceiver(this.queue);
      }
      else {
        this.qreceiver = this.qsession.createReceiver(this.queue, this.selector);
      }
      this.qcon.start();
      retVal = true;
      this.receiverReady = true;
      //Log.msg(VERBOSE,this.queueName + " - JMS Initialized.");

    } catch (Exception e) {
      Log.msg("ERROR: Could not initialize JMS queue.");
      //e.printStackTrace();
    }

    this.initInProgress = false;
    return retVal;

  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void close ()
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.receiverReady = false;

    try{
      if (!(qreceiver == null)) {qreceiver.close();}
      if (!(qsession == null)) {qsession.close();}
      if (!(qcon == null)) {qcon.close();}
      qreceiver = null;
      qsession = null;
      qcon = null;
    }catch (Exception e) {}

  }

}
