package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.ejb.Util.Util;
import com.topcoder.ejb.Util.UtilHome;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 *  A servlet to insert a person's response to a question.
 *
 * @version $Revision$
 * @author Greg Paul
 */

public final class TourneyRegServlet extends HttpServlet {

    private static Logger log = Logger.getLogger(TourneyRegServlet.class);
    private static final String ERROR_PAGE = "/errorPage.jsp";

    public synchronized void init(ServletConfig config) throws ServletException {
        log.debug("SERVLET INIT CALLED");
        super.init(config);
    }

    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("get");
        process(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("post");
        process(request, response);
    }

    public void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InitialContext ctx = null;
        String roundId = null;
        String contestId = null;
//        int intRoundId = -1;
        int intContestId = -1;
        DataAccessInt transDai = null;
        Request dataRequest = null;
        ResultSetContainer rsc = null;
        Map resultMap = null;
        try {
            HttpSession session = request.getSession(true);
            Navigation nav = (Navigation) session.getAttribute("navigation");
            if (nav == null || !nav.isIdentified()) {
                response.sendRedirect("http://" + request.getServerName() +
                        "/tc?&module=Login=Login&message=" +
                        "You must be logged in to register for the Invitational.&nextpage=http://" +
                        request.getServerName() + request.getContextPath() + request.getServletPath() + "?" + replace(request.getQueryString()));
            } else {
                ctx = (InitialContext) TCContext.getInitial();
                roundId = request.getParameter("rd");
                contestId = request.getParameter("cd");
                if (roundId == null || contestId == null) {
                    forwardToErrorPage(request, response, new Exception("missing round id or contest id in request"),
                            "Invalid request, your registration failed.");
                }
                try {
//                    intRoundId = Integer.parseInt(roundId);
                    intContestId = Integer.parseInt(contestId);
                } catch (Exception e) {
                    forwardToErrorPage(request, response, new Exception("non-numeric round id or contest id in request"),
                            "Invalid request, your registration failed.");
                }
                try {
                    dataRequest = new Request();
//                    dataRequest.setContentHandle("invitational_info");
                    dataRequest.setContentHandle("collegiate_info");
                    dataRequest.setProperty("cr", "" + nav.getUserId());
//                    dataRequest.setProperty("rd", "" + roundId);
                    dataRequest.setProperty("cd", "" + contestId);
                    transDai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
                    resultMap = transDai.getData(dataRequest);
//                    rsc = (ResultSetContainer) resultMap.get("Invitational_Eligibility");
                    rsc = (ResultSetContainer) resultMap.get("Collegiate_Eligibility");
                    if (rsc.getItem(0, "is_eligible").toString().trim().equals("T")) {
                        Util util = (Util)BaseProcessor.createEJB(ctx, Util.class);
//                        util.registerForTourny(nav.getUserId(), intContestId, intRoundId);
                        util.registerForTourny(nav.getUserId(), intContestId);
                    } else {
                        forwardToErrorPage(request, response, new Exception(nav.getUserId() + " was not registered because they are not eligible."),
                                "Your registration failed because you are not eligible.");
                    }
                    //forward to success page
//                    getServletContext().getContext("/").getRequestDispatcher("/index").forward(request, response);
                    response.sendRedirect("http://" + request.getServerName());
                } catch (Exception ex) {
                    forwardToErrorPage(request, response, ex,
                            "Your registration failed.  Please contact TopCoder.");
                }
            }

        } catch (Exception e) {
            forwardToErrorPage(request, response, e,
                    "Your registration failed.  Please contact TopCoder.");
        }

    }

    /**
     * Forwards to the navigation error page.
     *
     * @param  request the servlet request object
     * @param  response servlet response object
     *
     * @throws javax.servlet.ServletException
     */

    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception, String message) throws ServletException, IOException {

        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        if (message != null) request.setAttribute("message", message);
        /* get the root context so we can forward to the generic error page, not just
           one within this web application
         */
        getServletContext().getContext("/").getRequestDispatcher(
                response.encodeURL(ERROR_PAGE)).forward(request, response);
    }

    private String replace(String s) {

        if (s == null) {
            return "";
        } else {
            StringBuffer buffer = new StringBuffer(s);
            for (int i = 0; i < buffer.length(); i++) {
                if (buffer.charAt(i) == '&') {
                    buffer.replace(i, i + 1, "%26");
                    i += 3;
                }
            }
            return buffer.toString();
        }
    }
}
