package com.topcoder.web.hs.common;

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
 * This class contains commonly used registration methods
 *
 * @author Nathan Egge
 * @version 1.0 2003/01/15
 */
public class RegistrationHelper {

  private final static String STATE_INPUT_CODE="st";

  private final static String USER_ID_INPUT_CODE="ui";

  private final static String SCHOOL_ID_INPUT_CODE="si";

  private final static long TERMS_OF_USE_ID=1;

  private final static long EMAIL_TYPE_ID_DEFAULT=1;

  private final static char NEW_USER_TYPE='A';

  private final static String STUDENT_GROUP_NAME="Student";

  private final static String COACH_GROUP_NAME="Coach";

  private final static String INCORRECT_GROUP="Cannot processes request "+
                                              "because of wrong group";

  private final static String NO_USER_FOUND="Could not find user information "+
                                            "in our systems";

  private final static String BAD_COACH_COUNT="Could not get coach count for "+
                                              "given school_id";

  private final static String FIRST_NAME_NOT_EMPTY="Ensure that the first "+
                                                  "name field is not empty";

  private final static int MAX_FIRST_NAME_LENGTH=64;

  private final static String FIRST_NAME_TOO_LONG="The first name field must "+
                                                  "be less than 64 characters "+
                                                  "long";

  private final static String LAST_NAME_NOT_EMPTY="Ensure that the last name "+
                                                  "field is not empty";

  private final static int MAX_LAST_NAME_LENGTH=64;

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

  private RegistrationHelper() {
    /* do nothing */
  }

  public static void populateStudentWithDefaults(StudentRegistrationBean _srb) {
    _srb.setUserId(null);
    _srb.setFirstName("");
    _srb.setLastName("");
    _srb.setStateCode("");
    _srb.setSchoolId(new Long(-1));
    _srb.setHandle("");
    _srb.setChangePassword(false);
    _srb.setPassword("");
    _srb.setConfirmPassword("");
    _srb.setEmail("");
    _srb.setConfirmEmail("");
    _srb.setEditorId(new Integer(-1));
    _srb.setLanguageId(new Integer(-1));
    _srb.setAgreeTerms(false);
  }

  public static void populateStudentFromRequest(ServletRequest _request,
                                                StudentRegistrationBean _srb)
                                                              throws Exception {

    _srb.setFirstName(getParameter(_request,"first_name",_srb.getFirstName()));
    _srb.setLastName(getParameter(_request,"last_name",_srb.getLastName()));
    _srb.setStateCode(getParameter(_request,"state_code",_srb.getStateCode()));
    _srb.setSchoolId(getParameterLong(_request,"school_id",_srb.getSchoolId()));
    _srb.setHandle(getParameter(_request,"handle",_srb.getHandle()));
    _srb.setChangePassword("true".equals(getParameter(_request,
                                                      "change_password",
                                                      "false")));
    _srb.setPassword(getParameter(_request,"password",_srb.getPassword()));
    _srb.setConfirmPassword(getParameter(_request,"confirm_password",
                                         _srb.getConfirmPassword()));
    _srb.setEmail(getParameter(_request,"email",_srb.getEmail()));
    _srb.setConfirmEmail(getParameter(_request,"confirm_email",
                                      _srb.getConfirmEmail()));
    _srb.setEditorId(getParameterInteger(_request,"editor_id",
                                         _srb.getEditorId()));
    _srb.setLanguageId(getParameterInteger(_request,"language_id",
                                           _srb.getLanguageId()));
    _srb.setAgreeTerms("true".equals(getParameter(_request,"terms","false")));

  }

