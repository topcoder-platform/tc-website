package com.topcoder.shared.util;


import java.util.*;
import javax.naming.*;
import javax.transaction.*;
import com.topcoder.shared.util.logging.*;

public class Transaction {


  private static String JNDI_TRANSACTION = "javax.transaction.UserTransaction";
  private static int MAX_RETRIES = 5;
  private static Logger log = Logger.getLogger(Transaction.class);


  public static final UserTransaction get() throws NamingException {
    InitialContext ctx = (InitialContext)TCContext.getInitial();
    UserTransaction trans = (UserTransaction) ctx.lookup ( ApplicationServer.TRANS_FACTORY );
    ctx.close();
    return trans;
  }


  public static final UserTransaction get(javax.naming.Context ctx) 
  throws NamingException {
    UserTransaction trans = (UserTransaction) ctx.lookup ( ApplicationServer.TRANS_FACTORY );
    return trans;
  }


  public static final boolean begin(UserTransaction utx) {
    int tryCnt = 5;

    boolean retVal = true; 

    while (true)
    {
      try {   
        utx.begin();
        retVal = true; 
        break;
      } catch (Exception  e) {
        log.error("WARNING: Encountered problems obtaining transaction... Retrying.");
        retVal = false;
      }

      try {Thread.sleep(5000);}
       catch (InterruptedException e) {}
    }

    if (!retVal)
      log.error("ERROR: Could not begin transaction.");

    return retVal; 

  }

  public static final boolean rollback(UserTransaction utx) {

    boolean retVal = true; 
    log.error("WARNING: Rolling back transaction...");

    try {   
      utx.rollback();
    } catch (Exception  e) {
      log.error("ERROR: Could not rollback transaction.");
      e.printStackTrace();
      retVal = false;
    }

    return retVal; 

  }


  public static final boolean commit(UserTransaction utx) {

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
