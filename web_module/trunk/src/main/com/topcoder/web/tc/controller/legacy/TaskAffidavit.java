package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.util.Data;
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
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.PathResource;
import com.topcoder.web.common.PermissionException;

import javax.naming.Context;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


public final class TaskAffidavit {

    private static Logger log = Logger.getLogger(TaskAffidavit.class);

    private static final String QUESTION_PREFIX = "q";
    private static final String ANSWER_PREFIX = "a";

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws PermissionException, NavigationException {
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
            if (nav == null || !nav.isIdentified()) {
                throw new PermissionException(new SimpleUser(nav.getUserId(), "", ""), new PathResource(TCServlet.XSL_ROOT + requestTask + "/" + requestCommand));
            } else {
                requestTask = Conversion.checkNull(request.getParameter("t"));
                requestCommand = Conversion.checkNull(request.getParameter("c"));

                if (requestCommand.equals("2004_comp_collegiate_submit_info")
                        || requestCommand.equals("2004_collegiate_submit_info")) {

                    TreeMap questions = new TreeMap();
                    TreeMap answers = new TreeMap();

                    Enumeration parameterNames = request.getParameterNames();
                    while (parameterNames.hasMoreElements()) {
                        String parameterName = parameterNames.nextElement().toString();
                        log.debug("parameter: " + parameterName);
                        String parameterValue = request.getParameter(parameterName);
                        if (parameterName.startsWith(QUESTION_PREFIX)) {
                            int index = Integer.parseInt(parameterName.substring(QUESTION_PREFIX.length()));
                            questions.put(new Integer(index), parameterValue);
                        } else if (parameterName.startsWith(ANSWER_PREFIX)) {
                            int index = Integer.parseInt(parameterName.substring(ANSWER_PREFIX.length()));
                            answers.put(new Integer(index), parameterValue);
                        }
                    }
                    Data.loadUser(nav);
                    StringBuffer buf = new StringBuffer(1000);
                    buf.append(nav.getUser().getHandle());
                    buf.append(" has answered your questions thusly\n\n");
                    Map.Entry me = null;
                    for (Iterator it = questions.entrySet().iterator(); it.hasNext(); ) {
                        me = (Map.Entry) it.next();
                        buf.append(me.getKey());
                        buf.append(". ");
                        buf.append(me.getValue());
                        buf.append("\n");
                        buf.append(answers.get(me.getKey()));
                        buf.append("\n\n");
                    }

                    TCSEmailMessage mail = new TCSEmailMessage();
                    if (requestCommand.equals("2004_collegiate_submit_info"))
                        mail.setSubject("Travel Info Response - " + nav.getUser().getHandle());
                    else mail.setSubject("Component Travel Info Response - " + nav.getUser().getHandle());

                    mail.setBody(buf.toString());
                    mail.addToAddress("mluce@topcoder.com", TCSEmailMessage.TO);
                    mail.setFromAddress(nav.getUser().getEmail());
                    EmailEngine.send(mail);

                    xsldocURLString = TCServlet.XSL_ROOT + requestTask + "/" + requestCommand + "_sent.xsl";

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

                } else {
                    ctx = TCContext.getInitial();
                    dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
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
        } catch (PermissionException pe) {
            throw pe;
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("TaskAffidavit error", TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }
}
