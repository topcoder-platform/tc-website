package com.topcoder.shared.messaging;

import java.util.*;
import java.io.*;
import javax.jms.*;
import javax.naming.*;

import com.topcoder.common.*;

public class SubscriberController extends Thread {

  InitialContext ctx;
  TopicConnectionFactory tconFactory;
  TopicConnection tcon;
  Topic topic;
  TopicSession tsession;
  TopicSubscriber tsubscriber;

  String factoryName;
  String topicName;
  String topicSelector;

  int errorTime;
  int pollTime;
  int consoleMessageTime;

  long timeStamp;

  boolean subscriberReady;
  boolean active;
  boolean initInProgress;
  boolean VERBOSE = false;

  ////////////////////////////////////////////////////////////////////////////////
  public SubscriberController (String factoryName, String topicName) throws NamingException
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = TCContext.getInitial();
    initObject(factoryName, topicName);
    initJMS();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public SubscriberController (String factoryName, String topicName, InitialContext ctx)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = ctx;
    initObject(factoryName, topicName);
    initJMS();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public SubscriberController (String factoryName, String topicName, String topicSelector) throws NamingException
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = TCContext.getInitial();
    this.topicSelector = topicSelector;
    initObject(factoryName, topicName);
    initJMS();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public SubscriberController (String factoryName, String topicName, 
                               String topicSelector, InitialContext ctx)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = ctx;
    this.topicSelector = topicSelector;
    initObject(factoryName, topicName);
    initJMS();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public void run() {
  ////////////////////////////////////////////////////////////////////////////////
    if(VERBOSE) Log.msg(this.topicName + " - In run.");
    while (this.active)
    {
      //Log.msg(this.topicName + " - Run looping.");
      if (this.subscriberReady || this.initInProgress)
      {
        //Log.msg(this.topicName + " - Everything seems fine.");
        try{
          Thread.sleep(this.pollTime);
        }catch (Exception e) {}
        continue;
      }

      if (!this.subscriberReady && !this.initInProgress)
      {
        Log.msg(this.topicName + " - Houston... we have a problem... attempting to resolve.");
        while (this.active && !initJMS())
        {
          Log.msg(this.topicName + " - Could not resolve problem... trying again...");
          try{
            Thread.sleep(this.errorTime);
          }catch (Exception e) {}
        }
        Log.msg(this.topicName + " - Houston... the problem has been resolved.");
      }

    }
    Log.msg(VERBOSE,this.topicName + " - Finished running.");
    close();
  }

  ////////////////////////////////////////////////////////////////////////////////
  public boolean isReady ()
  ////////////////////////////////////////////////////////////////////////////////
  {
    return this.subscriberReady;
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

    Log.msg(VERBOSE,this.topicName + " - Deactivated.");
    this.active = false;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized ObjectMessage getMessage(int blockTime)
  ////////////////////////////////////////////////////////////////////////////////
  {

    boolean retVal = false;
    ObjectMessage msg = null;
    boolean alreadyWaited = false;

    while (true)
    {
      if (this.subscriberReady)
      {
        try{
          if (System.currentTimeMillis()-timeStamp > consoleMessageTime)
          {
            if(VERBOSE) Log.msg(this.topicName + " - Listening...");
            timeStamp = System.currentTimeMillis();
          }
          
          try {
          	msg = (ObjectMessage) tsubscriber.receive(blockTime);
          } catch (Exception e) 
          {	
                  Log.msg("ERROR: Error retreiving next message.");
	          while(!initJMS())
	          {
	            Log.msg("A topic connection could not be established. Retrying...");
	            try {
	              Thread.sleep(5000);
	            } catch (Exception ex) { ex.printStackTrace(); }
	          }	
          }
          
          break;
        }catch (Exception e) {
          try{
            e.printStackTrace();
            msg = null;
          }catch (Exception e1) {e1.printStackTrace();}
          this.subscriberReady = false;
          Log.msg("SubscriberController error occurred while retrieving message from topic");
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
  private synchronized void initObject (String factoryName, String topicName)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.subscriberReady = false;
    this.factoryName = factoryName;
    this.topicName = topicName;
    this.topicSelector = "";
    this.active = true;
    this.initInProgress = false;
    this.pollTime = 500;
    this.errorTime = 2000;
    this.consoleMessageTime = 10000;
    this.timeStamp = 0;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private synchronized boolean initJMS ()
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.initInProgress = true;
    close();

    boolean retVal = false;

    try {
      this.tconFactory = (TopicConnectionFactory) this.ctx.lookup(this.factoryName);
      this.tcon = this.tconFactory.createTopicConnection();
      this.tsession = this.tcon.createTopicSession(false, Session.AUTO_ACKNOWLEDGE);
      this.topic = (Topic) ctx.lookup(this.topicName);
      this.tsubscriber = this.tsession.createSubscriber(this.topic, this.topicSelector, true);
      this.tcon.start();
      retVal = true;
      this.subscriberReady = true;
      if(VERBOSE) Log.msg(this.topicName + " - Subscriber Initialized.");

    } catch (Exception e) {
      Log.msg("ERROR: Could not initialize JMS subscriber.");
    }

    this.initInProgress = false;
    return retVal;

  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void close ()
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.subscriberReady = false;

    try{
      if (!(tsubscriber == null)) {tsubscriber.close();}
      if (!(tsession == null)) {tsession.close();}
      if (!(tcon == null)) {tcon.close();}
      tsubscriber = null;
      tsession = null;
      tcon = null;
    }catch (Exception e) {}

  }

}
