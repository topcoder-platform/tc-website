package com.topcoder.subscriber;

import com.topcoder.common.*;
import com.topcoder.common.attr.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import com.topcoder.ejb.User.*;
import javax.transaction.UserTransaction;
import javax.transaction.Status;



public final class taskAuthentication {


  private static final String XSL_DIR                 = task.XSL_URL + "authenticate/";
  private static final String SESSION_CLOBBER_URL     = XSL_DIR + "session_clobber.xsl";
  private static final String ACCOUNT_LOCKOUT_URL     = XSL_DIR + "lockout.xsl";
  private static final String RECOVER_PASSWORD_URL    = XSL_DIR + "recover_password.xsl";
  private static final String INVALID_LOGIN_URL       = XSL_DIR + "invalid_login.xsl";
  private static final String UNACTIVATED_ACCOUNT_URL = XSL_DIR + "unactive_account.xsl";
  private static final String NOT_ACTIVATED_URL       = XSL_DIR + "not_activated.xsl";
  private static final String ALREADY_ACTIVE_URL      = XSL_DIR + "already_active.xsl";
  private static final String ACTIVATED_URL           = XSL_DIR + "activated.xsl";
  private static final boolean VERBOSE                = false;


  ////////////////////////////////////////////////////////////////////////////////
  static String process (HttpServletRequest request, HttpServletResponse response,
                         RenderHTML HTMLmaker, Navigation nav, XMLDocument document)
    throws NavigationException, SessionClobberedException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    HttpSession session = null;
    try {
      session = request.getSession(true);
      HashMap sessionObjects = nav.getSessionObjects();
      String activationCode = Conversion.checkNull(request.getParameter("ActivationCode"));
      if ( !activationCode.equals("") ) {
        try {
          switch ( processAuthentication.validateActivationCode(activationCode) ) {
            case processAuthentication.INVALID:
              result = task.render(HTMLmaker, nav, document, NOT_ACTIVATED_URL, request.getServerName()+task.LOGGED_OUT_KEY);
              break;
            case processAuthentication.ALREADY_ACTIVE:
              result = task.render(HTMLmaker, nav, document, ALREADY_ACTIVE_URL, request.getServerName()+task.LOGGED_OUT_KEY);
              break;
            case processAuthentication.VALID:
              result = task.render(HTMLmaker, nav, document, ACTIVATED_URL, request.getServerName()+task.LOGGED_OUT_KEY);
          }
          return result; 
        } catch (Exception e) {
          throw new NavigationException("FAILED TO ACTIVATE ACCOUNT", NOT_ACTIVATED_URL);
        }
      } else {
        //********************** get/set registration object ************************
        AuthenticationAttributes login = null;
        if ( !sessionObjects.containsKey("login") ) { 
          login = new AuthenticationAttributes(); sessionObjects.put ( "login", login );
        } else {
            login = (AuthenticationAttributes) sessionObjects.get ( "login" );
        }
        String command = Conversion.checkNull( request.getParameter("Command") );
        document.addTag ( nav.getBrowser().getXML() );
        if ( command.equals("login") ) {
          result = displayLogin ( HTMLmaker, nav, document );
        }
        else if ( command.equals("recover_password") ) {
          result = taskStatic.displayStatic ( HTMLmaker, request, response, nav, document, XSL_DIR );
        }
        else if ( command.equals("SubmitLogin") ) {
          result = submitLogin ( HTMLmaker, request, response, login, nav, document );
        }
        else if ( command.equals("SendPassword") ) {
          result = sendPassword ( HTMLmaker, request, login, nav, document );
        }
        else if ( command.equals("SubmitLogout") ) {
          result = submitLogout ( HTMLmaker, request, response, nav, document );
        }
        else {
          throw new NavigationException (
            "subscriber.taskAuthentication:ERROR:invalid command"
            ,task.NAVIGATION_ERROR_URL
          );
        }
      }
    } catch ( SessionClobberedException se ) {
      throw se;
    } catch ( NavigationException ne ) {
      throw ne;
    } catch (Exception e) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer ( 150             );
      msg.append ( "subscriber.taskAuthentication:process:" );
      msg.append ( ":ERROR:\n"                              );
      msg.append ( e                                        );
      throw new NavigationException ( 
        msg.toString()
        ,task.INTERNAL_ERROR_URL
      );
    } 
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String displayLogin (RenderHTML HTMLmaker, Navigation nav, XMLDocument document)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    try {
      String xsldocURLString = XSL_DIR + "login.xsl";
      result = task.render ( HTMLmaker, nav, document, xsldocURLString, null );
    } catch (Exception e) {
      throw new NavigationException (
        "subscriber.taskAuthentication:displayLogin:ERROR:\n" + e.getMessage()
        ,task.NAVIGATION_ERROR_URL
      );
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String submitLogin ( RenderHTML HTMLmaker, HttpServletRequest request, 
    HttpServletResponse response, AuthenticationAttributes login, Navigation nav, XMLDocument document ) 
    throws ProcessingErrorException, NavigationException, SessionClobberedException { 
  ////////////////////////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE,"subscriber.taskAuthentication.submitLogin called" );
    String result = null;
    HttpSession session = null;
    try {
      if ( login.getLockout() ) {
        throw new NavigationException (
          "subscriber.taskAuthentication.submitLogin:ERROR:account lockout"
          ,ACCOUNT_LOCKOUT_URL
        );
      }
      session = request.getSession ( true );
      HashMap sessionObjects = nav.getSessionObjects();
      String userName = null;
      String password = null;
      boolean clobberingLogin = false;
      if ( sessionObjects.containsKey("ClobberLogin") ) {      
        AuthenticationAttributes clobber = (AuthenticationAttributes) sessionObjects.remove ("ClobberLogin");
        userName = clobber.getUserName();
        password = clobber.getPassword();
        clobberingLogin = true;
      } else {
        userName = Conversion.checkNull ( request.getParameter("UserName") );
        password = Conversion.checkNull ( request.getParameter("Password") );
      }
      boolean authenticated = processAuthentication.authenticate ( login, userName, password );
      if ( authenticated ) {
        if ( login.getStatus().equals("I") ) {
          StringBuffer msg = new StringBuffer(150);
          msg.append ( "subscriber.taskAuthentication.submitLogin:ERROR:invalid login, inactive account" );
          msg.append ( ":usr=" );
          msg.append ( userName );
          throw new NavigationException ( msg.toString(), INVALID_LOGIN_URL );
        }
        UserAttributes user = null;
        Context ctx = null;
        UserTransaction ux = null;
        try {
          ctx = TCContext.getInitial();
          UserHome userHome = (UserHome) ctx.lookup ( "UserHome" );
          User userEJB = (User) userHome.findByPrimaryKey ( login.getUserId() );
          user = userEJB.getUser();
          if ( !processAuthentication.hasMinimumPermission(user) ) {
            StringBuffer msg = new StringBuffer(150);
            msg.append ( "subscriber.taskAuthentication.submitLogin:ERROR:insufficient permissions" );
            msg.append ( ":usr=" );
            msg.append ( userName );
            throw new NavigationException ( msg.toString(), INVALID_LOGIN_URL );
          }
          if ( user.getLoggedIn().equals("Y") && !clobberingLogin && !user.getUserName().equals("jcoder") ) {
            sessionObjects.put ( "ClobberLogin", login );
            StringBuffer msg = new StringBuffer ( 1500                             );
            msg.append ( "subscriber.taskAuthentication:submitLogin:"              );
            msg.append ( "user in db as logged in, prompting user to overwrite:\n" );
            XMLDocument clobberLogin = new XMLDocument ( "CLOBBER"                 );
            clobberLogin.addTag ( login.getXML()                                   );
            msg.append ( clobberLogin.getXML(2)                                    );
            throw new SessionClobberException ( msg.toString()                     );
          }
          if (login.getStatus().equals("U")) {
            login.setEmail(user.getEmail());
            HashMap userTypeDetails = user.getUserTypeDetails();
            SubscriberAttributes subscriber = (SubscriberAttributes) userTypeDetails.get("Subscriber");
            login.setActivationCode(subscriber.getActivationCode());
            throw new NavigationException("INVALID LOGIN: UNACTIVATED ACCOUNT:\n",
              UNACTIVATED_ACCOUNT_URL);
          }
          // set last_login value, and set logged_in to true
          java.sql.Timestamp currentTimestamp = Common.getCurrentTimestamp();
          HashMap userTypeDetails = user.getUserTypeDetails();
          SubscriberAttributes subs = (SubscriberAttributes) userTypeDetails.get("Subscriber"); 
          if ( subs != null ) {
            ux = Common.getTransaction();
            if ( Tran.beginTran(ux) ) {
              sessionObjects.put ( "LastLogin", currentTimestamp );
              subs.setLastLogin  ( currentTimestamp              );
              subs.setModified   ( "U"                           );
              user.setLoggedIn   ( "Y"                           );
              user.setModified   ( "U"                           );
              processCoderWatch.expiredCoderWatchesDeleted ( user );
              userEJB.setUser    ( user                          );
            } else {
              StringBuffer msg = new StringBuffer ( 150                 );
              msg.append ( "subscriber.taskAuthentication:submitLogin:" );
              msg.append ( "failed to begin user update transaction."   );
              throw new ProcessingErrorException ( msg.toString()       );
            }
            if ( !Tran.commitTran(ux) ) {
              StringBuffer msg = new StringBuffer(150);
              msg.append ( "subscriber.taskAuthentication:submitLogin:" );
              msg.append ( "failed to commit user update transaction."  );
              throw new ProcessingErrorException ( msg.toString() );
            }
          }
        } catch (SessionClobberException se) {
          throw new NavigationException ( 
            "subscriber.taskAuthentication:submitLogin:ERROR"+se.getMessage()
            ,SESSION_CLOBBER_URL 
          );
        } catch (NavigationException ne) {
          throw ne;
        } catch (Exception e) {
          e.printStackTrace();
          try {
            if ( ux!=null && ux.getStatus()==Status.STATUS_ACTIVE ) {
              if ( !Tran.rollbackTran(ux) ) {
                StringBuffer msg = new StringBuffer(200);
                msg.append ( "subscriber.taskAuthentication:submitLogin:rollback failed:" );
                msg.append ( e.getMessage() );
                throw new ProcessingErrorException ( msg.toString() );
              }
            }
          } catch (Exception te) {
            StringBuffer msg = new StringBuffer(300);
            msg.append ( "subscriber.taskAuthentication:submitLogin:failed to roll back transaction.:" );
            msg.append ( te.getMessage() );
            throw new NavigationException ( msg.toString(), task.INTERNAL_ERROR_URL );
          }
          StringBuffer msg = new StringBuffer(150);
          msg.append ( "subscriber.taskAuthentication.submitLogin:ERROR:failed to lookup user" );
          msg.append ( ":usr="  );
          msg.append ( userName );
          msg.append ( ":"      );
          msg.append ( e        );
          throw new NavigationException ( msg.toString(), task.INTERNAL_ERROR_URL );
        } finally {
          if (ctx != null) { try { ctx.close(); } catch ( Exception ignore ) {} }
        }
        if (VERBOSE) {
          XMLDocument test = new XMLDocument ( "TEST" );
          test.addTag   ( user.getXML() );
          Log.msg ( test.getXML(2) );
        }
        try {
          nav.setUserId   ( user.getUserId()                                       );
          nav.setUser     ( user                                                   );
          nav.setLoggedIn ( true                                                   );
          document.addTag ( new ValueTag("LoggedIn", "true")                       );
          document.addTag ( new ValueTag("UserName", nav.getUser().getUserName())  );
          result = taskHome.process ( request, response, HTMLmaker, nav, document  );
        } catch (SessionClobberedException se) {
          throw se;
        } catch (Exception e) {
          e.printStackTrace();
          StringBuffer msg = new StringBuffer(150);
          msg.append ( "subscriber.taskAuthentication.submitLogin:ERROR:setting session" );
          msg.append ( ":usr="        );
          msg.append ( userName       );
          msg.append ( "\n"           );
          msg.append ( e.getMessage() );
          throw new NavigationException ( msg.toString(), task.INTERNAL_ERROR_URL );
        }
      } else {
        StringBuffer msg = new StringBuffer(150);
        msg.append ( "subscriber.taskAuthentication.submitLogin:ERROR:invalid login" );
        msg.append ( ":usr="  );
        msg.append ( userName );
        msg.append ( ":pwd="  );
        msg.append ( password );
        throw new NavigationException ( msg.toString(), INVALID_LOGIN_URL );
      }
    } catch (SessionClobberedException se) {
      throw se;
    } catch (NavigationException ne) {
      try {
        RecordTag errTag = new RecordTag ( "ERROR" );
        errTag.addTag ( login.getXML() );
        document.addTag ( errTag );
      } catch ( Exception ignore ) {}
      throw ne;
    } catch (Exception e) {
      e.printStackTrace();
      throw new ProcessingErrorException ( "subscriber.taskAuthentication:submitLogin:ERROR:\n"+e );
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String sendPassword (RenderHTML HTMLmaker, HttpServletRequest request,
    AuthenticationAttributes login, Navigation nav, XMLDocument document) 
    throws ProcessingErrorException, NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    try {
      HttpSession session = request.getSession   ( true                              );
      String firstName    = Conversion.checkNull ( request.getParameter("FirstName") );
      String lastName     = Conversion.checkNull ( request.getParameter("LastName")  );
      String email        = Conversion.checkNull ( request.getParameter("Email")     );
      try {
        processAuthentication.sendPasswordMail ( firstName, lastName, email );
      } catch (Exception e) {
        RecordTag errTag = new RecordTag ( "RECOVER_PASSWORD_ERROR" );
        errTag.addTag ( new ValueTag("UserNotFound",true)   );
        errTag.addTag ( new ValueTag("FirstName",firstName) );
        errTag.addTag ( new ValueTag("LastName",lastName)   );
        errTag.addTag ( new ValueTag("Email",email)         );
        document.addTag ( errTag );
        StringBuffer msg = new StringBuffer(150);
        msg.append ( "subscriber.taskAuthentication.submitLogin:ERROR:unable to recover password" );
        msg.append ( ":first="  );
        msg.append ( firstName );
        msg.append ( ":last="  );
        msg.append ( lastName );
        msg.append ( ":email="  );
        msg.append ( email );
        throw new NavigationException ( 
          e.getMessage() 
          ,RECOVER_PASSWORD_URL
        );
      }
      result = task.render ( 
        HTMLmaker
        ,nav
        ,document
        ,task.MAIL_SENT_URL
        ,request.getServerName()+task.LOGGED_OUT_KEY 
      );
    } catch (NavigationException ne) {
      RecordTag errTag = new RecordTag ( "ERROR" );
      errTag.addTag ( login.getXML() );
      document.addTag ( errTag );
      throw ne;
    } catch ( Exception e ) {
      throw new ProcessingErrorException ( "subscriber.taskAuthentication:submitLogin:ERROR:"+e.getMessage() );
    }
    return result;
  }

 
  ////////////////////////////////////////////////////////////////////////////////
  private static String submitLogout ( RenderHTML HTMLmaker, HttpServletRequest request, 
    HttpServletResponse response, Navigation nav, XMLDocument document ) 
    throws ProcessingErrorException { 
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    try {
      HttpSession session = request.getSession ( true );
      session.removeAttribute ( "navigation" );
      session.invalidate ();
      result = "logout";
    } catch (Exception e) {
      throw new ProcessingErrorException ( "subscriber.taskAuthentication:submitLogout:ERROR:" + e.getMessage() );
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private static String sendMail ( RenderHTML HTMLmaker, HttpServletRequest request, 
    HttpServletResponse response, AuthenticationAttributes login, Navigation nav, 
    XMLDocument document ) throws NavigationException { 
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    try {
      Mail.sendActivationMail ( 
        login.getUserId().intValue()
        ,login.getEmail()
        ,nav.getPostURL ( request, response )
        ,nav.cookiesEnabled ( request, response )
        ,login.getActivationCode()
        ,login.getUserName()
        ,login.getPassword()
      );
      result = task.render ( 
        HTMLmaker
        ,nav
        ,document
        ,task.MAIL_SENT_URL
        ,request.getServerName()+task.LOGGED_OUT_KEY
      );
    } catch (Exception e) {
      throw new NavigationException (
        "subscriber.taskAuthentication:sendMail:ERROR:\n" + e.getMessage()
        ,task.MAIL_ERROR_URL
      );
    }
    return result;
  }


}
