package admin.task;

import javax.servlet.*;
import javax.servlet.http.*;
import admin.*;
import com.topcoder.common.*;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.*;


public final class Home {

  ////////////////////////////////////////////////////////////////////////////////
  public static String process (HttpServletRequest request, HttpServletResponse response,
                       RenderHTML HTMLmaker, Navigation nav, XMLDocument document)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    try {
      result = HTMLmaker.render (document, XSL.DIR+"home.xsl", null );
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer ( 150                               );
      msg.append ( "admin.task.Home:process:"                                 );
      msg.append ( ":ERROR:\n"                                                );
      msg.append ( e.getMessage()                                             );
      throw new NavigationException ( msg.toString(), XSL.INTERNAL_ERROR_URL  );
    } 
    return result;
  }


}