  public static void populateStudentFromSession(SessionInfoBean _sib,
                                                StudentRegistrationBean _srb)
                                                              throws Exception {

    if (!_sib.isStudent()) {
      throw(new Exception(INCORRECT_GROUP));
    }

    Context ctx=TCContext.getInitial();
    DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
    DataAccessInt dai=new DataAccess(ds);
    Map map=new HashMap();

    map.put(DataAccessConstants.COMMAND,"student_data");
    map.put(USER_ID_INPUT_CODE,""+_sib.getUserId());
    Request req=new Request(map);
    Map data=dai.getData(req);

    ResultSetContainer rsc;
    ResultSetContainer.ResultSetRow rsr;

    rsc=(ResultSetContainer)data.get("student_data");
    Iterator iterator=rsc.iterator();
    if (!iterator.hasNext()) {
      throw(new Exception(NO_USER_FOUND));
    }
    rsr=(ResultSetContainer.ResultSetRow)iterator.next();

    _srb.setUserId(new Long(_sib.getUserId()));
    _srb.setHandle(_sib.getHandle());

    _srb.setFirstName((String)rsr.getItem("first_name").getResultData());
    _srb.setLastName((String)rsr.getItem("last_name").getResultData());
    _srb.setStateCode((String)rsr.getItem("state_code").getResultData());
    _srb.setSchoolId((Long)rsr.getItem("school_id").getResultData());
    _srb.setEmail((String)rsr.getItem("address").getResultData());
    _srb.setConfirmEmail((String)rsr.getItem("address").getResultData());
    _srb.setEditorId((Integer)rsr.getItem("editor_id").getResultData());
    _srb.setLanguageId((Integer)rsr.getItem("language_id").getResultData());
  }

