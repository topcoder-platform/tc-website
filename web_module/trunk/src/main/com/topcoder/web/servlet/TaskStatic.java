package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import java.util.Map;


public final class TaskStatic {

    private static Logger log = Logger.getLogger(TaskStatic.class);
    private static final String SECURE_DIR_NAME = "secure";

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            String requestCommand = Conversion.checkNull(request.getParameter("c"));
            if (requestCommand.equals("")) {
                result = TaskHome.process(request, response, HTMLmaker, nav, document);
            } else {
                result = displayStatic(HTMLmaker, request, nav, document);
            }
        } catch (NavigationException ne) {
            log.error("TaskStatic:ERROR:\n" + ne);
            throw ne;
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskStatic:process:");
            msg.append(":ERROR:\n");
            msg.append(e);
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }


    public static String displayStatic(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                       Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        String requestTask = null;
        String requestCommand = null;
        String requestOther = null;
        String requestAccess= null;
        String xsldocURLString = null;
        Request dataRequest = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        Map resultMap = null;
        Context ctx = null;

        requestTask = Conversion.checkNull(request.getParameter("t"));
        requestCommand = Conversion.checkNull(request.getParameter("c"));
        requestOther = Conversion.checkNull(request.getParameter("o"));
        requestAccess = Conversion.checkNull(request.getParameter("a"));

        if (!isLegal(requestTask)) {
            throw new NavigationException("Illegal task t: " + requestTask, TCServlet.NAVIGATION_ERROR_PAGE);
        } else if (!isLegal(requestCommand)) {
            throw new NavigationException("Illegal command c: " + requestCommand, TCServlet.NAVIGATION_ERROR_PAGE);
        } else if (!isLegal(requestOther) || requestOther.equals(SECURE_DIR_NAME)) { //don't let folks get to supposedly "secure" files
            throw new NavigationException("Illegal other o: " + requestOther, TCServlet.NAVIGATION_ERROR_PAGE);
        }

        if (!requestTask.equals("")) requestTask += "/";
        if (!requestOther.equals("")) requestOther += "/";

        if (requestAccess.equals(SECURE_DIR_NAME)) {
            if (nav.getLoggedIn()) {
                xsldocURLString = TCServlet.XSL_ROOT + requestTask + SECURE_DIR_NAME + "/" + requestCommand + ".xsl";
            } else {
                StringBuffer url = new StringBuffer(request.getRequestURI());
                String query = request.getQueryString();
                if (query != null) {
                    url.append("/?");
                    url.append(query);
                }
                throw new NavigationException(
                        "You must login to view this page" // MESSAGE WILL APPEAR ABOVE LOGIN
                        , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                        , url.toString()
                );
            }
        } else {
            xsldocURLString = TCServlet.XSL_ROOT + requestTask + requestOther + requestCommand + ".xsl";
        }
        try {
            ctx = TCContext.getInitial();
            dai = new CachedDataAccess((javax.sql.DataSource)ctx.lookup(DBMS.DW_DATASOURCE_NAME));
            RecordTag homeTag = new RecordTag("HOME");
            dataRequest = new Request();
            dataRequest.setContentHandle("school_avg_rating");
            dataRequest.setProperty("sr", "1");
            dataRequest.setProperty("er", "10");   // just get the top 10
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("School_Avg_Rating");
            homeTag.addTag(rsc.getTag("TopRankedSchools", "School"));
            document.addTag(homeTag);
        } catch (Exception e) {
            log.error("failed to get top school list from DB");
            e.printStackTrace();
        }

        try {
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (Exception e) {
            e.printStackTrace();
            StringBuffer msg = new StringBuffer(150);
            msg.append("processStatic:displayStatic:");
            msg.append(requestCommand);
            msg.append(":ERROR:");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), TCServlet.NAVIGATION_ERROR_PAGE);
        }
        return result;
    }

    private static boolean isLegal(String s) {
        for (int i=0; i<s.length(); i++) {
            char ch = s.charAt(i);
            if ("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_".indexOf(ch) < 0) {
                return false;
            }
        }
        return true;
    }
}
