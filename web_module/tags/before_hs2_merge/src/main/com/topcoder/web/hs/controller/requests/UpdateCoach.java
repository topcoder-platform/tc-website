package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.security.*;
import com.topcoder.shared.util.logging.*;
import com.topcoder.web.hs.common.*;
import com.topcoder.web.hs.model.*;

import java.util.*;
import javax.servlet.*;

/**
 * A RequestProcessor which handles updating coach's information.  It
 * contains the business logic of walking through the different pages and
 * updating entries in the database via EJBs.
 *
 * @author Nathan Egge
 * @date 2003/1/16
 */
public class UpdateCoach extends Base {

  private final static String UPDATE_BASE="/registration/";

  private final static String UPDATE_PAGE="update_coach.jsp";

  private final static String CONFIRM_PAGE="confirm_coach.jsp";

  private final static String HOME_PAGE="/home/index.jsp";

  private final static String UPDATE_CMD="update";

  private final static String CONFIRM_CMD="confirm";

  private final static String INVALID_COMMAND="Invalid command passed to "+
                                              "update module: ";

  private final static String MISSING_SESSION="Cannot update information "+
                                              "without logging in";

  private final static Logger log=Logger.getLogger(UpdateCoach.class);

  protected User getAuthUser() {
    return(auth.getUser());
  }

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    /* If there is no command, then we are trying to display the main update
     * coach page 
     */
    if (cmd==null||cmd.equals("")) {

      log.debug("Processing UpdateCoach '' command.");

      CoachRegistrationBean crb=new CoachRegistrationBean();

      SessionInfoBean sib=(SessionInfoBean)request.getAttribute("SessionInfo");
      if (sib==null) {
        throw(new Exception(MISSING_SESSION));
      }

      RegistrationHelper.populateCoachWithDefaults(crb);
      RegistrationHelper.populateCoachFromSession(sib,crb);
      RegistrationHelper.populateCoachFromRequest(request,crb);
      RegistrationHelper.populateCoachStaticContent(crb);

      request.setAttribute("coach",crb);

      setNextPage(UPDATE_BASE+UPDATE_PAGE);
      setIsNextPageInContext(true);
    }

    /* If the user clicks the "Continute" button after entering his registration
     * information, then perform some data validation and redirect to the
     * confirmation page
     */
    else if (cmd.equals(UPDATE_CMD)) {

      log.debug("Processing UpdateCoach 'update' command.");

      CoachRegistrationBean crb=new CoachRegistrationBean();

      SessionInfoBean sib=(SessionInfoBean)request.getAttribute("SessionInfo");
      if (sib==null) {
        throw(new Exception(MISSING_SESSION));
      }

      RegistrationHelper.populateCoachWithDefaults(crb);
      RegistrationHelper.populateCoachFromSession(sib,crb);
      RegistrationHelper.populateCoachFromRequest(request,crb);
      RegistrationHelper.populateCoachStaticContent(crb);

      request.setAttribute("coach",crb);

      HashMap errors=new HashMap();
      request.setAttribute("form_errors",errors);
   
      if (RegistrationHelper.isValidCoach(errors,crb)) {
        setNextPage(UPDATE_BASE+CONFIRM_PAGE);
      }
      else {
        setNextPage(UPDATE_BASE+UPDATE_PAGE);
      }

      setIsNextPageInContext(true);
    }

    /* When the user confirms his registration information, perform data
     * validation again, and persist it to the database
     */
    else if (cmd.equals(CONFIRM_CMD)) {

      log.debug("Processing UpdateCoach 'confirm' command.");

      CoachRegistrationBean crb=new CoachRegistrationBean();

      SessionInfoBean sib=(SessionInfoBean)request.getAttribute("SessionInfo");
      if (sib==null) {
        throw(new Exception(MISSING_SESSION));
      }

      RegistrationHelper.populateCoachWithDefaults(crb);
      RegistrationHelper.populateCoachFromSession(sib,crb);
      RegistrationHelper.populateCoachFromRequest(request,crb);
      RegistrationHelper.populateCoachStaticContent(crb);

      request.setAttribute("coach",crb);

      HashMap errors=new HashMap();
      request.setAttribute("form_errors",errors);

      if (RegistrationHelper.isValidCoach(errors,crb)) {
        RegistrationHelper.updateCoach(crb);
        setNextPage(HOME_PAGE);
      }
      else {
        setNextPage(UPDATE_BASE+UPDATE_PAGE);
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
