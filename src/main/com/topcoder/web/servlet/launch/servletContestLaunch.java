package com.topcoder.launch;

import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.ejb.LoadBalServices.*;
import com.topcoder.common.attr.AppletServerAttributes;
import javax.naming.InitialContext;
import com.topcoder.common.*;

public class servletContestLaunch extends HttpServlet
{

  public void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  {
    doPost(req, resp);
  }

  public void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  {

    int port = 0;
    String ip = "";
    String appletType = "C";

    try {
      InitialContext ctx = TCContext.getInitial(Common.HOST_URL);
      LoadBalServicesHome lbHome = (LoadBalServicesHome) ctx.lookup(Common.LOAD_SERVICES);
      LoadBalServices lbServices = (LoadBalServices) lbHome.create();
      lbHome = null;
      ctx.close();
      ctx = null;
      AppletServerAttributes server = lbServices.getConnectionInfo(appletType);
      port = server.getServerPort();
      ip = server.getServerIP();
    }
    catch (Exception e) {
      Log.msg("ERROR: Could not access load balancing service.");
    }

    // Set the content type of the response
    resp.setContentType("text/html");
    
    // Create a PrintWriter to write the response
    java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
    
    // Print the HTML header and other HTML code
    out.println("<HTML>");
    out.println("<HEAD>");
    out.println("<TITLE>Top Coder Launcher</TITLE>");
    out.println("</HEAD>");
    out.println("<BODY>");
    out.println("<!--'CONVERTED_APPLET'-->");
    out.println("<!-- CONVERTER VERSION 1.3 -->");

    out.println("<CENTER>");
    out.println("<P> Click here to begin load the contest applet. </P>");
    out.println("<P> If you close this window, the applet will close, too, and the judges look badly upon such behavior. </P>");
    out.println("<BR><BR>");

    out.println("<OBJECT classid='clsid:8AD9C840-044E-11D1-B3E9-00805F499D93'"); 
    out.println("    WIDTH = 150"); 
    out.println("    HEIGHT = 30");
    out.println("    NAME = 'LaunchApplet'");
    out.println("    ALIGN = middle");
    out.println("    VSPACE = 0");
    out.println("    HSPACE = 0");
    out.println("    codebase='http://java.sun.com/products/plugin/1.3/jinstall-13-win32.cab#Version=1,3,0,0'>");

    out.println("<PARAM NAME = NAME VALUE = 'LaunchApplet' >");
    out.println("<PARAM NAME = CODE VALUE = 'jmaContestApplet.LaunchApplet.class' >");
    out.println("<PARAM NAME = CODEBASE VALUE = 'http://" + ip + "/classes/jmaContestApplet/archive/' >");
    out.println("<PARAM NAME = ARCHIVE VALUE = 'ContestApplet.jar' >");
    out.println("<PARAM NAME = TYPE VALUE='application/x-java-applet;version=1.3'>");
    out.println("<PARAM NAME = SCRIPTABLE VALUE='false'>");
    
    out.println("<PARAM NAME = HOST VALUE='" + ip + "'>");
    out.println("<PARAM NAME = PORT VALUE='" + port + "'>");

    out.println("<COMMENT>");

    out.println("<EMBED type='application/x-java-applet;version=1.3'");
    out.println("     CODE = 'jmaContestApplet.LaunchApplet.class'");
    out.println("     CODEBASE = 'http://" + ip + "/classes/jmaContestApplet/archive/'");
    out.println("     NAME = 'LaunchApplet'");
    out.println("     ARCHIVE = 'ContestApplet.jar'");
    out.println("     WIDTH = 150"); 
    out.println("     HEIGHT = 30");
    out.println("     ALIGN = middle");
    out.println("     VSPACE = 0");
    out.println("     HSPACE = 0");
    out.println("     scriptable=false");
    out.println("      pluginspage='http://java.sun.com/products/plugin/1.3/plugin-install.html'>");

    out.println("<NOEMBED></COMMENT></NOEMBED>");
    out.println("</EMBED>"); 
    out.println("</OBJECT>");

    out.println("<!--'END_CONVERTED_APPLET'-->");

    out.println("<!--");
    out.println("<APPLET CODEBASE='http://" + ip + "/classes/jmaContestApplet/archive/'");
    out.println("    CODE='jmaContestApplet.LaunchApplet.class'");
    out.println("    ARCHIVE='ContestApplet.jar'");
    out.println("    WIDTH=150");
    out.println("    HEIGHT=30>");
    out.println("</APPLET>");
    out.println("-->");
    out.println("</CENTER>");

    out.println("</P>");

    out.println("</BODY>");
    out.println("</HTML>");
    out.flush();
  }
  
  public void init(ServletConfig cfg)
    throws ServletException
  {
    super.init(cfg);
  }
  
  public void destroy()
  {
    super.destroy();
  }
}
