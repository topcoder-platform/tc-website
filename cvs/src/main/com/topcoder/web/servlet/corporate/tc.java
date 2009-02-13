package corporate;

import com.topcoder.common.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.web.util.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public final class tc extends HttpServlet {


  private              RenderHTML HTMLMaker             = null;
  private static final boolean    VERBOSE               = false;
  private static final String     REFRESH_PASSWORD      = "sb6493";
  private static final int        MAX_REPLACEMENTS      = 100;


  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void init (ServletConfig config) throws ServletException {
  ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "SERVLET INIT CALLED");
    ////////////////////////////////////////////////////////
    if (HTMLMaker == null) { HTMLMaker = new RenderHTML(); }
    super.init(config);
  }

 
  ////////////////////////////////////////////////////////////////////////////////
  public final void doGet (HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
  ////////////////////////////////////////////////////////////////////////////////
    PrintWriter out = null;
    String adv = Conversion.checkNull( request.getParameter("adv") );
    if ( !adv.equals("") ) {
      try {
        HitCount.incrementAdvertiser ( Integer.parseInt(adv) );
      } catch ( Exception ignore ) {
        if (VERBOSE) ignore.printStackTrace();
      }
    }
    doPost(request, response);
  }

     
  ////////////////////////////////////////////////////////////////////////////////
  public void doPost (HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
  ////////////////////////////////////////////////////////////////////////////////
    //==============================================================
    // REMOVE THIS CACHE REFRESH BLOCK AFTER TESTING COMPLETED...
    //==============================================================
    try {
      synchronized (this) {HTMLMaker.refresh();} 
    } catch (Exception e) {
      e.printStackTrace();
    }
    //==============================================================
    processCommands (request, response);
  }
  

  ////////////////////////////////////////////////////////////////////////////////
  private void processCommands (HttpServletRequest request, HttpServletResponse response) {
  ////////////////////////////////////////////////////////////////////////////////
    PrintWriter out = null;
    String HTMLString = null;
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
      String loggedIn = Conversion.checkNull( request.getParameter("LoggedIn") );
      if ( timedOut && loggedIn.equals("true") ) {
        throw new NavigationException (
          "corporate.tc:processCommands:ERROR:session timeout:"
          ,task.SESSION_TIMEOUT_URL
        );
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
      //////////////////////////////////////////
      // USE THE 'TASK' PARAMETER FROM THE 
      // INCOMING REQUEST TO DETERMINE 
      // STATIC PROCESSOR TO USE TO CREATE THE 
      // RESPONSE HTML. SOME WILL REQUIRE CHECK
      // FOR SESSION TIMEOUTS TO WARN USER.
      //////////////////////////////////////////
      if ( requestTask.equals("") ) {
        HTMLString = taskStatic.process( request, response, HTMLMaker, nav, document );
      }
      //************************ request ************************
      else if ( requestTask.equals("request") ) {
        if (timedOut) {
          throw new NavigationException (
            "corporate.tc:processCommands:ERROR:session timeout:"
            ,task.SESSION_TIMEOUT_URL
          );
        }
        HTMLString = taskRequest.process( request, response, HTMLMaker, nav, document );
      }
      //************************ home ************************
      else if ( requestTask.equals("home") ) {
        HTMLString = taskHome.process(request, response, HTMLMaker, nav, document);
      }
      //************************ else ************************
      else {
        StringBuffer msg = new StringBuffer( 150                         );
        msg.append ( "corporate.tc:processCommands:ERROR:invalid task:" );
        msg.append ( requestTask                                         );
        msg.append ( ":\n"                                               );
        throw new 
          NavigationException( msg.toString(), task.NAVIGATION_ERROR_URL );
      }
      //////////////////////////////////////////
      // IF ANY OF THE PROCESSORS RETURN A STRING
      // OF "HOME" INSTEAD OF A RENDERED DOCUMENT,
      // REDIRECT TO HOMEPAGE.
      //////////////////////////////////////////
      if ( HTMLString.equals("home") ) {
        response.sendRedirect( "http"+nav.getSubscriberCookieEnabledURL(request) );
      } else {
        if ( !nav.cookiesEnabled(request, response) ) {
          HTMLString = appendSessionIdToURL(HTMLString, nav, request, response);
        }
        out = response.getWriter();
        out.print(HTMLString);
        out.flush();
      }
    } catch (NavigationException ne) {
      ne.printStackTrace();
      showError ( request, response, nav, ne.getUrl(), document );
    } catch (Exception e) {
      e.printStackTrace();
      showError ( request, response, nav, task.INTERNAL_ERROR_URL, document );
    } finally {
      try {
        session = request.getSession(false);
        if (session!=null && nav!=null) {
          session.setAttribute("navigation", nav);
        }
        session = null;
        nav = null;
        document = null;
        if (out != null) {
          out.close();
          out = null;
        }
      } catch (Exception end) {
        end.printStackTrace();
        try {
          response.sendRedirect ( task.FUBAR_ERROR_URL  );
        } catch (Exception ignore) {}
      }
    }
  }


  ////////////////////////////////////////////////////////////////////////////////
  private void showError ( HttpServletRequest request, HttpServletResponse response, 
    Navigation nav, String url, XMLDocument document ) {
  ////////////////////////////////////////////////////////////////////////////////
    PrintWriter out = null;
    HttpSession session = null;
    try {
      out = response.getWriter();
      if (nav == null) {
        session = request.getSession ( true );
        nav = setupSession ( request, response, session );
      }
      if (document == null) {
        document = new XMLDocument ( "TC" );
        addURLTags ( nav, request, response, document );
      }
      String HTMLString = task.render ( HTMLMaker, nav,document, url, null );
      if ( !nav.cookiesEnabled(request, response) ) {
        HTMLString = appendSessionIdToURL ( HTMLString, nav, request, response );
      }
      out.print ( HTMLString );
      out.flush();
    } catch (Exception end) {
      end.printStackTrace();
      try {
        response.sendRedirect ( task.FUBAR_ERROR_URL  );
      } catch (Exception ignore) {}
    }
  }


  ////////////////////////////////////////////////////////////////////////////////
  private Navigation setupSession (HttpServletRequest request, HttpServletResponse response, 
    HttpSession session ) throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    Navigation result = null;
    try {
      //////////////////////////////////////////
      // SET THE CONTENT TYPE OF THE RESPONSE
      //////////////////////////////////////////
      response.setContentType("text/html");
      //////////////////////////////////////////
      // GET/SET ALL BROWSER INFO
      //////////////////////////////////////////
      String appName = Conversion.checkNull( request.getParameter("AppName") );
      Browser browser = null;
      if ( session.getAttribute("navigation") == null ) {
        result = new Navigation();
        browser = result.getBrowser();
        browser.setAppName    ( appName                                                  );
        browser.setAppVersion ( Conversion.checkNull(request.getParameter("AppVersion")) );
        browser.setUserAgent  ( Conversion.checkNull(request.getParameter("UserAgent"))  );
        result.setBrowser     ( browser                                                  );
      } else {
        result = (Navigation) session.getAttribute("navigation");
        browser = result.getBrowser();
        if ( !appName.equals("") && browser.getAppName().equals("") ) {
          browser.setAppName    ( appName                                       );
          browser.setAppVersion ( Conversion.checkNull(request.getParameter("AppVersion")) );
          browser.setUserAgent  ( Conversion.checkNull(request.getParameter("UserAgent"))  );
        }
      }
    } catch (Exception e) {
      throw new TCException("corporate.tc:setupSession:ERROR:\n"+e);
    }
    return result;
  }


  ////////////////////////////////////////////////////////////////////////////////
  private void addURLTags (Navigation nav, HttpServletRequest request, 
    HttpServletResponse response, XMLDocument document) 
    throws TCException {
  ////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////
    // ADD ALL XML TAGS BASIC TO ALL REQUESTS
    //////////////////////////////////////////
    User user = null;
    try {
      document.addTag( new ValueTag("SubscriberURL", nav.getSubscriberCookieEnabledURL(request)) );
      document.addTag( new ValueTag("CoderURL", nav.getPostCookieEnabledURL(request))            );
      document.addTag( new ValueTag("CookiesEnabled", nav.cookiesEnabled(request, response))     );
      document.addTag( new ValueTag("Host", request.getServerName())                             );
      document.addTag( nav.getBrowser().getXML()                                                 );
      document.addTag(new ValueTag("LoggedIn", "false"));
    } catch (Exception e) {
      throw new TCException ( "corporate.tc:addURLTags:ERROR:\n"+e );
    } finally {
      if (user != null) user=null;
    }
  }

 











