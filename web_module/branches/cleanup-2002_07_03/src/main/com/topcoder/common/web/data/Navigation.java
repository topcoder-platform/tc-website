package com.topcoder.common.web.data;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.naming.*;

import com.topcoder.common.*;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.util.*;
import com.topcoder.ejb.UserServices.*;
import com.topcoder.ejb.AuthenticationServices.*;

/**
* This class stores login information about site navigation.
* @author Steve Burrows
*/
public final class Navigation 
  implements Serializable, HttpSessionBindingListener {

  private static boolean VERBOSE = false;
  private String screen; 
  private Browser browser;
  private boolean loggedIn;
  private boolean serializable;
  private int userId;
  private User userSerializable;
  private transient User user;
  private HashMap sessionObjects;  
  private boolean newNav;
 

  //////////////////////////////////////////////////////////////////////////
  public void valueBound ( HttpSessionBindingEvent e ) {
  //////////////////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "common.Navigation:valueBound:called" );
  }


  //////////////////////////////////////////////////////////////////////////
  public void valueUnbound ( HttpSessionBindingEvent e ) {
  //////////////////////////////////////////////////////////////////////////
    if (VERBOSE) {
      StringBuffer msg = new StringBuffer ( 200           );
      msg.append ( "common.attr.Navigation:valueUnbound:" );
      msg.append ( "user.getUserId:"                      );
      msg.append ( user.getUserId()                       );
      Log.msg ( msg.toString()                      );
    }
    if ( getUser().getLoggedIn().equals("Y") ) {
      Context ctx = null;
      try {
        ctx = TCContext.getInitial();
        UserServicesHome userHome = (UserServicesHome) ctx.lookup ( ApplicationServer.USER_SERVICES );
        UserServices userEJB = (UserServices) userHome.findByPrimaryKey( new Integer(getUser().getUserId()) );
        setUser ( userEJB.getUser() );
        getUser().setLoggedIn ( "N" );
        getUser().setModified ( "U" );
        userEJB.setUser ( getUser() );
      } catch (Exception exception) {
        Log.msg("common.Navigation:valueUnbound:ERROR:\n"+exception);
      } finally {
        if (ctx != null) { try { ctx.close(); } catch (Exception ignore) {} }
      }
    }
  }


 
  /**
  * The constructor for the class. Initializes instance variables.
  */
  //////////////////////////////////////////////////////////////////////////
  public Navigation() {
  //////////////////////////////////////////////////////////////////////////
    screen="";
    browser = new Browser();
    loggedIn = false;
    serializable = false;
    userId = 0;
    user = new User();
    userSerializable = new User();
    sessionObjects = new HashMap(3);
    newNav = true;
  }


  //get


  public String getServletURL(HttpServletRequest request, HttpServletResponse response, String servlet) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/"+servlet);
    return response.encodeURL(url.toString());
  }

  ///////////////////////////////////////////////////////////////
  public String getPostURL(HttpServletRequest request, HttpServletResponse response) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/");
    return response.encodeURL(url.toString());
  }

  ///////////////////////////////////////////////////////////////
  public String getSubscriberURL(HttpServletRequest request, HttpServletResponse response) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer ( 100  );
    url.append ( "://"                         );
    url.append ( request.getServerName()       );
    url.append ( "/corporate"                 );
    return response.encodeURL ( url.toString() );
  }

  ///////////////////////////////////////////////////////////////
  public String getAdminURL(HttpServletRequest request, HttpServletResponse response) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer ( 100  );
    url.append ( "://"                         );
    url.append ( request.getServerName()       );
    url.append ( "/admin"                      );
    return response.encodeURL ( url.toString() );
  }
 
  ///////////////////////////////////////////////////////////////
  public String getJSPURL(HttpServletRequest request, HttpServletResponse response) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    //url.append("://");
    //url.append(request.getServerName());
    url.append("/rtables/index.jsp");
    return response.encodeURL(url.toString());
  }


  ///////////////////////////////////////////////////////////////
  public String getAppletURL(String appletName, HttpServletRequest request, HttpServletResponse response) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/");
    url.append(appletName);
    url.append("/classes/");
    return response.encodeURL(url.toString());
  }

  ///////////////////////////////////////////////////////////////
  public String getJSPURL(String jspName, HttpServletRequest request, HttpServletResponse response) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    //url.append("://");
    //url.append(request.getServerName());
    url.append("/rtables/");
    url.append(jspName);
    url.append(".jsp");
    return response.encodeURL(url.toString());
  }

  ///////////////////////////////////////////////////////////////
  public String getRoundTableURL(HttpServletRequest request, HttpServletResponse response) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/rtables/viewForum.jsp");
    return response.encodeURL(url.toString());
  }

  public String getServletCookieEnabledURL(HttpServletRequest request, String servlet) {
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/"+servlet);
    return url.toString();
  }

  ///////////////////////////////////////////////////////////////
  public String getPostCookieEnabledURL(HttpServletRequest request) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/");
    return url.toString();
  }

  ///////////////////////////////////////////////////////////////
  public String getSubscriberCookieEnabledURL(HttpServletRequest request) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer ( 100 );
    url.append ( "://"                        );
    url.append ( request.getServerName()      );
    url.append ( "/corporate"                );
    return url.toString(                      );
  }

  ///////////////////////////////////////////////////////////////
  public String getJSPCookieEnabledURL(HttpServletRequest request) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    //url.append("://");
    //url.append(request.getServerName());
    url.append("/rtables/index.jsp");
    return url.toString();
  }

  ///////////////////////////////////////////////////////////////
  public String getAppletCookieEnabledURL(String appletName, HttpServletRequest request) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/");
    url.append(appletName);
    url.append("/classes/");
    return url.toString();
  }

  ///////////////////////////////////////////////////////////////
  public String getRoundTableCookieEnabledURL(HttpServletRequest request) {
  ///////////////////////////////////////////////////////////////
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/rtables/viewForum.jsp");
    return url.toString();
  }

  ///////////////////////////////////////////////////////////////
  public boolean cookiesEnabled(HttpServletRequest request, HttpServletResponse response) {
  ///////////////////////////////////////////////////////////////
    boolean result = false;
    StringBuffer url = new StringBuffer(100);
    url.append("://");
    url.append(request.getServerName());
    url.append("/");
    if ( response.encodeURL(url.toString()).equals(url.toString()) ) result = true;
    return result;
  }


  ///////////////////////////////////////////////////////////////
  public boolean userIsSerializable() {
  ///////////////////////////////////////////////////////////////
    return this.serializable;
  }

  ///////////////////////////////////////////////////////////////
  public String getScreen() {
  ///////////////////////////////////////////////////////////////
    return this.screen;
  }

  ///////////////////////////////////////////////////////////////
  public Browser getBrowser() {
  ///////////////////////////////////////////////////////////////
    return this.browser;
  }

  ///////////////////////////////////////////////////////////////
  public int getUserId() {
  ///////////////////////////////////////////////////////////////
    return this.userId;
  }

  ///////////////////////////////////////////////////////////////
  public boolean getLoggedIn() {
  ///////////////////////////////////////////////////////////////
    return this.loggedIn;
  }

  ///////////////////////////////////////////////////////////////
  public boolean getNewNav() {
  ///////////////////////////////////////////////////////////////
    return this.newNav;
  }

  ///////////////////////////////////////////////////////////////
  public User getUser() {
  ///////////////////////////////////////////////////////////////
    if ( serializable ) {
      return this.userSerializable;
    } else {
      return this.user;
    }
  }

  
  ///////////////////////////////////////////////////////////////
  public HashMap getSessionObjects() {
  ///////////////////////////////////////////////////////////////
    return this.sessionObjects;
  }

