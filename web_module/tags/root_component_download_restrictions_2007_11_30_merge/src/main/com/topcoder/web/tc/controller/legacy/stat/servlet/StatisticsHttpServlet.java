package com.topcoder.web.tc.controller.legacy.stat.servlet;

import com.topcoder.common.web.util.Data;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.RequestTracker;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.controller.legacy.stat.bean.CoderRatingStyleBean;
import com.topcoder.web.tc.controller.legacy.stat.bean.QuickStatListBean;
import com.topcoder.web.tc.controller.legacy.stat.common.StatXMLParser;
import org.w3c.dom.Document;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;


public class StatisticsHttpServlet extends BaseServlet {
    private static Logger log = Logger.getLogger(StatisticsHttpServlet.class);
    //    private static final String XML_FILE = ApplicationServer.BASE_DIR + "/resources/stat/statServlet.xml";
    private static final String XML_FILE = "statServlet.xml";
    private static final String LOGGED_IN_ONLY = "1";
    private static final String ACCESS_MAP_KEY = "ACCESSCTRL";
    private Properties mProp = new Properties();

    /**
     * This method returns the associated properties object
     *
     * @return Properties
     */
    public Properties getProps() {
        return mProp;
    }


    /**
     * This method initializes global variables
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
     *
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
     * This method handles the actual request processing
     *
     * @param request  object
     * @param response object
     * @throws ServletException
     * @throws IOException
     */
    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String sQueryString = request.getQueryString();
        WebAuthentication authentication;
        SessionInfo info;

        if (sQueryString != null) {
            //check to redirect member profile requests to new servlet
            if (request.getParameter("c") != null && request.getParameter("c").equals("member_profile")) {
                response.sendRedirect("http://" + request.getServerName() + "/tc?module=MemberProfile&cr=" + request.getParameter("cr"));
                return;
            }
            // the next line works for Servlet.jar pre Servlet 2.3
            //Map map = HttpUtils.parseQueryString(sQueryString);
            // the next line works for Servlet 2.3
            Map map = request.getParameterMap();

            ServletContext sctx = null;
            Map accessMap = null;
            String accessLevel = null;
            Request dataRequest = null;
            try {
                dataRequest = new Request(map);

                sctx = this.getServletContext();
                accessMap = (Map) this.getServletContext().getAttribute(ACCESS_MAP_KEY);
                accessLevel = (String) accessMap.get(dataRequest.getContentHandle());

                TCRequest tcRequest = HttpObjectFactory.createRequest(request);
                TCResponse tcResponse = HttpObjectFactory.createUnCachedResponse(response);
                //set up security objects and session info
                authentication = createAuthentication(tcRequest, tcResponse);
                TCSubject user = getUser(authentication.getActiveUser().getId());
                info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
                tcRequest.setAttribute(SESSION_INFO_KEY, info);
                //todo perhaps this should be configurable...so implementing classes
                //todo don't have to do it if they don't want to
                RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);


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

                //hoke so that we can reload the properties file on the fly
                if (dataRequest.getContentHandle().equals("reload")) {
                    if (info.isAdmin()) {
                        this.reload(sctx);
                        response.getOutputStream().write("reloaded".getBytes());
                        return;
                    } else {
                        response.getOutputStream().write("shame on you, you're no admin".getBytes());
                        return;
                    }
                }

                if (accessLevel.equals(LOGGED_IN_ONLY) && (info.isAnonymous())) {
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


}
