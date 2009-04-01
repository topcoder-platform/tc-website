package com.topcoder.web.distui.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2007
 */
public class DistUIServlet extends BaseServlet {

    private static final Logger log = Logger.getLogger(DistUIServlet.class);

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        RequestProcessor rp;

        long start = System.currentTimeMillis();
        try {
            try {

                request.setCharacterEncoding("utf-8");

                TCRequest tcRequest = HttpObjectFactory.createRequest(request);
                TCResponse tcResponse = HttpObjectFactory.createResponse(response);

/*
                if (log.isDebugEnabled()) {
                    WebAuthentication authentication;
                    SessionInfo info;

                    authentication = createAuthentication(tcRequest, tcResponse);
                    TCSubject user = getUser(authentication.getActiveUser().getId());
                    info = createSessionInfo(tcRequest, authentication, user.getPrincipals());

                    StringBuffer loginfo = new StringBuffer(100);
                    loginfo.append("[* ");
                    loginfo.append(info.getHandle());
                    loginfo.append(" * ");
                    loginfo.append(request.getRemoteAddr());
                    loginfo.append(" * ");
                    loginfo.append(request.getMethod());
                    loginfo.append(" ");
                    loginfo.append(info.getRequestString());
                    loginfo.append(" *]");
                    log.info(loginfo);
                }
*/


                String cmd = StringUtils.checkNull((String) tcRequest.getAttribute(MODULE));
                //log.debug("got module attribute " + cmd);
                if (cmd.equals("")) {
                    cmd = StringUtils.checkNull(tcRequest.getParameter(MODULE));
                }

                if (cmd.equals("")) {
                    cmd = DEFAULT_PROCESSOR;
                }
                if (!isLegalCommand(cmd)) {
                    throw new NavigationException();
                }

                //log.debug("path " + PATH);
                String processorName = PATH + (PATH.endsWith(".") ? "" : ".") + getProcessor(cmd);

                if (log.isDebugEnabled()) {
                    log.debug("creating request processor for " + processorName);
                }
                try {
                    rp = callProcess(processorName, tcRequest, tcResponse);
                } catch (ClassNotFoundException e) {
                    throw new NavigationException("Invalid request", e);
                }
                if (!response.isCommitted()) {
                    fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
                }
                //if there is an exception in post processing, and we've already started writting the response
                //we're not going to be able to forward to the error page.
                rp.postProcessing();

            } catch (Throwable e) {
                handleException(request, response, e);
            }

            /* things are extremely broken, or perhaps some of the response
             * buffer had already been flushed when an error was thrown,
             * and the forward to error page failed.  in any event, make
             * one last attempt to get an error message to the browser
             */
        } catch (Exception e) {
            log.fatal("forwarding to error page failed", e);
            response.setContentType("text/html");
            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        } finally {
            if (log.isDebugEnabled()) {
                log.debug("processing complete in " + (System.currentTimeMillis() - start) + " milliseconds.");
            }
        }

    }


    protected RequestProcessor callProcess(String processorName, TCRequest request, TCResponse response) throws Exception {
        RequestProcessor rp;

        rp = (RequestProcessor) Class.forName(processorName).newInstance();
        rp.setRequest(request);
        rp.setResponse(response);
        //we're not spending the cycles to create the authentication.
        //rp.setAuthentication(authentication);
        rp.process();
        return rp;
    }


}
