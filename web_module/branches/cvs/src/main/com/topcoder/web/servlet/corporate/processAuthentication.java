package com.topcoder.subscriber;

import com.topcoder.common.*;
import com.topcoder.common.attr.*;
import java.io.*;
import java.util.*;
import javax.naming.*;
import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.ejb.User.*;


public final class processAuthentication {


  static final int ATTEMPT_LIMIT = 3;
  static final int INVALID = 0;
  static final int ALREADY_ACTIVE = 1;
  static final int VALID = 2;
  static final boolean VERBOSE = true;

  /*********************************************************************************
  PACKAGE STATIC METHODS
  *********************************************************************************/


  ////////////////////////////////////////////////////////////////////////////////
  static boolean authenticate (AuthenticationAttributes credentials, String userName,
    String password) throws ProcessingErrorException {
  ////////////////////////////////////////////////////////////////////////////////
    boolean result = false;
    credentials.setUserName ( userName );
    credentials.setPassword ( password );
    if ( !credentials.getLockout() ) {
      Context ctx = null;
      try {
        ctx = TCContext.getInitial ();
        AuthenticationServicesHome home = (AuthenticationServicesHome) ctx.lookup ( "jma.AuthenticationServicesHome" );
        AuthenticationServices authServices = home.create();
        AuthenticationAttributes authentication = authServices.authenticate ( userName, password );
        credentials.setUserId ( authentication.getUserId().intValue() );
        credentials.setStatus ( authentication.getStatus()            );
        if ( credentials.getUserId().intValue() == 0 ) {
          credentials.setAttempts ( credentials.getAttempts() + 1 );
          if ( credentials.getAttempts() == ATTEMPT_LIMIT ) credentials.setLockout(true);
        } else {
          result = true;
        }
      } catch (Exception e) {
        e.printStackTrace();
        StringBuffer msg = new StringBuffer ( 150                              );
        msg.append ( "subscriber.processAuthentication:authenticate:userName=" );
        msg.append ( userName                                                  );
        msg.append ( ":password="                                              );
        msg.append ( password                                                  );
        msg.append ( ":ERROR:"                                                 );
        msg.append ( e.getMessage()                                            );
        throw new ProcessingErrorException ( msg.toString()                    );
      } finally {
        if (ctx != null) { try { ctx.close(); } catch ( Exception ignore ) {} }
      }
    }
    return result;
  }


  ///////////////////////////////////////////////////////////////
  static PermissionAttributes getSectorPermission (SectorAttributes sector, PermissionAssignee assignee) 
    throws ProcessingErrorException {
  ///////////////////////////////////////////////////////////////
    PermissionAttributes result = new PermissionAttributes();
    result.setSector(sector);
    result.setSId(assignee.getSId());
    try {
      ArrayList permissions = assignee.getPermissions();
      for ( int i=0; i < permissions.size(); i++ ) {
        PermissionAttributes listPermission = (PermissionAttributes) permissions.get(i);
        if (listPermission.getSector().getSectorId() == sector.getSectorId() ) {
          int listLevel = listPermission.getAccessLevel().getAccessLevelId();
          int currentLevel = result.getAccessLevel().getAccessLevelId();
          if ( listLevel > currentLevel ) {
            result.setAccessLevel( listPermission.getAccessLevel() );
          }
        }
      }
    } catch (Exception e) {
      StringBuffer msg = new StringBuffer(1000);
      msg.append("processAuthentication:getSectorPermission:ERROR:\n");
      try {
        XMLDocument error = new XMLDocument("Parameters");
        error.addTag(sector.getXML());
        error.addTag(assignee.getXML());
        msg.append(error.getXML(2));
      } catch (Exception ignore) {} 
      msg.append(e.getMessage());
      throw new ProcessingErrorException( msg.toString() );
    }
    return result;
  }


