package com.topcoder.web.hs.controller.requests;

import com.topcoder.security.*;
import com.topcoder.security.admin.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.*;
import com.topcoder.web.ejb.user.*;
import com.topcoder.web.ejb.email.*;
import com.topcoder.web.ejb.termsofuse.*;
import com.topcoder.web.hs.ejb.coder.*;
import com.topcoder.web.hs.ejb.rating.*;
import com.topcoder.web.hs.model.*;

import java.rmi.*;
import java.util.*;
import javax.ejb.*;
import javax.naming.*;
import javax.servlet.*;
import javax.sql.*;
import javax.transaction.UserTransaction;

/**
 * A RequestProcessor which handles the registration of new coaches.  It
 * contains the business logic of walking through the different pages and
 * creating new entries in the database via EJBs.
 *
 * @author Nathan Egge
 * @date 2003/1/2
 */
public class CoachRegistration extends Base {

  private final static String STATE_INPUT_CODE="st";

  private final static long TERMS_OF_USE_ID=1;

  private final static long EMAIL_TYPE_ID_PRIMARY=1;

  private final static String REGISTRATION_BASE="/registration/";

  private final static String REGISTRATION_PAGE="registration_coach.jsp";

  private final static String CONFIRM_PAGE="confirm_coach.jsp";

  private final static String THANK_YOU_PAGE="thankyou_coach.jsp";

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

  private final static String LAST_NAME_TOO_LONG="The last name field must be "+
                                                  "less than 64 characters "+
                                                  "long";

  private final static String INVALID_STATE_CODE="Please select a state";

  private final static String INVALID_SCHOOL_ID="Please select a school";

  private final static String HANDLE_NOT_EMPTY="Ensure that the handle field "+
                                               "is not empty";

  private final static String HANDLE_ALPHABET="ABCDEFGHIJKLMNOPQRSTUVWXYZ"+
                                              "abcdefghijklmnopqrstuvwxyz"+
                                              "0123456789"+
                                              "-_.";

  private final static String INVALID_HANDLE="The handle field must contain "+
                                             "only alpha numeric symbols";

  private final static String HANDLE_TAKEN="This handle is already in use by "+
                                           "another user";

  private final static String TECHNICAL_PROBLEMS="Technical problems are "+
                                                 "preventing further "+
                                                 "processing, try again later";

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

  private final static String INVALID_EDITOR_ID="Please select an editor";

  private final static String INVALID_LANGUAGE_ID="Please select a language";

