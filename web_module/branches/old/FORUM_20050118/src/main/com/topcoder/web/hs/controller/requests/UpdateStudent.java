package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.security.*;
import com.topcoder.shared.util.logging.*;
import com.topcoder.web.hs.common.*;
import com.topcoder.web.hs.model.*;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.BasicAuthentication;

import java.util.*;

/**
 * A RequestProcessor which handles updating students information.  It
 * contains the business logic of walking through the different pages and
 * updating entries in the database via EJBs.
 *
 * @author Nathan Egge
 */
public class UpdateStudent extends Base {

    private final static String UPDATE_BASE = "/registration/";
    private final static String UPDATE_PAGE = "update_student.jsp";
    private final static String CONFIRM_PAGE = "confirm_student.jsp";
    private final static String HOME_PAGE = "/home/index.jsp";
    private final static String REGISTER_CMD = "update";
    private final static String CONFIRM_CMD = "confirm";
    private final static String INVALID_COMMAND = "Invalid command passed to update module: ";
    private final static String MISSING_SESSION = "Cannot update information without logging in";

    private final static Logger log = Logger.getLogger(UpdateStudent.class);

    protected User getUser() {
        return (getAuthentication().getUser());
    }

    protected void businessProcessing() throws TCWebException {

        String cmd = getRequest().getParameter("cmd");

        log.info("UpdateStudent: cmd=" + cmd);

        /* If there is no command, then we are trying to display the main update
         * student page
         */
        try {

            if (cmd == null || cmd.equals("")) {
                log.debug("UpdateStudent processing '' command.");

                StudentRegistrationBean srb = new StudentRegistrationBean();

                SessionInfoBean sib = (SessionInfoBean) getRequest().getAttribute("SessionInfo");
                if (sib == null) {
                    throw(new Exception(MISSING_SESSION));
                }

                RegistrationHelper.populateStudentWithDefaults(srb);
                RegistrationHelper.populateStudentFromSession(sib, srb);
                RegistrationHelper.populateStudentFromRequest(getRequest(), srb);
                RegistrationHelper.populateStudentStaticContent(srb);

                getRequest().setAttribute("student", srb);

                setNextPage(UPDATE_BASE + UPDATE_PAGE);
                setIsNextPageInContext(true);
            }

            /* If the user clicks the "Continute" button after entering his registration
             * information, then perform some data validation and redirect to the
             * confirmation page
             */
            else if (cmd.equals(REGISTER_CMD)) {
                log.debug("UpdateStudent processing 'register' command.");

                StudentRegistrationBean srb = new StudentRegistrationBean();

                SessionInfoBean sib = (SessionInfoBean) getRequest().getAttribute("SessionInfo");
                if (sib == null) {
                    throw(new Exception(MISSING_SESSION));
                }

                RegistrationHelper.populateStudentWithDefaults(srb);
                RegistrationHelper.populateStudentFromSession(sib, srb);
                RegistrationHelper.populateStudentFromRequest(getRequest(), srb);
                RegistrationHelper.populateStudentStaticContent(srb);

                getRequest().setAttribute("student", srb);

                HashMap errors = new HashMap();
                getRequest().setAttribute("form_errors", errors);

                if (RegistrationHelper.isValidStudent(errors, srb)) {
                    setNextPage(UPDATE_BASE + CONFIRM_PAGE);
                } else {
                    setNextPage(UPDATE_BASE + UPDATE_PAGE);
                }

                setIsNextPageInContext(true);
            }

            /* When the user confirms his registration information, perform data
             * validation again, and persist it to the database
             */
            else if (cmd.equals(CONFIRM_CMD)) {
                log.debug("UpdateStudent processing 'confirm' command.");

                StudentRegistrationBean srb = new StudentRegistrationBean();

                SessionInfoBean sib = (SessionInfoBean) getRequest().getAttribute("SessionInfo");
                if (sib == null) {
                    throw(new Exception(MISSING_SESSION));
                }

                RegistrationHelper.populateStudentWithDefaults(srb);
                RegistrationHelper.populateStudentFromSession(sib, srb);
                RegistrationHelper.populateStudentFromRequest(getRequest(), srb);
                RegistrationHelper.populateStudentStaticContent(srb);

                getRequest().setAttribute("student", srb);

                HashMap errors = new HashMap();
                getRequest().setAttribute("form_errors", errors);

                if (RegistrationHelper.isValidStudent(errors, srb)) {
                    RegistrationHelper.updateStudent(srb);
                    if (srb.getChangePassword()) reissueCookie(BasicAuthentication.HS_SITE);
                    setNextPage(HOME_PAGE);
                } else {
                    setNextPage(UPDATE_BASE + UPDATE_PAGE);
                }

                setIsNextPageInContext(true);
            }

            /* If any other command is given, redirect to the errorPage and display a
             * meaningful message
             */
            else {
                log.debug("UpdateStudent illegal command.");

                throw(new IllegalArgumentException(INVALID_COMMAND + cmd));
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }
    }


}

;
