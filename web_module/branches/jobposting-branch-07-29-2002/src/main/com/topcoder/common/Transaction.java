package com.topcoder.common;


import java.util.*;
import javax.naming.*;
import javax.transaction.*;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;


public class Transaction {


  private static String JNDI_TRANSACTION = "javax.transaction.UserTransaction";
  private static int MAX_RETRIES = 5;
  private static Logger log = Logger.getLogger(Transaction.class);


  ////////////////////////////////////////////////////////////////////////////////
  public static final UserTransaction get() throws NamingException {
  ////////////////////////////////////////////////////////////////////////////////
    InitialContext ctx = (InitialContext)TCContext.getInitial ( ApplicationServer.HOST_URL );
    UserTransaction trans = (UserTransaction) ctx.lookup ( ApplicationServer.TRANS_FACTORY );
    ctx.close();
    return trans;
  }


  ////////////////////////////////////////////////////////////////////////////////
  public static final UserTransaction get ( String url ) throws NamingException {
  ////////////////////////////////////////////////////////////////////////////////
    InitialContext ctx = null;
    if (url.length() == 0) {
      ctx = (InitialContext)TCContext.getInitial();
    } else {
      ctx = (InitialContext)TCContext.getInitial(url); 
    }
    UserTransaction trans = (UserTransaction) ctx.lookup ( ApplicationServer.TRANS_FACTORY );
    ctx.close();
    return trans;
  }


  ////////////////////////////////////////////////////////////////////////////////
  public static final UserTransaction get ( javax.naming.Context ctx ) 
  throws NamingException {
  ////////////////////////////////////////////////////////////////////////////////
    UserTransaction trans = (UserTransaction) ctx.lookup ( ApplicationServer.TRANS_FACTORY );
    return trans;
  }


/*
  public static final UserTransaction JNDIget() {
    UserTransaction tx = null;
    try{
      Context ctx = new InitialContext();
      tx = (UserTransaction)  ctx.lookup ( JNDI_TRANSACTION );
    }catch (NamingException e) {
      log.warn("WARNING: Could not get transaction reference.");
      e.printStackTrace();
    }
    return tx;
  }
*/

  ////////////////////////////////////////////////////////////////////////////////
  public static final boolean begin(UserTransaction utx)
  ////////////////////////////////////////////////////////////////////////////////
  {
    int tryCnt = 5;

    boolean retVal = true; 

//    for (int i = 1; i <= tryCnt; i++)
    while (true)
    {
      try {   
        utx.begin();
        retVal = true; 
        break;
      } catch (Exception  e) {
        log.warn("WARNING: Encountered problems obtaining transaction... Retrying.");

//        e.printStackTrace();
        retVal = false;
      }

      try {Thread.sleep(5000);}
       catch (InterruptedException e) {}
    }

    if (!retVal)
      log.error("ERROR: Could not begin transaction.");

    return retVal; 

  }

  ////////////////////////////////////////////////////////////////////////////////
  public static final boolean rollback(UserTransaction utx)
  ////////////////////////////////////////////////////////////////////////////////
  {

    boolean retVal = true; 
    log.warn("WARNING: Rolling back transaction...");

    try {   
      utx.rollback();
    } catch (Exception  e) {
      log.warn("ERROR: Could not rollback transaction.");
      e.printStackTrace();
      retVal = false;
    }

    return retVal; 

  }


  ////////////////////////////////////////////////////////////////////////////////
  public static final boolean commit(UserTransaction utx)
  ////////////////////////////////////////////////////////////////////////////////
  {

    boolean retVal = true; 

    try {   
      utx.commit();
    } catch (HeuristicRollbackException e) {
      log.error("ERROR: Could not commit transaction.");
      e.printStackTrace();
      retVal = false;
    } catch (RollbackException e) {
      log.error("ERROR: Could not commit transaction.");
      e.printStackTrace();
      retVal = false;
    } catch (HeuristicMixedException e) {
      log.error("ERROR: Could not commit transaction.");
      e.printStackTrace();
      retVal = false;
    } catch (SystemException e) {
      log.error("ERROR: Could not commit transaction.");
      e.printStackTrace();
      retVal = false;
    }

    return retVal; 

  }


}
