package com.topcoder.web.corp.controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  A servlet to generate graph images
 *
 * @version $Revision$
 * @author Greg Paul
 */

public final class JNLPServlet extends HttpServlet {

    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    public void process(HttpServletRequest request, HttpServletResponse response) {
        ServletOutputStream out = null;
        String host = "";
        String port = "";
        String companyID = "";
        String tunnel = "";

        try {
             host = request.getParameter("host");
             if ((host==null) || host.equals("")) host="corporate.topcoder.com";

             port = request.getParameter("port");
             if ((port==null) || port.equals("")) port="8001";

             tunnel = request.getParameter("tunnel");
             if ((tunnel==null) || tunnel.equals("")) tunnel="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=screening+port=8001";

             companyID = request.getParameter("company");
             if ((companyID==null) || companyID.equals("")) companyID="1";


             /***********************************************************************/
             out = response.getOutputStream();
             response.setHeader("Content-Type", "application/x-java-jnlp-file; charset=utf-8");
             response.setContentType("application/x-java-jnlp-file");
             /***********************************************************************/

             out.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>" +
                     "<jnlp spec=\"1.0+\" " +
                     //"codebase=\"http://corporate.topcoder.com/contest/screening/\" " +
                     //"href=\"ScreeningApp.jnlp\">\r\n" +
                     ">\r\n" +
                     "<information>\r\n" +
                     "<title>TopCoder Testing Application</title>\r\n" +
                     "<vendor>TopCoder, Inc.</vendor>\r\n" +
                     "<homepage href=\"http://corporate.topcoder.com\"/>\r\n" +
                     "<description>TopCoder Testing Application</description>\r\n" +
                     "<icon href=\"http://corporate.topcoder.com/i/ScreeningJWS.jpg\"/>\r\n" +
                     "</information>\r\n" +
                     "<security>\r\n" +
                     "<all-permissions/>\r\n" +
                     "</security>\r\n" +
                     "<resources>\r\n" +
                     "<j2se version=\"1.4+\"/>\r\n" +
                     "<jar href=\"http://corporate.topcoder.com/contest/classes/ScreeningClient.jar\"/>\r\n" +
                     "</resources>\r\n" +
                     "<application-desc " +
                     "main-class=\"com.topcoder.client.screening.tool.view.screeningClient.GenericStarter\">\r\n"+
                     "<argument>");
             out.print(host);
             out.print("</argument>\r\n" +
                     "<argument>");
             out.print(port);
             out.print("</argument>\r\n" +
                     "<argument>");
             out.print(companyID);
             out.print("</argument>\r\n" +
                     "<argument>");
             out.print(tunnel);
             out.print("</argument>\r\n" +
                     "</application-desc>\r\n" +
                     "</jnlp>\r\n");
             //out.write(result);
         } catch (Exception e) {
             e.printStackTrace();
         }

    }

}
