package corporate;

import com.topcoder.common.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.xml.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public final class taskHome {


  private static final String  PUBLIC_URL    = task.XSL_URL + "static/overview.xsl";
  private static final boolean VERBOSE       = false;


  ////////////////////////////////////////////////////////////////////////////////
  static String process ( HttpServletRequest request, HttpServletResponse response,
    RenderHTML HTMLmaker, Navigation nav, XMLDocument document )
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String      result  = null;
    HttpSession session = null;
    try {
      String sponsor = request.getParameter("Sponsor");
      if ( sponsor != null ) {
        document.addTag ( new ValueTag("Sponsor","Y") );
      }
      String xsldocURLString = PUBLIC_URL;
      result = task.render ( HTMLmaker, nav, document, xsldocURLString, null );
    } catch (NavigationException ne) {
      Log.msg ( "corporate.taskHome:ERROR:\n" + ne );
      throw ne;
    } catch (Exception e) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer ( 150                               );
      msg.append ( "corporate.taskHome:process:"                             );
      msg.append ( ":ERROR:\n"                                                );
      msg.append ( e.getMessage()                                             );
      throw new NavigationException ( msg.toString(), task.INTERNAL_ERROR_URL );
    } 
    return result;
  }


}