  private final static String MUST_AGREE_TERMS="You must agree to the terms "+
                                               "and conditions to register";

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    /* If there is no command, then we are trying to display the main coach 
     * registration page 
     */
    if (cmd==null||cmd.equals("")) {
      CoachRegistrationBean crb=new CoachRegistrationBean();
      populateCoachRegistrationBean(crb);

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
      populateCoachRegistrationBean(crb);

      request.setAttribute("coach",crb);

      if (isValidCoach(crb)) {
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
      populateCoachRegistrationBean(crb);

      request.setAttribute("coach",crb);

      if (isValidCoach(crb)) {
        persistCoach(crb);
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

  private void populateCoachRegistrationBean(CoachRegistrationBean _crb)
                                                              throws Exception {
    Context ctx=TCContext.getInitial();
    DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
    DataAccessInt dai=new CachedDataAccess(ds);
    Map map=new HashMap();

    map.put(DataAccessConstants.COMMAND,"coach_form");
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

    _crb.setStateList(state_list);

    rsc=(ResultSetContainer)data.get("editor_list");
    List editor_list=new ArrayList();
    for (Iterator i=rsc.iterator();i.hasNext();) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      Integer editor_id=(Integer)rsr.getItem("editor_id").getResultData();
      String editor_desc=(String)rsr.getItem("editor_desc").getResultData();
      editor_list.add(new ListPairBean(editor_id,editor_desc));
    }

    _crb.setEditorList(editor_list);
    
    rsc=(ResultSetContainer)data.get("language_list");
    List language_list=new ArrayList();
    for (Iterator i=rsc.iterator();i.hasNext();) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      Integer language_id=(Integer)rsr.getItem("language_id").getResultData();
      String language_name=(String)rsr.getItem("language_name").getResultData();
      language_list.add(new ListPairBean(language_id,language_name));
    }

    _crb.setLanguageList(language_list);

    _crb.setFirstName(getParameterNonNull("first_name"));
    _crb.setLastName(getParameterNonNull("last_name"));
    _crb.setStateCode(getParameterNonNull("state"));
    _crb.setSchoolId(getParameterLong("school"));
    _crb.setHandle(getParameterNonNull("handle"));
    _crb.setPassword(getParameterNonNull("password"));
    _crb.setConfirmPassword(getParameterNonNull("confirm_password"));
    _crb.setEmail(getParameterNonNull("email"));
    _crb.setConfirmEmail(getParameterNonNull("confirm_email"));
    _crb.setEditorId(getParameterInteger("editor"));
    _crb.setLanguageId(getParameterInteger("language"));
    _crb.setAgreeTerms(getParameterNonNull("terms").equals("true"));

    List school_list=new ArrayList();
    school_list.add(new ListPairBean(null,"Pick a school"));
    if (isValidListValue(_crb.getStateCode(),_crb.getStateList())) {
      map.put(DataAccessConstants.COMMAND,"state_schools");
      map.put(STATE_INPUT_CODE,_crb.getStateCode());
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
    _crb.setSchoolList(school_list);

    TermsOfUseHome touh=(TermsOfUseHome)ctx.lookup(TermsOfUseHome.EJB_REF_NAME);
    TermsOfUse tou=touh.create();
    _crb.setTermsOfUse(tou.getText(TERMS_OF_USE_ID));
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

  private boolean isValidListValue(Object _value,List _list) {
    if (_value==null) {
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

  private boolean isValidCoach(CoachRegistrationBean _crb) {
    HashMap errors=new HashMap();
    boolean is_valid=true;

    /* Check for a valid first name
     */
    String first_name=_crb.getFirstName();

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
    String last_name=_crb.getLastName();

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
    if (!isValidListValue(_crb.getStateCode(),_crb.getStateList())) {
      addErrorMessage(errors,"StateCode",INVALID_STATE_CODE);
      is_valid=false;
    }
    else {

      /* Check for valid school
       */
       if (!isValidListValue(_crb.getSchoolId(),_crb.getSchoolList())) {
         addErrorMessage(errors,"SchoolId",INVALID_SCHOOL_ID);
         is_valid=false;
       }
    }

    /* Check for valid handle
     */
    String handle=_crb.getHandle();

    if (handle==null||handle.length()==0) {
      addErrorMessage(errors,"Handle",HANDLE_NOT_EMPTY);
      is_valid=false;
    }
    else {
      boolean valid_handle=true;
      for (int i=0;i<handle.length();i++) {
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
        boolean technical_problems=false;
        try {
          Context ctx=TCContext.getContext(ApplicationServer.JBOSS_JNDI_FACTORY,
                                           ApplicationServer.SECURITY_HOST);
          PrincipalMgrRemoteHome pmrh=(PrincipalMgrRemoteHome)
                                ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
          PrincipalMgrRemote pmr=pmrh.create();
          try {
            UserPrincipal up=pmr.getUser(handle);
            addErrorMessage(errors,"Handle",HANDLE_TAKEN);
            is_valid=false;
          }
          catch (NoSuchUserException _nsue) {
            /* do nothing */
          }
        }
        catch (RemoteException _re) {
          _re.printStackTrace();
          technical_problems=true;
        }
        catch (CreateException _ce) {
          _ce.printStackTrace();
          technical_problems=true;
        }
        catch (NamingException _ne) {
          _ne.printStackTrace();
          technical_problems=true;
        }
        catch (GeneralSecurityException _gse) {
          _gse.printStackTrace();
          technical_problems=true;
        }
        if (technical_problems) {
          addErrorMessage(errors,"Handle",TECHNICAL_PROBLEMS);
          is_valid=false;
        }
      }
    }

    /* Check for a valid password
     */
    String password=_crb.getPassword();
    String confirm_password=_crb.getConfirmPassword();
    
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
    String email=_crb.getEmail();
    String confirm_email=_crb.getConfirmEmail();

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

    /* Check for valid editor id
     */
    if (!isValidListValue(_crb.getEditorId(),_crb.getEditorList())) {
      addErrorMessage(errors,"EditorId",INVALID_EDITOR_ID);
      is_valid=false;
    }

    /* Check for valid language id
     */
    if (!isValidListValue(_crb.getLanguageId(),_crb.getLanguageList())) {
      addErrorMessage(errors,"LanguageId",INVALID_LANGUAGE_ID);
      is_valid=false;
    }

    /* Check to make sure they agreed to the terms and conditions
     */
    if (!_crb.getAgreeTerms()) {
      addErrorMessage(errors,"AgreeTerms",MUST_AGREE_TERMS);
      is_valid=false;
    }

    request.setAttribute("form_errors",errors);

    return(is_valid);
  }

  private void persistCoach(CoachRegistrationBean _crb) throws Exception {
    UserTransaction utx=null;
    try {
      /*utx=EJBContext.getUserTransaction();
      utx.begin()*/

      Context ctx=TCContext.getContext(ApplicationServer.JBOSS_JNDI_FACTORY,
                                       ApplicationServer.SECURITY_HOST);

      PrincipalMgrRemoteHome pmrh=(PrincipalMgrRemoteHome)
                                ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
      PrincipalMgrRemote pmr=pmrh.create();

      UserPrincipal up;
      up=pmr.createUser(_crb.getHandle(),_crb.getPassword(),new TCSubject(0));
      long user_id=up.getId();

      ctx=TCContext.getInitial();

      UserHome uh=(UserHome)ctx.lookup(UserHome.EJB_REF_NAME);
      User user=uh.create();
      user.createUser(user_id,_crb.getHandle(),'A');
      user.setFirstName(user_id,_crb.getFirstName());
      user.setLastName(user_id,_crb.getLastName());

      UserSchoolHome ush=(UserSchoolHome)
                                        ctx.lookup(UserSchoolHome.EJB_REF_NAME);
      UserSchool user_school=ush.create();
      user_school.createUserSchool(user_id,_crb.getSchoolId().longValue());
      user_school.setCurrent(user_id,_crb.getSchoolId().longValue(),true);

      UserTermsOfUseHome utouh=(UserTermsOfUseHome)
                                    ctx.lookup(UserTermsOfUseHome.EJB_REF_NAME);
      UserTermsOfUse user_terms_of_use=utouh.create();
      user_terms_of_use.createUserTermsOfUse(user_id,TERMS_OF_USE_ID);

      EmailHome eh=(EmailHome)ctx.lookup(EmailHome.EJB_REF_NAME);
      Email email=eh.create();
      long email_id=email.createEmail(user_id);
      email.setEmailTypeId(email_id,user_id,EMAIL_TYPE_ID_PRIMARY);
      email.setAddress(email_id,user_id,_crb.getEmail());

      CoderHome ch=(CoderHome)ctx.lookup(CoderHome.EJB_REF_NAME);
      Coder coder=ch.create();
      coder.createCoder(user_id);
      coder.setMemberSince(user_id,new java.sql.Date(new Date().getTime()));
      coder.setEditorId(user_id,_crb.getEditorId().intValue());
      coder.setLanguageId(user_id,_crb.getLanguageId().intValue());

      RatingHome rh=(RatingHome)ctx.lookup(RatingHome.EJB_REF_NAME);
      Rating rating=rh.create();
      rating.createRating(user_id);

      /*utx.commit();*/
    }
    catch (Exception _e) {
      _e.printStackTrace();
      if (utx!=null) {
        try {
          utx.rollback();
        }
        catch (Exception _e1) {
          /* do nothing */
        }
      }
      throw(_e);
    }
  }

};
