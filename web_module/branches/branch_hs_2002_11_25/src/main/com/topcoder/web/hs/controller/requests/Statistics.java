package com.topcoder.web.hs.controller.requests;

import com.topcoder.web.hs.model.*;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.common.web.util.Data;
//import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.util.ApplicationServer;
//import com.topcoder.shared.util.logging.Logger;
//import com.topcoder.web.stat.bean.CoderRatingStyleBean;
//import com.topcoder.web.stat.bean.QuickStatListBean;
import com.topcoder.web.stat.common.StatXMLParser;

import org.w3c.dom.Document;

import javax.servlet.*;
//import javax.servlet.http.*;
import java.util.*;

/**
 * A RequestProcessor which handles statistics pages.  It uses the dataAccess
 * engine to process the query, and then the page named with the same command
 * to render the results.
 *
 * @author Ambrose Feinstein
 */
public class Statistics extends Base {

    private static final String XML_FILE = ApplicationServer.BASE_DIR + "/resources/stat/statServlet.xml";

    public void process() throws Exception {
        super.process();

        //@@@ old stats code cached this...
        Document doc = StatXMLParser.getXMLDocument(XML_FILE);
        CoderRatingStyleBean crsb = StatXMLParser.buildCoderRatingStyleBean(doc);
        request.setAttribute(CoderRatingStyleBean.BEAN_TOKEN, crsb);
        Data.initializeDataTypes();

        Map map = gpm(request);
        Request dataRequest = new Request(map);
        request.setAttribute("REQUEST_BEAN", dataRequest);
        DataAccessInt dai = new CachedDataAccess((javax.sql.DataSource)TCContext.getInitial().lookup(DBMS.DW_DATASOURCE_NAME));
        Map dataMap = dai.getData(dataRequest);
        request.setAttribute("QUERY_RESPONSE", dataMap);

        setNextPage("/hs"+"/stats/"+request.getParameter(DataAccessConstants.COMMAND)+".jsp");
        setIsNextPageInContext(true);
    }

    //@@@ why doesnt getParameterMap work?
    private static Map gpm(ServletRequest r) {
        Enumeration e = r.getParameterNames();
        Map m = new HashMap();
        while(e.hasMoreElements()) {
            String s = (String)e.nextElement();
            m.put(s, r.getParameter(s));
        }
        return m;
    }
}
