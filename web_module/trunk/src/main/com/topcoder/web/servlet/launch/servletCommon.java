package com.topcoder.launch;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import java.util.*;
import com.topcoder.common.*;
import java.io.PrintWriter;

abstract class servletCommon extends HttpServlet {

  public static final boolean VERBOSE = true;
  public static final String fileDirURL = "file:" + Common.BASE_DIR + "/servlet/";
  private RenderHTML HTMLmaker;
    
  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void init(ServletConfig config) throws ServletException {
  ////////////////////////////////////////////////////////////////////////////////
    Log.msg("SERVLET INIT CALLED");
    //Context ctx = new InitialContext();
    //RenderHTMLHome htmlHome = (RenderHTMLHome) ctx.lookup("jma.RenderHTMLHome");
    HTMLmaker = new RenderHTML();
    super.init(config);
  }
  
  ////////////////////////////////////////////////////////////////////////////////
  public RenderHTML getRenderer() {
  ////////////////////////////////////////////////////////////////////////////////
    return this.HTMLmaker;
  }
  
  ////////////////////////////////////////////////////////////////////////////////
  public void render(XMLDocument document, String xsldocURLString, PrintWriter out) {
  ////////////////////////////////////////////////////////////////////////////////
    try {
      HTMLmaker.render(document, xsldocURLString, null);
    }catch(Exception e) {Log.msg("ERROR SERVLET, rendering problem");}
  }
  
  ////////////////////////////////////////////////////////////////////////////////
  public String checkNull(String temp) {
  ////////////////////////////////////////////////////////////////////////////////
    if(temp == null) return "";
    else return temp;
  }

  ////////////////////////////////////////////////////////////////////////////////
  public String cleanNumber(String number) {
  ////////////////////////////////////////////////////////////////////////////////
    StringBuffer tempBuffer = new StringBuffer();
    char[] numChar = number.toCharArray();
    for( int i=0, len=numChar.length; i<len; i++ ) {
      if(  numChar[i] == '0' || numChar[i] == '1' ||
           numChar[i] == '2' || numChar[i] == '3' ||
           numChar[i] == '4' || numChar[i] == '5' ||
           numChar[i] == '6' || numChar[i] == '7' ||
           numChar[i] == '8' || numChar[i] == '9' )
      {
        tempBuffer.append(numChar[i]);
      }
    }
    return( tempBuffer.toString() );
  }
  
  ////////////////////////////////////////////////////////////////////////////////
  public RecordTag genXML(String tagName, List attrList) {
  ////////////////////////////////////////////////////////////////////////////////
    RecordTag rec = new RecordTag(tagName);
    if (attrList!=null) {
      for (int i=0; i< attrList.size(); i++) {
        BaseAttributes attrObj = (BaseAttributes) attrList.get(i);
        try {
          rec.addTag( attrObj.getXML() );
        }catch(Exception e) {
          Log.msg("ERROR SERVLET COMMON loading tags");
          e.printStackTrace();
        }
      }
    }
    return rec;
  }
  
  /* BAD, BAD, BAD... Makes a messy session
  ////////////////////////////////////////////////////////////////////////////////
  public void storeInSession(HttpServletRequest request, Enumeration parameters, String varPrefix) {
  ////////////////////////////////////////////////////////////////////////////////
    HttpSession session = request.getSession(true);
    for ( ; parameters.hasMoreElements() ;) {
      String paramName = (String) parameters.nextElement();
      session.putValue( varPrefix + paramName, checkNull(request.getParameter(paramName)) );
    }
  }
  */
  
}