//set
  ///////////////////////////////////////////////////////////////
  public void makeUserTransient() throws Exception {
  ///////////////////////////////////////////////////////////////
    try {
      if (serializable) {
        user = (User) userSerializable.clone();
        userSerializable = new User();
        serializable = false;
        Log.msg(VERBOSE, "common.Navigation:makeUserTransient:user made transient");
      }
    } catch (Exception e) {
      throw new Exception("common.Navigation:makeUserTransient:ERROR:\n"+e);
    }
  }

  ///////////////////////////////////////////////////////////////
  public void makeUserSerializable() throws Exception {
  ///////////////////////////////////////////////////////////////
    try {
      if (!serializable) {
        userSerializable = (User) user.clone();
        user = new User();
        serializable = true;
        Log.msg(VERBOSE, "common.Navigation:makeUserSerializable:user made serializable");
      }
    } catch (Exception e) {
      throw new Exception("common.Navigation:makeUserSerializable:ERROR:\n"+e);
    }
  }

  ///////////////////////////////////////////////////////////////
  public void setScreen(String screen) {
  ///////////////////////////////////////////////////////////////
    this.screen=screen;
  }

  ///////////////////////////////////////////////////////////////
  public void setBrowser(Browser browser) {
  ///////////////////////////////////////////////////////////////
    this.browser=browser;
  }

  ///////////////////////////////////////////////////////////////
  public void setUserId(int userId) {
  ///////////////////////////////////////////////////////////////
    this.userId=userId;
  }

  ///////////////////////////////////////////////////////////////
  public void setLoggedIn(boolean loggedIn) {
  ///////////////////////////////////////////////////////////////
    this.loggedIn=loggedIn;
  }

  ///////////////////////////////////////////////////////////////
  public void setNewNav(boolean newNav) {
  ///////////////////////////////////////////////////////////////
    this.newNav=newNav;
  }

  ///////////////////////////////////////////////////////////////
  public void setUser(User user) {
  ///////////////////////////////////////////////////////////////
    if (serializable) {
      this.userSerializable=user;
      Log.msg(VERBOSE, "common.Navigation:setUser:serializable user set");
    } else {
      this.user=user;
      Log.msg(VERBOSE, "common.Navigation:setUser:transient user set");
    }
  }

  ///////////////////////////////////////////////////////////////
  public void setSessionObjects(HashMap sessionObjects) {
  ///////////////////////////////////////////////////////////////
    this.sessionObjects=sessionObjects;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public Scroll getScroll ( int Returns, String sessionKey )
    throws Exception {
  ////////////////////////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "coder:task:getScroll called...");
    Scroll result = null; 
    try {   
      if ( sessionObjects.containsKey(sessionKey) ) {
        result = (Scroll) sessionObjects.get ( sessionKey );
      } else {
        result = new Scroll ( true, 1, Returns, 0, false, false );
        sessionObjects.put ( sessionKey, result );
      }
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer ( 150           );
      msg.append ( "Navigation.getScroll:"                );
      msg.append ( sessionKey                             );
      msg.append ( ":ERROR:\n"                            );
      msg.append ( e.getMessage()                         );
      throw new Exception ( msg.toString() );
    }
    return result; 
  }



/*
  ///////////////////////////////////////////////////////////////
  public RecordTag getXML() throws Exception {
  ///////////////////////////////////////////////////////////////
    RecordTag result = null;
    try {
      result = new RecordTag("Navigation");
      result.addTag( new ValueTag("Screen", screen) );
      result.addTag( new ValueTag("LoggedIn", loggedIn) );
      result.addTag( new ValueTag("UserId", userId) );
      result.addTag( new ValueTag("Serializable", serializable) );
      result.addTag( browser.getXML() );
      if (serializable) {
        result.addTag(userSerializable.getXML());
      } else {
        result.addTag(user.getXML());
      }
      RecordTag objectsTag = new RecordTag("SessionObjects");
      for (Iterator objects = sessionObjects.values().iterator(); objects.hasNext(); ) {
        objectsTag.addTag( ((Base)objects.next()).getXML() );
      }
      result.addTag(objectsTag); 
      result.addTag( new ValueTag("NewNav", newNav) );
    }catch (Exception e)  {
      throw new Exception("common.Navigation:getXML:ERROR:\n"+e);
    }
    return result;
  }
*/
}
