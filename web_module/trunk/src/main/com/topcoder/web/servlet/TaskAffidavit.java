package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.Enumeration;
import java.util.ArrayList;


public final class TaskAffidavit {

    private static Logger log = Logger.getLogger(TaskAffidavit.class);

    private static final String QUESTION_PREFIX = "q";
    private static final String ANSWER_PREFIX = "a";

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
        String requestCommand = null;
        try {
            if (nav == null || !nav.getLoggedIn()) {
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
                requestCommand = Conversion.checkNull(request.getParameter("c"));

                if (requestCommand.equals("submit_questions")) {

                    ArrayList questions = new ArrayList();
                    ArrayList answers = new ArrayList();

                    Enumeration parameterNames = request.getParameterNames();
                    while (parameterNames.hasMoreElements()) {
                        String parameterName = parameterNames.nextElement().toString();
                        String parameterValue = request.getParameter(parameterName);
                        if (parameterName.startsWith(QUESTION_PREFIX)) {
                            int index = Integer.parseInt(parameterName.substring(QUESTION_PREFIX.length()));
                            questions.ensureCapacity(index);
                            questions.set(index, parameterValue);
                        } else {
                            int index = Integer.parseInt(parameterName.substring(ANSWER_PREFIX.length()));
                            answers.ensureCapacity(index);
                            answers.set(index, parameterValue);
                        }
                    }
                    StringBuffer buf = new StringBuffer(1000);
                    buf.append(nav.getUser().getHandle());
                    buf.append(" has answered your questions thusly\n\n");
                    for (int i=0; i<questions.size(); i++) {
                        buf.append(i);
                        buf.append(". ");
                        buf.append(questions.get(i));
                        buf.append("\n");
                        buf.append(answers.get(i));
                        buf.append("\n\n");
                    }

                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.setSubject("Questionaire Response - " + nav.getUser().getHandle());
                    mail.setBody(buf.toString());
                    mail.addToAddress("gpaul@topcoder.com", TCSEmailMessage.TO);
                    mail.setFromAddress(nav.getUser().getEmail());
                    EmailEngine.send(mail);
                } else {
                    ctx = TCContext.getInitial();
                    dai = new DataAccess((javax.sql.DataSource) ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
                    RecordTag affidavitTag = new RecordTag("AFFIDAVIT");
                    dataRequest = new Request();

                    dataRequest.setContentHandle("affidavit_info");
                    dataRequest.setProperty("cr", "" + nav.getUserId());
                    dataRequest.setProperty("mid", "" + nav.getUserId());
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Affidavit_Info");
                    affidavitTag.addTag(rsc.getTag("Affidavit", "Info"));
                    rsc = (ResultSetContainer) resultMap.get("TCES_Member_Demographics");
                    affidavitTag.addTag(rsc.getTag("Demographics", "Demographic"));
                    rsc = (ResultSetContainer) resultMap.get("TCES_Member_Profile");
                    affidavitTag.addTag(rsc.getTag("Member", "Profile"));

                    document.addTag(affidavitTag);
                    log.debug(document.getXML(2));
                    xsldocURLString = TCServlet.XSL_ROOT + requestTask + "/" + requestCommand + ".xsl";

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
                }
            }
        } catch (NavigationException ne) {
            log.error("TaskAffidavit error" + ne);
            throw ne;
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("TaskAffidavit error", TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }
}
