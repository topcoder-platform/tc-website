package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.CoderRegistration;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;


public final class TaskArena {


    private static final String XSL_DIR = TCServlet.XSL_ROOT + "arena/";
    private static Logger log = Logger.getLogger(TaskArena.class);

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            String xsldocURLString = null;
            StringBuffer url = new StringBuffer(request.getRequestURI());
            String query = request.getQueryString();
            if (query != null) {
                url.append("/?");
                url.append(query);
            }
            String command = Conversion.checkNull(request.getParameter("c"));
            /********************** inquire *******************/
            if (command.equals("source")) {
                if (!nav.getLoggedIn()) {
                    throw new NavigationException(
                            "You must login to request the arena source" // MESSAGE WILL APPEAR ABOVE LOGIN
                            , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                            , url.toString() // THE URL OF WHERE YOU WANT TO GO UPON SUCCESSFUL LOGIN
                    );
                }
                HashMap userTypeDetails = nav.getUser().getUserTypeDetails();
                CoderRegistration reg = (CoderRegistration) userTypeDetails.get("Coder");
                document.addTag(new ValueTag("Code", reg.getActivationCode()));
                xsldocURLString = XSL_DIR + command + ".xsl";
            } else if (command.equals("source_agree")) {
                if (!nav.getLoggedIn()) {
                    throw new NavigationException(
                            "You must login to request the arena source" // MESSAGE WILL APPEAR ABOVE LOGIN
                            , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                            , url.toString() // THE URL OF WHERE YOU WANT TO GO UPON SUCCESSFUL LOGIN
                    );
                }
                String activationCode = request.getParameter("req");
                if (activationCode == null) {
                    throw new NavigationException(
                            "You must login to request the arena source" // MESSAGE WILL APPEAR ABOVE LOGIN
                            , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                            , url.toString() // THE URL OF WHERE YOU WANT TO GO UPON SUCCESSFUL LOGIN
                    );
                } else {
                    HashMap userTypeDetails = nav.getUser().getUserTypeDetails();
                    CoderRegistration reg = (CoderRegistration) userTypeDetails.get("Coder");
                    if (reg.getActivationCode().equals(activationCode)) {
                        String handle = nav.getUser().getHandle();
                        String from = nav.getUser().getEmail();
                        TCSEmailMessage mail = new TCSEmailMessage();
                        mail.setSubject("Arena Source Request -- " + handle);
                        mail.setBody("source request");
                        mail.addToAddress("service@topcoder.com", TCSEmailMessage.TO);
                        mail.setFromAddress(from);
                        EmailEngine.send(mail);
                        xsldocURLString = XSL_DIR + "inquiry_sent.xsl";
                    } else {
                        throw new NavigationException("Invalid request for arena source.", TCServlet.NAVIGATION_ERROR_PAGE);
                    }
                }
            } else {
                xsldocURLString = XSL_DIR + command + ".xsl";
            }
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            log.error("TaskArena:ERROR:\n" + ne);
            throw ne;
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskArena:process:");
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }
}
