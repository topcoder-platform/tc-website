package com.topcoder.web.servlet.marketing;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.*;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.common.web.util.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public final class TC extends HttpServlet {

  private static Logger log = Logger.getLogger(TC.class);
  private              HTMLRenderer renderer         = null;
  private static final int        MAX_REPLACEMENTS = 100;


  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void init ( ServletConfig config ) throws ServletException {
  ////////////////////////////////////////////////////////////////////////////////
    if (renderer == null) { renderer = new HTMLRenderer(); }
    super.init(config);
  }

 
  ////////////////////////////////////////////////////////////////////////////////
  public final void doGet ( HttpServletRequest request, HttpServletResponse response )
    throws ServletException, IOException {
  ////////////////////////////////////////////////////////////////////////////////
    doPost ( request, response );
  }

     
  ////////////////////////////////////////////////////////////////////////////////
  public void doPost ( HttpServletRequest request, HttpServletResponse response ) 
    throws ServletException, IOException {
  ////////////////////////////////////////////////////////////////////////////////
    processCommands ( request, response );
  }
  

  ////////////////////////////////////////////////////////////////////////////////
  private void processCommands ( HttpServletRequest request, HttpServletResponse response ) {
  ////////////////////////////////////////////////////////////////////////////////
    PrintWriter out = null;
    String html = null;
    Navigation nav = null;
    HttpSession session = null;
    XMLDocument document = null;
    boolean timedOut = false;
    try {
      //////////////////////////////////////////
      // CHECK FOR SESSION TIMEOUT
      //////////////////////////////////////////
      if (request.isRequestedSessionIdValid()==false && request.getRequestedSessionId()!=null) {
        timedOut = true;
      }
      //////////////////////////////////////////
      // INIT SESSION AND XML DOCUMENT
      //////////////////////////////////////////
      session = request.getSession(true);
      document = new XMLDocument("TC");
      nav = setupSession(request, response, session);
      addURLTags(nav, request, response, document);
      //////////////////////////////////////////
      // NEED THE TASK TO SEE WHAT THE USER WANTS
      //////////////////////////////////////////
      String requestTask =    Conversion.checkNull( request.getParameter("Task")    );
      String requestCommand = Conversion.checkNull( request.getParameter("Command") );
      //************************ no task ************************
      if ( requestTask.equals("") ) {
        if ( requestCommand.equals("") ) {
          html = com.topcoder.web.servlet.marketing.task.Home.process( request, response, renderer, nav, document );
        } else {
          html = renderer.render ( document, XSL.DIR+requestCommand, null );
        }
      }
      //************************ request ************************
/*
      else if ( requestTask.equals("request") ) {
        html = marketing.task.corp.Request.process ( request, response, renderer, nav, document );
      }
*/
      //************************ report ************************
      else if ( requestTask.equals("report") ) {
        html = com.topcoder.web.servlet.marketing.task.report.Report.process ( request, response, renderer, nav, document );
      }
      //************************ invalid ************************
      else {
        StringBuffer msg = new StringBuffer( 150                               );
        msg.append ( "com.topcoder.web.servlet.marketing.TC:processCommands:ERROR:invalid task:" );
        msg.append ( requestTask                                               );
        msg.append ( ":\n"                                                     );
        throw new NavigationException ( 
          msg.toString()
          ,XSL.NAVIGATION_ERROR_URL
        );
      }
      out = response.getWriter();
      out.print(html);
      out.flush();
    } catch (NavigationException ne) {
      try {
        out = response.getWriter();
        ne.printStackTrace();
        if (nav==null) {
          session = request.getSession(true);
          nav = setupSession(request, response, session);
        }
        if (document==null) {
          document = new XMLDocument("TC");
          addURLTags(nav, request, response, document);
        }
        html = renderer.render(document, ne.getUrl(), null);
        out.print ( html );
        out.flush();
        log.debug ( "com.topcoder.web.servlet.marketing.TC:NAVIGATION ERROR:\n"+ne.getMessage() );
      } catch (Exception end) {
        end.printStackTrace();
        try {
          response.sendRedirect ( "/general_error.html" );
        } catch (Exception ignore) {}
      }
    } catch (Exception e) {
      try {
        out = response.getWriter();
        e.printStackTrace();
        if (nav==null) {
          session = request.getSession(true);
          nav = setupSession(request, response, session);
        }
        if (document==null) {
          document = new XMLDocument("TC");
          addURLTags(nav, request, response, document);
        }
        html = renderer.render(document, XSL.INTERNAL_ERROR_URL, null);
        out.print(html);
        out.flush();
        log.debug("com.topcoder.web.servlet.marketing.TC:INTERNAL ERROR:\n"+e);
      } catch (Exception end) {
        end.printStackTrace();
        try {
          response.sendRedirect("/general_error.html");
        } catch (Exception ignore) {}
      }
    } finally {
      session = request.getSession(false);
      if (session!=null && nav!=null) {
        session.setAttribute("navigation", nav);
      }
      session = null;
      nav = null;
      document = null;
      if (out!=null) {
        try {
          out.close();
          out = null;
        } catch (Exception end) {
          end.printStackTrace();
          try {
            response.sendRedirect("/general_error.html");
          } catch (Exception ignore) {}
        }
      }
    }
  }


  ////////////////////////////////////////////////////////////////////////////////
  private Navigation setupSession (HttpServletRequest request, HttpServletResponse response, 
    HttpSession session ) throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    Navigation result = null;
    try {
      response.setContentType("text/html");
      if ( session.getAttribute("navigation") == null ) {
        result = new Navigation();
      } else {
        result = (Navigation) session.getAttribute("navigation");
      }
    } catch (Exception e) {
      throw new TCException("com.topcoder.web.servlet.marketing.TC:setupSession:ERROR:\n"+e);
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private void addURLTags (Navigation nav, HttpServletRequest request, 
    HttpServletResponse response, XMLDocument document) throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////
    // ADD ALL XML TAGS BASIC TO ALL REQUESTS
    //////////////////////////////////////////
    try {
      document.addTag ( 
        new ValueTag (
          "AdminURL"
          ,nav.getAdminURL(request,response)
        ) 
      );
      document.addTag ( 
        new ValueTag (
          "Host"
          ,request.getServerName()
        ) 
      );
    } catch (Exception e) {
      throw new TCException ( "com.topcoder.web.servlet.marketing.TC:addURLTags:ERROR:\n"+e );
    }
  }



}
