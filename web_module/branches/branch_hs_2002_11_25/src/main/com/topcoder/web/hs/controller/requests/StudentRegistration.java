package com.topcoder.web.hs.controller.requests;

import com.topcoder.web.hs.model.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.*;

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

  private final static String STATE_INPUT_CODE="st";

  private final static String REGISTRATION_BASE="/registration/";

  private final static String REGISTRATION_PAGE="registration_student.jsp";

  private final static String CONFIRM_PAGE="confirm_student.jsp";

  private final static String THANK_YOU_PAGE="thankyou.jsp";

  private final static String REGISTER_CMD="register";

  private final static String CONFIRM_CMD="confirm";

  private final static String INVALID_COMMAND="Invalid command passed to "+
                                              "registration module: ";

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    /* If there is no command, then we are trying to display the main student
     * registration page 
     */
    if (cmd==null||cmd.equals("")) {
      StudentRegistrationBean srb=new StudentRegistrationBean();
      populateStudentRegistrationBean(srb);

      request.setAttribute("student",srb);
      validateStudent(srb);

      setNextPage(REGISTRATION_BASE+REGISTRATION_PAGE);
      setIsNextPageInContext(true);
    }

    /* If the user clicks the "Continute" button after entering his registration
     * information, then perform some data validation and redirect to the
     * confirmation page
     */
    else if (cmd.equals(REGISTER_CMD)) {

    }

    /* When the user confirms his registration information, perform data
     * validation again, and commit it to the database
     */
    else if (cmd.equals(CONFIRM_CMD)) {

    }

    /* If any other command is given, redirect to the errorPage and display a
     * meaningful message
     */
    else {
      throw(new IllegalArgumentException(INVALID_COMMAND+cmd));
    }
  }

  private void populateStudentRegistrationBean(StudentRegistrationBean _srb)
                                                              throws Exception {
    Context ctx=TCContext.getInitial();
    DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
    DataAccessInt dai=new CachedDataAccess(ds);
    Map map=new HashMap();

    map.put(DataAccessConstants.COMMAND,"student_form");
    Request req=new Request(map);
    Map data=dai.getData(req);

    ResultSetContainer rsc;
    ResultSetContainer.ResultSetRow rsr;

    rsc=(ResultSetContainer)data.get("state_list");
    List state_list=new ArrayList();
    state_list.add(new ListPairBean("ZZ","Pick a state"));
    for (Iterator i=rsc.iterator();i.hasNext();) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      String state_code=(String)rsr.getItem("state_code").getResultData();
      String state_name=(String)rsr.getItem("state_name").getResultData();
      state_list.add(new ListPairBean(state_code,state_name));
    }

    _srb.setStateList(state_list);

    rsc=(ResultSetContainer)data.get("editor_list");
    List editor_list=new ArrayList();
    for (Iterator i=rsc.iterator();i.hasNext();) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      Integer editor_id=(Integer)rsr.getItem("editor_id").getResultData();
      String editor_desc=(String)rsr.getItem("editor_desc").getResultData();
      editor_list.add(new ListPairBean(editor_id.toString(),editor_desc));
    }

    _srb.setEditorList(editor_list);
    
    rsc=(ResultSetContainer)data.get("language_list");
    List language_list=new ArrayList();
    for (Iterator i=rsc.iterator();i.hasNext();) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      Integer language_id=(Integer)rsr.getItem("language_id").getResultData();
      String language_name=(String)rsr.getItem("language_name").getResultData();
      language_list.add(new ListPairBean(language_id.toString(),language_name));
    }

    _srb.setLanguageList(language_list);

    _srb.setFirstName(getParameterNonNull("first_name"));
    _srb.setLastName(getParameterNonNull("last_name"));
    _srb.setStateCode(getParameterNonNull("state"));
    _srb.setSchoolId(getParameterLong("school"));
    _srb.setHandle(getParameterNonNull("handle"));
    _srb.setPassword(getParameterNonNull("password"));
    _srb.setConfirmPassword(getParameterNonNull("confirm_password"));
    _srb.setEmail(getParameterNonNull("email"));
    _srb.setConfirmEmail(getParameterNonNull("confirm_email"));
    _srb.setEditorId(getParameterInteger("editor"));
    _srb.setLanguageId(getParameterInteger("language"));

    /* add error checking here */

    List school_list=new ArrayList();
    school_list.add(new ListPairBean("-1","Pick a school"));
    if (!_srb.getStateCode().equals("")) {
      map.put(DataAccessConstants.COMMAND,"state_schools");
      map.put(STATE_INPUT_CODE,_srb.getStateCode());
      req=new Request(map);
      Map schools=dai.getData(req);

      rsc=(ResultSetContainer)schools.get("state_schools");
      for (Iterator i=rsc.iterator();i.hasNext();) {
        rsr=(ResultSetContainer.ResultSetRow)i.next();
        Long school_id=(Long)rsr.getItem("school_id").getResultData();
        String short_name=(String)rsr.getItem("short_name").getResultData();
        school_list.add(new ListPairBean(school_id.toString(),short_name));
      }

    }
    _srb.setSchoolList(school_list);
      
  }

  private String getParameterNonNull(String _param) {
    String value=request.getParameter(_param);
    if (value==null) {
      value="";
    }
    return(value);
  }

  private Integer getParameterInteger(String _param) {
    Integer value=new Integer(-1);
    try {
      value=new Integer(request.getParameter(_param));
    }
    catch (Exception _e)
      /* do nothing */
    }
    return(value);
  }

  private Long getParameterLong(String _param) {
    Long value=new Long(-1);
    try {
      value=new Long(request.getParameter(_param));
    }
    catch (Exception _e) {
      /* do nothing */
    }
    return(value);
  }

  private boolean validateStudent(StudentRegistrationBean _srb) {
    
    return(false);
  }

};
