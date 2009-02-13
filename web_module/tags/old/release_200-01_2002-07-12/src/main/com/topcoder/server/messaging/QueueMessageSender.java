package com.topcoder.server.messaging;

import java.util.*;
import java.io.*;
import javax.jms.*;
import javax.naming.*;

import com.topcoder.common.*;

public class QueueMessageSender {

  private static final int PRIMARY = 0;
  private static final int BACKUP = 1;

  InitialContext ctx;
  QueueConnectionFactory qconFactory;
  QueueConnection qcon;
  Queue queue;
  QueueSession qsession;
  QueueSender qsender;

  QueueConnectionFactory qconFactory_BKP;
  QueueConnection qcon_BKP;
  Queue queue_BKP;
  QueueSession qsession_BKP;
  QueueSender qsender_BKP;

  String factoryName;
  String queueName;
  String factoryName_BKP;
  String queueName_BKP;

  boolean persistent;
  boolean dbPersistent;
  boolean primaryReady = false;
  boolean backupReady;
  boolean faultTolerant;
  Object messObject = null;
  public static boolean verbose = true;

  private boolean ctxCreated = true;

  ////////////////////////////////////////////////////////////////////////////////
  public QueueMessageSender (String factoryName, String queueName) throws NamingException
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = com.topcoder.common.TCContext.getInitial();
    this.ctxCreated = true;
    initObject(factoryName, queueName);
  }

  ////////////////////////////////////////////////////////////////////////////////
  public QueueMessageSender (String factoryName, String queueName, InitialContext ctx)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.ctx = ctx;
    this.ctxCreated = false;
    initObject(factoryName, queueName);
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setPersistent (boolean value) {
  ////////////////////////////////////////////////////////////////////////////////
    this.persistent = value;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setDBPersistent (boolean value) {
  ////////////////////////////////////////////////////////////////////////////////
    this.dbPersistent = value;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setFaultTolerant (boolean value) {
  ////////////////////////////////////////////////////////////////////////////////
    this.faultTolerant = value;
  }
  
  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void setMessObject (Object obj) {
  ////////////////////////////////////////////////////////////////////////////////
  	this.messObject = obj;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public boolean sendMessage(HashMap props)
  ////////////////////////////////////////////////////////////////////////////////
  {
//    Object temp = null;
    return sendMessage(props, this.messObject);
  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized boolean sendMessage(HashMap props, Object messObject)
  ////////////////////////////////////////////////////////////////////////////////
  {

    int activeQueue = PRIMARY;
    boolean retVal = false;
    boolean reInitPrimary = false;
    boolean reInitBackup = false;

    while (true)
    {

      if (activeQueue == PRIMARY)
      {
        if (!this.primaryReady)
        { 
          reInitPrimary = true;
          if (!initJMS(PRIMARY))
          {
            if (faultTolerant)
            {
              // Tried to reinit the primary queue but we were unsuccessful...
              // switch over to the backup queue.
              activeQueue = BACKUP;
              continue;
            }
            else
            {
              // Couldn't reinit the primary, and we have no fault tolerance...
              // time to give up
              retVal = false;
              break;
            }
          }
        }
        if (sendMessage(this.qsession, this.qsender, props, messObject))
        {
          // Message was sent successfully... let's break out.
          retVal = true;
          break;
        }
        else
        {
          Log.msg("ERROR: Could not send message on primary queue.");
          if (reInitPrimary)
          {
            if (faultTolerant)
            {
              // We've already tried reinit of the primary queue.
              // Switch the activeQueue over to the backup... continue loop.
              activeQueue = BACKUP;
              continue;
            }
            else
            {
              // Can't set the activeQueue to backup... no fault tolerance. 
              // Time to give up.
              retVal = false;
              break;
            }
          }
          else
          {
            // We havn't tried reinit on the primary queue yet... 
            // stay with primary queue for now, but force it to reinit.
            this.primaryReady = false;
            continue;
          }
        }
      }
      else
      {
        if (!this.backupReady)
        { 
          reInitBackup = true;
          if (!initJMS(BACKUP))
          {
            // Could not reinit the backup queue... sincee we're here, we couldn't send on
            // the primary queue either... give up.
            retVal = false;
            break;
          }
        }
        if (sendMessage(this.qsession_BKP, this.qsender_BKP, props, messObject))
        {
          // Got the message to go on the backup queue... let's break out.
          retVal = true;
          break;
        }
        else
        {
          Log.msg("ERROR: Could not send message on backup queue.");
          if (reInitBackup)
          {
            // We couldn't send the message, but we've already tried a 
            // reinit on the backup queue... let's give up.
            retVal = false;
            break;
          }
          else
          {
            // We couldn't send the message, but we havn't yet tried a
            // reinit on the backup queue... force the queue to reinit
            // on the next pass.
            this.backupReady = false;
            continue;
          }
        }
      }
    }

    // Close the queue resources unless they are set to persist.
    if (!persistent)
      { close(); }

    return retVal;

  }

  ////////////////////////////////////////////////////////////////////////////////
  private boolean sendMessage(QueueSession qSess, QueueSender qSend, HashMap props, Object messObject)
  ////////////////////////////////////////////////////////////////////////////////
  {
    boolean retVal = false;
    try {

      ObjectMessage msg = qSess.createObjectMessage(); 
      //msg.setJMSDeliveryMode(DeliveryMode.PERSISTENT);

      if (!props.isEmpty())
      {
        Set keys = props.keySet();
        Iterator iter = keys.iterator();
        while (iter.hasNext())
        {
          String key = (String) iter.next();
          Object value = props.get(key);

          if (value instanceof String) {
            msg.setStringProperty(key, (String) value);
          }else if (value instanceof Integer) {
            Integer holder = (Integer) value;
            msg.setIntProperty(key, holder.intValue());
          }else if (value instanceof Boolean) {
            Boolean holder = (Boolean) value;
            msg.setBooleanProperty(key, holder.booleanValue());
          }else if (value instanceof Double) {
            Double holder = (Double) value;
            msg.setDoubleProperty(key, holder.doubleValue());
          }else if (value instanceof Long) {
            Long holder = (Long) value;
            msg.setLongProperty(key, holder.longValue());
          }else if (value instanceof Short) {
            Short holder = (Short) value;
            msg.setShortProperty(key, holder.shortValue());
          }else if (value instanceof Float) {
            Float holder = (Float) value;
            msg.setFloatProperty(key, holder.floatValue());
          }
        }
      }

      if (!(messObject == null))
        { msg.setObject((Serializable)messObject); }

      if (this.dbPersistent)
        {msg.setJMSDeliveryMode(DeliveryMode.PERSISTENT); }
      else
        {msg.setJMSDeliveryMode(DeliveryMode.NON_PERSISTENT); }

      qSend.send(msg);
      retVal = true;

    } catch (JMSException e) {
      retVal = false;
      Log.msg("ERROR:  Could not write to message queue.");
      e.printStackTrace();
      Log.msg("QueueMessageSender failed to write to message queue");
    }

    return retVal;

  }

  ////////////////////////////////////////////////////////////////////////////////
  private synchronized void initObject (String factoryName, String queueName)
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.persistent = false;
    this.dbPersistent = true;
    this.faultTolerant = true;
    this.primaryReady = false;
    this.backupReady = false;
    this.factoryName = factoryName;
    this.queueName = queueName;
    this.factoryName_BKP = factoryName + "_BKP";
    this.queueName_BKP = queueName + "_BKP";
  }

  ////////////////////////////////////////////////////////////////////////////////
  private synchronized boolean initJMS (int queueType)
  ////////////////////////////////////////////////////////////////////////////////
  {
    if (queueType == PRIMARY)
      { Log.msg(verbose,"Initializing primary JMS queue."); }
    else
      { Log.msg(verbose,"Initializing backup JMS queue."); }

    String factoryName = "";
    String queueName = "";
    boolean retVal = false;

    if (queueType == PRIMARY)
    {
      factoryName = this.factoryName;
      queueName = this.queueName;
      Log.msg(verbose,"QueueMessageSender: initJMS: factoryName: " + this.factoryName);
      Log.msg(verbose,"QueueMessageSender: initJMS: queueName: " + this.queueName);

      try {
        this.qconFactory = (QueueConnectionFactory) ctx.lookup(factoryName);
        this.qcon = this.qconFactory.createQueueConnection();
        this.qsession = this.qcon.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
        this.queue = (Queue) ctx.lookup(queueName);
        this.qsender = this.qsession.createSender(this.queue);

        if (this.dbPersistent)
          {this.qsender.setDeliveryMode(DeliveryMode.PERSISTENT); }
        else
          {this.qsender.setDeliveryMode(DeliveryMode.NON_PERSISTENT); }

        this.qcon.start();
        retVal = true;
        this.primaryReady = true;

      } catch (Exception e) {
        Log.msg("ERROR: Could not initialize primary JMS queue.");
        e.printStackTrace();
      }
    }else
    {
      factoryName = this.factoryName_BKP;
      queueName = this.queueName_BKP;
      Log.msg(verbose,"QueueMessageSender: initJMS: backup factoryName: " + this.factoryName_BKP);
      Log.msg(verbose,"QueueMessageSender: initJMS: backup queueName: " + this.queueName_BKP);

      try {
        this.qconFactory_BKP = (QueueConnectionFactory) ctx.lookup(factoryName);
        this.qcon_BKP = this.qconFactory_BKP.createQueueConnection();
        this.qsession_BKP = this.qcon_BKP.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
        this.queue_BKP = (Queue) ctx.lookup(queueName);
        this.qsender_BKP = this.qsession_BKP.createSender(this.queue_BKP);
        this.qcon_BKP.start();
        retVal = true;
        this.backupReady = true; 

      } catch (Exception e) {
        Log.msg("ERROR: Could not initialize backup JMS queue.");
        e.printStackTrace();
      }
    }

    return retVal;

  }

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void close ()
  ////////////////////////////////////////////////////////////////////////////////
  {
    this.primaryReady = false;
    this.backupReady = false;

    try{
      if (!(qsender == null)) {qsender.close();}
      if (!(qsession == null)) {qsession.close();}
      if (!(qcon == null)) {qcon.close();}
      qsender = null;
      qsession = null;
      qcon = null;
    }catch (JMSException e) {}

    try{
      if (!(qsender_BKP == null)) {qsender_BKP.close();}
      if (!(qsession_BKP == null)) {qsession_BKP.close();}
      if (!(qcon_BKP == null)) {qcon_BKP.close();}
      qsender_BKP = null;
      qsession_BKP = null;
      qcon_BKP = null;
    }catch (JMSException e) {}

  }



}
