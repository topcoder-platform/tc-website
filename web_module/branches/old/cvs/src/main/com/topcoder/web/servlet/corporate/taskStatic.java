package corporate;

import com.topcoder.common.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.util.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public final class taskStatic {


  private static final String XSL_DIR = task.XSL_URL + "static/";
  private static final String CODER_CLICK_THRU_DIR = task.XSL_URL + "click_thru/coder/";
  private static final String SPONSOR_CLICK_THRU_DIR = task.XSL_URL + "click_thru/sponsor/";
  private static final boolean VERBOSE = false;


  ////////////////////////////////////////////////////////////////////////////////
  static String process (HttpServletRequest request, HttpServletResponse response,
                         RenderHTML HTMLmaker, Navigation nav, XMLDocument document)
    throws NavigationException, SessionClobberedException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    try {
      String command = Conversion.checkNull ( request.getParameter("Command") );
      Log.msg ( VERBOSE, "taskStatic: Command: " + request.getParameter("Command") );
      if ( command.equals("") ) {
        result = taskHome.process ( request, response, HTMLmaker, nav, document );
      }
      else if ( command.equals("overview") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, XSL_DIR );
      }
      else if ( command.equals("benefit") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, XSL_DIR );
      }
      else if ( command.equals("plan") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, XSL_DIR );
      }
      else if ( command.equals("member_home") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("member_search") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("member_profile") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("login") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("lobby") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("problem") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("coding") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("250") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("500") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("1000") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("status") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, CODER_CLICK_THRU_DIR );
      }
      else if ( command.equals("sponsor_home") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, SPONSOR_CLICK_THRU_DIR );
      }
      else if ( command.equals("sponsor_match_detail") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, SPONSOR_CLICK_THRU_DIR );
      }
      else if ( command.equals("sponsor_arena") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, SPONSOR_CLICK_THRU_DIR );
      }
      else if ( command.equals("sponsor_code") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, SPONSOR_CLICK_THRU_DIR );
      }
      else if ( command.equals("sponsor_stat") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, SPONSOR_CLICK_THRU_DIR );
      }
      else if ( command.equals("sponsor_email") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, SPONSOR_CLICK_THRU_DIR );
      }
      else if ( command.equals("privacy") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, XSL_DIR );
      }
      else if ( command.equals("terms") ) {
        result = displayStatic ( HTMLmaker, request, response, nav, document, XSL_DIR );
      }
      else {
        throw new NavigationException (
          "corporate.taskStatic:process:ERROR:invalid command"
          ,task.NAVIGATION_ERROR_URL
        );
      }
    } catch (NavigationException ne) {
      Log.msg ( "corporate.taskStatic:ERROR:\n" + ne );
      throw ne;
    } catch (Exception e) {
      StringBuffer msg = new StringBuffer ( 150     );
      msg.append ( "corporate.taskStatic:process:" );
      msg.append ( ":ERROR:\n"                      );
      msg.append ( e                                );
      throw new NavigationException ( msg.toString(), task.INTERNAL_ERROR_URL );
    } 
    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public static String displayStatic (RenderHTML HTMLmaker, HttpServletRequest request, 
    HttpServletResponse response, Navigation nav, XMLDocument document, String dir ) 
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    String command = null;
    try {
      command = Conversion.checkNull( request.getParameter("Command") );
      String xsldocURLString = dir + command + ".xsl";
      Log.msg ( VERBOSE, xsldocURLString );
      Log.msg ( VERBOSE, document.getXML(2) );
      String cacheKey = task.LOGGED_OUT_KEY;
      result = task.render ( HTMLmaker, nav, document, xsldocURLString, request.getServerName()+cacheKey );
    } catch (Exception e) {
      StringBuffer msg = new StringBuffer( 150              );
      msg.append( "corporate.processStatic:displayStatic:" );
      msg.append( command                                   );
      msg.append( ":ERROR:"                                 );
      msg.append( e.getMessage()                            );
      throw new NavigationException ( msg.toString(), task.NAVIGATION_ERROR_URL );
    }
    return result;
  }


}
