package com.topcoder.ejb.UserServices;

import java.util.*;
import java.io.*;
import javax.transaction.*;
import java.sql.*;
import com.topcoder.common.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.shared.docGen.xml.*;


final class UserDbCoder {


  private static boolean VERBOSE = false;



///////////////////////////////////////////////////////////////////////////////
//                                 INSERT
///////////////////////////////////////////////////////////////////////////////



  ///////////////////////////////////////////////////////////////
  static void insertCoder ( Connection conn, CoderRegistration coder ) 
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:insertCoder() called ..." );
    boolean demogError    = false;
    PreparedStatement ps  = null;
    //ArrayList schools     = null;
    //ArrayList educations  = null;
    //ArrayList skills      = null;
    //ArrayList experiences = null;
    //ArrayList texts       = null;
    //ArrayList jobPrefs    = null;
    ArrayList demographicResponses = null;
    StringBuffer query = new StringBuffer(500);
    query.append ( " INSERT INTO"                                          );
    query.append (   " coder ("                                            );
    query.append (     " coder_id"                                         );
    query.append (     " ,first_name"                                      );
    query.append (     " ,last_name"                                       );
    query.append (     " ,middle_name"                                     );
    query.append (     " ,address1"                                        );
    query.append (     " ,address2"                                        );   
    query.append (     " ,city"                                            );   
    query.append (     " ,state_code"                                      );   
    query.append (     " ,country_code"                                    );   
    query.append (     " ,zip"                                             );   
    query.append (     " ,home_phone"                                      );
    query.append (     " ,work_phone"                                      );
    query.append (     " ,activation_code"                                 );
    query.append (     " ,notify"                                          );
    query.append (     " ,quote"                                           );
    query.append (     " ,member_since"                                    );
    query.append (     " ,editor_id"                                       );   
    query.append (     " ,language_id"                                     );
    query.append (     " ,coder_type_id"                                   );
    query.append (   " )"                                                  );
    query.append ( " VALUES ("                                             );
    query.append (   " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? "       );
    query.append (   " ,CURRENT,"                                          );
    query.append (   " ?, ?, ?)"                                           );
    try {
      State states = coder.getHomeState();
      Country country = coder.getHomeCountry();
      Editor editorType = coder.getEditor();
      ps = conn.prepareStatement ( query.toString()   );
      ps.setInt      ( 1,  coder.getCoderId        () );
      ps.setString   ( 2,  coder.getFirstName      () );
      ps.setString   ( 3,  coder.getLastName       () );
      ps.setString   ( 4,  coder.getMiddleName     () );
      ps.setString   ( 5,  coder.getHomeAddress1   () );
      ps.setString   ( 6,  coder.getHomeAddress2   () );
      ps.setString   ( 7,  coder.getHomeCity       () );
      ps.setString   ( 8,  states.getStateCode     () );
      ps.setString   ( 9,  country.getCountryCode  () );
      ps.setString   ( 10, coder.getHomeZip        () );
      ps.setString   ( 11, coder.getHomePhone      () );
      ps.setString   ( 12, coder.getWorkPhone      () );
      ps.setString   ( 13, coder.getActivationCode () );
      ps.setString   ( 14, coder.getNotify         () );
      ps.setString   ( 15, coder.getQuote          () );
      ps.setInt      ( 16, editorType.getEditorId     () );
      ps.setInt      ( 17, coder.getLanguage().getLanguageId() );
      ps.setInt      ( 18, coder.getCoderType().getCoderTypeId() );
      int RetVal = ps.executeUpdate();
      if (RetVal != 1) {
        throw new TCException ( 
          "ejb.User.UserDbCoder:insertCoder():failed:\n" 
        );
      }
      coder.getRating().setCoderId ( coder.getCoderId() );
      insertRating ( conn, coder.getRating() );
/*
      schools = coder.getSchools();
      for (int i = 0; i < schools.size(); i++)  {
        School school = (School) schools.get(i);
        school.setUserId ( coder.getCoderId() );
        insertCoderSchool( conn, school );
      }
      educations = coder.getEducations();
      for (int i = 0; i < educations.size(); i++)  {
        Education education = (Education) educations.get(i);
        education.setCoderId ( coder.getCoderId() );
        insertCoderEducation ( conn, education );
      }
      skills = coder.getSkills();
      for (int i = 0; i < skills.size(); i++)  {
        CoderSkill skill = (CoderSkill) skills.get(i);
        skill.setCoderId ( coder.getCoderId() );
        insertCoderSkill( conn, skill );
      }
      experiences = coder.getExperiences();
      for (int i = 0; i < experiences.size(); i++)  {
        Experience experience = (Experience) experiences.get(i);
        experience.setCoderId ( coder.getCoderId() );
        insertExperience( conn, experience );
      }
*/
      ArrayList notifications = coder.getNotifications();
      if ( notifications.size() == 0 )
      {
          insertCoderNotify ( conn, coder.getCoderId(), 0 );
      }
      else
      {
        for ( int i = 0; i < notifications.size(); i++ )  {
          Notify notify = (Notify) notifications.get(i);
          insertCoderNotify ( conn, coder.getCoderId(), notify.getNotifyId() );
        }
      }
      coder.getCoderReferral().setCoderId ( coder.getCoderId() );
      insertCoderReferral ( conn, coder.getCoderReferral() );
      coder.getCurrentSchool().setUserId ( coder.getCoderId() );
      insertCurrentSchool ( conn, coder.getCurrentSchool() );
      demographicResponses = coder.getDemographicResponses();
      HashSet qIdsForCoderType = getDemographicQuestionIds ( conn, coder.getCoderType().getCoderTypeId() );
      demogError = true;
      //int inserted = 0;
      for (int i=0; i<demographicResponses.size(); i++) {
        DemographicResponse demographicResponse = (DemographicResponse) demographicResponses.get(i);
        if ( qIdsForCoderType != null && qIdsForCoderType.contains(new Integer(demographicResponse.getDemographicQuestionId())) ) {
          demographicResponse.setCoderId(coder.getCoderId());
          insertDemographicResponse(conn, demographicResponse);
          //inserted++;
        } else {
          if ( qIdsForCoderType != null ) {
            demographicResponses.remove(i);
            i--;
          } 
        }
      }
      //if ( inserted != qIdsForCoderType.size() ) throw new TCException ( "INCORRECT NUMBER OF DEMOG INFO INSERTED!!!" );
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      if ( demogError ) {
        demographicResponses = coder.getDemographicResponses();
        XMLDocument err = new XMLDocument ( "DEMOG_ERROR_FULL_LIST" );
        try {
          err.addTag ( RecordTag.getListXML("DEMOGS",demographicResponses) );
        } catch ( Exception ignore ) {}
        Log.msg ( err.getXML(2) );
      }
      StringBuffer msg = new StringBuffer ( 300 );
      msg.append ( "ejb.User.UserDbCoder:insertCoder:" );
      msg.append ( "coderId=" );
      msg.append ( coder.getCoderId() );
      msg.append ( ":failed:\n" );
      msg.append ( ex );
      throw new TCException ( msg.toString() );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }

  ///////////////////////////////////////////////////////////////
  private static void insertCoderReferral(Connection conn, CoderReferral coderReferral) throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:insertCoderReferral():called." );
    PreparedStatement ps = null;
    String query = "INSERT INTO coder_referral (coder_id, referral_id, reference_id, other) VALUES (?, ?, ?, ?)";
    try {
      ps = conn.prepareStatement ( query                      );
      ps.setInt ( 1, coderReferral.getCoderId()                );
      ps.setInt ( 2, coderReferral.getReferral().getReferralId() );
      ps.setInt ( 3, coderReferral.getReferenceId() );
      ps.setString ( 4, coderReferral.getOther() );
      int RetVal = ps.executeUpdate();
      coderReferral.setModified("S");
    } catch (SQLException sqe) {
      Log.msg("coder id: " + coderReferral.getCoderId());
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex )  {
      Log.msg("coder id: " + coderReferral.getCoderId());
      StringBuffer msg = new StringBuffer ( 500 );
      msg.append ( "ejb.User.UserDbCoder:insertCoderReferral():" );
      if ( coderReferral != null ) {
        XMLDocument errDoc = new XMLDocument ( "ERROR" );
        try {
          errDoc.addTag ( coderReferral.getXML() );
        } catch ( Exception ignore ) {}
        msg.append ( errDoc.getXML() );
      }
      msg.append ( "\nfailed:\n" );
      msg.append ( ex );
      throw new TCException ( msg.toString() );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }


