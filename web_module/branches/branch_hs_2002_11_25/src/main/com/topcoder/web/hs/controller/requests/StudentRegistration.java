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
 * A RequestProcessor which handles the registration of new students.  It
 * contains the business logic of walking through the different pages and
 * creating new entries in the database via EJBs.
 *
 * @author Nathan Egge
 * @date 2003/1/2
 */
public class StudentRegistration extends Base {

  private final static String STATE="st";

  private final static String REG_BASE="/registration/";

  private final static String REG_STUDENT_PAGE="registration_student.jsp";

  private final static String CONFIRM_STUDENT_PAGE="confirm_student.jsp";

  private final static String THANK_YOU_PAGE="thankyou.jsp";

  private final static String PICK_STATE_CMD="pick_state";

  private final static String REG_STUDENT_CMD="reg_student";

  private final static String CONFIRM_STUDENT_CMD="confirm_student";

  private final static String INVALID_COMMAND="Invalid command passed to "+
                                              "registration module: ";

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    /* If there is no command, then we are trying to display the main student
     * registration page 
     */
    if (cmd==null||cmd.equals("")) {
      redirectToStudentRegistration();
    }

    /* If the user has clicked on a different state we need to get the list
     * of high schools for that state and send it back
     */
    else if (cmd.equals(PICK_STATE_CMD)) {

      redirectToStudentRegistration();

      Context ctx=TCContext.getInitial();
      DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
      DataAccessInt dai=new CachedDataAccess(ds);

      List schools=new ArrayList();

      /* check to see if the users has picked a state */
      String pick=request.getParameter("state");
      if (pick!=null&&!pick.equals("")) {
        Map map=new HashMap();
        map.put(DataAccessConstants.COMMAND,"state_schools");
        map.put(STATE,pick);
        Request req=new Request(map);
        Map picked=dai.getData(req);
        schools=(List)picked.get("state_schools");
      }

      Map data=(Map)request.getAttribute("STUDENT_DATA");
      data.put("state_schools",schools);
      request.setAttribute("STUDENT_DATA",data);

    }

    /* If the user clicks the "Continute" button after entering his registration
     * information, then perform some data validation and redirect to the
     * confirmation page
     */
    else if (cmd.equals(REG_STUDENT_CMD)) {

    }

    /* When the user confirms his registration information, perform data
     * validation again, and commit it to the database
     */
    else if (cmd.equals(CONFIRM_STUDENT_CMD)) {
      Context ctx=TCContext.getInitial();
      DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);

    }

    else {
      throw(new IllegalArgumentException(INVALID_COMMAND+cmd));
    }
  }

  private void redirectToStudentRegistration() throws Exception {
    Context ctx=TCContext.getInitial();
    DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
    DataAccessInt dai=new CachedDataAccess(ds);
    Map map=new HashMap();

    map.put(DataAccessConstants.COMMAND,"student_form");
    Request req=new Request(map);
    Map data=dai.getData(req);

    request.setAttribute("STUDENT_DATA",data);

    /* need to preserve any passed in parameters */
    preserveNonNullParameter("first_name","FIRST_NAME");
    preserveNonNullParameter("last_name","LAST_NAME");
    preserveParameter("state_code","STATE_CODE");
    preserveParameter("school_id","SCHOOL_ID");
    preserveIntegerParameter("school_id","SCHOOL_ID");
    preserveNonNullParameter("handle","HANDLE");
    preserveNonNullParameter("email","EMAIL");
    preserveNonNullParameter("confirm_email","CONFIRM_EMAIL");
    preserveIntegerParameter("editor_id","EDITOR_ID");
    preserveIntegerParameter("language_id","LANGUAGE_ID");

    setNextPage(REG_BASE+REG_STUDENT_PAGE);
    setIsNextPageInContext(true);
  }

  private void preserveParameter(String _param,String _name) {
    String value=request.getParameter(_param);
    request.setAttribute(_name,value);
  }

  private void preserveNonNullParameter(String _param,String _name) {
    String value=request.getParameter(_param);
    if (value==null) {
      value="";
    }
    request.setAttribute(_name,value);
  }

  private void preserveIntegerParameter(String _param,String _name) {
    String param=request.getParameter(_param);
    Integer value=null;
    try {
      value=new Integer(param);
    }
    catch (NumberFormatException _nfe) {
      /* do nothing */
    }
    request.setAttribute(_name,value);
  }

  private boolean validateStudent() {
    return(false);
  }

};