  /////////////////////////////////////////////////////////////////////////
  static void sendPasswordMail(String firstName, String lastName, String email)
    throws ProcessingErrorException {
  /////////////////////////////////////////////////////////////////////////
    Context ctx = null;
    try {
      ctx = new InitialContext(System.getProperties());
      AuthenticationServicesHome authHome =
        (AuthenticationServicesHome) ctx.lookup("jma.AuthenticationServicesHome");
      AuthenticationServices authEJB = authHome.create();
      AuthenticationAttributes authentication = authEJB.getCredentials(firstName, lastName, email);
      if ( !authentication.getUserName().equals("") ) {
        MailServicesAttributes mail = new MailServicesAttributes();
        mail.setMailSubject("TopCoder");
        mail.setMailSentDate( new java.sql.Date(Common.getCurrentTimestamp().getTime()) );
        StringBuffer msgText = new StringBuffer(1000);
        msgText.append("Your TopCoder login credetials are:\n\n");
        msgText.append("Handle:  ");
        msgText.append( authentication.getUserName() );
        msgText.append("\nPassword:  ");
        msgText.append( authentication.getPassword() );
        msgText.append("\n\nThank You for registering with TopCoder!\n");
        msgText.append("\n\nPlease do not reply to this e-mail.\n");
        mail.setMailText( msgText.toString() );
        mail.setMailToAddress( email );
        mail.setMailFromAddress( "service@topcoder.com" );
        mail.setCoderId(  authentication.getUserId().intValue() );
        mail.setMode( "S" );
        mail.setReason( "Sent Password" );
        Mail.sendMail( mail );
      } else {
        throw new ProcessingErrorException
          ("processAuthentication:sendPasswordMail:ERROR:name and email address not found:\n");
      }
    } catch (Exception e)  {
      throw new ProcessingErrorException (
        "processAuthentication:sendPasswordMail:ERROR:\n"+e
      );
    } finally {
      try {
        if (ctx!=null) ctx.close();
      } catch (Exception ignore) {}
    }
  }


  ////////////////////////////////////////////////////////////////////////////////
  static final boolean hasMinimumPermission ( UserAttributes user )
    throws ProcessingErrorException {
  ////////////////////////////////////////////////////////////////////////////////
    boolean result = false;
    if ( user == null ) return false;
    try {
      PermissionAttributes permission   = Common.getSectorPermission ( Common.SUBSCRIBER_SITE_SECTOR, user );
      int level                         = permission.getAccessLevel().getAccessLevelId();
      if ( level == 99 ) return true;
      if ( level > 0 ) {
        HashMap userTypeDetails         = user.getUserTypeDetails();
        SubscriberAttributes subscriber = (SubscriberAttributes) userTypeDetails.get ("Subscriber");
        ArrayList subscriptions         = subscriber.getSubscriptions();
        java.sql.Timestamp now          = Common.getCurrentTimestamp();
        for ( int i=0; i < subscriptions.size(); i++ ) {
          SubscriptionAttributes subscription = (SubscriptionAttributes) subscriptions.get(i);
          if ( subscription.getEndDate().compareTo(now) > 0 ) {
            result = true;
            break;
          }
        }
      }
    } catch ( Exception e ) {
      e.printStackTrace();
      throw new ProcessingErrorException ( 
        "subscriber.processAuthentication:hasMinimumPermission:ERROR"+e.getMessage() 
      );
    }
    return result;
  }



  //////////////////////////////////////////////////////////////////////////
  static String generateActivationCode(String userId) throws ProcessingErrorException {
  /////////////////////////////////////////////////////////////////////////
    String result = null; 
    Context ctx = null; 
    try {   
      java.sql.Time time = Common.getCurrentTime();
      String todayInSecs = Long.toString( time.getTime()/1000 );
      StringBuffer buffer = new StringBuffer(17);
      buffer.append(userId);
      buffer.append("-");
      buffer.append(todayInSecs);
      int i = buffer.length()-2;
      for (int j=buffer.length();(i>-1&&j>0); j-=2) { 
        char[] twoCharNum = { buffer.charAt(i), buffer.charAt(j-1) };
        if ( Character.isDigit(twoCharNum[0]) && Character.isDigit(twoCharNum[1]) ) {
          int twoDigitNum = Integer.parseInt( new String(twoCharNum) );
          //if the two characters together as an int are between 65 and 90, 
          //convert them to the ASCII letter for the number. 
          if (twoDigitNum>64&&twoDigitNum<91) {
            buffer.replace( i, j, new Character((char)(twoDigitNum)).toString() );
            i-=1;
            j-=1;
          }
        }
        i-=2;
      }
      Integer intUserId = new Integer(userId);
      ctx = TCContext.getInitial();
      UserHome userHome = (UserHome) ctx.lookup("UserHome");
      User userEJB = (User) userHome.findByPrimaryKey(intUserId);
      UserAttributes user = userEJB.getUser();
      HashMap userTypeDetails = user.getUserTypeDetails();

      SubscriberAttributes subscriber = (SubscriberAttributes) userTypeDetails.get("Subscriber");

      result=buffer.toString();
      subscriber.setActivationCode(result);
      subscriber.setModified("U");
      userEJB.setUser(user);
    } catch (Exception e)  {
      StringBuffer msg = new StringBuffer(250);
      msg.append("processAuthentication:generateActivationCode:coderId=");
      msg.append(userId);
      msg.append(":ERROR:\n");
      msg.append(e.getMessage());
      throw new ProcessingErrorException(msg.toString());
    } finally {
      if (ctx!=null) {
        try {
          ctx.close();
        } catch (Exception ignore) {}
      }
    }
Log.msg("XXX activation code: " + result);
    return result; 
  }