/*********************************************************************************
COOKIES DISABLED METHODS (FOR REQUESTS WITH COOKIES TURNED OFF...)
*********************************************************************************/


  ///////////////////////////////////////////////////////////////
  private String appendSessionIdToURL ( String HTMLString, Navigation nav, HttpServletRequest request,
    HttpServletResponse response ) throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"***tc.appendSessionIdToURL:replaceURL:***");
    StringBuffer msg = null;
    if (VERBOSE) {
      msg = new StringBuffer(350);
      msg.append( "  :Task=" );
      msg.append( Conversion.checkNull(request.getParameter("Task")) );
      msg.append( "\n  :Command=" );
      msg.append( Conversion.checkNull(request.getParameter("Command")) );
      System.out.println( msg.toString() );
    }
    //////////////////////////////////////////
    // ONLY CALL THIS METHOD IF
    // COOKIES ARE TURNED OFF
    // ON A CACHED PAGE.  NEED TO ADD
    // SESSION ID TO ALL LINKS TO KEEP SESSION.
    //////////////////////////////////////////
    //////////////////////////////////////////
    // CREATE A SORTED TREESET THAT CONTAINS
    // RANGES TO EXCLUDE FROM REPEAT
    // REPLACEMENT CALLS
    //////////////////////////////////////////
    TreeSet excludes = new TreeSet();
    //////////////////////////////////////////
    // REPLACE URLs WITH URL+SESSION IDs
    //////////////////////////////////////////
    String[] cookieURL = {
      nav.getSubscriberCookieEnabledURL(request)
      ,nav.getPostCookieEnabledURL(request)
    };
    String[] noCookieURL = {
      nav.getSubscriberURL(request,response)
      ,nav.getPostURL(request,response)
    };
    try {
      for (int i = 0; i < cookieURL.length; i++) {
        //////////////////////////////////////////
        // REPLACE URLS
           if (VERBOSE && msg!=null) {
             msg.delete(0,350);
             msg.append( "  :cookieURL="         );
             msg.append( cookieURL[i]            );
             msg.append( " [ len = "             );
             msg.append( cookieURL[i].length()   );
             msg.append( " ]\n  :noCookieURL="   );
             msg.append( noCookieURL[i]          );
             msg.append( " [ len = "             );
             msg.append( noCookieURL[i].length() );
             msg.append( " ]"                    );
             System.out.println( msg.toString()  );
           }
        //
        //////////////////////////////////////////
        HTMLString = replaceURL(HTMLString, cookieURL[i], noCookieURL[i], excludes);
        if (VERBOSE) {
          for ( Iterator j = excludes.iterator(); j.hasNext(); ) {
            ExcludeRange range = (ExcludeRange) j.next();
            Log.msg("["+range.getStart()+","+range.getEnd()+"]");
          }
        }
      }
    } catch (Exception e) {
      throw new TCException("tc:appendSessionIdToURL:ERROR:\n"+e);
    }
    return HTMLString;
  }


  ///////////////////////////////////////////////////////////////
  private boolean excluded ( TreeSet excludes, int pos )
    throws TCException {
  ///////////////////////////////////////////////////////////////
    //////////////////////////////////////////
    // RETURN TRUE IF THE URL LOCATION HAS
    // ALREADY BEEN REPLACED IN THE DOCUMENT.
    //////////////////////////////////////////
    boolean result = false;
    for ( Iterator i = excludes.iterator(); i.hasNext(); ) {
      ExcludeRange range = (ExcludeRange) i.next();
      if ( pos < range.getEnd() ) {
        Log.msg ( VERBOSE, " pos is less than "+range.getEnd() );
        if ( pos > (range.getStart()-1) ) {
          result = true;
          break;
        }
      }
    }
    return result;
  }


  ///////////////////////////////////////////////////////////////
  private void shiftExcludeRanges ( TreeSet excludes, int startPos, int num )
    throws TCException {
  ///////////////////////////////////////////////////////////////
    //////////////////////////////////////////
    // NEED TO SHIFT REMAINING LOCATIONS
    // AFTER A REPLACE.
    //////////////////////////////////////////
    boolean result = false;
    for ( Iterator i = excludes.iterator(); i.hasNext(); ) {
      ExcludeRange range = (ExcludeRange) i.next();
      if ( range.getStart() > startPos ) {
        range.shift ( num );
      }
    }
  }


  ///////////////////////////////////////////////////////////////
  private String replaceURL ( String HTMLString, String cookieOnURL, String cookieOffURL, TreeSet excludes )
    throws TCException {
  ///////////////////////////////////////////////////////////////
    //////////////////////////////////////////
    // REPLACE URLs WITH URL+SESSION IDs
    // FOR USERS WITH COOKIES TURNED OFF.
    //////////////////////////////////////////
    String result = HTMLString;
    try {
      int cookieOnURLPos = HTMLString.indexOf ( cookieOnURL );
      //////////////////////////////////////////
      // if the URL is found ,start process to replace it with URL+SessionId (cookieOffURL)
      //////////////////////////////////////////
      if ( cookieOnURLPos > -1 ) {
        int cookieOnURLLen  = cookieOnURL.length();
        int cookieOffURLLen = cookieOffURL.length();
        //////////////////////////////////////////
        // replace first instance of URL with URL+SessionId
        //////////////////////////////////////////
        StringBuffer buf = new StringBuffer ( HTMLString );
        if ( !excluded(excludes,cookieOnURLPos) ) {
          buf = buf.replace ( cookieOnURLPos, cookieOnURLPos+cookieOnURLLen, cookieOffURL );
          excludes.add ( new ExcludeRange(cookieOnURLPos,cookieOnURLPos+cookieOffURLLen) );
          shiftExcludeRanges ( excludes, cookieOnURLPos+cookieOnURLLen, cookieOffURLLen-cookieOnURLLen );
        }
        int loopCount = 0;
        //////////////////////////////////////////
        // look for 2nd URL
        //////////////////////////////////////////
        cookieOnURLPos = buf.toString().indexOf ( cookieOnURL, cookieOnURLPos+cookieOffURLLen );
        //////////////////////////////////////////
        // if more URLs exists, loop to replace them all with URL+SessionId...
        //////////////////////////////////////////
        for ( ; cookieOnURLPos > -1; cookieOnURLPos = buf.toString().indexOf(cookieOnURL, cookieOnURLPos+cookieOffURLLen) ) {
          if ( !excluded(excludes,cookieOnURLPos) ) {
            buf = buf.replace ( cookieOnURLPos, cookieOnURLPos+cookieOnURLLen, cookieOffURL );
            excludes.add ( new ExcludeRange(cookieOnURLPos,cookieOnURLPos+cookieOffURLLen) );
            shiftExcludeRanges ( excludes, cookieOnURLPos+cookieOnURLLen, cookieOffURLLen-cookieOnURLLen );
          }
          //////////////////////////////////////////
          // keep count of loop to avoid possibility of infinite loop...
          //////////////////////////////////////////
          loopCount++;
          if (loopCount > MAX_REPLACEMENTS) {
            StringBuffer msg = new StringBuffer ( 100           );
            msg.append ( "tc:replaceURL:ERROR:"                 );
            msg.append (  Integer.toString(MAX_REPLACEMENTS)    );
            msg.append ( " max replacements exceeded."          );
            throw new TCException ( msg.toString() );
          }
        }
        result = buf.toString();
      }
    } catch (Exception e) {
      throw new TCException ( "tc:replaceURL:ERROR:\n"+e );
    }
    return result;
  }



}
