package com.topcoder.web.forums.controller;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.User;
import com.jivesoftware.forum.ForumFactory;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.forums.controller.request.ForumsProcessor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * just a simple servlet to response to ajax requests.  i've removed
 * all security because i'm assuming anyone can make these kinds of requests.
 * i really wanted this to be speedy, so i stripped it down a bit.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 16, 2006
 */
public class AjaxServlet extends BaseServlet {
    private static final Logger log = Logger.getLogger(BaseServlet.class);

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        RequestProcessor rp = null;

        try {

            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createUnCachedResponse(response);
            AuthToken auth = AuthFactory.getAnonymousAuthToken();
            ForumFactory forumFactory = ForumFactory.getInstance(auth);
            try {
                String cmd = StringUtils.checkNull((String) tcRequest.getAttribute(MODULE));
                if (cmd.equals(""))
                    cmd = StringUtils.checkNull(tcRequest.getParameter(MODULE));

                if (cmd.equals(""))
                    cmd = DEFAULT_PROCESSOR;
                if (!isLegalCommand(cmd))
                    throw new NavigationException();

                String processorName = PATH + (PATH.endsWith(".") ? "" : ".") + getProcessor(cmd);

                log.debug("creating request processor for " + processorName);
                rp = callProcess(processorName, request, response, tcRequest, tcResponse, null, auth, forumFactory);
                if (!response.isCommitted()) {
                    fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
                }
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
            response.setContentType("text/html");
            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }

    protected RequestProcessor callProcess(String processorName, HttpServletRequest httpRequest,
                                           HttpServletResponse httpResponse, TCRequest request, TCResponse response,
                                           User user, AuthToken authToken, ForumFactory factory) throws Exception {
        ForumsProcessor rp = null;

        rp = (ForumsProcessor) Class.forName(processorName).newInstance();
        rp.setHttpRequest(httpRequest);
        rp.setHttpResponse(httpResponse);
        rp.setRequest(request);
        rp.setResponse(response);
        rp.setAuthToken(authToken);
        rp.setUser(user);
        rp.setForumFactory(factory);
        rp.process();
        return rp;
    }



}






