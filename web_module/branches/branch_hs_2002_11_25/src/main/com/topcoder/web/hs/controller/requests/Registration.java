package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.Transaction;

import java.util.*;
import javax.naming.*;
import javax.servlet.*;
import javax.sql.*;

/**
 * A RequestProcessor which handles the registration of new users.  It contains
 * the business logic of walking through the different pages and creating new
 * entries in the database via EJBs.
 *
 * @author Nathan Egge
 * @date 2003/1/2
 */
public class Registration extends Base {

  private final static String REG_BASE="/registration/";

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

  private final static String STUDENT_TYPE="student";

  private final static String COACH_TYPE="coach";

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("c");

    /* If there is no command, redirect to the main registration page
     */
    if (cmd==null||cmd.equals("")) {
      setNextPage(REG_BASE+REG_PAGE);
      setIsNextPageInContext(true);
    }

    /* If the command is "reg", attempt to redirect to a specific registration
     * page for the indicated type of coder
     */
    else if (cmd.equals(REG_CMD)) {
      String coder_type=request.getParameter("coderType");

      Context ctx=TCContext.getInitial();
      DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
      DataAccessInt dai=new CachedDataAccess(ds);
      Map map=new HashMap();

      /* If coder_type=="student" redirect to the student registration page
       */
      if (STUDENT_TYPE.equals(coder_type)) {

        map.put(DataAccessConstants.COMMAND,"student_form");
        Request req=new Request(map);
        Map data=dai.getData(req);

        request.setAttribute("FORM_DATA",data);

        setNextPage(REG_BASE+REG_STUDENT_PAGE);
      }

      /* If coder_type=="coach" redirect to the coach registration page
       */
      else if (COACH_TYPE.equals(coder_type)) {
        setNextPage(REG_BASE+REG_COACH_PAGE);
      }

      /* Otherwise no coder_type was specified so redirect back to the main
       * registration page
       */
      else {
        setNextPage(REG_BASE+REG_PAGE);
      }
      setIsNextPageInContext(true);
    }

    /* If the command is "reg_student", validate the student's information
     * and redirect to a confirmation page
     */
    else if (cmd.equals(REG_STUDENT_CMD)) {
    }

    /* If the command is "reg_coach", validate the coach's information and
     * redirect to a confirmation page
     */
    else if (cmd.equals(REG_COACH_CMD)) {
    }

    /* If the command is "confirm_student", validate the student's information
     * a second time and commit it to the database
     */
    else if (cmd.equals(CONFIRM_STUDENT_CMD)) {
    }

    /* If the command is "confirm_coach", validate the coach's information a
     * second time and commit it to the database
     */
    else if (cmd.equals(CONFIRM_COACH_CMD)) {
    }

    else {
      throw(new IllegalArgumentException(INVALID_COMMAND+cmd));
    }
  }

  private boolean validateStudent() {
    return(false);
  }

  private boolean validateCoach() {
    return(false);
  }
};
