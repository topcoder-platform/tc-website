package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.Transaction;

import java.util.*;
import javax.servlet.*;

/**
 * A RequestProcessor which handles the registration of new users.  It contains
 * the business logic of walking through the different pages and creating new
 * entries in the database via EJBs.
 *
 * @author Nathan Egge
 * @date 2003/1/2
 */
public class Registration extends Base {

  private final static String HS_REG_BASE="/hs/registration/";

  private final static String REG_PAGE="registration.jsp";

  private final static String REG_STUDENT_PAGE="registration_student.jsp";

  private final static String REG_COACH_PAGE="registration_coach.jsp";

  private final static String CONFIRM_STUDENT_PAGE="confirm_student.jsp";
  
  private final static String CONFIRM_COACH_PAGE="confirm_coach.jsp";

  private final static String THANK_YOU_PAGE="thankyou.jsp";

  private final static String REG_CMD="reg";

  private final static String REG_STUDENT_CMD="reg_student";

  private final static String REG_COACH_CMD="reg_coach";

  private final static String CONFIRM_STUDENT_CMD="confirm_student";

  private final static String CONFIRM_COACH_CMD="confirm_student";

  private final static String INVALID_COMMAND="Invalid command passed to "+
                                              "registration module: ";

  public void process() throws Exception {
    super.process();

    String cmd=request.getParameter("c");

    /* If there is no command, redirect to the main registration page
     */
    if (cmd==null||cmd.equals("")) {
      setNextPage(HS_REG_BASE+REG_PAGE);
      setIsNextPageInContext(true);
    }
    else if (cmd.equals(REG_CMD)) {
      String coder_type=request.getParameter("coderType");
    }
    else if (cmd.equals(REG_STUDENT_CMD)) {
    }
    else if (cmd.equals(REG_COACH_CMD)) {
    }
    else if (cmd.equals(CONFIRM_STUDENT_CMD)) {
    }
    else if (cmd.equals(CONFIRM_COACH_CMD)) {
    }
    else { 
      throw(new IllegalArgumentException(INVALID_COMMAND+cmd));
    }
  }

};
