package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.util.logging.*;
import com.topcoder.web.hs.common.*;
import com.topcoder.web.hs.model.*;
import com.topcoder.web.common.TCWebException;

import java.util.*;

/**
 * A RequestProcessor which handles the registration of new students.  It
 * contains the business logic of walking through the different pages and
 * creating new entries in the database via EJBs.
 *
 * @author Nathan Egge
 */
public class StudentRegistration extends Base {

    private final static String REGISTRATION_BASE = "/registration/";

    private final static String REGISTRATION_PAGE = "registration_student.jsp";

    private final static String CONFIRM_PAGE = "confirm_student.jsp";

    private final static String THANK_YOU_PAGE = "thankyou_student.jsp";

    private final static String REGISTER_CMD = "register";

    private final static String CONFIRM_CMD = "confirm";

    private final static String INVALID_COMMAND = "Invalid command passed to " +
            "registration module: ";

    private final static Logger log = Logger.getLogger(StudentRegistration.class);

    protected void businessProcessing() throws TCWebException {

        String cmd = getRequest().getParameter("cmd");

        log.info("StudentRegistration: cmd=" + cmd);

        /* If there is no command, then we are trying to display the main student
         * registration page
         */
        try {
            if (cmd == null || cmd.equals("")) {
                log.debug("StudentRegistration processing '' command.");

                StudentRegistrationBean srb = new StudentRegistrationBean();

                RegistrationHelper.populateStudentWithDefaults(srb);
                RegistrationHelper.populateStudentFromRequest(getRequest(), srb);
                RegistrationHelper.populateStudentStaticContent(srb);

                getRequest().setAttribute("student", srb);

                setNextPage(REGISTRATION_BASE + REGISTRATION_PAGE);
                setIsNextPageInContext(true);
            }

            /* If the user clicks the "Continute" button after entering his registration
             * information, then perform some data validation and redirect to the
             * confirmation page
             */
            else if (cmd.equals(REGISTER_CMD)) {
                log.debug("StudentRegistration processing 'register' command.");

                StudentRegistrationBean srb = new StudentRegistrationBean();

                RegistrationHelper.populateStudentWithDefaults(srb);
                RegistrationHelper.populateStudentFromRequest(getRequest(), srb);
                RegistrationHelper.populateStudentStaticContent(srb);

                getRequest().setAttribute("student", srb);

                HashMap errors = new HashMap();
                getRequest().setAttribute("form_errors", errors);

                if (RegistrationHelper.isValidStudent(errors, srb)) {
                    setNextPage(REGISTRATION_BASE + CONFIRM_PAGE);
                } else {
                    setNextPage(REGISTRATION_BASE + REGISTRATION_PAGE);
                }

                setIsNextPageInContext(true);
            }

            /* When the user confirms his registration information, perform data
             * validation again, and persist it to the database
             */
            else if (cmd.equals(CONFIRM_CMD)) {
                log.debug("StudentRegistration processing 'confirm' command.");

                StudentRegistrationBean srb = new StudentRegistrationBean();

                RegistrationHelper.populateStudentWithDefaults(srb);
                RegistrationHelper.populateStudentFromRequest(getRequest(), srb);
                RegistrationHelper.populateStudentStaticContent(srb);

                getRequest().setAttribute("student", srb);

                HashMap errors = new HashMap();
                getRequest().setAttribute("form_errors", errors);

                if (RegistrationHelper.isValidStudent(errors, srb)) {
                    RegistrationHelper.createStudent(srb);
                    RegistrationHelper.populateSchoolCoachCount(srb);
                    setNextPage(REGISTRATION_BASE + THANK_YOU_PAGE);
                } else {
                    setNextPage(REGISTRATION_BASE + REGISTRATION_PAGE);
                }

                setIsNextPageInContext(true);
            }

            /* If any other command is given, redirect to the errorPage and display a
             * meaningful message
             */
            else {
                log.debug("StudentRegistration illegal command.");

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