  public static void populateStudentStaticContent(StudentRegistrationBean _srb)
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
        String full_name=(String)rsr.getItem("full_name").getResultData();
        school_list.add(new ListPairBean(school_id,full_name));
      }

    }
    _srb.setSchoolList(school_list);

    TermsOfUseHome touh=(TermsOfUseHome)ctx.lookup(TermsOfUseHome.EJB_REF_NAME);
    TermsOfUse tou=touh.create();
    _srb.setTermsOfUse(tou.getText(TERMS_OF_USE_ID));
  }

  public static void populateSchoolCoachCount(StudentRegistrationBean _srb)
                                                              throws Exception {

    Context ctx=TCContext.getInitial();
    DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
    DataAccessInt dai=new DataAccess(ds);
    Map map=new HashMap();

    map.put(DataAccessConstants.COMMAND,"school_coach_count");
    map.put(SCHOOL_ID_INPUT_CODE,""+_srb.getSchoolId());
    Request req=new Request(map);
    Map data=dai.getData(req);

    ResultSetContainer rsc;
    ResultSetContainer.ResultSetRow rsr;

    rsc=(ResultSetContainer)data.get("school_coach_count");

    Iterator iterator=rsc.iterator();
    if (!iterator.hasNext()) {
      throw(new Exception(BAD_COACH_COUNT));
    }
    rsr=(ResultSetContainer.ResultSetRow)iterator.next();
    _srb.setSchoolCoachCount((Long)rsr.getItem("coach_count").getResultData());
  }

  public static boolean isValidStudent(Map _errors,
                                       StudentRegistrationBean _srb)
                                                              throws Exception {
    boolean valid=true;
    valid&=checkValidFirstName(_errors,_srb.getFirstName());
    valid&=checkValidLastName(_errors,_srb.getLastName());
    valid&=(checkValidState(_errors,_srb.getStateCode(),_srb.getStateList())&&
            checkValidSchool(_errors,_srb.getSchoolId(),_srb.getSchoolList()));
    valid&=(_srb.getUserId()!=null||checkValidHandle(_errors,_srb.getHandle()));
    valid&=(!_srb.getChangePassword()||
      checkValidPassword(_errors,_srb.getPassword(),_srb.getConfirmPassword()));
    valid&=checkValidEmail(_errors,_srb.getEmail(),_srb.getConfirmEmail());
    valid&=checkValidEditor(_errors,_srb.getEditorId(),
                            _srb.getEditorList());
    valid&=checkValidLanguage(_errors,_srb.getLanguageId(),
                              _srb.getLanguageList());
    valid&=(_srb.getUserId()!=null||
            checkAgreeTerms(_errors,_srb.getAgreeTerms()));
    return(valid);
  }

  public static void createStudent(StudentRegistrationBean _srb)
                                                              throws Exception {
    /* !!This is bad!! Because the persisting is done in a web container, or
    * servlet, its not possible to use EJBContext.getUserTransaction(). Instead
    * we simply get a UserTransaction object for each database we are accessing.
    * The problem is that both commits cannot happen atomically. Hence errors in
    * one database will not force a rollback in another. This should be fixed!
    */
    UserTransaction utx=null;

    try {
      /*utx=EJBContext.getUserTransaction();
      utx.begin();*/

      Context ctx=TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                                       ApplicationServer.SECURITY_PROVIDER_URL);

      /* this doesn't work because the JBoss ctx doesn't support transactions */
      /*utx_common=(UserTransaction)
                                ctx.lookup("javax.transaction.UserTransaction");
      utx_common.begin();*/

      PrincipalMgrRemoteHome pmrh=(PrincipalMgrRemoteHome)
                                ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
      PrincipalMgrRemote pmr=pmrh.create();

      TCSubject tcs=new TCSubject(0);
      UserPrincipal up=pmr.createUser(_srb.getHandle(),_srb.getPassword(),tcs);
      long user_id=up.getId();

      Collection groups=pmr.getGroups(tcs);
      for (Iterator iterator=groups.iterator();iterator.hasNext();) {
        GroupPrincipal gp=(GroupPrincipal)iterator.next();
        if (gp.getName().equals(STUDENT_GROUP_NAME)) {
          pmr.addUserToGroup(gp,up,tcs);
        }
      }

      ctx=TCContext.getInitial();

      utx=(UserTransaction)ctx.lookup("javax.transaction.UserTransaction");
      utx.begin();

      UserHome uh=(UserHome)ctx.lookup(UserHome.EJB_REF_NAME);
      User user=uh.create();
      user.createUser(user_id,_srb.getHandle(),NEW_USER_TYPE);
      user.setFirstName(user_id,_srb.getFirstName());
      user.setLastName(user_id,_srb.getLastName());

      UserSchoolHome ush=(UserSchoolHome)
                                        ctx.lookup(UserSchoolHome.EJB_REF_NAME);
      UserSchool user_school=ush.create();
      user_school.createUserSchool(user_id,_srb.getSchoolId().longValue());
      user_school.setCurrentUserSchoolId(user_id,
                                         _srb.getSchoolId().longValue());

      EmailHome eh=(EmailHome)ctx.lookup(EmailHome.EJB_REF_NAME);
      Email email=eh.create();
      long email_id=email.createEmail(user_id);
      email.setPrimaryEmailId(user_id,email_id);
      email.setAddress(email_id,_srb.getEmail());
      email.setEmailTypeId(email_id,EMAIL_TYPE_ID_DEFAULT);

      CoderHome ch=(CoderHome)ctx.lookup(CoderHome.EJB_REF_NAME);
      Coder coder=ch.create();
      coder.createCoder(user_id);
      coder.setMemberSince(user_id,new java.sql.Date(new Date().getTime()));
      coder.setEditorId(user_id,_srb.getEditorId().intValue());
      coder.setLanguageId(user_id,_srb.getLanguageId().intValue());

      UserTermsOfUseHome utouh=(UserTermsOfUseHome)
                                    ctx.lookup(UserTermsOfUseHome.EJB_REF_NAME);
      UserTermsOfUse user_terms_of_use=utouh.create();
      user_terms_of_use.createUserTermsOfUse(user_id,TERMS_OF_USE_ID);

      RatingHome rh=(RatingHome)ctx.lookup(RatingHome.EJB_REF_NAME);
      Rating rating=rh.create();
      rating.createRating(user_id);

      utx.commit();
    }
    catch (Exception _e) {
      _e.printStackTrace();
      if (utx!=null) {
        try {
          utx.rollback();
        }
        catch (Exception _ex) {
          /* log it */
        }
      }
      throw(_e);
    }
  }

  public static void updateStudent(StudentRegistrationBean _srb)
                                                              throws Exception {

    /* This is bad, please see above comment */
    UserTransaction utx=null;

    try {
      /*utx=EJBContext.getUserTransaction();
      utx.begin();*/

      Context ctx;

      if (_srb.getChangePassword()) {
        ctx=TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                                 ApplicationServer.SECURITY_PROVIDER_URL);

        PrincipalMgrRemoteHome pmrh=(PrincipalMgrRemoteHome)
                                ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr=pmrh.create();

        TCSubject tcs=new TCSubject(0);

        UserPrincipal up=pmr.getUser(_srb.getHandle());
        pmr.editPassword(up,_srb.getPassword(),tcs);
      }

      ctx=TCContext.getInitial();

      utx=(UserTransaction)ctx.lookup("javax.transaction.UserTransaction");
      utx.begin();

      UserHome uh=(UserHome)ctx.lookup(UserHome.EJB_REF_NAME);
      User user=uh.create();
      long user_id=_srb.getUserId().longValue();
      user.setFirstName(user_id,_srb.getFirstName());
      user.setLastName(user_id,_srb.getLastName());

      UserSchoolHome ush=(UserSchoolHome)
                                        ctx.lookup(UserSchoolHome.EJB_REF_NAME);
      UserSchool user_school=ush.create();
      long school_id=_srb.getSchoolId().longValue();
      if (user_school.existsUserSchoolId(user_id,school_id)) {
        user_school.setCurrentUserSchoolId(user_id,school_id);
      }
      else {
        user_school.createUserSchool(user_id,school_id);
        user_school.setCurrentUserSchoolId(user_id,school_id);
      }

      EmailHome eh=(EmailHome)ctx.lookup(EmailHome.EJB_REF_NAME);
      Email email=eh.create();
      long email_id=email.createEmail(user_id);
      email.setPrimaryEmailId(user_id,email_id);
      email.setAddress(email_id,_srb.getEmail());
      email.setEmailTypeId(email_id,EMAIL_TYPE_ID_DEFAULT);

      CoderHome ch=(CoderHome)ctx.lookup(CoderHome.EJB_REF_NAME);
      Coder coder=ch.create();
      coder.setEditorId(user_id,_srb.getEditorId().intValue());
      coder.setLanguageId(user_id,_srb.getLanguageId().intValue());

      utx.commit();
    }
    catch (Exception _e) {
      _e.printStackTrace();
      if (utx!=null) {
        try {
          utx.rollback();
        }
        catch (Exception _ex) {
          /* log it */
        }
      }
      throw(_e);
    }
  }

  public static void populateCoachWithDefaults(CoachRegistrationBean _crb) {
    _crb.setUserId(null);
    _crb.setFirstName("");
    _crb.setLastName("");
    _crb.setStateCode("");
    _crb.setSchoolId(new Long(-1));
    _crb.setHandle("");
    _crb.setChangePassword(false);
    _crb.setPassword("");
    _crb.setConfirmPassword("");
    _crb.setEmail("");
    _crb.setConfirmEmail("");
    _crb.setEditorId(new Integer(-1));
    _crb.setLanguageId(new Integer(-1));
    _crb.setAgreeTerms(false);
  }

  public static void populateCoachFromRequest(ServletRequest _request,
                                              CoachRegistrationBean _crb)
                                                              throws Exception {

    _crb.setFirstName(getParameter(_request,"first_name",_crb.getFirstName()));
    _crb.setLastName(getParameter(_request,"last_name",_crb.getLastName()));
    _crb.setStateCode(getParameter(_request,"state_code",_crb.getStateCode()));
    _crb.setSchoolId(getParameterLong(_request,"school_id",_crb.getSchoolId()));
    _crb.setHandle(getParameter(_request,"handle",_crb.getHandle()));
    _crb.setChangePassword("true".equals(getParameter(_request,
                                                      "change_password",
                                                      "false")));
    _crb.setPassword(getParameter(_request,"password",_crb.getPassword()));
    _crb.setConfirmPassword(getParameter(_request,"confirm_password",
                                         _crb.getConfirmPassword()));
    _crb.setEmail(getParameter(_request,"email",_crb.getEmail()));
    _crb.setConfirmEmail(getParameter(_request,"confirm_email",
                                      _crb.getConfirmEmail()));
    _crb.setEditorId(getParameterInteger(_request,"editor_id",
                                         _crb.getEditorId()));
    _crb.setLanguageId(getParameterInteger(_request,"language_id",
                                           _crb.getLanguageId()));
    _crb.setAgreeTerms("true".equals(getParameter(_request,"terms","false")));

  }

  public static void populateCoachFromSession(SessionInfoBean _sib,
                                              CoachRegistrationBean _crb)
                                                              throws Exception {

    if (!_sib.isCoach()) {
      throw(new Exception(INCORRECT_GROUP));
    }

    Context ctx=TCContext.getInitial();
    DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
    DataAccessInt dai=new DataAccess(ds);
    Map map=new HashMap();

    map.put(DataAccessConstants.COMMAND,"coach_data");
    map.put(USER_ID_INPUT_CODE,""+_sib.getUserId());
    Request req=new Request(map);
    Map data=dai.getData(req);

    ResultSetContainer rsc;
    ResultSetContainer.ResultSetRow rsr;

    rsc=(ResultSetContainer)data.get("coach_data");
    Iterator iterator=rsc.iterator();
    if (!iterator.hasNext()) {
      throw(new Exception(NO_USER_FOUND));
    }
    rsr=(ResultSetContainer.ResultSetRow)iterator.next();

    _crb.setUserId(new Long(_sib.getUserId()));
    _crb.setHandle(_sib.getHandle());

    _crb.setFirstName((String)rsr.getItem("first_name").getResultData());
    _crb.setLastName((String)rsr.getItem("last_name").getResultData());
    _crb.setStateCode((String)rsr.getItem("state_code").getResultData());
    _crb.setSchoolId((Long)rsr.getItem("school_id").getResultData());
    _crb.setEmail((String)rsr.getItem("address").getResultData());
    _crb.setConfirmEmail((String)rsr.getItem("address").getResultData());
    _crb.setEditorId((Integer)rsr.getItem("editor_id").getResultData());
    _crb.setLanguageId((Integer)rsr.getItem("language_id").getResultData());
  }

  public static void populateCoachStaticContent(CoachRegistrationBean _crb)
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
        String full_name=(String)rsr.getItem("full_name").getResultData();
        school_list.add(new ListPairBean(school_id,full_name));
      }

    }
    _crb.setSchoolList(school_list);

    TermsOfUseHome touh=(TermsOfUseHome)ctx.lookup(TermsOfUseHome.EJB_REF_NAME);
    TermsOfUse tou=touh.create();
    _crb.setTermsOfUse(tou.getText(TERMS_OF_USE_ID));
  }

  public static boolean isValidCoach(Map _errors,
                                     CoachRegistrationBean _crb)
                                                              throws Exception {
    boolean valid=true;
    valid&=checkValidFirstName(_errors,_crb.getFirstName());
    valid&=checkValidLastName(_errors,_crb.getLastName());
    valid&=(checkValidState(_errors,_crb.getStateCode(),_crb.getStateList())&&
            checkValidSchool(_errors,_crb.getSchoolId(),_crb.getSchoolList()));
    valid&=(_crb.getUserId()!=null||checkValidHandle(_errors,_crb.getHandle()));
    valid&=(!_crb.getChangePassword()||
      checkValidPassword(_errors,_crb.getPassword(),_crb.getConfirmPassword()));
    valid&=checkValidEmail(_errors,_crb.getEmail(),_crb.getConfirmEmail());
    valid&=checkValidEditor(_errors,_crb.getEditorId(),
                            _crb.getEditorList());
    valid&=checkValidLanguage(_errors,_crb.getLanguageId(),
                              _crb.getLanguageList());
    valid&=(_crb.getUserId()!=null||
            checkAgreeTerms(_errors,_crb.getAgreeTerms()));
    return(valid);
  }

  public static void createCoach(CoachRegistrationBean _crb)
                                                              throws Exception {
    /* !!This is a hack!! Because the persisting is done in a web container, or
    * servlet, its not possible to use EJBContext.getUserTransaction(). Instead
    * we simply get a UserTransaction object for each database we are accessing.
    * The problem is that both commits cannot happen atomically. Hence errors in
    * one database will not force a rollback in another. This should be fixed!
    */
    UserTransaction utx_common=null;
    UserTransaction utx_tchs=null;

    try {
      /*utx=EJBContext.getUserTransaction();
      utx.begin();*/

      Context ctx=TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                                       ApplicationServer.SECURITY_PROVIDER_URL);

      // this doesn't work because the JBoss context doesn't support
      // transactions
      /*utx_common=(UserTransaction)
                                ctx.lookup("javax.transaction.UserTransaction");
      utx_common.begin();*/

      PrincipalMgrRemoteHome pmrh=(PrincipalMgrRemoteHome)
                                ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
      PrincipalMgrRemote pmr=pmrh.create();

      TCSubject tcs=new TCSubject(0);
      UserPrincipal up=pmr.createUser(_crb.getHandle(),_crb.getPassword(),tcs);
      long user_id=up.getId();

      Collection groups=pmr.getGroups(tcs);
      for (Iterator iterator=groups.iterator();iterator.hasNext();) {
        GroupPrincipal gp=(GroupPrincipal)iterator.next();
        if (gp.getName().equals(COACH_GROUP_NAME)) {
          pmr.addUserToGroup(gp,up,tcs);
        }
      }

      ctx=TCContext.getInitial();

      utx_tchs=(UserTransaction)ctx.lookup("javax.transaction.UserTransaction");
      utx_tchs.begin();

      UserHome uh=(UserHome)ctx.lookup(UserHome.EJB_REF_NAME);
      User user=uh.create();
      user.createUser(user_id,_crb.getHandle(),NEW_USER_TYPE);
      user.setFirstName(user_id,_crb.getFirstName());
      user.setLastName(user_id,_crb.getLastName());

      UserSchoolHome ush=(UserSchoolHome)
                                        ctx.lookup(UserSchoolHome.EJB_REF_NAME);
      UserSchool user_school=ush.create();
      user_school.createUserSchool(user_id,_crb.getSchoolId().longValue());
      user_school.setCurrentUserSchoolId(user_id,
                                         _crb.getSchoolId().longValue());

      EmailHome eh=(EmailHome)ctx.lookup(EmailHome.EJB_REF_NAME);
      Email email=eh.create();
      long email_id=email.createEmail(user_id);
      email.setPrimaryEmailId(user_id,email_id);
      email.setAddress(email_id,_crb.getEmail());
      email.setEmailTypeId(email_id,EMAIL_TYPE_ID_DEFAULT);

      CoderHome ch=(CoderHome)ctx.lookup(CoderHome.EJB_REF_NAME);
      Coder coder=ch.create();
      coder.createCoder(user_id);
      coder.setMemberSince(user_id,new java.sql.Date(new Date().getTime()));
      coder.setEditorId(user_id,_crb.getEditorId().intValue());
      coder.setLanguageId(user_id,_crb.getLanguageId().intValue());

      UserTermsOfUseHome utouh=(UserTermsOfUseHome)
                                    ctx.lookup(UserTermsOfUseHome.EJB_REF_NAME);
      UserTermsOfUse user_terms_of_use=utouh.create();
      user_terms_of_use.createUserTermsOfUse(user_id,TERMS_OF_USE_ID);

      RatingHome rh=(RatingHome)ctx.lookup(RatingHome.EJB_REF_NAME);
      Rating rating=rh.create();
      rating.createRating(user_id);

      /*utx.commit();*/

      /*utx_common.commit();*/
      utx_tchs.commit();
    }
    catch (Exception _e) {
      _e.printStackTrace();
      /*if (utx!=null) {
        try {
          utx.rollback();
        }
        catch (Exception _e1) {

      }*/
      if (utx_common!=null) {
        try {
          utx_common.rollback();
        }
        catch (Exception _ex) {
        }
      }
      if (utx_tchs!=null) {
        try {
          utx_tchs.rollback();
        }
        catch (Exception _ex) {
        }
      }
      throw(_e);
    }
  }

  public static void updateCoach(CoachRegistrationBean _crb) throws Exception {

    /* This is bad, please see above comment */
    UserTransaction utx=null;

    try {
      /*utx=EJBContext.getUserTransaction();
      utx.begin();*/

      Context ctx;

      if (_crb.getChangePassword()) {
        ctx=TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                                 ApplicationServer.SECURITY_PROVIDER_URL);

        PrincipalMgrRemoteHome pmrh=(PrincipalMgrRemoteHome)
                                ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr=pmrh.create();

        TCSubject tcs=new TCSubject(0);

        UserPrincipal up=pmr.getUser(_crb.getHandle());
        pmr.editPassword(up,_crb.getPassword(),tcs);
      }

      ctx=TCContext.getInitial();

      utx=(UserTransaction)ctx.lookup("javax.transaction.UserTransaction");
      utx.begin();

      UserHome uh=(UserHome)ctx.lookup(UserHome.EJB_REF_NAME);
      User user=uh.create();
      long user_id=_crb.getUserId().longValue();
      user.setFirstName(user_id,_crb.getFirstName());
      user.setLastName(user_id,_crb.getLastName());

      UserSchoolHome ush=(UserSchoolHome)
                                        ctx.lookup(UserSchoolHome.EJB_REF_NAME);
      UserSchool user_school=ush.create();
      long school_id=_crb.getSchoolId().longValue();
      if (user_school.existsUserSchoolId(user_id,school_id)) {
        user_school.setCurrentUserSchoolId(user_id,school_id);
      }
      else {
        user_school.createUserSchool(user_id,school_id);
        user_school.setCurrentUserSchoolId(user_id,school_id);
      }

      EmailHome eh=(EmailHome)ctx.lookup(EmailHome.EJB_REF_NAME);
      Email email=eh.create();
      long email_id=email.createEmail(user_id);
      email.setPrimaryEmailId(user_id,email_id);
      email.setAddress(email_id,_crb.getEmail());
      email.setEmailTypeId(email_id,EMAIL_TYPE_ID_DEFAULT);

      CoderHome ch=(CoderHome)ctx.lookup(CoderHome.EJB_REF_NAME);
      Coder coder=ch.create();
      coder.setEditorId(user_id,_crb.getEditorId().intValue());
      coder.setLanguageId(user_id,_crb.getLanguageId().intValue());

      utx.commit();
    }
    catch (Exception _e) {
      _e.printStackTrace();
      if (utx!=null) {
        try {
          utx.rollback();
        }
        catch (Exception _ex) {
          /* log it */
        }
      }
      throw(_e);
    }
  }

  private static String getParameter(ServletRequest _request,String _param,
                                     String _default) {
    String value=_request.getParameter(_param);
    return(value==null||value.trim().length()==0?_default:value.trim());
  }

  private static Long getParameterLong(ServletRequest _request,String _param,
                                       Long _default) {
    Long value=_default;
    try {
      value=new Long(_request.getParameter(_param));
    }
    catch (NumberFormatException _nfe) {
      /* do nothing */
    }
    return(value);
  }

  private static Integer getParameterInteger(ServletRequest _request,
                                             String _param,Integer _default) {
    Integer value=_default;
    try {
      value=new Integer(_request.getParameter(_param));
    }
    catch (NumberFormatException _nfe) {
      /* do nothing */
    }
    return(value);
  }

  private static boolean isValidListValue(Object _value,List _list) {
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


  /**
   * Check for a valid first name
   */
  private static boolean checkValidFirstName(Map _errors,String _first_name) {
    if (_first_name==null||_first_name.length()==0) {
      addErrorMessage(_errors,"FirstName",FIRST_NAME_NOT_EMPTY);
      return(false);
    }
    else {
      if (_first_name.length()>=MAX_FIRST_NAME_LENGTH) {
        addErrorMessage(_errors,"FirstName",FIRST_NAME_TOO_LONG);
        return(false);
      }
    }
    return(true);
  }

  /**
   * Check for a valid last name
   */
  private static boolean checkValidLastName(Map _errors,String _last_name) {
    if (_last_name==null||_last_name.length()==0) {
      addErrorMessage(_errors,"LastName",LAST_NAME_NOT_EMPTY);
      return(false);
    }
    else {
      if (_last_name.length()>=MAX_LAST_NAME_LENGTH) {
        addErrorMessage(_errors,"LastName",LAST_NAME_TOO_LONG);
        return(false);
      }
    }
    return(true);
  }

  /**
   * Check for valid state code
   */
  private static boolean checkValidState(Map _errors,String _state_code,
                                         List _list) {
    if (!isValidListValue(_state_code,_list)) {
      addErrorMessage(_errors,"StateCode",INVALID_STATE_CODE);
      return(false);
    }
    return(true);
  }

  private static void addErrorMessage(Map _errors,String _key,String _message) {
    List msgs=(List)_errors.get(_key);
    if (msgs==null) {
      msgs=new ArrayList();
      _errors.put(_key,msgs);
    }
    msgs.add(_message);
  }

  /**
   * Check for valid school
   */
  private static boolean checkValidSchool(Map _errors,Long _school_id,
                                          List _list) {
    if (!isValidListValue(_school_id,_list)) {
      addErrorMessage(_errors,"SchoolId",INVALID_SCHOOL_ID);
      return(false);
    }
    return(true);
  }

  /**
   * Check for valid handle
   */
  private static boolean checkValidHandle(Map _errors,String _handle)
                                                              throws Exception {
    if (_handle==null||_handle.length()==0) {
      addErrorMessage(_errors,"Handle",HANDLE_NOT_EMPTY);
      return(false);
    }
    else {
      for (int i=0;i<_handle.length();i++) {
        if (HANDLE_ALPHABET.indexOf(_handle.charAt(i))==-1) {
          addErrorMessage(_errors,"Handle",INVALID_HANDLE);
          return(false);
        }
      }
      boolean technical_problems=false;
      try {
        Context ctx=TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                                         ApplicationServer.SECURITY_PROVIDER_URL);
        PrincipalMgrRemoteHome pmrh=(PrincipalMgrRemoteHome)
                                ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr=pmrh.create();
        try {
          UserPrincipal up=pmr.getUser(_handle);
          addErrorMessage(_errors,"Handle",HANDLE_TAKEN);
          return(false);
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
        throw(new Exception(TECHNICAL_PROBLEMS));
      }
    }
    return(true);
  }

  /**
   * Check for a valid password
   */
  private static boolean checkValidPassword(Map _errors,String _password,
                                            String _confirm_password) {
    if (_password==null||_password.length()==0) {
      addErrorMessage(_errors,"Password",PASSWORD_NOT_EMPTY);
      return(false);
    }
    else {
      if (_password.length()<7||_password.length()>15) {
        addErrorMessage(_errors,"Password",PASSWORD_WRONG_LENGTH);
        return(false);
      }
      else {
        if (!_password.equals(_confirm_password)) {
          addErrorMessage(_errors,"Password",PASSWORD_NO_MATCH);
          return(false);
        }
      }
    }
    return(true);
  }


  /**
   * Check for valid email address
   */
  private static boolean checkValidEmail(Map _errors,String _email,
                                         String _confirm_email) {
    if (_email==null||_email.length()==0) {
      addErrorMessage(_errors,"Email",EMAIL_NOT_EMPTY);
      return(false);
    }
    else {
      if (_email.length()<5||_email.indexOf("@")<0||_email.indexOf(".")<0) {
        addErrorMessage(_errors,"Email",INVALID_EMAIL);
        return(false);
      }
      else {
        if (!_email.equals(_confirm_email)) {
          addErrorMessage(_errors,"Email",EMAIL_NO_MATCH);
          return(false);
        }
      }
    }
    return(true);
  }

  /**
   * Check for valid editor id
   */
  private static boolean checkValidEditor(Map _errors,Integer _editor_id,
                                          List _editor_list) {
    if (!isValidListValue(_editor_id,_editor_list)) {
      addErrorMessage(_errors,"EditorId",INVALID_EDITOR_ID);
      return(false);
    }
    return(true);
  }

  /**
   * Check for valid language id
   */
  private static boolean checkValidLanguage(Map _errors,Integer _language_id,
                                            List _language_list) {
    if (!isValidListValue(_language_id,_language_list)) {
      addErrorMessage(_errors,"LanguageId",INVALID_LANGUAGE_ID);
      return(false);
    }
    return(true);
  }
 
  /**
   * Check to make sure they agreed to the terms and conditions
   */
  private static boolean checkAgreeTerms(Map _errors,boolean _agree_terms) {
    if (!_agree_terms) {
      addErrorMessage(_errors,"AgreeTerms",MUST_AGREE_TERMS);
    }
    return(_agree_terms);
  } 

};