  /////////////////////////////////////////////////////////////////////////////////////////////////////////
  private static void insertCoderNotify ( Connection conn, int coderId, int notifyId ) throws TCException {
  /////////////////////////////////////////////////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:insertCoderNotify():called." );
    PreparedStatement ps = null;
    String query = "INSERT INTO coder_notify (coder_id, notify_id) VALUES (?, ?)";
    try {
      ps = conn.prepareStatement ( query  );
      ps.setInt ( 1, coderId );
      ps.setInt ( 2, notifyId );
      ps.executeUpdate();
    } catch (SQLException sqe) {
      Log.msg("coder id: " + coderId);
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex )  {
      ex.printStackTrace();
      throw new TCException ( ex.getMessage() );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }


  //////////////////////////////////////////////////////////////////////////////////////////////////////
  private static void insertCurrentSchool ( Connection conn, School currentSchool ) throws TCException {
  //////////////////////////////////////////////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:insertCurrentSchool():called." );
    PreparedStatement ps = null;
    String query = "INSERT INTO current_school ( coder_id, school_id, school_name ) VALUES ( ?, ?, ? )";
    try {
      ps = conn.prepareStatement ( query );
      ps.setInt ( 1, currentSchool.getUserId() );
      ps.setInt ( 2, currentSchool.getSchoolId() );
      ps.setString ( 3, currentSchool.getName() );
      int RetVal = ps.executeUpdate();
      currentSchool.setModified("S");
    } catch (SQLException sqe) {
      Log.msg("coder id: " + currentSchool.getUserId());
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex )  {
      Log.msg("coder id: " + currentSchool.getUserId());
      StringBuffer msg = new StringBuffer ( 500 );
      msg.append ( "ejb.User.UserDbCoder:insertCurrentSchool():" );
      if ( currentSchool != null ) {
        XMLDocument errDoc = new XMLDocument ( "ERROR" );
        try {
          errDoc.addTag ( currentSchool.getXML() );
        } catch ( Exception ignore ) {}
        msg.append ( errDoc.getXML() );
      }
      msg.append ( "\nfailed:\n" );
      msg.append ( ex );
      throw new TCException ( msg.toString() );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void insertRating ( Connection conn, Rating rating )  
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE, "ejb.User.UserDbCoder:insertRating() called ...");
    PreparedStatement ps = null;
    StringBuffer query = new StringBuffer(250);
    query.append ( " INSERT"                  );
    query.append (   " INTO"                  );
    query.append (     " rating ("            );
    query.append (       " coder_id"          );
    query.append (       " ,round_id"         );
    query.append (       " ,rating"           );
    query.append (       " ,last_rated_event" );
    query.append (       " ,num_ratings"      );
    query.append (     " )"                   );
    query.append ( " VALUES ("                );
    query.append (   " ?, ?, ?, ?, ?"         );
    query.append ( " )"                       );
    try {
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt    ( 1, rating.getCoderId()         );
      ps.setInt    ( 2, rating.getRoundId()         );
      ps.setInt    ( 3, rating.getRating()          );
      if ( rating.getLastRatedEvent() == null ) {
        ps.setNull ( 4,java.sql.Types.DATE );
      } else {
        ps.setDate ( 4, rating.getLastRatedEvent() );
      }
      ps.setInt    ( 5, rating.getNumRatings()     );
      int RetVal = ps.executeUpdate();
      if (RetVal != 1) {
        throw new TCException ( "ejb.User.UserDbCoder:insertRating():failed." );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      StringBuffer msg = new StringBuffer ( 300              );
      msg.append ( "ejb.User.UserDbCoder:insertRating:" );
      msg.append ( "coderId="                                );
      msg.append ( rating.getCoderId()                       );
      msg.append ( ":failed:\n"                              );
      msg.append ( ex                                        );
      throw new TCException ( msg.toString()    );
    } finally {
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ){} }
    }
  }


/*
  ///////////////////////////////////////////////////////////////
  private static void insertExperience ( Connection conn, 
    Experience experience ) throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:insertExperience():called." );
    PreparedStatement ps = null;
    StringBuffer query = new StringBuffer(220);
    query.append ( " INSERT"                                         );
    query.append (   " INTO"                                         );
    query.append (     " experience ("                               );
    query.append (       " coder_id"                                 );
    query.append (       " ,experience_id"                           );
    query.append (       " ,organization_name"                       );
    query.append (       " ,start_year"                              );
    query.append (       " ,start_month"                             );
    query.append (       " ,end_year"                                );
    query.append (       " ,end_month"                               );
    query.append (       " ,title"                                   );
    query.append (       " ,description"                             );
    query.append (       " ,city"                                    );
    query.append (       " ,state_code"                              );
    query.append (       " ,country_code"                            );
    query.append (       " ,title_id"                                );
    query.append (       " ,organization_id"                         );
    query.append (       " ,experience_type_id"                      );
    query.append (     " )"                                          );
    query.append ( " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" );
    try {
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt    ( 1,  experience.getCoderId()                  );
      experience.setExperienceId ( DBMS.getTransSeqId(conn, DBMS.EXPERIENCE_SEQ));
      ps.setInt    ( 2,  experience.getExperienceId()             );
      ps.setString ( 3,  experience.getCompany()                  );
      ps.setInt    ( 4,  experience.getStartYear()                );
      ps.setInt    ( 5,  experience.getStartMonth()               );
      ps.setInt    ( 6,  experience.getEndYear()                  );
      ps.setInt    ( 7,  experience.getEndMonth()                 );
      ps.setString ( 8,  experience.getTitleDesc()                );
      ps.setString ( 9,  experience.getDescription()              );
      ps.setString ( 10, experience.getCity()                     );
      ps.setString ( 11, experience.getState().getStateCode()     );
      ps.setString ( 12, experience.getCountry().getCountryCode() );
      ps.setInt    ( 13, experience.getTitle().getTitleId()       );
      ps.setInt    ( 14, experience.getOrganization().getOrganizationId()       );
      ps.setInt    ( 15, experience.getExperienceType().getExperienceTypeId()       );
      int RetVal = ps.executeUpdate();
      if (RetVal != 1) {
        throw new TCException ( "ejb.User.UserDbCoder:insertExperience():failed." );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      StringBuffer msg = new StringBuffer ( 300                  );
      msg.append ( "ejb.User.UserDbCoder:insertExperience:" );
      msg.append ( "coderId="                                    );
      msg.append ( experience.getCoderId()                       );
      msg.append ( ":company="                                   );
      msg.append ( experience.getCompany()                       );
      msg.append ( ":failed:\n"                                  );
      msg.append ( ex                                            );
      throw new TCException ( msg.toString()        );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void insertCoderEducation ( Connection conn, Education education )
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:insertCoderEducation() called...");
    Education ed = null;
    Degree degreeLevel = null;
    State state = null;
    Country country = null;
    PreparedStatement ps = null;
    StringBuffer query = new StringBuffer(210);
    query.append( " INSERT"                       );
    query.append(   " INTO"                       );
    query.append(     " education ("              );
    query.append(       " education_id"           );
    query.append(       " ,coder_id"              );
    query.append(       " ,degree_id"             );
    query.append(       " ,major"                 );
    query.append(       " ,graduation_year"       );
    query.append(       " ,graduation_month"      );
    query.append(       " ,school_id"             );
    query.append(     " )"                        );
    query.append( " VALUES (?, ?, ?, ?, ?, ?, ?)" );
    try {
      ps = conn.prepareStatement ( query.toString() );
      degreeLevel = education.getDegree();
      School school = education.getSchool();
      education.setEducationId ( DBMS.getTransSeqId(conn, DBMS.EDUCATION_SEQ) );
      ps.setInt     (1, education.getEducationId()    );
      ps.setInt     (2, education.getCoderId()         );
      ps.setInt     (3, degreeLevel.getDegreeId() );
      ps.setString  (4, education.getMajor()           );
      ps.setInt     (5, education.getGraduationYear()  );
      ps.setInt     (6, education.getGraduationMonth() );
      ps.setInt     (7, school.getSchoolId()           );
      int RetVal = ps.executeUpdate();
      if (RetVal != 1) {
        throw new TCException ( "ejb.User.UserDbCoder:insertCoderEducation():failed" );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      StringBuffer msg = new StringBuffer ( 300 );
      msg.append ( "ejb.User.UserDbCoder:insertCoderEducation:" );
      msg.append ( "coderId="                                   );
      msg.append ( education.getCoderId()                       );
      msg.append ( ":degreeNumber="                             );
      msg.append ( education.getEducationId()                  );
      msg.append ( ":failed:\n"                                 );
      msg.append ( ex                                           );
      throw new TCException ( msg.toString()       );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }

  ///////////////////////////////////////////////////////////////
  private static boolean schoolIdExists (Connection conn, int schoolId) 
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User:UserDbCoder:checkSchoolId() called ...");
    boolean result       = false;
    PreparedStatement ps = null;
    ResultSet rs         = null;
    String query         = null;
    query = "SELECT COUNT(1) FROM school WHERE school_id = ?";  
    try {
      ps = conn.prepareStatement ( query );
      ps.setInt ( 1, schoolId );
      rs = ps.executeQuery();
      if ( rs.next() ) {
        if ( rs.getInt(1) == 1 ) result = true;
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      StringBuffer msg = new StringBuffer ( 200 );
      msg.append ( "ejb.User.UserDbCoder:checkSchoolId:schoolId=" );
      msg.append ( schoolId );
      msg.append ( ":failed:\n" );
      msg.append ( ex );
      throw new TCException(msg.toString());
    } finally {
      if (rs != null) { try { rs.close(); } catch(Exception ignore){} }
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
    return result;
  }

  ///////////////////////////////////////////////////////////////
  private static void insertCoderSchool ( Connection conn, School school )
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:insertCoderSchool():called." );
    State state     = null;
    Country country = null;
    PreparedStatement ps      = null;
    StringBuffer query        = new StringBuffer(210);
    query.append( " INSERT"                       );
    query.append(   " INTO"                       );
    query.append(     " school ("                 );
    query.append(       " user_id"                );
    query.append(       " ,school_id"             );
    query.append(       " ,name"                  );
    query.append(       " ,city"                  );
    query.append(       " ,state_code"            );
    query.append(       " ,country_code"          );
    query.append(       " ,sort_letter"           );
    query.append(     " )"                        );
    query.append( " VALUES (?, ?, ?, ?, ?, ?, ?)" );
    try {
      ps = conn.prepareStatement(query.toString());
      state = school.getState();
      country = school.getCountry();
      school.setSchoolId ( DBMS.getTransSeqId(conn, DBMS.SCHOOL_SEQ) );
      ps.setInt      ( 1,  school.getUserId()       );
      ps.setInt      ( 2,  school.getSchoolId()     );
      ps.setString   ( 3,  school.getName()   );
      ps.setString   ( 4,  school.getCity()   );
      if ( state.getStateCode().equals("") ) {
        ps.setNull   ( 5,  java.sql.Types.VARCHAR   );
      } else {
        ps.setString ( 5,  state.getStateCode()     );
      }
      ps.setString   ( 6,  country.getCountryCode() );
      ps.setString   ( 7,  school.getSortLetter() );
      int RetVal = ps.executeUpdate();
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      StringBuffer msg = new StringBuffer(300);
      msg.append ( "ejb.User.UserDbCoder:insertCoderSchool:" );
      msg.append ( "coderId="                                );
      msg.append ( school.getUserId()                        );
      msg.append ( ":schoolName="                            );
      msg.append ( school.getName()                    );
      msg.append ( ":failed:\n"                              );
      msg.append ( ex                                        );
      throw new TCException ( msg.toString()    );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void insertCoderSkill ( Connection conn, CoderSkill coderSkill )
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:insertCoderSkill() called...");
    PreparedStatement ps = null;
    Skill skill = null;
    String query = null;
    query = "INSERT INTO coder_skill ( coder_id, skill_id, ranking ) VALUES (?,?,?)";
    try  {
      skill = coderSkill.getSkill();
      ps = conn.prepareStatement ( query );
      ps.setInt ( 1, coderSkill.getCoderId()  );
      ps.setInt ( 2, skill.getSkillId()       );
      ps.setInt ( 3, coderSkill.getRanking()  );
      int RetVal = ps.executeUpdate();
      if (RetVal != 1)  {
        throw new TCException ( "ejb.User.UserDbCoder:insertCoderSkill():failed." );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      StringBuffer msg = new StringBuffer(300);
      msg.append ( "ejb.User.UserDbCoder:insertCoderSkill:" );
      msg.append ( "coderId="                               );
      msg.append ( coderSkill.getCoderId()                  );
      msg.append ( ":skillId="                              );
      msg.append ( coderSkill.getSkill().getSkillId()       );
      msg.append ( ":failed:\n"                             );
      msg.append ( ex                                       );
      throw new TCException ( msg.toString()   );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }
*/
 
