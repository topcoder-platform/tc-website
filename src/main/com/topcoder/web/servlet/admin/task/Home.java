package com.topcoder.web.servlet.admin.task;

import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.shared.util.*;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.web.servlet.admin.*;


public final class Home {

  ////////////////////////////////////////////////////////////////////////////////
  public static String process (HttpServletRequest request, HttpServletResponse response,
                       HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
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
