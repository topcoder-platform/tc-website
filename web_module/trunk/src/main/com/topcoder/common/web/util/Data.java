package com.topcoder.common.web.util;

import java.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.xml.WebPage;
import com.topcoder.ejb.UserServices.*;
import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.shared.util.*;
import javax.naming.*;
import javax.transaction.*;
import com.topcoder.shared.util.logging.Logger;

public final class Data {
  private static Logger log = Logger.getLogger(Data.class);

  ////////////////////////////////////////////////////////////////////////////////
  public static final void stabilizeModifiableList (List modifiableList)
    throws Exception {
  ////////////////////////////////////////////////////////////////////////////////
    try {   
      if (modifiableList != null) { 
        for (int i = 0; i < modifiableList.size(); i++) {
          Modifiable modifiableObj = 
            (Modifiable) modifiableList.get(i);
          if ( modifiableObj.getModified().equals("D") ) {
            modifiableList.remove(modifiableObj);
          } else {
            modifiableObj.setAllModifiedStable();
          }
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new Exception("common.web.util.stablilizeModifiableList:ERROR:\n"+e);
    }
  }


  ///////////////////////////////////////////////////////////////////
  public static void saveUser ( Navigation nav ) throws TCException {
  ///////////////////////////////////////////////////////////////////
    UserTransaction uTx = null;
    Context         ctx = null;
    try {
      ctx = TCContext.getInitial();
      UserServicesHome userHome = ( UserServicesHome ) ctx.lookup ( ApplicationServer.USER_SERVICES );
      Integer key = new Integer ( nav.getUser().getUserId() );
      UserServices userEJB = (UserServices) userHome.findByPrimaryKey ( key );
      uTx = com.topcoder.common.Transaction.get();
      uTx.begin();
      userEJB.setUser ( nav.getUser() );
      uTx.commit();
      nav.setUser ( userEJB.getUser() );
    } catch ( Exception e ) {
      e.printStackTrace();
      try {
        if ( uTx!=null && uTx.getStatus()==Status.STATUS_ACTIVE ) {
          uTx.rollback();
        }
      } catch ( Exception te ) {
        StringBuffer msg = new StringBuffer ( 300         );
        msg.append ( "common.DBMS:saveUser:"              );
        msg.append ( "failed to roll back transaction.\n" );
        msg.append ( "MSG: "                              );
        msg.append ( te.getMessage()                      );
        msg.append ( "\n"                                 );
        te.printStackTrace();
      }
      throw new TCException ( "common.DBMS:saveUser:ERROR:"+e.getMessage() );
    } finally {
      if ( ctx != null ) { try { ctx.close(); } catch (Exception ignore) {} }
    }
  }

  public static void loadUser(Navigation nav) throws TCException {
  
    User user = null;
    if (nav.getUser()==null) {
      user = new User();
      nav.setUser(user);
    } else {
      user = nav.getUser();
    }
    if ( user.getUserId()==0 ) {
      Context ctx = null;
      try {
        /////////////////////////////////////////////////////
        StringBuffer msg = new StringBuffer(250);
        msg.append("tc: logged in user found with no user attributes:\n");
        msg.append("tc: user id = ");
        msg.append(nav.getUserId());
        msg.append("\n");
        msg.append("tc: Loading user attributes from user entity bean...");
        log.debug(msg.toString());
        /////////////////////////////////////////////////////
        ctx = TCContext.getInitial();
        UserServicesHome userHome = ( UserServicesHome ) ctx.lookup ( ApplicationServer.USER_SERVICES );
        UserServices userEJB = (UserServices) userHome.findByPrimaryKey( new Integer(nav.getUserId()) );
        user = userEJB.getUser();
        nav.setUser(user);
        /////////////////////////////////////////////////////
        log.debug("tc: user loaded from entity bean");
        /////////////////////////////////////////////////////
      } catch (Exception e) {
        throw new NavigationException("tc:processCommands:ERROR READING DATABASE\n"+e,TCServlet.INTERNAL_ERROR_PAGE);
      } finally {
        if (ctx!=null) {
          try {
            ctx.close();
          } catch (Exception ignore) {}
        }
      }
    }
  }




  ////////////////////////////////////////////////////////////////////////////////
  public static RecordTag getDynamicContestInfo(ArrayList contests) throws Exception {
  ////////////////////////////////////////////////////////////////////////////////
    RecordTag result = new RecordTag("Contests");
    try {
      for (int i = 0; i < contests.size(); i++) {
        Contest contest = (Contest) contests.get(i);
        RecordTag contestTag = contest.getXML();
        TimeZone tz = TimeZone.getDefault();
        if ( tz.inDaylightTime(contest.getContestStart()) ) {
          contestTag.addTag ( new ValueTag("ShortDaylight","EDT") );
          contestTag.addTag ( new ValueTag("LongDaylight","Eastern Daylight Time") );
        } else {
          contestTag.addTag ( new ValueTag("ShortDaylight","EST") );
          contestTag.addTag ( new ValueTag("LongDaylight","Eastern Standard Time") );
        }
        java.sql.Date today = DateTime.getCurrentDate();
        result.addTag(contestTag);
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new Exception("processContest.getContestPhases:ERROR:"+e);
    }
    return result;
  }

 
}
