package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.http.*;
import javax.naming.Context;
import java.util.Map;


public final class TaskAffidavit {

    private static Logger log = Logger.getLogger(TaskAffidavit.class);

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        Request dataRequest = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        Map resultMap = null;
        Context ctx = null;
        String xsldocURLString = null;
        String requestTask = null;
        String requestCommand = "2002_invitational_affidavit";
        try {
            if (nav==null || !nav.getLoggedIn()) {
                StringBuffer url = new StringBuffer(request.getRequestURI());
                String query = request.getQueryString();
                if (query != null) {
                    url.append("/?");
                    url.append(query);
                }
                throw new NavigationException(
                        "You must login to view this page"
                        , TCServlet.LOGIN_PAGE
                        , url.toString());
            } else {
                requestTask = Conversion.checkNull(request.getParameter("t"));
                ctx = TCContext.getInitial();
                dai = new CachedDataAccess((javax.sql.DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
                RecordTag affidavitTag = new RecordTag("AFFIDAVIT");
                dataRequest = new Request();

                dataRequest.setContentHandle("affidavit_info");
                dataRequest.setProperty("cr", ""+nav.getUserId());
                dataRequest.setProperty("mid", ""+nav.getUserId());
                resultMap = dai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("Affidavit_Info");
                affidavitTag.addTag(rsc.getTag("Affidavit", "Info"));
                rsc = (ResultSetContainer) resultMap.get("TCES_Member_Demographics");
                affidavitTag.addTag(rsc.getTag("Demographics", "Demographic"));

                document.addTag(affidavitTag);
                xsldocURLString = TCServlet.XSL_ROOT + requestTask + "/" + requestCommand + ".xsl";
                result = HTMLmaker.render(document, xsldocURLString);
            }
        } catch (NavigationException ne) {
            log.error("TaskAffidavit error" + ne);
            throw ne;
        } catch (Exception e) {
            throw new NavigationException("TaskAffidavit error", TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }
}
