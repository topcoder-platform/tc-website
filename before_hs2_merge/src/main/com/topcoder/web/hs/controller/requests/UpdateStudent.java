package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.security.*;
import com.topcoder.web.hs.common.*;
import com.topcoder.web.hs.model.*;

import java.util.*;
import javax.servlet.*;

/**
 * A RequestProcessor which handles updating students information.  It
 * contains the business logic of walking through the different pages and
 * updating entries in the database via EJBs.
 *
 * @author Nathan Egge
 * @date 2003/1/16
 */
public class UpdateStudent extends Base {

  private final static String UPDATE_BASE="/registration/";

  private final static String UPDATE_PAGE="update_student.jsp";

  private final static String CONFIRM_PAGE="confirm_student.jsp";

  private final static String HOME_PAGE="/home/index.jsp";

  private final static String REGISTER_CMD="update";

  private final static String CONFIRM_CMD="confirm";

  private final static String INVALID_COMMAND="Invalid command passed to "+
                                              "update module: ";

  private final static String MISSING_SESSION="Cannot update information "+
                                              "without logging in";

  protected User getAuthUser() {
    return(auth.getUser());
  }

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    /* If there is no command, then we are trying to display the main update
     * student page 
     */
    if (cmd==null||cmd.equals("")) {
      StudentRegistrationBean srb=new StudentRegistrationBean();

      SessionInfoBean sib=(SessionInfoBean)request.getAttribute("SessionInfo");
      if (sib==null) {
        throw(new Exception(MISSING_SESSION));
      }

      RegistrationHelper.populateStudentWithDefaults(srb);
      RegistrationHelper.populateStudentFromSession(sib,srb);
      RegistrationHelper.populateStudentFromRequest(request,srb);
      RegistrationHelper.populateStudentStaticContent(srb);

      request.setAttribute("student",srb);

      setNextPage(UPDATE_BASE+UPDATE_PAGE);
      setIsNextPageInContext(true);
    }

    /* If the user clicks the "Continute" button after entering his registration
     * information, then perform some data validation and redirect to the
     * confirmation page
     */
    else if (cmd.equals(REGISTER_CMD)) {
      StudentRegistrationBean srb=new StudentRegistrationBean();

      SessionInfoBean sib=(SessionInfoBean)request.getAttribute("SessionInfo");
      if (sib==null) {
        throw(new Exception(MISSING_SESSION));
      }

      RegistrationHelper.populateStudentWithDefaults(srb);
      RegistrationHelper.populateStudentFromSession(sib,srb);
      RegistrationHelper.populateStudentFromRequest(request,srb);
      RegistrationHelper.populateStudentStaticContent(srb);

      request.setAttribute("student",srb);

      HashMap errors=new HashMap();
      request.setAttribute("form_errors",errors);
   
      if (RegistrationHelper.isValidStudent(errors,srb)) {
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
      StudentRegistrationBean srb=new StudentRegistrationBean();

      SessionInfoBean sib=(SessionInfoBean)request.getAttribute("SessionInfo");
      if (sib==null) {
        throw(new Exception(MISSING_SESSION));
      }

      RegistrationHelper.populateStudentWithDefaults(srb);
      RegistrationHelper.populateStudentFromSession(sib,srb);
      RegistrationHelper.populateStudentFromRequest(request,srb);
      RegistrationHelper.populateStudentStaticContent(srb);

      request.setAttribute("student",srb);

      HashMap errors=new HashMap();
      request.setAttribute("form_errors",errors);

      if (RegistrationHelper.isValidStudent(errors,srb)) {
        RegistrationHelper.updateStudent(srb);
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
