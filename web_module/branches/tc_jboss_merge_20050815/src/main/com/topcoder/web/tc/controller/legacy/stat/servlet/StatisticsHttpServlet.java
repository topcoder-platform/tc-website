package com.topcoder.web.tc.controller.legacy.stat.servlet;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.util.Data;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.RequestTracker;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.controller.legacy.stat.bean.CoderRatingStyleBean;
import com.topcoder.web.tc.controller.legacy.stat.bean.QuickStatListBean;
import com.topcoder.web.tc.controller.legacy.stat.common.StatXMLParser;
import org.w3c.dom.Document;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Collections;


public class StatisticsHttpServlet extends HttpServlet {
    private static Logger log = Logger.getLogger(StatisticsHttpServlet.class);
    private static final String XML_FILE = ApplicationServer.BASE_DIR + "/resources/stat/statServlet.xml";
    private static final String LOGGED_IN_ONLY = "1";
    private static final String ACCESS_MAP_KEY = "ACCESSCTRL";
    private Properties mProp = new Properties();

    /**
     * This method returns the associated properties object
     *
     * @return  Properties
     */
    public Properties getProps() {
        return mProp;
    }


    /**
     * This method initializes global variables
     *
     */
    public void init() {
        ServletContext srvctx = this.getServletContext();
        if (srvctx.getAttribute("PAGECTRL") == null) {
            this.reload(srvctx);
        }
        try {
            Data.initializeDataTypes();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * Reloads all the config info
     * @param srvctx the servlet context
     */
    public static void reload(ServletContext srvctx) {

        try {
            Document doc = StatXMLParser.getXMLDocument(XML_FILE);
            QuickStatListBean qslist = StatXMLParser.buildQuickStatListBean(doc);
            srvctx.setAttribute(QuickStatListBean.BEAN_TOKEN, qslist);
            CoderRatingStyleBean crsb = StatXMLParser.buildCoderRatingStyleBean(doc);
            srvctx.setAttribute(CoderRatingStyleBean.BEAN_TOKEN, crsb);
            Map m = StatXMLParser.buildContentMap(doc);
            srvctx.setAttribute("PAGECTRL", m);
            Map accessMap = StatXMLParser.buildAccessMap(doc);
            srvctx.setAttribute(ACCESS_MAP_KEY, accessMap);
            String sMasterError = StatXMLParser.getGlobalErrorFwd(doc);
            srvctx.setAttribute("GLOBAL_ERROR", sMasterError);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * This method implements the doGet method, which forwards the request to process
     *
     * @param request object
     * @param response object
     * @throws    ServletException
     * @throws    IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    /**
     * This method implements the doPost method, which forwards the request to process
     *
     * @param request object
     * @param response object
     * @throws    ServletException
     * @throws    IOException
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    /**
     * This method handles the actual request processing
     *
     * @param request object
     * @param response object
     * @throws    ServletException
     * @throws    IOException
     */
    public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sQueryString = request.getQueryString();
        if (sQueryString != null) {
            //check to redirect member profile requests to new servlet
            if (request.getParameter("c") != null && request.getParameter("c").equals("member_profile")) {
                response.sendRedirect("http://" + request.getServerName() + "/tc?module=MemberProfile&cr=" + request.getParameter("cr"));
                return;
            }
            // the next line works for Servlet.jar pre Servlet 2.3
            Map map = HttpUtils.parseQueryString(sQueryString);
            // the next line works for Servlet 2.3
            // Map map = request.getParameterMap();

            ServletContext sctx = null;
            Map accessMap = null;
            String accessLevel = null;
            Navigation nav = null;
            Request dataRequest = null;
            try {
                dataRequest = new Request(map);

                sctx = this.getServletContext();
                accessMap = (Map) this.getServletContext().getAttribute(ACCESS_MAP_KEY);
                accessLevel = (String) accessMap.get(dataRequest.getContentHandle());
                HttpSession session = request.getSession(true);
                nav = (Navigation) session.getAttribute("navigation");
                if (nav == null) nav = new Navigation(request, response);
                TCRequest tcRequest = HttpObjectFactory.createRequest(request);
                WebAuthentication authentication = new BasicAuthentication(
                        new SessionPersistor(session),
                        tcRequest,
                        HttpObjectFactory.createResponse(response),
                        BasicAuthentication.MAIN_SITE);
                SessionInfo info = new SessionInfo(tcRequest, authentication, Collections.EMPTY_SET);
                RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);

                session.setAttribute("navigation", nav);

                StringBuffer loginfo = new StringBuffer(100);
                loginfo.append("[**** ");
                loginfo.append(info.getHandle());
                loginfo.append(" **** ");
                loginfo.append(request.getRemoteAddr());
                loginfo.append(" **** ");
                loginfo.append(request.getMethod());
                loginfo.append(" ");
                loginfo.append(info.getRequestString());
                loginfo.append(" ****]");
                log.info(loginfo);

                //hoke so that we can reload the properties file on the fly
                if (dataRequest.getContentHandle().equals("reload")) {
                    if (nav.getSessionInfo().isAdmin()) {
                        this.reload(sctx);
                        response.getOutputStream().write("reloaded".getBytes());
                        return;
                    } else {
                        response.getOutputStream().write("shame on you, you're no admin".getBytes());
                        return;
                    }
                }

                if (accessLevel.equals(LOGGED_IN_ONLY) && (!nav.isIdentified())) {

                    request.setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name " +
                            "and password.");
                    request.setAttribute(BaseServlet.NEXT_PAGE_KEY, info.getRequestString());

                    request.setAttribute("module", "Login");
                    fetchRegularPage(request, response, "/tc", true);
                    return;
                }
                request.setAttribute("REQUEST_BEAN", dataRequest);
                DataAccessInt dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
                Map dataMap = dai.getData(dataRequest);
                request.setAttribute("QUERY_RESPONSE", dataMap);
                Map mpage = (Map) sctx.getAttribute("PAGECTRL");
                sctx.getRequestDispatcher((String) mpage.get(dataRequest.getContentHandle())).forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                sctx.getRequestDispatcher(sctx.getAttribute("GLOBAL_ERROR").toString()).forward(request, response);
            }

        }
    }
/*

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
*/


    protected final void fetchRegularPage(HttpServletRequest request, HttpServletResponse response, String dest,
                                          boolean forward) throws Exception {

        if (forward) {
            if (!dest.startsWith("/")) {
                dest = "/" + dest;
            }
            log.debug("forwarding to " + dest);
            getServletContext().getRequestDispatcher(response.encodeURL(dest)).forward(request, response);
        } else {
            log.debug("redirecting to " + dest);
            response.sendRedirect(response.encodeRedirectURL(dest));
        }
    }


}
