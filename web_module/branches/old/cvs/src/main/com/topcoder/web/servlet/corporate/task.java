package corporate;

import com.topcoder.common.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.xml.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public final class task {


  static final String XSL_URL              = TCServlet.XSL_ROOT + "corporate/";
  static final String LOGGED_IN_KEY        = "1";
  static final String LOGGED_OUT_KEY       = "0";
  static final String FUBAR_ERROR_URL      = "/fubar_error.xsl";
  static final String ERROR_XSL_DIR        = "error/";
  static final String NAVIGATION_ERROR_URL = XSL_URL + ERROR_XSL_DIR + "navigation.xsl";
  static final String INTERNAL_ERROR_URL   = XSL_URL + ERROR_XSL_DIR + "internal.xsl";
  static final String SESSION_TIMEOUT_URL  = XSL_URL + ERROR_XSL_DIR + "session_timeout.xsl";
  static final String INVALID_BROWSER_URL  = XSL_URL + ERROR_XSL_DIR + "invalid_browser.xsl";
  static final String MAIL_ERROR_URL       = XSL_URL + ERROR_XSL_DIR + "mail_error.xsl";
  static final String MAIL_SENT_URL        = XSL_URL + "mail/mail_sent.xsl";
  static final int    CODER_WATCH_SCROLL   = 10;
  static final int    CODER_STAT_SORT_SCROLL = 10;

  private static final boolean VERBOSE     = false;


  ////////////////////////////////////////////////////////////////////////////////
  static final String render ( RenderHTML HTMLmaker, Navigation nav,
    XMLDocument document, String xsldocURLString, String cacheKey )
    throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    String HTMLString = null;
    try {
      HTMLString = HTMLmaker.render ( document, xsldocURLString, cacheKey );
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer ( 150           );
      msg.append ( "corporate.task:render:"              );
      msg.append ( xsldocURLString                        );
      msg.append ( ":ERROR:\n"                            );
      msg.append ( e                                      );
      throw new TCException ( msg.toString() );
    }
    return HTMLString;
  }


  ////////////////////////////////////////////////////////////////////////////////
  static Scroll getScroll ( Navigation nav, int Returns, String sessionKey )
    throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    Scroll result = null;
    try {
      HashMap sessionObjects   = nav.getSessionObjects();
      if ( sessionObjects.containsKey(sessionKey) ) {
        result = (Scroll) sessionObjects.get ( sessionKey );
      } else {
        result = new Scroll ( true, 1, Returns, 0, false, false );
        sessionObjects.put ( sessionKey, result );
      }
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer ( 150           );
      msg.append ( "corporate.task:getScroll:"           );
      msg.append ( sessionKey                             );
      msg.append ( ":ERROR:\n"                            );
      msg.append ( e.getMessage()                         );
      throw new TCException ( msg.toString() );
    }
    return result;
  }


}
