package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public final class TaskDevelopment {


    private static final String XSL_DIR = TCServlet.XSL_ROOT + "development/";
    private static Logger log = Logger.getLogger(TaskDevelopment.class);

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        String cacheKey = null;
        try {
            String command = Conversion.checkNull(request.getParameter("c"));
            if (nav.getLoggedIn()) {
                RecordTag devTag = new RecordTag("DEVELOPMENT");
                String xsldocURLString = null;
                /********************** no command *******************/
                if (command.equals("index")) {
                    cacheKey = request.getServerName() + TCServlet.LOGGED_IN_KEY;
                    xsldocURLString = XSL_DIR + command + ".xsl";
                }
                /********************** inquire *******************/
                else if (command.equals("inquire")) {
                    String project = Conversion.checkNull(request.getParameter("Project"));
                    String to = Conversion.checkNull(request.getParameter("To"));
                    devTag.addTag(new ValueTag("ProjectName", project));
                    devTag.addTag(new ValueTag("Project", project));
                    devTag.addTag(new ValueTag("To", to));
                    xsldocURLString = XSL_DIR + command + ".xsl";
                }
                /********************** send *******************/
                else if (command.equals("send")) {
                    String handle = nav.getUser().getHandle();
                    String from = nav.getUser().getEmail();
                    String project = Conversion.checkNull(request.getParameter("Project"));
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String experience = Conversion.clean(request.getParameter("Experience"));
                    String workWeek = Conversion.checkNull(request.getParameter("WorkWeek"));
                    String comment = Conversion.clean(request.getParameter("Comment"));
                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.setSubject(project + " -- " + handle);
                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append(handle);
                    msgText.append(" inquiry for project:  ");
                    msgText.append(project);
                    msgText.append("\n\n");
                    msgText.append("Hours per Week:  ");
                    msgText.append(workWeek);
                    msgText.append("\n\nExperience:\n");
                    msgText.append(experience);
                    msgText.append("\n\nComment:\n");
                    msgText.append(comment);
                    mail.setBody(msgText.toString());
                    mail.addToAddress(to, TCSEmailMessage.TO);
                    mail.setFromAddress(from);
                    EmailEngine.send(mail);
                    xsldocURLString = XSL_DIR + "inquiry_sent.xsl";
                /********************** tcs_send *******************/
                else if (command.equals("tcs_send")) {
                    String handle = nav.getUser().getHandle();
                    String from = nav.getUser().getEmail();
                    String project = Conversion.checkNull(request.getParameter("Project"));
                    String to = Conversion.checkNull(request.getParameter("To"));
                    String tcsHandle = Conversion.clean(request.getParameter("TCSHandle"));
                    String comment = Conversion.clean(request.getParameter("Comment"));
                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.setSubject(project + " -- " + handle);
                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append(handle);
                    msgText.append(" inquiry for project:  ");
                    msgText.append(project);
                    msgText.append("\n\n");
                    msgText.append("\n\nTCS Handle:\n");
                    msgText.append(tcsHandle);
                    msgText.append("\n\nComment:\n");
                    msgText.append(comment);
                    mail.setBody(msgText.toString());
                    mail.addToAddress(to, TCSEmailMessage.TO);
                    mail.setFromAddress(from);
                    EmailEngine.send(mail);
                    xsldocURLString = XSL_DIR + "inquiry_sent.xsl";
                } else {
                    xsldocURLString = XSL_DIR + command + ".xsl";
                }
                document.addTag(devTag);
                result = HTMLmaker.render(document, xsldocURLString);
            } else {
                StringBuffer url = new StringBuffer(request.getRequestURI());
                String query = request.getQueryString();
                if (query != null) {
                    url.append("/?");
                    url.append(query);
                }
                throw new NavigationException(
                        "You must login to view the member development page" // MESSAGE WILL APPEAR ABOVE LOGIN
                        , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                        , url.toString()
                );
            }
        } catch (NavigationException ne) {
            log.error("TaskDevelopment:ERROR:\n" + ne);
            throw ne;
        } catch (Exception e) {
            e.printStackTrace();
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskDevelopment:process:");
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }


}
