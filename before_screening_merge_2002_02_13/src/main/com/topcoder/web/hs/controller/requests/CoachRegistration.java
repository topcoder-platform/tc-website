package com.topcoder.web.hs.controller.requests;

import com.topcoder.web.hs.common.*;
import com.topcoder.web.hs.model.*;

import java.util.*;
import javax.servlet.*;

/**
 * A RequestProcessor which handles the registration of new coaches.  It
 * contains the business logic of walking through the different pages and
 * creating new entries in the database via EJBs.
 *
 * @author Nathan Egge
 * @date 2003/1/2
 */
public class CoachRegistration extends Base {

  private final static String COACH_GROUP_NAME="Coach";

  private final static String REGISTRATION_BASE="/registration/";

  private final static String REGISTRATION_PAGE="registration_coach.jsp";

  private final static String CONFIRM_PAGE="confirm_coach.jsp";

  private final static String THANK_YOU_PAGE="thankyou_coach.jsp";

  private final static String REGISTER_CMD="register";

  private final static String CONFIRM_CMD="confirm";

  private final static String INVALID_COMMAND="Invalid command passed to "+
                                              "registration module: ";

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    /* If there is no command, then we are trying to display the main coach 
     * registration page 
     */
    if (cmd==null||cmd.equals("")) {
      CoachRegistrationBean crb=new CoachRegistrationBean();

      RegistrationHelper.populateCoachWithDefaults(crb);
      RegistrationHelper.populateCoachFromRequest(request,crb);
      RegistrationHelper.populateCoachStaticContent(crb);

      request.setAttribute("coach",crb);

      setNextPage(REGISTRATION_BASE+REGISTRATION_PAGE);
      setIsNextPageInContext(true);
    }

    /* If the user clicks the "Continute" button after entering his registration
     * information, then perform some data validation and redirect to the
     * confirmation page
     */
    else if (cmd.equals(REGISTER_CMD)) {
      CoachRegistrationBean crb=new CoachRegistrationBean();

      RegistrationHelper.populateCoachWithDefaults(crb);
      RegistrationHelper.populateCoachFromRequest(request,crb);
      RegistrationHelper.populateCoachStaticContent(crb);

      request.setAttribute("coach",crb);

      HashMap errors=new HashMap();
      request.setAttribute("form_errors",errors);

      if (RegistrationHelper.isValidCoach(errors,crb)) {
        setNextPage(REGISTRATION_BASE+CONFIRM_PAGE);
      }
      else {
        setNextPage(REGISTRATION_BASE+REGISTRATION_PAGE);
      }

      setIsNextPageInContext(true);
    }

    /* When the user confirms his registration information, perform data
     * validation again, and persist it to the database
     */
    else if (cmd.equals(CONFIRM_CMD)) {
      CoachRegistrationBean crb=new CoachRegistrationBean();

      RegistrationHelper.populateCoachWithDefaults(crb);
      RegistrationHelper.populateCoachFromRequest(request,crb);
      RegistrationHelper.populateCoachStaticContent(crb);

      request.setAttribute("coach",crb);

      HashMap errors=new HashMap();
      request.setAttribute("form_errors",errors);

      if (RegistrationHelper.isValidCoach(errors,crb)) {
        RegistrationHelper.createCoach(crb);
        setNextPage(REGISTRATION_BASE+THANK_YOU_PAGE);
      }
      else {
        setNextPage(REGISTRATION_BASE+REGISTRATION_PAGE);
      }

      setIsNextPageInContext(true);
    }

    /* If any other command is given, redirect to the errorPage and display a
     * meaningful message
     */
    else {
      throw(new IllegalArgumentException(INVALID_COMMAND+cmd));
    }
  }

};
