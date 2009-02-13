package com.topcoder.web.servlet.marketing.task;

import com.topcoder.web.servlet.marketing.*;
import com.topcoder.common.*;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.data.*;

import javax.servlet.*;
import javax.servlet.http.*;


public final class Home {

  ////////////////////////////////////////////////////////////////////////////////
  public static String process (HttpServletRequest request, HttpServletResponse response,
                       RenderHTML renderer, Navigation nav, XMLDocument document)
    throws NavigationException {
  ////////////////////////////////////////////////////////////////////////////////
    String result = null;
    try {
      result = renderer.render ( document, XSL.DIR+"home.xsl", null );
    } catch ( Exception e ) {
      StringBuffer msg = new StringBuffer ( 150                               );
      msg.append ( "marketing.task.Home:process:"                                 );
      msg.append ( ":ERROR:\n"                                                );
      msg.append ( e.getMessage()                                             );
      throw new NavigationException ( msg.toString(), XSL.INTERNAL_ERROR_URL  );
    } 
    return result;
  }


}
