package com.topcoder.web.privatelabel.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.privatelabel.controller.request.resume.Base;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.InvalidContentTypeException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ResumeServlet extends BaseServlet {
    private static Logger log = Logger.getLogger(ResumeServlet.class);

    protected void process(HttpServletRequest request, HttpServletResponse response )
            throws IOException  {
        Base rp = null;

        try {

            StringBuffer loginfo = new StringBuffer(100);
            loginfo.append("[**** ");
            loginfo.append("resume");
            loginfo.append(" **** ");
            loginfo.append(request.getRemoteHost());
            loginfo.append(" **** ");
            loginfo.append(request.getMethod());
            loginfo.append(" ****]");
            log.info(loginfo);

            try {
                try {
                    FileUpload fu = null;
                    try {
                        fu = new FileUpload(request, false);
                    } catch (InvalidContentTypeException ignore) {
                        //that's ok, we'll just procede with out
                    }
                    String cmd = null;
                    cmd = StringUtils.checkNull((String) request.getAttribute(MODULE));
                    if (cmd.equals("") && fu==null)
                        cmd = StringUtils.checkNull(getParameter(request, MODULE));
                    if (cmd.equals("") && fu!=null)
                        cmd = StringUtils.checkNull(fu.getParameter(MODULE));
                    if (cmd.equals(""))
                        cmd = DEFAULT_PROCESSOR;
                    if (!isLegalCommand(cmd))
                        throw new NavigationException();

                    String processorName = PATH + (PATH.endsWith(".") ? "" : ".") + getProcessor(cmd);

                    log.debug("creating request processor for " + processorName);
                    TCRequest tcRequest = TCRequestFactory.createRequest(request);
                    try {
                        SimpleResource resource = new SimpleResource(processorName);
                        if (hasPermission(null, resource)) { //not handing over an authentication object
                            rp = (Base) Class.forName(processorName).newInstance();
                            rp.setRequest(tcRequest);
                            rp.setFileUpload(fu);
                            rp.process();
                        } else {
                            throw new PermissionException(SimpleUser.createGuest(), resource);  //unknown user
                        }
                    } catch (ClassNotFoundException e) {
                        throw new NavigationException("Invalid request", e);
                    }
                } catch (PermissionException pe) {
                    throw pe;
                }
                fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
                return;
            } catch (Exception e) {
                handleException(request, response, e);
            }

            /* things are extremely broken, or perhaps some of the response
             * buffer had already been flushed when an error was thrown,
             * and the forward to error page failed.  in any event, make
                 * one last attempt to get an error message to the browser
             */
        } catch (Exception e) {
            log.fatal("forwarding to error page failed", e);
            e.printStackTrace();

            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }


    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }


}
