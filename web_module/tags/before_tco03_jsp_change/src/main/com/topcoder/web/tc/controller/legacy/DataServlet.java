package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;


/**
 * A servlet to generate "dumps" of data from the db
 * it receives a query string which is converted to command
 * for the statistics bean to retrieve data from a db.
 * It is then returned to a jsp which displays the data, or
 * is returned directly to the browser as xml.
 *
 * @version $Revision$
 * @author Greg Paul
 */

public class DataServlet extends HttpServlet {

    private static Logger log = Logger.getLogger(DataServlet.class);

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
    }

    public void process(HttpServletRequest request, HttpServletResponse response) {

        DataAccessInt dai = null;
        Request dataRequest = null;
        Map resultMap = null;
        ServletOutputStream o = null;
        Iterator it = null;
        Map.Entry entry = null;
        String key = null;
        StringBuffer buf = null;
        ResultSetContainer rsc = null;
        RecordTag rootTag = null;

        try {
            if (isAuthenticated(request, response)) {
                dai = new DataAccess((javax.sql.DataSource)
                        TCContext.getInitial().lookup(DBMS.DW_DATASOURCE_NAME));
                dataRequest = new Request(HttpUtils.parseQueryString(request.getQueryString()));
                resultMap = dai.getData(dataRequest);
                // if the request is for an xml file, then go through all the result sets in the map
                // get their associated xml and return that after setting the content type to be xml
                if (dataRequest.getProperty("display") != null && dataRequest.getProperty("display").equals("xmlfile")) {
                    response.setContentType("text/xml");
                    o = response.getOutputStream();
                    rootTag = new RecordTag("RootElement");

                    buf = new StringBuffer();
                    it = resultMap.entrySet().iterator();
                    while (it.hasNext()) {
                        entry = (Map.Entry) it.next();
                        key = entry.getKey().toString();
                        rsc = (ResultSetContainer) resultMap.get(key);
                        rootTag.addTag(rsc.getTag(key, "ResultRow"));
                    }
                    buf.append(rootTag.getXML(2));
                    o.write(asciiGetBytes(buf.toString()));
                } else {
                    request.setAttribute("DATA_DUMP", resultMap);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dataDump.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private boolean isAuthenticated(HttpServletRequest request, HttpServletResponse response) {
        Navigation nav = null;
        String command = null;

        DataAccessInt dai = null;
        Request dataRequest = null;
        Map resultMap = null;

        try {

            command = request.getParameter("c") == null ? "" : request.getParameter("c");
            nav = (Navigation) request.getSession().getAttribute("navigation");
            if (nav == null || !nav.isIdentified())
                response.sendRedirect("http://" + request.getServerName() +
                        "/tc?&module=Login&message=" +
                        "You must log in to view this portion of the site.&nextpage=" +
                        request.getRequestURI());


            else {
                log.info("[*** data *** " + command + " *** " + nav.getUser().getHandle() + " ***]");

                dai = new DataAccess((javax.sql.DataSource)
                        TCContext.getInitial().lookup(DBMS.OLTP_DATASOURCE_NAME));
                dataRequest = new Request();
                dataRequest.setContentHandle("authenticate_data_user");
                dataRequest.setProperty("cr", "" + nav.getUserId());
                dataRequest.setProperty("sector", command);
                resultMap = dai.getData(dataRequest);

                if (((ResultSetContainer) resultMap.get("Authenticate_Data_User")).size() == 1) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    //Some utility type methods

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

    private byte[] asciiGetBytes(String s) {
        int size = s.length();
        byte[] result = new byte[size];
        for (int i = 0; i < size; i++) {
            result[i] = (byte) s.charAt(i);
        }
        return result;
    }

}