  /**
   ********************************************************************************************
   * validateActivationCode()
   * Determines the status of the given activation code
   *    INVALID if the user id associated with the given activation doesn't match the
   *      'decripted' user id, or if the given activation code doesn't match the 
   *      activation code store in the database.
   *    VALID if everything matches up
   *    ALREADY_ACTIVE if the user has already been activated
   * @author Greg Paul
   * @param activationCode - the activation code to check
   * @throws ProcessingErrorException
   ********************************************************************************************
   */
  static int validateActivationCode(String activationCode) throws ProcessingErrorException {
    Log.msg(VERBOSE, "subscriber:processAuthentication:validateActivationCode called..."); 
    int result = INVALID;
    Context ctx = null; 
    try {   
      int userId = getActivationUserId(activationCode);
      ctx = TCContext.getInitial();
      AuthenticationServicesHome authHome =
        (AuthenticationServicesHome) ctx.lookup("jma.AuthenticationServicesHome");
      AuthenticationServices authEJB = authHome.create();
      AuthenticationAttributes authentication = authEJB.getSubscriberActivation(userId);
      if ( authentication.getUserId().intValue() == userId ) {
        if ( authentication.getActivationCode().equals(activationCode) ) {
          if ( authentication.getStatus().equals("U") ) {
            UserHome userHome = (UserHome) ctx.lookup("UserHome");
            User userEJB = (User) userHome.findByPrimaryKey(authentication.getUserId());
            UserAttributes user = userEJB.getUser();
            user.setStatus("A");
            user.setModified("U");
            userEJB.setUser(user);
            result = VALID;
          } else {
            result = ALREADY_ACTIVE;
          }
        }
      }
    } catch (Exception e)  {
      e.printStackTrace();
      throw new ProcessingErrorException
        ("processAuthentication:validateActivationCoderId:ERROR:\n"+e);
    } finally {
      try {
        if (ctx!=null) ctx.close();
      } catch (Exception ignore) {}
    }
    return result;
  }

  /**
   ******************************************************************************************
   * getActivationUserId()
   * Decripts a user id from the given activation code
   * @author Greg Paul
   * @param activationCode - the code
   * @return int - the user's id
   * @throws ProcessingErrorException
   ******************************************************************************************
   */
  private static int getActivationUserId(String activationCode) 
    throws ProcessingErrorException {
    Log.msg(VERBOSE, "subscriber:processAuthentication:getActivationUserId called..."); 
    int result = 0;
    try {   
      StringBuffer buffer = new StringBuffer(activationCode);
      for (int i=0; i<buffer.length(); i++) {
        char thisChar = buffer.charAt(i);
        if (thisChar=='-') {
          buffer.delete(i,17);
          break;
        } else if ( Character.isLetterOrDigit(thisChar) ) {
          if ( Character.isLetter(thisChar) ) {
            buffer.replace( i, i+1, Integer.toString((int)(thisChar)) );
            i++;
          }
        } else {
          buffer.deleteCharAt(i);
          i--;
        }
      }
      result = Integer.parseInt( buffer.toString() );
    }catch (Exception e)  {
      throw new ProcessingErrorException("processAuthentication:getActivationCoderId:ERROR:\n"+e);
    }
    return result; 
  }




}
