package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.CoderRegistration;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.util.Data;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.PathResource;
import com.topcoder.web.tc.controller.legacy.TaskHome;
import com.topcoder.web.common.PermissionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;


public final class TaskJob {


    private static final String XSL_DIR = TCServlet.XSL_ROOT + "jobs/";
    private static final String NOT_RATED_PAGE = XSL_DIR + "index_nr.xsl";

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        String cacheKey = null;
        try {
            String command = Conversion.checkNull(request.getParameter("c"));
            RecordTag devTag = new RecordTag("JOB");
            String xsldocURLString = null;
            String job = Conversion.checkNull(request.getParameter("Job"));
            String jobDesc = Conversion.checkNull(request.getParameter("JobDesc"));
            String to = Conversion.checkNull(request.getParameter("To"));
            /********************** inquire *******************/
            if (command.equals("inquire")) {
                checkPermission(document, request, nav);
                devTag.addTag(new ValueTag("Job", job));
                devTag.addTag(new ValueTag("JobDesc", jobDesc));
                devTag.addTag(new ValueTag("To", to));
                xsldocURLString = XSL_DIR + "inquire.xsl";
            }
            /********************** send *******************/
            else if (command.equals("send")) {
                checkPermission(document, request, nav);
                String handle = nav.getUser().getHandle();
                String from = nav.getUser().getEmail();
                String experience = Conversion.clean(request.getParameter("Experience"));
                String comment = Conversion.clean(request.getParameter("Comment"));
                Data.loadUser(nav);
                HashMap userTypeDetails = nav.getUser().getUserTypeDetails();
                CoderRegistration reg = (CoderRegistration) userTypeDetails.get("Coder");
                int rating = reg.getRating().getRating();
                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject(jobDesc + " -- " + handle + " (" + rating + ")");
                StringBuffer msgText = new StringBuffer(1000);
                msgText.append(handle);
                msgText.append(" inquiry for job:  ");
                msgText.append(job);
                msgText.append("\n\nExperience:\n");
                msgText.append(experience);
                msgText.append("\n\nComment:\n");
                msgText.append(comment);
                mail.setBody(msgText.toString());
                mail.addToAddress(to, TCSEmailMessage.TO);
                mail.setFromAddress(from);
                EmailEngine.send(mail);
                xsldocURLString = XSL_DIR + "inquiry_sent.xsl";
            } else {
                if (nav.isIdentified()) {
                    Data.loadUser(nav);
                    HashMap userTypeDetails = nav.getUser().getUserTypeDetails();
                    CoderRegistration reg = (CoderRegistration) userTypeDetails.get("Coder");
                    devTag.addTag(new ValueTag("Rating", reg.getRating().getRating()));
                }
                xsldocURLString = XSL_DIR + command + ".xsl";
            }
            document.addTag(devTag);
            result = HTMLmaker.render(document, xsldocURLString);

        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskJob:process:");
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }


    private static void checkPermission(XMLDocument document, HttpServletRequest request, Navigation nav)
            throws PermissionException, NavigationException {
        if (!nav.isIdentified()) {
            throw new PermissionException(new SimpleUser(nav.getUserId(), "", ""), new PathResource("job"));
        }
        if (nav.getSessionInfo().getRating() <= 0) {
            RecordTag tag = new RecordTag("HOME");
            TaskHome.getContestDates(tag);
            document.addTag(tag);
            throw new NavigationException(
                    "You must be a rated member to inquire about a job" // MESSAGE WILL APPEAR ABOVE LOGIN
                    , NOT_RATED_PAGE
            );
        }
    }


    private static String getRequestedURL(HttpServletRequest request) {
        StringBuffer url = new StringBuffer(request.getRequestURI());
        String query = request.getQueryString();
        if (query != null) {
            url.append("/?");
            url.append(query);
        }
        return url.toString();
    }


}
