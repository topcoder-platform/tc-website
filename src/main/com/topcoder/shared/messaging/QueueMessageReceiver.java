package com.topcoder.shared.messaging;

import java.util.*;
import java.io.*;
import javax.jms.*;
import javax.naming.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.*;

public class QueueMessageReceiver {

  private static Logger log = Logger.getLogger(QueueMessageReceiver.class);
  private static final int PRIMARY = 0;
  private static final int BACKUP = 1;

  InitialContext ctx;

  String factoryName;
  String queueName;
  String factoryName_BKP;
  String queueName_BKP;

  protected boolean primaryReady = false;
  protected boolean backupReady;
  private boolean faultTolerant;
  private boolean persistent;
  private boolean autoCommit;
  private boolean transacted;
 
  private boolean alive = true;

  private int pollTime;
  private int errorTime;
  private int consoleMessageTime;

  private ReceiverController controller;
  private ReceiverController controller_BKP;

  private boolean ctxCreated = true;

  private String selector;

  ////////////////////////////////////////////////////////////////////////////////
  public QueueMessageReceiver (String factoryName, String queueName) throws NamingException
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = (InitialContext)TCContext.getInitial();
    this.ctxCreated = true;
    initObject(factoryName, queueName, "");
  }

  ////////////////////////////////////////////////////////////////////////////////
  public QueueMessageReceiver (String factoryName, String queueName, InitialContext ctx)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = ctx;
    this.ctxCreated = false;
    initObject(factoryName, queueName, "");
  }

  ////////////////////////////////////////////////////////////////////////////////
  public QueueMessageReceiver (String factoryName, String queueName, InitialContext ctx, String selector)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = ctx;
    this.ctxCreated = false;
    initObject(factoryName, queueName, selector);
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setFaultTolerant (boolean value) {
  ////////////////////////////////////////////////////////////////////////////////
    this.faultTolerant = value;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setAutoCommit (boolean value) {
  ////////////////////////////////////////////////////////////////////////////////
    this.autoCommit = value;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setTransacted (boolean value) {
  ////////////////////////////////////////////////////////////////////////////////
    this.transacted = value;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setPersistent (boolean value) {
  ////////////////////////////////////////////////////////////////////////////////
    this.persistent = value;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setPollTime (int in) {
  ////////////////////////////////////////////////////////////////////////////////
    this.pollTime = in;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setErrorTime (int in) {
  ////////////////////////////////////////////////////////////////////////////////
    this.errorTime = in;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setConsoleMessageTime (int in) {
  ////////////////////////////////////////////////////////////////////////////////
    this.consoleMessageTime = in;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public ObjectMessage getMessage()
  ////////////////////////////////////////////////////////////////////////////////
  {
    return getMessage(500);
  }

  ////////////////////////////////////////////////////////////////////////////////
  public ObjectMessage getMessage(int time)
  ////////////////////////////////////////////////////////////////////////////////
  {

    int activeQueue = PRIMARY;
    boolean reInitPrimary = false;
    boolean reInitBackup = false;
    ObjectMessage retVal = null;

    if (!primaryReady)
    { 
      setPrimaryController();
    }

    if (faultTolerant && !backupReady)
    { 
      setBackupController();
    }

    while (isAlive())
    {
      retVal = controller.getMessage(time, this.autoCommit);
      
      if (retVal != null)
        { break; }

      if (retVal == null && faultTolerant)
      {
        retVal = controller_BKP.getMessage(time, this.autoCommit);
        if (retVal != null)
          { break; }
      }
    }

    // Close the queue resources unless they are set to persist.
    if (!persistent)
     { close(); }

    return retVal;

  }

  ////////////////////////////////////////////////////////////////////////////////
  private synchronized void setPrimaryController() 
  ////////////////////////////////////////////////////////////////////////////////
  {
    //log.debug("Initializing primary receiver.");
    controller = new ReceiverController(factoryName, queueName, this.transacted, ctx, selector);

    if (this.pollTime > 0) { controller.setPollTime(this.pollTime); }
    if (this.errorTime > 0) { controller.setErrorTime(this.errorTime); }
    if (this.consoleMessageTime > 0) { controller.setConsoleMessageTime(this.consoleMessageTime); }

    controller.start();
    primaryReady = true;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private synchronized void setBackupController()
  ////////////////////////////////////////////////////////////////////////////////
  {
    //log.debug("Initializing backup receiver.");
    controller_BKP = new ReceiverController(factoryName_BKP, queueName_BKP, this.transacted, ctx, selector);

    if (this.pollTime > 0) { controller_BKP.setPollTime(this.pollTime); }
    if (this.errorTime > 0) { controller_BKP.setErrorTime(this.errorTime); }
    if (this.consoleMessageTime > 0) { controller_BKP.setConsoleMessageTime(this.consoleMessageTime); }

    controller_BKP.start();
    backupReady = true;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized boolean commit() 
  ////////////////////////////////////////////////////////////////////////////////
  {
    boolean retVal = true;

    try{

      controller.commit();

      if (this.faultTolerant)
      {
        controller_BKP.commit();
      }

    }catch(Exception e) {
      log.error("ERROR:  Could not commit JMS transaction.");
      e.printStackTrace();
      retVal = false;
    }
 
    return retVal;

  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void rollback()
  ////////////////////////////////////////////////////////////////////////////////
  {

    try{

      controller.rollback();

      if (this.faultTolerant)
      {
        controller_BKP.rollback();
      }

    }catch(Exception e) {
      e.printStackTrace();
    }

  }

  ////////////////////////////////////////////////////////////////////////////////
  private synchronized void initObject (String factoryName, String queueName, String selector)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.persistent = true;
    this.autoCommit = true;
    this.transacted = true;
    this.faultTolerant = true;
    this.primaryReady = false;
    this.backupReady = false;
    this.factoryName = factoryName;
    this.queueName = queueName;
    this.factoryName_BKP = factoryName + "_BKP";
    this.queueName_BKP = queueName + "_BKP";
    this.pollTime = 0;
    this.errorTime = 0;
    this.consoleMessageTime = 0;
    this.selector = selector;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void close ()
  ////////////////////////////////////////////////////////////////////////////////
  {

    try{
      this.controller.deactivate();
      this.controller.close();
      this.primaryReady = false;

      if (this.faultTolerant || this.backupReady)
        { this.controller_BKP.deactivate(); }
      this.backupReady = false;

      if(this.ctxCreated)
        { this.ctx.close(); }

    }catch(Exception e) {}

  }

  /////////////////////////////////////////////////////////////////////////////////
  private boolean isAlive()
  /////////////////////////////////////////////////////////////////////////////////
  {
    return this.alive;
  }
	
  /////////////////////////////////////////////////////////////////////////////////
  public void deactivate()
  /////////////////////////////////////////////////////////////////////////////////
  {
    this.alive = false;
  }
}