  ///////////////////////////////////////////////////////////////
  private static void insertDemographicResponse ( Connection conn, DemographicResponse demographicResponse )
  ///////////////////////////////////////////////////////////////
    throws TCException {
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:insertDemographicResponse():called." );
    PreparedStatement ps = null;
    /**************************************************************/
    StringBuffer query = new StringBuffer(200);
    query.append ( " INSERT" );
    query.append (   " INTO" );
    query.append (     " demographic_response (" );
    query.append (       " coder_id" );
    query.append (       " ,demographic_question_id" );
    query.append (       " ,demographic_answer_id" );
    query.append (       " ,demographic_response" );
    query.append (     " )" );
    query.append ( " VALUES ( ?, ?, ?, ? )" );
    /**************************************************************/
    try {
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt    ( 1, demographicResponse.getCoderId() );
      ps.setInt    ( 2, demographicResponse.getDemographicQuestionId() );
      ps.setInt    ( 3, demographicResponse.getDemographicAnswerId() );
      ps.setString ( 4, demographicResponse.getDemographicResponseText() );
      int RetVal = ps.executeUpdate();
    } catch (SQLException sqe) {
      ////////////////////////////////////////////////////////
      XMLDocument err = new XMLDocument ( "INSERT_DEMO_RESPONSE_ERROR" );
      try {
        err.addTag ( demographicResponse.getXML() );
      } catch ( Exception ignore ) {}
      Log.msg ( err.getXML(2) );
      ////////////////////////////////////////////////////////
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex )  {
      StringBuffer msg = new StringBuffer ( 500 );
      msg.append ( "ejb.User.UserDbCoder:insertDemographicResponse():" );
      if ( demographicResponse != null ) {
        XMLDocument errDoc = new XMLDocument ( "ERROR" );
        try {
          errDoc.addTag ( demographicResponse.getXML() );
        } catch ( Exception ignore ) {}
        msg.append ( errDoc.getXML() );
      }
      msg.append ( "\nfailed:\n" );
      msg.append ( ex );
      throw new TCException ( msg.toString() );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }


///////////////////////////////////////////////////////////////////////////////
//                                 UPDATE
///////////////////////////////////////////////////////////////////////////////








  ///////////////////////////////////////////////////////////////
  static void updateCoder (Connection conn, CoderRegistration coder) 
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:updateCoder() called...");
    PreparedStatement ps      = null;
    ResultSet rs              = null;
    try  {
      if ( coder.getModified().equals("A") ){
        insertCoder(conn, coder);
      } else {
        if ( coder.getModified().equals("U") ) {
          StringBuffer query = new StringBuffer(540);
          query.append ( " UPDATE"                 );
          query.append (   " coder"                );
          query.append ( " SET "                   );
          query.append (   " first_name=?"         );
          query.append (   " ,last_name=?"         );
          query.append (   " ,middle_name=?"       );
          query.append (   " ,address1=?"          );
          query.append (   " ,address2=?"          );
          query.append (   " ,city=?"              );
          query.append (   " ,state_code=?"        );
          query.append (   " ,country_code=?"      );
          query.append (   " ,zip=?"               );
          query.append (   " ,work_phone=?"        );
          query.append (   " ,home_phone=?"        );
          query.append (   " ,activation_code=?"   );
          query.append (   " ,notify=?"            );
          query.append (   " ,quote=?"             );
          query.append (   " ,editor_id=?"         );
          query.append (   " ,language_id=?"       );
          query.append (   " ,coder_type_id=?"     );
          query.append ( " WHERE"                  );
          query.append (   " coder_id=?"           );
          State state       = coder.getHomeState();
          Country country   = coder.getHomeCountry();
          Editor editorType = coder.getEditor();
          int i             = 0;
          ps                = conn.prepareStatement ( query.toString() );
          ps.setString   ( 1,  coder.getFirstName()             );
          ps.setString   ( 2,  coder.getLastName()              );
          ps.setString   ( 3,  coder.getMiddleName()            );
          ps.setString   ( 4,  coder.getHomeAddress1()          );
          ps.setString   ( 5,  coder.getHomeAddress2()          );
          ps.setString   ( 6,  coder.getHomeCity()              );
          ps.setString   ( 7,  state.getStateCode()             );
          ps.setString   ( 8,  country.getCountryCode()         );
          ps.setString   ( 9,  coder.getHomeZip()               );
          ps.setString   ( 10, coder.getWorkPhone()             );
          ps.setString   ( 11, coder.getHomePhone()             );
          ps.setString   ( 12, coder.getActivationCode()        );
          ps.setString   ( 13, coder.getNotify()                );
          ps.setString   ( 14, coder.getQuote()                 );
          ps.setInt      ( 15, editorType.getEditorId()              );
          ps.setInt      ( 16, coder.getLanguage().getLanguageId()   );
          ps.setInt      ( 17, coder.getCoderType().getCoderTypeId() );
          ps.setInt      ( 18, coder.getCoderId()                    );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1) {
            throw new TCException (
              "ejb.User.UserDbCoder:updateCoder():did not update record:\n"
            );
          }
        }
        updateRating(conn, coder.getRating());
/*
        ArrayList schools = coder.getSchools();
        if (schools.size() > 0)  {
          updateSchools(conn, schools);
        }
        ArrayList educations = coder.getEducations();
        if (educations.size() > 0)  {
          updateCoderEducations(conn, educations);
        }
        ArrayList skills = coder.getSkills();
        if (skills.size() > 0)  {
          updateCoderSkills(conn, skills);
        }
        ArrayList experiences = coder.getExperiences();
        if (experiences.size() > 0)  {
          updateExperiences(conn, experiences);
        }
*/
        updateCoderNotify ( conn, coder );
        updateCoderReferral ( conn, coder.getCoderReferral() );
        updateCurrentSchool ( conn, coder.getCurrentSchool() );
        ArrayList demographicResponses = coder.getDemographicResponses();
        updateDemographicResponses(conn, coder.getCoderType().getCoderTypeId(), demographicResponses);
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex ) {
      ex.printStackTrace();
      StringBuffer msg = new StringBuffer(300);
      msg.append("ejb.User.UserDbCoder:updateCoder:");
      msg.append("coderId=");
      msg.append(coder.getCoderId());
      msg.append(":failed:\n");
      msg.append(ex);
      throw new TCException(msg.toString());
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }


/*
  ///////////////////////////////////////////////////////////////
  private static void updateCoderEducations ( Connection conn, ArrayList educations )  
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:updateCoderEducations() called ...");
    PreparedStatement ps              = null;
    String modifiedFlag               = "";
    boolean coderSchFlag              = false;
    Education education     = null;
    Degree degreeLevel = null;
    State state             = null;
    Country country         = null;
    StringBuffer query                = new StringBuffer(430);
    try {
      for (int i = 0; i < educations.size(); i++)  {
        int queryLen = query.length();
        if ( queryLen > 0 ) query.delete ( 0, queryLen );
        education = (Education) educations.get(i);
        degreeLevel = education.getDegree();
        modifiedFlag = education.getModified();
        if (modifiedFlag.equals("A"))  {
          insertCoderEducation(conn, education);
        } else if (modifiedFlag.equals("U")) {
          query.append( " UPDATE"                );
          query.append(   " education"           );
          query.append( " SET"                   );
          query.append(   " degree_id=?"         );
          query.append(   " ,major=?"            );
          query.append(   " ,graduation_year=?"  );
          query.append(   " ,graduation_month=?" );
          query.append(   " ,school_id=?"        );
          query.append( " WHERE"                 );
          query.append(   " education_id=?"      );
          ps = conn.prepareStatement ( query.toString()          );
          ps.setInt     ( 1, degreeLevel.getDegreeId()           );
          ps.setString  ( 2, education.getMajor()                );
          ps.setInt     ( 3, education.getGraduationYear()       );
          ps.setInt     ( 4, education.getGraduationMonth()      );
          ps.setInt     ( 5, education.getSchool().getSchoolId() );
          ps.setInt     ( 6, education.getEducationId()          );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1) {
            throw new TCException("ejb.User.UserDbCoder:updateCoderEducations() failed to Update:\n");
          }
        } else if (modifiedFlag.equals("D"))  {
          query.append ( "DELETE FROM education WHERE coder_id=? AND education_id=?" );
          ps = conn.prepareStatement ( query.toString()   );
          ps.setInt     ( 1,  education.getCoderId()      );
          ps.setInt     ( 2,  education.getEducationId() );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1) {
            throw new TCException ( "ejb.User.UserDbCoder:updateCoderEducations():failed." );
          }
        }
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      ex.printStackTrace();
      StringBuffer msg = new StringBuffer(300);
      msg.append   ( "ejb.User.UserDbCoder:updateCoderEducations:" );
      msg.append   ( "coderId="                                    );
      msg.append   ( education.getCoderId()                        );
      if (education != null) {
        msg.append ( ":degreeNumber="                              );
        msg.append ( education.getEducationId()                   );
      }
      msg.append   ( ":failed:\n"                                  );
      msg.append   ( ex                                            );
      throw new TCException ( msg.toString()          );
    } finally {
      if (ps != null) { try { ps.close(); } catch(Exception ignore){} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void updateSchools ( Connection conn, ArrayList schools )
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:updateSchools() called ...");
    PreparedStatement ps      = null;
    String modifiedFlag       = "";
    boolean coderSchFlag      = false;
    School school   = null;
    State state     = null;
    Country country = null;
    StringBuffer query        = new StringBuffer ( 230 );
    try {
      for (int i = 0; i < schools.size(); i++)  {
        int queryLen = query.length();
        if ( queryLen > 0 ) query.delete ( 0, queryLen );
        school = (School) schools.get(i);
        state = school.getState();
        country = school.getCountry();
        modifiedFlag = school.getModified();
        if ( modifiedFlag.equals("A") ) {
          insertCoderSchool(conn, school);
        } else if ( modifiedFlag.equals("U") ) {
          query.append( " UPDATE"            );
          query.append(   " school"          );
          query.append( " SET"               );
          query.append(   " name=?"          );
          query.append(   " ,city=?"         );
          query.append(   " ,state_code=?"   );
          query.append(   " ,country_code=?" );
          query.append(   " ,sort_letter=?"  );
          query.append( " WHERE"             );
          query.append(   " user_id=?"       );
          query.append(   " AND school_id=?" );
          ps = conn.prepareStatement ( query.toString() );
          ps.setString  ( 1,  school.getName()    );
          ps.setString  ( 2,  school.getCity()    );
          ps.setString  ( 3,  state.getStateCode()      );
          ps.setString  ( 4,  country.getCountryCode()  );
          ps.setString  ( 5,  school.getSortLetter()  );
          ps.setInt     ( 6,  school.getUserId()        );
          ps.setInt     ( 7,  school.getSchoolId()      );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1) {
            throw new TCException ( "ejb.User.UserDbCoder:updateSchools():failed." );
          }
        } else if ( modifiedFlag.equals("D") ) {
          query.append ( "DELETE FROM school WHERE user_id=? AND school_id=?" );
          ps = conn.prepareStatement ( query.toString() );
          ps.setInt     ( 1, school.getUserId()   );
          ps.setInt     ( 2, school.getSchoolId() );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1) {
            throw new TCException ( "ejb.User.UserDbCoder:updateSchools():failed." );
          }
        }
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      StringBuffer msg = new StringBuffer(300);
      msg.append   ( "ejb.User.UserDbCoder:updateSchools:" );
      msg.append   ( "coderId="                                 );
      if (school != null) {
        msg.append   ( school.getUserId()                       );
        msg.append ( ":schoolId="                               );
        msg.append ( school.getSchoolId()                       );
      }
      msg.append   ( ":failed:\n"                               );
      msg.append   ( ex                                         );
      throw new TCException ( msg.toString()       );
    } finally {
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void updateCoderSkills ( Connection conn, ArrayList coderSkills ) 
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg (VERBOSE,"ejb.User.UserDbCoder:updateCoderSkills(ArrayList) called ...");
    CoderSkill coderSkill = null;
    Skill skill = null;
    PreparedStatement ps = null;
    String modifiedFlag = "";
    StringBuffer query = new StringBuffer(200);
    try {
      for (int i = 0; i < coderSkills.size(); i++) {
        int queryLen = query.length();
        if ( queryLen > 0 ) query.delete ( 0, queryLen );
        coderSkill = (CoderSkill) coderSkills.get(i);
        skill = coderSkill.getSkill();
        modifiedFlag = coderSkill.getModified();
        if (modifiedFlag.compareToIgnoreCase("A") == 0)  {
          insertCoderSkill(conn, coderSkill);
        } else if(modifiedFlag.compareToIgnoreCase("U") == 0)  {
          query.append( " UPDATE"                 );
          query.append(   " coder_skill"          );
          query.append( " SET"                    );
          query.append(   " ranking=?"            );
          query.append( " WHERE"                  );
          query.append(   " coder_id=?"           );
          query.append(   " AND skill_id=?"       );
          ps = conn.prepareStatement ( query.toString() );
          ps.setInt ( 1, coderSkill.getRanking()        );
          ps.setInt ( 2, coderSkill.getCoderId()        );
          ps.setInt ( 3, skill.getSkillId()             );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1)  {
            throw new TCException 
              ("ejb.User.UserDbCoder:updateCoderSkills():update:failed:\n");
          }
          ps.close();
        } else if(modifiedFlag.compareToIgnoreCase("D") == 0)  {
          query.append ( "DELETE FROM coder_skill WHERE coder_id = ? AND skill_id = ?" );
          ps = conn.prepareStatement ( query.toString() );
          ps.setInt ( 1, coderSkill.getCoderId()        );
          ps.setInt ( 2, skill.getSkillId()             );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1)  {
            throw new TCException 
              ("ejb.User.UserDbCoder:updateCoderSkills():delete:failed:\n");
          }
          ps.close();
        }
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      StringBuffer msg = new StringBuffer(300);
      msg.append   ( "ejb.User.UserDbCoder:updateCoderSkills:" );
      msg.append   ( "coderId="                                );
      if (coderSkill != null) {
        msg.append   ( coderSkill.getCoderId()                 );
        msg.append   ( ":skillId="                             );
        msg.append   ( coderSkill.getSkill().getSkillId()      );
      }
      msg.append   ( ":failed:\n"                              );
      msg.append   ( ex                                        );
      throw new TCException ( msg.toString()      );
    } finally {
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void updateExperiences ( Connection conn, ArrayList coderExperiences )
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg (VERBOSE,"ejb.User.UserDbCoder:updateExperiences(ArrayList) called ...");
    Experience coderExperience = null;
    Experience experience = null;
    PreparedStatement ps = null;
    String modifiedFlag = "";
    StringBuffer query = new StringBuffer(300);
    try {
      for (int i = 0; i < coderExperiences.size(); i++) {
        int queryLen = query.length();
        if ( queryLen > 0 ) query.delete ( 0, queryLen );
        experience = (Experience) coderExperiences.get(i);
        modifiedFlag = experience.getModified();
        if (modifiedFlag.compareToIgnoreCase("A") == 0) {
          insertExperience(conn, experience);
        } else if(modifiedFlag.compareToIgnoreCase("U") == 0) {
          query.append ( " UPDATE"                );
          query.append (   " experience"          );
          query.append ( " SET"                   );
          query.append (   " coder_id=?"          );
          query.append (   " ,organization_name=?" );
          query.append (   " ,start_year=?"       );
          query.append (   " ,start_month=?"      );
          query.append (   " ,end_year=?"         );
          query.append (   " ,end_month=?"        );
          query.append (   " ,title=?"            );
          query.append (   " ,description=?"      );
          query.append (   " ,city=?"             );
          query.append (   " ,state_code=?"       );
          query.append (   " ,country_code=?"     );
          query.append (   " ,title_id=?"         );
          query.append (   " ,organization_id=?"  );
          query.append (   " ,experience_type_id=?"         );
          query.append ( " WHERE"                 );
          query.append (   " experience_id=?"     );
          ps = conn.prepareStatement ( query.toString() );
          ps.setInt    ( 1,  experience.getCoderId()                  );
          ps.setString ( 2,  experience.getCompany()                  );
          ps.setInt    ( 3,  experience.getStartYear()                );
          ps.setInt    ( 4,  experience.getStartMonth()               );
          ps.setInt    ( 5,  experience.getEndYear()                  );
          ps.setInt    ( 6,  experience.getEndMonth()                 );
          ps.setString ( 7,  experience.getTitleDesc()                );
          ps.setString ( 8,  experience.getDescription()              );
          ps.setString ( 9,  experience.getCity()                     );
          ps.setString ( 10, experience.getState().getStateCode()     );
          ps.setString ( 11, experience.getCountry().getCountryCode() );
          ps.setInt    ( 12, experience.getTitle().getTitleId()       );
          ps.setInt    ( 13, experience.getOrganization().getOrganizationId()             );
          ps.setInt    ( 14, experience.getExperienceType().getExperienceTypeId()         );
          ps.setInt    ( 15, experience.getExperienceId()             );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1)  {
            throw new TCException
              ( "ejb.User.UserDbCoder:updateExperiences():update:failed:\n" );
          }
          ps.close();
        } else if(modifiedFlag.compareToIgnoreCase("D") == 0)  {
          query.append ( "DELETE FROM experience WHERE experience_id=?" );
          ps = conn.prepareStatement ( query.toString() );
          ps.setInt ( 1, experience.getExperienceId() );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1)  {
            throw new TCException
              ("ejb.User.UserDbCoder:updateExperiences:delete:failed:\n");
          }
          ps.close();
        }
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      StringBuffer msg = new StringBuffer ( 300                   );
      msg.append ( "ejb.User.UserDbCoder:updateExperiences:" );
      msg.append ( "coderId="                                     );
      if (experience != null) {
        msg.append ( experience.getCoderId()                      );
        msg.append ( ":experienceId="                             );
        msg.append ( experience.getExperienceId()                 );
      }
      msg.append ( ":failed:\n"                                   );
      msg.append ( ex                                             );
      throw new TCException ( msg.toString()         );
    } finally {
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }
*/


  ///////////////////////////////////////////////////////////////////////////////////////////
  private static void updateCoderNotify ( Connection conn, Coder coder ) throws TCException {   
  ///////////////////////////////////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:updateCoderNotify():called." );
    PreparedStatement ps = null;
    try {
      /**************************************************************/
      String query = "DELETE FROM coder_notify WHERE coder_id = ?";
      /**************************************************************/
      ps = conn.prepareStatement ( query );
      ps.setInt ( 1, coder.getCoderId() );
      ps.executeUpdate();
      ArrayList notifications = coder.getNotifications();
      if ( notifications.size() == 0 )
      {
          insertCoderNotify ( conn, coder.getCoderId(), 0 );
      }
      else
      {
        for ( int i = 0; i < notifications.size(); i++ )
        {
          Notify notify = (Notify) notifications.get(i);
          if ( notify.getNotifyId() != 0 )
          {
            insertCoderNotify ( conn, coder.getCoderId(), notify.getNotifyId() );
          }
        }
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex ) {
      ex.printStackTrace();
      throw new TCException ( "ejb.User.UserDbCoder:updateCoderReferral:ERROR:"+ex);
    } finally {
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void updateCoderReferral ( Connection conn, CoderReferral coderReferral )
  ///////////////////////////////////////////////////////////////
    throws TCException {
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:updateCoderReferral():called." );
    PreparedStatement ps = null;
    try {
      String modifiedFlag = coderReferral.getModified();
      if (modifiedFlag.equals("A") && coderReferral.getReferral().getReferralId()!=0) {
        insertCoderReferral ( conn, coderReferral );
      }
      else if (modifiedFlag.equals("U")) {
        /**************************************************************/
        String query = "UPDATE coder_referral SET reference_id = ?, referral_id=?, other=? WHERE coder_id=?";
        /**************************************************************/
        ps = conn.prepareStatement ( query );
        ps.setInt ( 1, coderReferral.getReferenceId() );
        ps.setInt ( 2, coderReferral.getReferral().getReferralId() );
        ps.setString ( 3, coderReferral.getOther() );
        ps.setInt ( 4, coderReferral.getCoderId() );
        int retVal = ps.executeUpdate();
        if ( retVal != 1 ) {
          Log.msg ( VERBOSE, "coder: " 
           + coderReferral.getCoderId() + "  referralId: " 
           + coderReferral.getReferral().getReferralId() + "  reference: " 
           + coderReferral.getReferenceId());
          throw new TCException ("ejb.User.UserDbCoder:updateCoderReferral:update errror: " + retVal);
        }
        coderReferral.setModified("S");
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex ) {
      throw new TCException ( 
        "ejb.User.UserDbCoder:updateCoderReferral:ERROR:"+ex 
      );
    } finally {
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  /////////////////////////////////////////////////////////////////////////////////
  private static void updateCurrentSchool ( Connection conn, School currentSchool )
    throws TCException {
  /////////////////////////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:updateCurrentSchool():called." );
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
      /**************************************************************/
      String query = "SELECT 1 FROM current_school WHERE coder_id=?";
      /**************************************************************/
      ps = conn.prepareStatement ( query );
      ps.setInt ( 1, currentSchool.getUserId() );
      rs = ps.executeQuery();
      ps.clearParameters();
      if ( rs.next() ) {
        /**************************************************************/
        query = "UPDATE current_school SET school_id=?, school_name=? WHERE coder_id=?";
        /**************************************************************/
        ps = conn.prepareStatement ( query );
        ps.setInt ( 1, currentSchool.getSchoolId() );
        ps.setString ( 2, currentSchool.getName() );
        ps.setInt ( 3, currentSchool.getUserId() );
        ps.executeUpdate();
        currentSchool.setModified("S");
      } else {
        insertCurrentSchool ( conn, currentSchool );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex ) {
      throw new TCException (
        "ejb.User.UserDbCoder:updateCurrentSchool:ERROR:"+ex
      );
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void updateDemographicResponses(Connection conn, int coderTypeId, ArrayList demographicResponses)
  ///////////////////////////////////////////////////////////////
    throws TCException {
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:updateDemographicResponses():called." );
    PreparedStatement ps = null;
    try { 
      Log.msg ( VERBOSE, "CODER_TYPE_ID="+coderTypeId );
      HashSet qIdsForCoderType = getDemographicQuestionIds ( conn, coderTypeId );
      for (int i = 0; i < demographicResponses.size(); i++) {
        DemographicResponse demographicResponse = (DemographicResponse) demographicResponses.get(i);
        if ( qIdsForCoderType != null && !qIdsForCoderType.contains(new Integer(demographicResponse.getDemographicQuestionId())) ) {
          demographicResponse.setModified("D");
        }
        String modifiedFlag = demographicResponse.getModified();
        if ( modifiedFlag.compareToIgnoreCase("A") == 0) {
          insertDemographicResponse(conn, demographicResponse);
        } else if (modifiedFlag.compareToIgnoreCase("U") == 0) {
          StringBuffer query = new StringBuffer(200);
          query.append ( " UPDATE"  );
          query.append (   " demographic_response"  );
          query.append ( " SET"  );
          query.append (   " demographic_response=?"  );
          query.append ( " WHERE"  );
          query.append (   " coder_id=?"  );
          query.append (   " AND demographic_question_id=?"  );
          query.append (   " AND demographic_answer_id=?"  );
          ps = conn.prepareStatement ( query.toString() );
          ps.setString ( 1, demographicResponse.getDemographicResponseText() );
          ps.setInt ( 2, demographicResponse.getCoderId() );
          ps.setInt ( 3, demographicResponse.getDemographicQuestionId() );
          ps.setInt ( 4, demographicResponse.getDemographicAnswerId() );
          int RetVal = ps.executeUpdate();
          if (RetVal != 1)  {
            Log.msg (
              VERBOSE 
              ,"ejb.User.UserDbCoder:updateDemographicResponses():update:failed" 
            );
          }
        } else if (modifiedFlag.compareToIgnoreCase("D") == 0) {
          /**************************************************************/
          String query = "DELETE FROM demographic_response WHERE demographic_question_id=? AND demographic_answer_id=? AND coder_id=?";
          /**************************************************************/
          ps = conn.prepareStatement ( query );
          ps.setInt ( 1, demographicResponse.getDemographicQuestionId());
          ps.setInt ( 2, demographicResponse.getDemographicAnswerId());
          ps.setInt ( 3, demographicResponse.getCoderId());
          int retVal = ps.executeUpdate();
          if ( retVal != 1 ) {
            Log.msg ( VERBOSE, "q="+demographicResponse.getDemographicQuestionId() );
            Log.msg ( VERBOSE, "a="+demographicResponse.getDemographicAnswerId() );
            Log.msg ( VERBOSE, "c="+demographicResponse.getCoderId() );
            Log.msg ( VERBOSE, "ejb.User.UserDbCoder:updateDemographicResponses():ERROR:"+retVal+" records deleted" );
            //throw new TCException (
              //"ejb.User.UserDbCoder:updateDemographicResponses():ERROR:"+retVal+" records deleted"
            //);
          }
        }
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex ) {
      throw new TCException (
        "ejb.User.UserDbCoder:updateDemographicResponses:ERROR:"+ex
      );
    } finally {
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void updateRating ( Connection conn, Rating cr )  
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:updateRating() called ...");
    PreparedStatement ps = null;
    String modifiedFlag = "";
    StringBuffer query = new StringBuffer(230);
    try {
      modifiedFlag = cr.getModified();
      if ( modifiedFlag.equals("A") ) {
        insertRating ( conn, cr );
      } else if ( modifiedFlag.equals("U") ) {
        query.append ( " UPDATE"                );
        query.append (   " rating"              );
        query.append ( " SET"                   );
        query.append (   " round_id=?"          );
        query.append (   " ,rating=?"           );
        query.append (   " ,last_rated_event=?" );
        query.append (   " ,num_ratings=?"      );
        query.append ( " WHERE"                 );
        query.append (   " coder_id=?"          );
        ps = conn.prepareStatement(query.toString());
        ps.setInt  ( 1, cr.getRoundId        () );
        ps.setInt  ( 2, cr.getRating         () );
        ps.setDate ( 3, cr.getLastRatedEvent () );
        ps.setInt  ( 4, cr.getNumRatings     () );
        ps.setInt  ( 5, cr.getCoderId        () );
        int RetVal = ps.executeUpdate();
        if (RetVal != 1) {
          throw new TCException ( "ejb.User.UserDbCoder:updateRating():failed." );
        }
      } else if (modifiedFlag.equals("D"))  {
        query.append ( "DELETE FROM rating WHERE coder_id=?" );
        ps = conn.prepareStatement ( query.toString() );
        ps.setInt    ( 1, cr.getCoderId() );
        int RetVal = ps.executeUpdate();
        if (RetVal != 1) {
          throw new TCException ( "ejb.User.UserDbCoder:updateRating():failed." );
        }
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      StringBuffer msg = new StringBuffer ( 300              );
      msg.append ( "ejb.User.UserDbCoder:updateRating:" );
      msg.append ( "coderId="                                );
      msg.append ( cr.getCoderId()                           );
      msg.append ( ":contestId="                             );
      msg.append ( cr.getContestId()                         );
      msg.append ( ":roundId="                               );
      msg.append ( cr.getRoundId()                           );
      msg.append ( ":failed:\n"                              );
      msg.append ( ex                                        );
      throw new TCException ( msg.toString()    );
    } finally {
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }




///////////////////////////////////////////////////////////////////////////////
//                                 SELECT
///////////////////////////////////////////////////////////////////////////////




 
  ///////////////////////////////////////////////////////////////
  static void loadCoder (Connection conn, User user) 
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:loadCoder():called...");
    PreparedStatement ps = null;
    ResultSet rs = null;
    StringBuffer query = new StringBuffer(1000);
    query.append( " SELECT");
    query.append(     " c.first_name");
    query.append(     " ,c.last_name");
    query.append(     " ,c.middle_name");
    query.append(     " ,c.address1");
    query.append(     " ,c.address2");
    query.append(     " ,c.city");
    query.append(     " ,c.state_code");
    query.append(     " ,c.country_code");
    query.append(     " ,c.zip");
    query.append(     " ,c.work_phone");
    query.append(     " ,c.home_phone");
    query.append(     " ,c.activation_code");
    query.append(     " ,c.member_since");
    query.append(     " ,c.notify");
    query.append(     " ,c.quote");
    query.append(     " ,s.state_name");
    query.append(     " ,s.demographic_decline");
    query.append(     " ,co.country_name");
    query.append(     " ,co.participating");
    query.append(     " ,c.editor_id");
    query.append(     " ,e.editor_desc");
    query.append(     " ,c.language_id");
    query.append(     " ,l.language_name");
    query.append(     " ,c.coder_type_id");
    query.append(     " ,ct.coder_type_desc");
    query.append(     " ,crr.referral_id");
    query.append(     " ,crr.referral_desc");
    query.append(     " ,crr.reference_id");
    query.append(     " ,crr.other");
    query.append(     " ,(SELECT count(*)");
    query.append(         " FROM coder_image_xref cix");
    query.append(              " ,image i");
    query.append(        " WHERE cix.image_id = i.image_id");
    query.append(          " AND cix.coder_id = c.coder_id");
    query.append(          " AND i.image_type_id = 1) as image_flag");
    query.append(   " FROM");
    query.append(     " coder c");
    query.append(     " ,country co");
    query.append(     " ,language l");
    query.append(     " ,coder_type ct");
    query.append(     " ,editor e");
    query.append(     " ,state s");
    query.append(     " ,OUTER");
    query.append(       " TABLE(MULTISET(");
    query.append(         " SELECT");
    query.append(           " cr.coder_id");
    query.append(           " ,cr.referral_id");
    query.append(           " ,r.referral_desc");
    query.append(           " ,cr.other");
    query.append(           " ,cr.reference_id ");
    query.append(         " FROM");
    query.append(           " coder_referral cr");
    query.append(           " ,referral r");
    query.append(         " WHERE");
    query.append(           " r.referral_id = cr.referral_id");
    query.append(           " AND cr.coder_id = ?");
    query.append(       " )) crr");
    query.append(   " WHERE");
    query.append(     " c.coder_id = ?");
    query.append(     " AND c.country_code = co.country_code");
    query.append(     " AND c.language_id = l.language_id");
    query.append(     " AND c.coder_type_id  = ct.coder_type_id");
    query.append(     " AND c.editor_id = e.editor_id");
    query.append(     " AND c.state_code = s.state_code");
    query.append(     " AND c.coder_id = crr.coder_id");

    try {
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt ( 1, user.getUserId() );
      ps.setInt ( 2, user.getUserId() );
      rs = ps.executeQuery();
      if ( rs.next() )  {
        HashMap userTypeDetails     = user.getUserTypeDetails();
        CoderRegistration coder     = new CoderRegistration();
        State state                 = coder.getHomeState();
        Country country             = coder.getHomeCountry();
        Editor editorType           = coder.getEditor();
        Language subject            = coder.getLanguage();
        CoderType coderType         = coder.getCoderType();
        CoderReferral coderReferral = coder.getCoderReferral();
        Referral referral           = coderReferral.getReferral();
        userTypeDetails.put          ( "Coder", coder   );
        coder.setCoderId             ( user.getUserId() );
        coder.setFirstName           ( rs.getString(1)  );
        coder.setLastName            ( rs.getString(2)  );
        coder.setMiddleName          ( rs.getString(3)  );
        coder.setHomeAddress1        ( rs.getString(4)  );
        coder.setHomeAddress2        ( rs.getString(5)  );
        coder.setHomeCity            ( rs.getString(6)  );
        state.setStateCode           ( rs.getString(7)  );
        country.setCountryCode       ( rs.getString(8)  );
        coder.setHomeZip             ( rs.getString(9)  );
        coder.setWorkPhone           ( rs.getString(10) );
        coder.setHomePhone           ( rs.getString(11) );
        coder.setActivationCode      ( rs.getString(12) );
        coder.setMemberSince         ( rs.getDate(13)   );
        coder.setNotify              ( rs.getString(14) );
        coder.setQuote               ( rs.getString(15) );
        state.setStateName           ( rs.getString(16) );
        state.setDemographicDecline  ( rs.getInt(17) );
        country.setCountryName       ( rs.getString(18) );
        country.setParticipating     ( rs.getInt(19) );
        editorType.setEditorId       ( rs.getInt(20)    );
        editorType.setEditorDesc     ( rs.getString(21) );
        subject.setLanguageId        ( rs.getInt(22)    );
        subject.setName              ( rs.getString(23) );
        coderType.setCoderTypeId     ( rs.getInt(24)    );
        coderType.setCoderTypeDesc   ( rs.getString(25) );
        coderReferral.setCoderId     ( user.getUserId() );
        referral.setReferralId       ( rs.getInt(26)    );
        referral.setReferralDesc     ( rs.getString(27) );
        coderReferral.setReferenceId ( rs.getInt(28)    );
        coderReferral.setOther       ( rs.getString(29) );
        if (rs.getInt(30)==0)
          coder.setHasImage(false);
        else if (rs.getInt(30)==1)
          coder.setHasImage(true);
        coder.setModified            ( "S"              );
        //loadCoderEducation           ( conn, coder      );
        //loadCoderSchool              ( conn, coder      );
        //loadCoderSkill               ( conn, coder      );
        //loadExperience               ( conn, coder      );
        loadCoderNotify              ( conn, coder      );
        loadRating                   ( conn, coder      );
        loadRanking                  ( conn, coder      );
        loadDemographicResponses     ( conn, coder      );
        loadCurrentSchool            ( conn, coder      );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      Log.msg ( "MIKE SAYS:"+ex.getMessage() );
      ex.printStackTrace();
      StringBuffer msg = new StringBuffer(300);
      msg.append ( "ejb.User.UserDbCoder:loadCoder:" );
      msg.append ( "coderId="                        );
      msg.append ( user.getUserId()                  );
      msg.append ( ":failed:\n"                      );
      msg.append ( ex                                );
      throw new TCException ( msg.toString() );
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }

/*
  ///////////////////////////////////////////////////////////////
  private static void loadCoderEducation (Connection conn, CoderRegistration coder)
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:loadCoderEducation() called...\n");
    PreparedStatement ps = null;
    ResultSet rs         = null;
    int degreeLevelId    = 0;
    String stateCode     = "";
    String countryCode   = "";
    StringBuffer query   = new StringBuffer(1100);
    query.append( " SELECT"                                           );
    query.append(   " education.education_id"                         );
    query.append(   " ,education.degree_id"                           );
    query.append(   " ,degree.degree_desc"                            );
    query.append(   " ,education.major"                               );
    query.append(   " ,education.graduation_year"                     );
    query.append(   " ,education.graduation_month"                    );
    query.append(   " ,education.school_id"                           );
    query.append(   " ,school.name"                                   );
    query.append(   " ,school.sort_letter"                            );
    query.append(   " ,school.city"                                   );
    query.append(   " ,school.state_code"                             );
    query.append(   " ,state.state_name"                              );
    query.append(   " ,state.demographic_decline"                     );
    query.append(   " ,school.country_code"                           );
    query.append(   " ,country.country_name"                          );
    query.append(   " ,country.participating"                         );
    query.append( " FROM"                                             );
    query.append(   " education"                                      );
    query.append(   " ,degree"                                        );
    query.append(   " ,school"                                        );
    query.append(   " ,country"                                       );
    query.append(   " ,state"                                         );
    query.append( " WHERE"                                            );
    query.append(   " education.coder_id = ?"                         );
    query.append(   " AND education.degree_id = degree.degree_id"     );
    query.append(   " AND education.school_id = school.school_id"     );
    query.append(   " AND school.country_code = country.country_code" );
    query.append(   " AND school.state_code = state.state_code"       );
    try  {
      ArrayList listEd = coder.getEducations();
      listEd.clear();
      ps = conn.prepareStatement( query.toString() );
      ps.setInt( 1, coder.getCoderId() );
      rs = ps.executeQuery();
      while ( rs.next() )  {
        Education ed          = new Education();
        Degree degreeLevel    = ed.getDegree();
        School school         = ed.getSchool();
        State schoolState     = school.getState();
        Country schoolCountry = school.getCountry();
        ed.setCoderId                ( coder.getCoderId() );
        ed.setEducationId            ( rs.getInt    (1)  );
        degreeLevel.setDegreeId      ( rs.getInt    (2)  );
        degreeLevel.setDegreeDesc    ( rs.getString (3)  );
        ed.setMajor                  ( rs.getString (4)  );
        ed.setGraduationYear         ( rs.getInt    (5)  );
        ed.setGraduationMonth        ( rs.getInt    (6)  );
        school.setSchoolId           ( rs.getInt    (7)  );
        school.setName               ( rs.getString (8)  );
        school.setSortLetter         ( rs.getString (9)  );
        school.setCity               ( rs.getString (10) );
        schoolState.setStateCode     ( rs.getString (11) );
        schoolState.setStateName     ( rs.getString (12) );
        schoolState.setDemographicDecline ( rs.getInt (13) );
        schoolCountry.setCountryCode ( rs.getString (14) );
        schoolCountry.setCountryName ( rs.getString (15) );
        schoolCountry.setParticipating ( rs.getInt (16) );
        ed.setModified               ( "S"                );
        listEd.add                   ( ed                 );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      StringBuffer msg = new StringBuffer(300);
      msg.append( "ejb.User.UserDbCoder:loadCoderEducation:" );
      msg.append( "coderId="                                 );
      msg.append( coder.getCoderId()                         );
      msg.append( ":failed:\n"                               );
      msg.append( ex                                         );
      throw new TCException( msg.toString() );
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void loadCoderSchool (Connection conn, CoderRegistration coder)
    throws TCException  {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:loadCoderSchool():called." );
    PreparedStatement ps = null;
    ResultSet rs         = null;
    StringBuffer query   = new StringBuffer(375);
    query.append ( " SELECT"                                           );
    query.append (   " school.school_id"                               );
    query.append (   " ,school.name"                                   );
    query.append (   " ,school.sort_letter"                            );
    query.append (   " ,school.city"                                   );
    query.append (   " ,school.state_code"                             );
    query.append (   " ,state.state_name"                              );
    query.append (   " ,state.demographic_decline"                     );
    query.append (   " ,school.country_code"                           );
    query.append (   " ,country.country_name"                          );
    query.append (   " ,country.participating"                         );
    query.append ( " FROM"                                             );
    query.append (   " school"                                         );
    query.append (   " ,country"                                       );
    query.append (   " ,state"                                         );
    query.append ( " WHERE"                                            );
    query.append (   " school.user_id = ?"                             );
    query.append (   " AND school.country_code = country.country_code" );
    query.append (   " AND school.state_code = state.state_code"       );
    try  {
      ArrayList listSchools = coder.getSchools();
      listSchools.clear();
      ps = conn.prepareStatement(query.toString());
      ps.setInt(1, coder.getCoderId());
      rs = ps.executeQuery();
      while ( rs.next() )  {
        School school = new School();
        school.setUserId                   ( coder.getCoderId() );
        school.setSchoolId                 ( rs.getInt    (1)   );
        school.setName                     ( rs.getString (2)   );
        school.setSortLetter               ( rs.getString (3)   );
        school.setCity                     ( rs.getString (4)   );
        school.getState().setStateCode     ( rs.getString (5)   );
        school.getState().setStateName     ( rs.getString (6)   );
        school.getState().setDemographicDecline     ( rs.getInt (7)   );
        school.getCountry().setCountryCode ( rs.getString (8)   );
        school.getCountry().setCountryName ( rs.getString (9)   );
        school.getCountry().setParticipating ( rs.getInt (10)   );
        listSchools.add                    ( school             );
      }
      ps.clearParameters();
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex)  {
      StringBuffer msg = new StringBuffer ( 300            );
      msg.append ( "ejb.User.UserDbCoder:loadCoderSchool:" );
      msg.append ( "coderId="                              );
      msg.append ( coder.getCoderId()                      );
      msg.append ( ":failed:\n"                            );
      msg.append ( ex                                      );
      throw new TCException ( msg.toString()  );
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }

  ///////////////////////////////////////////////////////////////
  private static void loadCoderSkill (Connection conn, CoderRegistration coder) 
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg(VERBOSE,"ejb.User.UserDbCoder:loadCoderSkill() called...\n");
    PreparedStatement ps = null;
    ResultSet rs         = null;
    StringBuffer query   = new StringBuffer(300);
    query.append( " SELECT"                                  );      
    query.append(   " c.skill_id"                            );      
    query.append(   " ,s.skill_type_id"                      );      
    query.append(   " ,t.skill_type_desc"                    );      
    query.append(   " ,t.skill_type_order"                   );      
    query.append(   " ,t.status"                             );      
    query.append(   " ,s.skill_desc"                         );      
    query.append(   " ,s.status"                             );      
    query.append(   " ,s.skill_order"                        );      
    query.append(   " ,c.ranking"                            );      
    query.append( " FROM"                                    );      
    query.append(   " coder_skill c"                         );      
    query.append(   " ,skill s"                              );      
    query.append(   " ,skill_type t"                         );      
    query.append( " WHERE"                                   );      
    query.append(   " c.coder_id = ?"                        );      
    query.append(   " AND c.skill_id = s.skill_id"           );      
    query.append(   " AND s.skill_type_id = t.skill_type_id" );
    try  {
      ArrayList coderSkills = coder.getSkills();
      coderSkills.clear();
      ps = conn.prepareStatement( query.toString() );
      ps.setInt( 1, coder.getCoderId() );
      ps.executeQuery();
      rs = ps.getResultSet();
      while ( rs.next() ) {
        CoderSkill coderSkill = new CoderSkill();
        Skill      skill      = coderSkill.getSkill();
        SkillType  skillType  = skill.getSkillType();
        coderSkill.setCoderId       ( coder.getCoderId() );
        skill.setSkillId            ( rs.getInt    (1)   );
        skillType.setSkillTypeId    ( rs.getInt    (2)   );
        skillType.setSkillTypeDesc  ( rs.getString (3)   );
        skillType.setSkillTypeOrder ( rs.getInt    (4)   );
        skillType.setActiveInd      ( rs.getString (5)   );
        skill.setSkillDesc          ( rs.getString (6)   );
        skill.setActiveInd          ( rs.getString (7)   );
        skill.setSkillOrder         ( rs.getInt    (8)   );
        coderSkill.setRanking       ( rs.getInt    (9)   );
        coderSkill.setModified      ( "S"                );
        coderSkills.add             ( coderSkill         );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      throw new TCException ( "ejb.User.UserDbCoder:loadCoderSkill:"+coder.getCoderId()+":failed."+ex );
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }
*/

  ///////////////////////////////////////////////////////////////
  private static void loadDemographicResponses (Connection conn, CoderRegistration coder)
  ///////////////////////////////////////////////////////////////
    throws TCException {
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:loadDemographicResponses():called." );
    PreparedStatement ps = null;
    ResultSet         rs = null;
    StringBuffer query = new StringBuffer(200);
    /**************************************************************/
    query.append( " SELECT demographic_question_id");
    query.append(        " ,demographic_answer_id");
    query.append(        " ,demographic_response");
    query.append(   " FROM demographic_response");
    query.append(  " WHERE coder_id = ?");
    /**************************************************************/
    try {
      ArrayList demographicResponses = coder.getDemographicResponses();
      demographicResponses.clear();
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt ( 1, coder.getCoderId() );
      rs = ps.executeQuery();
      while ( rs.next() ) {
        DemographicResponse demographicResponse = new DemographicResponse();
        demographicResponse.setCoderId(coder.getCoderId());
        demographicResponse.setDemographicQuestionId(rs.getInt(1)); 
        demographicResponse.setDemographicAnswerId(rs.getInt(2));
        demographicResponse.setDemographicResponseText(rs.getString(3));
        demographicResponse.setModified ( "S" );
        demographicResponses.add(demographicResponse);
      }
    } catch (SQLException sqe) { 
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch ( Exception ex )  {
      ex.printStackTrace();
      throw new TCException (
        "ejb.User.UserDbCoder:loadDemographicResponses:"+coder.getCoderId()+":failed:\n"+ex
      );
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void loadCoderNotify (Connection conn, CoderRegistration coder)
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:loadCoderNotify():called." );
    PreparedStatement ps = null;
    ResultSet rs = null;
    ArrayList notifications = coder.getNotifications();
    notifications.clear();
    StringBuffer query = new StringBuffer(170);
    query.append( " SELECT");
    query.append(   " c.notify_id");
    query.append(   " ,n.name");
    query.append( " FROM");
    query.append(   " coder_notify c");
    query.append(   " ,notify_lu n");
    query.append( " WHERE");
    query.append(   " c.coder_id=?");
    query.append(   " AND c.notify_id=n.notify_id");
    try {
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt ( 1, coder.getCoderId() );
      rs = ps.executeQuery();
      while (rs.next()) {
        Notify notify = new Notify();
        notify.setNotifyId ( rs.getInt(1) );
        notify.setName ( rs.getString(2) );
        notifications.add ( notify );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      throw new
        TCException("ejb.User.UserDbCoder:loadCoderNotify:"+coder.getCoderId()+":failed:\n"+ex);
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }


  ///////////////////////////////////////////////////////////////
  private static void loadRating (Connection conn, CoderRegistration coder) 
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:loadRating():called." );
    PreparedStatement ps = null;
    ResultSet rs = null;
    Rating coderRating = coder.getRating();
    StringBuffer query = new StringBuffer(170);
    query.append( " SELECT"              );
    query.append(   " round_id"          );
    query.append(   " ,rating"           );
    query.append(   " ,last_rated_event" );
    query.append(   " ,num_ratings"      );
    query.append( " FROM"                );
    query.append(   " rating"            );
    query.append( " WHERE"               );
    query.append(   " coder_id=?"        );
    try {
      ps = conn.prepareStatement(query.toString());
      ps.setInt(1, coder.getCoderId());
      rs = ps.executeQuery();
      while (rs.next()) {
        coderRating.setCoderId(coder.getCoderId());
        coderRating.setRoundId(rs.getInt(1));
        coderRating.setRating(rs.getInt(2));
        coderRating.setLastRatedEvent(rs.getDate(3));
        coderRating.setNumRatings(rs.getInt(4));
        coderRating.setModified  ("S");
      }
      rs.close();
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      throw new 
        TCException("ejb.User.UserDbCoder:loadRating:"+coder.getCoderId()+":failed:\n"+ex);
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }

  ///////////////////////////////////////////////////////////////
  private static void loadCurrentSchool (Connection conn, CoderRegistration coder)
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:loadCurrentSchool():called." );
    PreparedStatement ps = null;
    ResultSet rs = null;
    School currentSchool = coder.getCurrentSchool();
    StringBuffer query = new StringBuffer(170);
    query.append( " SELECT");
    query.append(   " c.school_id");
    query.append(   " ,c.school_name");
    query.append(   " ,s.name");
    query.append(   " ,s.city");
    query.append(   " ,s.state_code");
    query.append(   " ,st.state_name");
    query.append(   " ,s.country_code");
    query.append(   " ,ct.country_name");
    query.append( " FROM");
    query.append(   " current_school c");
    query.append(   " ,school s");
    query.append(   " ,state st");
    query.append(   " ,country ct");
    query.append( " WHERE");
    query.append(   " coder_id=?");
    query.append(   " AND c.school_id = s.school_id" );
    query.append(   " AND s.state_code = st.state_code" );
    query.append(   " AND s.country_code = ct.country_code" );
    try {
      ps = conn.prepareStatement ( query.toString() );
      ps.setInt ( 1, coder.getCoderId() );
      rs = ps.executeQuery();
      if ( rs.next() ) {
        currentSchool.setUserId ( coder.getCoderId() );
        currentSchool.setSchoolId ( rs.getInt(1) );
        if ( currentSchool.getSchoolId()==0 ) {
          currentSchool.setName ( rs.getString(2) );
        } else {
          currentSchool.setName ( rs.getString(3) );
        }
        currentSchool.setCity ( rs.getString(4) );
        currentSchool.getState().setStateCode ( rs.getString(5) );
        currentSchool.getState().setStateName ( rs.getString(6) );
        currentSchool.getCountry().setCountryCode ( rs.getString(7) );
        currentSchool.getCountry().setCountryName ( rs.getString(8) );
        currentSchool.setModified  ( "S" );
      }
      if (VERBOSE) {
        XMLDocument test = new XMLDocument("test");
        test.addTag ( currentSchool.getXML() );
        System.out.println ( test.getXML(2) );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      throw new
        TCException("ejb.User.UserDbCoder:loadCurrentSchool:"+coder.getCoderId()+":failed:\n"+ex);
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }

  /**
  *********************************************************************************************
  * loadRanking()
  * Gets a particular coder's ranking 
  * @author Greg Paul
  *********************************************************************************************
  */
  private static void loadRanking(Connection conn, CoderRegistration coder) throws TCException {
    Log.msg(VERBOSE, "ejb:User:loadRanking called...");
    PreparedStatement ps = null; 
    ResultSet rs = null; 
    StringBuffer query = null;   

    try {   
      query = new StringBuffer(300);
      query.append(" SELECT u.user_id, r.rating");
      query.append(  " FROM rating r,");
      query.append(       " user u");
      query.append( " WHERE r.coder_id = u.user_id");
      query.append(   " AND r.num_ratings > 0");
      query.append(   " AND u.status = 'A'");
      query.append( " ORDER by r.rating DESC"); 
      ps = conn.prepareStatement(query.toString());
      rs = ps.executeQuery();
      int i=0;
      int prevRating = 0;
      int prevRanking = 0;
      int currRanking = 0;
      while (rs.next()) {
        i++;
        if (prevRating == rs.getInt(2))
          currRanking = prevRanking;
        else currRanking = i;
       
        if (rs.getInt(1) == coder.getCoderId()) {
          coder.setRanking(currRanking);
          return;
        }
        prevRating = rs.getInt(2);
        prevRanking = currRanking;
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException(true, sqe);
      throw new TCException (sqe.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      throw new TCException (e.getMessage());
    } finally {
      try { if (rs   != null) rs.close();  } catch (Exception ignore) {Log.msg(VERBOSE, "rs   close problem");}
      try { if (ps   != null) ps.close();  } catch (Exception ignore) {Log.msg(VERBOSE, "ps   close problem");}
      rs = null; 
      ps = null; 
    }
  }   

/*
  ///////////////////////////////////////////////////////////////
  private static void loadExperience (Connection conn, CoderRegistration coder) 
    throws TCException {
  ///////////////////////////////////////////////////////////////
    Log.msg ( VERBOSE, "ejb.User.UserDbCoder:loadExperience():called." );
    PreparedStatement ps = null;
    ResultSet         rs = null;
    StringBuffer query = new StringBuffer(620);
    query.append( " SELECT"                                               );
    query.append(   " experience.experience_id"                           );
    query.append(   " ,experience.organization_name"                      );
    query.append(   " ,experience.start_year"                             );
    query.append(   " ,experience.start_month"                            );
    query.append(   " ,experience.end_year"                               );
    query.append(   " ,experience.end_month"                              );
    query.append(   " ,experience.title"                                  );
    query.append(   " ,experience.description"                            );
    query.append(   " ,experience.city"                                   );
    query.append(   " ,experience.state_code"                             );
    query.append(   " ,state.state_name"                                  );
    query.append(   " ,state.demographic_decline"                         );
    query.append(   " ,experience.country_code"                           );
    query.append(   " ,country.country_name"                              );
    query.append(   " ,country.participating"                             );
    query.append(   " ,experience.title_id"                               );
    query.append(   " ,title.title_desc"                                  );
    query.append(   " ,title.title"                                       );
    query.append(   " ,experience.organization_id"                        );
    query.append(   " ,organization.organization"                         );
    query.append(   " ,organization.organization_desc"                    );
    query.append(   " ,experience.experience_type_id"                     );
    query.append(   " ,experience_type_lu.experience_type_desc"           );
    query.append( " FROM"                                                 );
    query.append(   " experience"                                         );
    query.append(   " ,country"                                           );
    query.append(   " ,title"                                             );
    query.append(   " ,organization"                                      );
    query.append(   " ,experience_type_lu"                                );
    query.append(   " ,state"                                             );
    query.append( " WHERE"                                                );
    query.append(   " experience.coder_id = ?"                            );
    query.append(   " AND experience.country_code = country.country_code" );
    query.append(   " AND experience.title_id = title.title_id"           );
    query.append(   " AND experience.organization_id = organization.organization_id"             );
    query.append(   " AND experience.experience_type_id = experience_type_lu.experience_type_id" );
    query.append(   " AND experience.state_code = state.state_code"       );
    try {
      ArrayList experiences = coder.getExperiences();
      experiences.clear();
      ps = conn.prepareStatement( query.toString() );
      ps.setInt( 1, coder.getCoderId() );
      rs = ps.executeQuery();
      while ( rs.next() ) {
        Experience experience = new Experience();
        State state                = experience.getState();
        Country country            = experience.getCountry();
        Title title                = experience.getTitle();
        Organization organization     = experience.getOrganization();
        ExperienceType experienceType = experience.getExperienceType();
        experience.setCoderId       ( coder.getCoderId() );
        experience.setExperienceId  ( rs.getInt    (1)   );
        experience.setCompany       ( rs.getString (2)   );
        experience.setStartYear     ( rs.getInt    (3)   );
        experience.setStartMonth    ( rs.getInt    (4)   );
        experience.setEndYear       ( rs.getInt    (5)   );
        experience.setEndMonth      ( rs.getInt    (6)   );
        experience.setTitleDesc     ( rs.getString (7)   );
        experience.setDescription   ( rs.getString (8)   );
        experience.setCity          ( rs.getString (9)   );
        state.setStateCode          ( rs.getString (10)  );
        state.setStateName          ( rs.getString (11)  );
        state.setDemographicDecline ( rs.getInt (12)  );
        country.setCountryCode      ( rs.getString (13)  );
        country.setCountryName      ( rs.getString (14)  );
        country.setParticipating    ( rs.getInt (15)  );
        title.setTitleId            ( rs.getInt    (16)  );
        title.setTitle              ( rs.getString (17)  );
        title.setTitleDesc          ( rs.getString (18)  );
        organization.setOrganizationId       ( rs.getInt    (19)  );
        organization.setOrganization         ( rs.getString (20)  );
        organization.setOrganizationDesc     ( rs.getString (21)  );
        experienceType.setExperienceTypeId   ( rs.getInt    (22)  );
        experienceType.setExperienceTypeDesc ( rs.getString (23)  );
        experience.setModified     ( "S"                );
        experiences.add            ( experience         );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      ex.printStackTrace(); //XXX
      throw new 
        TCException("ejb.User.UserDbCoder:loadExperience:"+coder.getCoderId()+":failed:\n"+ex);
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
  }
*/


  ///////////////////////////////////////////////////////////////
  private static HashSet getDemographicQuestionIds ( Connection conn, int coderTypeId ) 
    throws TCException {
  ///////////////////////////////////////////////////////////////
    HashSet result = null;
    PreparedStatement ps = null;
    ResultSet         rs = null;
    StringBuffer query   = new StringBuffer ( 200 );
    query.append ( " SELECT");
    query.append (   " demographic_question_id");
    query.append ( " FROM");
    query.append (   " demographic_assignment");
    query.append ( " WHERE");
    query.append (   " coder_type_id = ?");
    try {
      ps = conn.prepareStatement( query.toString() );
      ps.setInt( 1, coderTypeId );
      rs = ps.executeQuery();
      while ( rs.next() ) {
        if ( result == null ) result = new HashSet();
        result.add ( new Integer(rs.getInt(1)) );
      }
    } catch (SQLException sqe) {
      DBMS.printSqlException ( true, sqe );
      throw new TCException ( sqe.getMessage() );
    } catch (Exception ex) {
      ex.printStackTrace(); //XXX
      throw new
        TCException("ejb.User.UserDbCoder:getDemographicQuestionIds:"+coderTypeId+":failed:\n"+ex);
    } finally {
      if (rs != null) { try { rs.close(); } catch ( Exception ignore ) {} }
      if (ps != null) { try { ps.close(); } catch ( Exception ignore ) {} }
    }
    return result;
  }

}
