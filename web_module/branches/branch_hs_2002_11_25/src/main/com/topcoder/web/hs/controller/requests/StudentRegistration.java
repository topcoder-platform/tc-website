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

  private final static String FIRST_NAME_NOT_EMPTY="Ensure that the first "+
                                                  "name field is not empty";

  private final static int MAX_FIRST_NAME_LENGTH=64;

  private final static String FIRST_NAME_TOO_LONG="The first name field must "+
                                                  "be less than 64 characters "+
                                                  "long";

  private final static String LAST_NAME_NOT_EMPTY="Ensure that the last name "+
                                                  "field is not empty";

  private final int MAX_LAST_NAME_LENGTH=64;

  private final static String FIRST_NAME_TOO_LONG="The last name field must "+
                                                  "be less than 64 characters "+
                                                  "long";

  private final static String INVALID_STATE_CODE="Please select a state";

  private final static String INVALID_SCHOOL_ID="

  private final static String HANDLE_NOT_EMPTY="Ensure that the handle field "+
                                               "is not empty";

  private final static String HANDLE_ALPHABET="ABCDEFGHIJKLMNOPQRSTUVWXYZ"+
                                              "abcdefghijklmnopqrstuvwxyz"+
                                              "0123456789"+
                                              "-_.";

  private final static String INVALID_HANLDE="The handle field must contain "+
                                             "only alpha numeric symbols";

  private final static String PASSWORD_NOT_EMPTY="Ensure that the password "+
                                                 "field is not empty";

  private final static String PASSWORD_WRONG_LENGTH="The password field must "+
                                                    "be 7 to 15 characters "+
                                                    "long";

  private final static String PASSWORD_NO_MATCH="The password field does not "+
                                                "match the re-typed password";

  private final static String EMAIL_NOT_EMPTY="Ensure that the email field "+
                                              "is not empty";

  private final static String INVALID_EMAIL="The email field must contain a "+
                                            "valid email address";

  private final static String EMAIL_NO_MATCH="The email field does not match "+
                                             "the re-typed email";

  private final static String MUST_AGREE_TERMS="You must agree to the terms "
                                               "and conditions to register";

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    /* If there is no command, then we are trying to display the main student
     * registration page 
     */
    if (cmd==null||cmd.equals("")) {
      StudentRegistrationBean srb=new StudentRegistrationBean();
      populateStudentRegistrationBean(srb);

      request.setAttribute("student",srb);

      setNextPage(REGISTRATION_BASE+REGISTRATION_PAGE);
      setIsNextPageInContext(true);
    }

    /* If the user clicks the "Continute" button after entering his registration
     * information, then perform some data validation and redirect to the
     * confirmation page
     */
    else if (cmd.equals(REGISTER_CMD)) {
      StudentRegistrationBean srb=new StudentRegistrationBean();
      populateStudentRegistrationBean(srb);

      request.setAttribute("student",srb);

      if (isValidStudent(srb)) {
        setNextPage(REGISTRATION_BASE+CONFIRM_PAGE);
      }
      else {
        setNextPage(REGISTRATION_BASE+REGISTRATION_PAGE);
      }

      setIsNextPageInContext(true);
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
    state_list.add(new ListPairBean(null,"Pick a state"));
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
      editor_list.add(new ListPairBean(editor_id,editor_desc));
    }

    _srb.setEditorList(editor_list);
    
    rsc=(ResultSetContainer)data.get("language_list");
    List language_list=new ArrayList();
    for (Iterator i=rsc.iterator();i.hasNext();) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      Integer language_id=(Integer)rsr.getItem("language_id").getResultData();
      String language_name=(String)rsr.getItem("language_name").getResultData();
      language_list.add(new ListPairBean(language_id,language_name));
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

    List school_list=new ArrayList();
    school_list.add(new ListPairBean(null,"Pick a school"));
    if (isValidListValue(_srb.getStateCode(),_srb.getStateList())) {
      map.put(DataAccessConstants.COMMAND,"state_schools");
      map.put(STATE_INPUT_CODE,_srb.getStateCode());
      req=new Request(map);
      Map schools=dai.getData(req);

      rsc=(ResultSetContainer)schools.get("state_schools");
      for (Iterator i=rsc.iterator();i.hasNext();) {
        rsr=(ResultSetContainer.ResultSetRow)i.next();
        Long school_id=(Long)rsr.getItem("school_id").getResultData();
        String short_name=(String)rsr.getItem("short_name").getResultData();
        school_list.add(new ListPairBean(school_id,short_name));
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
    catch (Exception _e) {
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

  private boolean isValidStudent(StudentRegistrationBean _srb) {
    HashMap errors=new HashMap();
    boolean is_valid=true;

    /* Check for a valid first name
     */
    String first_name=_srb.getFirstName();

    if (first_name==null||first_name.length()==0) {
      addErrorMessage(errors,"FirstName",FIRST_NAME_NOT_EMPTY);
      is_valid=false;
    }
    else {
      if (first_name.length()>=MAX_FIRST_NAME_LENGTH) {
        addErrorMessage(errors,"FirstName",FIRST_NAME_TOO_LONG);
        is_valid=false;
      }
    }

    /* Check for a valid last name
     */
    String last_name=_srb.getLastName();

    if (last_name==null||last_name.length()==0) {
      addErrorMessage(errors,"LastName",LAST_NAME_NOT_EMPTY);
      is_valid=false;
    }
    else {
      if (last_name.length()>=MAX_LAST_NAME_LENGTH) {
        addErrorMessage(errors,"LastName",LAST_NAME_TOO_LONG);
        is_valid=false;
      }
    }

    /* Check for valid state code
     */
    if (!isValidListValue(_srb.getStateCode(),_srb,getStateList())) {
      addErrorMessage(errors,"StateCode",INVALID_STATE_CODE);
      is_valid=false;
    }
    else {

      /* Check for valid school
       */
       if (!isValidListValue(_srb.getSchoolId(),_srb.getSchoolList())) {
         addErrorMessage(errors,"SchoolId",INVALID_SCHOOL_ID);
         is_valid=false;
       }
    }

    /* Check for valid handle
     */
    String handle=_srb.getHandle();

    if (handle==null||handle.length()==0) {
      addErrorMessage(errors,"Handle",HANDLE_NOT_EMPTY);
      is_valid=false;
    }
    else {
      boolean valid_handle=true;
      for (int i=0;i<handle.length;i++) {
        if (HANDLE_ALPHABET.indexOf(handle.charAt(i))==-1) {
          valid_handle=false;
          break;
        }
      }
      if (!valid_handle) {
        addErrorMessage(errors,"Handle",INVALID_HANDLE);
        is_valid=false;
      }
      else {
        
      }
    }

    /* Check for a valid password
     */
    String password=_srb.getPassword();
    String confirm_password=_srb.getConfirmPassword();
    
    if (password==null||password.length()==0) {
      addErrorMessage(errors,"Password",PASSWORD_NOT_EMPTY);
      is_valid=false;
    }
    else {
      if (password.length()<7||password.length()>15) {
        addErrorMessage(errors,"Password",PASSWORD_WRONG_LENGTH);
        is_valid=false;
      }
      else {
        if (!password.equals(confirm_password)) {
          addErrorMessage(errors,"Password",PASSWORD_NO_MATCH);
          is_valid=false;
        }
      }
    }

    /* Check for valid email address
     */
    String email=_srb.getEmail();
    String confirm_email=_srb.getConfirmEmail();
    if (email==null||email.length()==0) {
      addErrorMessage(errors,"Email",EMAIL_NOT_EMPTY);
      is_valid=false;
    }
    else {
      if (email.length()<5||email.indexOf("@")<0||email.indexOf(".")<0) {
        addErrorMessage(errors,"Email",INVALID_EMAIL);
        is_valid=false;
      }
      else {
        if (!email.equals(confirm_email)) {
          addErrorMessage(errors,"Email",EMAIL_NO_MATCH);
          is_valid=false;
        }
      }
    }

    /* Check to make sure they agreed to the terms and conditions
     */
    if (!_srb.getAgreeTerms()) {
      addErrorMessage(errors,"AgreeTerms",MUST_AGREE_TERMS);
      is_valid=false;
    }

    return(is_valid);
  }

  private boolean isValidListValue(Object _value,List _list) {
    if (_value==null||_value.length()==0) {
      return(false);
    }
    for (Iterator iterator=_list.iterator();iterator.hasNext();) {
      ListPairBean lpb=(ListPairBean)iterator.next();
      if (_value.equals(lpb.getValue())) {
        return(true);
      }
    }
    return(false);
  }

  private void addErrorMessage(HashMap _errors,String _key,String _message) {
    List msgs=(List)_errors.get(_key);
    if (msgs==null) {
      msgs=new ArrayList();
      _errors.put(_key,msgs);
    }
    msgs.add(_message);
  }

};
