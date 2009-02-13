package com.topcoder.subscriber;

import com.topcoder.common.*;
import com.topcoder.common.attr.*;
import java.io.*;
import java.util.*;
import java.rmi.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import javax.jms.*;
import com.topcoder.ejb.User.*;
import com.topcoder.ejb.AuthenticationServices.*;

public final class taskRegistration {
 
  private static final String XSL_DIR = task.XSL_URL + "reg/";
  private static final String REG_TERMS_URL = XSL_DIR + "reg_terms.xsl";
  private static final String REG_URL = XSL_DIR + "reg.xsl"; 
  private static final String GENERIC_ERROR_URL = task.XSL_URL + "error/generic_error.xsl";
  private static final String REG_COMPLETE_URL = XSL_DIR + "reg_complete.xsl"; 
   
  private static final boolean VERBOSE = true; 

  /**
   ***********************************************************************************
   * process()
   * Processes a subscriber registration request
   * @Author Greg Paul
   * @param request - 
   * @param response -
   * @param HTMLmaker -
   * @param nav -
   * @param document -
   * @return String -
   * @throws NavigationException - 
   ***********************************************************************************
   */
  static String process (HttpServletRequest request, HttpServletResponse response,
                       RenderHTML HTMLmaker, Navigation nav, XMLDocument document)
    throws NavigationException {

    String result = null;
    String command = null;
    RecordTag regTag = new RecordTag("REG");

    UserAttributes user = null;
    SubscriberAttributes subscriber = null;
    
    try {
      document.addTag( nav.getBrowser().getXML() );
      command = Conversion.checkNull(request.getParameter("Command"));
  
      user = nav.getUser();
      
      if (user.getUserTypeDetails().containsKey("Subscriber")) {
        subscriber = (SubscriberAttributes)user.getUserTypeDetails().get("Subscriber");
      } else {
        subscriber = new SubscriberAttributes();
        user.getUserTypeDetails().put("Subscriber", subscriber);
      }

      /***************** empty  **********************/
      if (command.equals("")) {
        // if they're logged in, give them the screen to update their info
        if ( nav.getLoggedIn() && processAuthentication.hasMinimumPermission(nav.getUser()) ) {
          document.addTag(Common.createErrorTag("You can not register because you are already logged in."));
          result = task.render(HTMLmaker, nav, document, GENERIC_ERROR_URL, null);
        }
        // if they're not logged in, give them the terms agreement
        else result = task.render(HTMLmaker, nav, document, REG_TERMS_URL, null);
        return result;
      }
      /***************** terms  **********************/
      else if (command.equals("terms")) {
        user.setTerms("Y");
        processRegistration.buildLookupTags(regTag);
        regTag.addTag(user.getXML());
        document.addTag(regTag);
        Log.msg(VERBOSE, document.getXML(2));
        result = task.render(HTMLmaker, nav, document, REG_URL, null);
      }
      /***************** submit **********************/
      else if (command.equals("submit")) {
        if ( nav.getLoggedIn() && processAuthentication.hasMinimumPermission(nav.getUser()) ) {
          document.addTag(Common.createErrorTag("Your user already exists."));
          result = task.render(HTMLmaker, nav, document, GENERIC_ERROR_URL, null);
        }
        // ** if they have submitted to our terms
        else if (user.getTerms().equals("Y")) {  
          if (processRegistration.isValidUserName(request.getParameter("UserName"))) {
            processRegistration.createSubscriber(request, response, nav);
            result = task.render(HTMLmaker, nav, document, REG_COMPLETE_URL, null);
            nav.setUserId(0);
            nav.setUser(new UserAttributes());
            nav.setLoggedIn(false);
          }
          else {
            document.addTag(Common.createErrorTag("Invalid User Name, choose another."));
            result = task.render(HTMLmaker, nav, document, GENERIC_ERROR_URL, null);
          }
        }
        else { 
          document.addTag(Common.createErrorTag("You must agree to terms of use before you can register."));
          result = task.render(HTMLmaker, nav, document, GENERIC_ERROR_URL, null);
        }
      }
      else {
          result=task.render(HTMLmaker, nav, document, task.XSL_URL + "authenticate/activated.xsl", null);
//        throw new NavigationException("subscriber.taskRegistration:process:ERROR:invalid command:",
//          task.NAVIGATION_ERROR_URL);
      }
    } catch (Exception e) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer();
      msg.append("taskRegistration:process:ERROR:\n");
      msg.append(e);
      throw new NavigationException(msg.toString(), task.NAVIGATION_ERROR_URL);
    }
    return result;
  }
 

 
  /**
   **********************************************************************************************
   * createSubscriber()
   * Create a subscriber using information in request
   * @author Greg Paul
   * @param request - the request
   * @param response - the response
   * @param HTMLmaker - that which creates the HTML
   * @param document - our XML document
   * @return String -
   * @throws NavigationException
   **********************************************************************************************
   */
  private static String createSubscriber(HttpServletRequest request, HttpServletResponse response,
    RenderHTML HTMLmaker, Navigation nav, XMLDocument document)
    throws NavigationException {

    try {
      UserAttributes user = nav.getUser();      
      String userMod =user.getModified(); 
      
      return null;
    } catch (Exception e) {
      throw new NavigationException("subscriber.taskRegistration:createSubscriber:ERROR:\n"+e,
        task.NAVIGATION_ERROR_URL);
    }
  }
}
