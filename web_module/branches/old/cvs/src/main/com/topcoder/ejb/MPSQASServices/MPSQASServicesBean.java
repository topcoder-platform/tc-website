package com.topcoder.ejb.MPSQASServices;

import java.net.*;
import com.topcoder.common.web.util.Mail;
import com.topcoder.common.web.data.EMailMessage;
import com.topcoder.mpsqas.tester.TesterWaiter;
import com.topcoder.mpsqas.compiler.CompilerWaiter;
import com.topcoder.tcclasses.*;
import javax.ejb.*;
import weblogic.common.*;
import java.rmi.RemoteException;
import com.topcoder.mpsqas.common.*;
import java.util.*;
import java.sql.*;
import java.io.*;
import javax.naming.*;
import javax.jms.*;
import javax.transaction.*;
import java.rmi.RemoteException;
import com.topcoder.ejb.*;

/**
 * Bean to control all application server work for 
 * MPSQAS.
 *
 * @author mitalub
 */
public class MPSQASServicesBean extends BaseEJB 
{
  /**
   * ejbCreate creates the bean.
   */
  public void ejbCreate() 
  { 
    if (VERBOSE) Common.logMsg("MPSQASServicesBean: ejbCreate called.");
  }

  /**
   * cleanUp finished everything up when the bean is dying.
   */
  private synchronized void cleanUp()
  {
    if (VERBOSE) Common.logMsg("Cleaning up MPSQASServicesBean");
  }

  /**
   * setSessionContext sets the session context.
   *
   * @param SessionContext ctx  The SessionContext
   */
  public void setSessionContext(SessionContext ctx) 
  {
    this.ctx = ctx;
  }

  /**
   * closeConnection closes a prepared statement and a connection, if
   * they are not null.
   *
   * @param conn Connection to close
   * @param ps PreparedStatement to close
   */
  private void closeConnection(java.sql.Connection conn,PreparedStatement ps)
  {
    try
    {
      if(ps!=null)ps.close();
      if(conn!=null) conn.close();
    }
    catch(Exception e)
    {
      Common.logMsg("Error closing connection: ");
      e.printStackTrace();
    }
  }

  /**
   * Sends a message to the MainAppletProcessor on the applet server.
   * 
   * @param data Message to send.
   */
  private void sendToAppletServer(ArrayList data)
  {
    try
    {
      Socket s=new Socket(ApplicationConstants.APPLET_SERVER_IP,ApplicationConstants.INTERNAL_COMMUNICATION_PORT);
      ObjectOutputStream outputStream=new ObjectOutputStream(new BufferedOutputStream(s.getOutputStream()));
      outputStream.flush();
      outputStream.writeObject(new ZippedObject(data));
      outputStream.flush();
    }
    catch(Exception e)
    {
      Common.logMsg("Error sending message to applet server. data: "+data);
      e.printStackTrace();
    }
  }


  /**
   * authenticateUser check with the database to make sure the user exits and that 
   * the user has the correct password.  Finally, it checks if the user is an admin.
   * The method returns an ArrayList containing a boolean indicating the success of the 
   * login.  If false, the ArrayList also contains a String that is the error.       
   * If true, the ArrayList contains an Integer (coder id) and 3 Booleans (indicating admin status 
   * writer status, and tester status)
   *
   * @param handle   The handle of the user trying to log in.
   * @param password The password they are trying to use.  
   */
  public ArrayList authenticateUser(String handle,String password)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.authenticateUser() with handle "+handle);
    Common.logMsg(handle+" logging into MPSQAS.");
    ArrayList retVal=new ArrayList(5);
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    try
    { 
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);
      sqlStr.replace(0,sqlStr.length(),"SELECT u.password, u.user_id, r.rating FROM user u, rating r");
      sqlStr.append(" WHERE u.handle=? AND u.status='A' AND u.user_id=r.coder_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setString(1,handle);
      ResultSet rs=ps.executeQuery();
      if(!rs.next())
      {
        retVal.add(new Boolean(false));
        retVal.add("Incorrect handle.");
        closeConnection(conn,ps);
        return retVal;
      }
      if(!password.equals(rs.getString(1)))
      {
        retVal.add(new Boolean(false));
        retVal.add("Incorrect password.");
        closeConnection(conn,ps);
        return retVal;
      }
      int userId=rs.getInt(2);
      boolean isAdmin=false;

      sqlStr.replace(0,sqlStr.length(),"SELECT * FROM group_user WHERE user_id=? AND group_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,userId);
      ps.setInt(2,ApplicationConstants.ADMIN_GROUP);
      rs=ps.executeQuery();
      isAdmin=rs.next();

      sqlStr.replace(0,sqlStr.length(),"SELECT * FROM group_user WHERE user_id=? AND group_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,userId);
      ps.setInt(2,ApplicationConstants.PROBLEM_WRITER_GROUP);
      rs=ps.executeQuery();
      boolean isWriter=rs.next()||isAdmin;

      sqlStr.replace(0,sqlStr.length(),"SELECT * FROM group_user WHERE user_id=? AND group_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,userId);
      ps.setInt(2,ApplicationConstants.PROBLEM_TESTER_GROUP);
      rs=ps.executeQuery();
      boolean isTester=rs.next()||isAdmin;

      retVal.add(new Boolean(true));
      retVal.add(new Integer(userId));
      retVal.add(new Boolean(isAdmin));
      retVal.add(new Boolean(isWriter));
      retVal.add(new Boolean(isTester));

     
    }
    catch(Exception e)
    {
      Common.logMsg("Error authenticating user:");
      e.printStackTrace();
      retVal=new ArrayList();
      retVal.add(new Boolean(false));
      retVal.add(ApplicationConstants.SERVER_ERROR);
    }
    closeConnection(conn,ps);
    return retVal;
  }

  /**
   * proposeProblem checks the validity of a problem proposal and, if the proposal
   * is ok, it inserts the proposal into the DB.
   *
   * @param info  The ProblemInformation containing proposal information
   * @param userId  The coder id of the user proposing the problem.
   * @returns An ArrayList consisting of a Boolean that is true if the proposal
   *          is valid, and false otherwise, and, if false, a String that is the reason.
   */
  public ArrayList proposeProblem(ProblemInformation info, int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServices.proposeProblem()");
    ArrayList proposalResults=new ArrayList();
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);
      int i;
      boolean validInput;

      //Make sure the user is a member of the problem writer (or admin) group
      sqlStr.replace(0,sqlStr.length(),"SELECT user_id FROM group_user WHERE (group_id=? OR group_id=?) AND user_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,ApplicationConstants.PROBLEM_WRITER_GROUP);
      ps.setInt(2,ApplicationConstants.ADMIN_GROUP);
      ps.setInt(3,userId);
      ResultSet rs=ps.executeQuery();
      if(!rs.next())
      {
        proposalResults.add(new Boolean(false));
        proposalResults.add("You do not have permission to propose a problem. "+
                            "Fill out a problem writer application.");
        closeConnection(conn,ps);
        return proposalResults;
      }

      //Make sure all required fields filled
      if(info.getMethodName().trim().length()==0||
         info.getClassName().trim().length()==0||
         info.getProblemStatement().trim().length()==0||
         info.getDifficultyLevel()<1||
         info.getDifficultyLevel()>3)
      {
        proposalResults.add(new Boolean(false));
        proposalResults.add("Please fill out all fields.");
        closeConnection(conn,ps);
        return proposalResults;
      }

      //Do some checking to make sure the input data seems ok
      validInput=true;
      for(i=0;i<info.getMethodName().length();i++)
        if(!Character.isLetterOrDigit(info.getMethodName().charAt(i))) validInput=false;
      for(i=0;i<info.getClassName().length();i++)
        if(!Character.isLetterOrDigit(info.getClassName().charAt(i))) validInput=false;
      if(Character.isDigit(info.getMethodName().charAt(0))||
         Character.isDigit(info.getClassName().charAt(0)))
        validInput=false;
      if(!validInput)
      {
        proposalResults.add(new Boolean(false));
        proposalResults.add("Class or Method name contains incorrect characters.");
        closeConnection(conn,ps);
        return proposalResults;
      }

      //Make sure we have no other problems with that class name.
      sqlStr.replace(0,sqlStr.length(),"SELECT * FROM problem WHERE class_name=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setString(1,info.getClassName());
      rs=ps.executeQuery();
      if(rs.next())
      {
        proposalResults.add(new Boolean(false));
        proposalResults.add("A problem with this class name already exists.  Please rename the class.");
        closeConnection(conn,ps);
        return proposalResults;
      }

      //Make sure the param types are valid
      sqlStr.replace(0,sqlStr.length(),"SELECT data_type_id FROM data_type WHERE data_type_desc=?");
      ps=conn.prepareStatement(sqlStr.toString());
      for(i=0;i<info.getParamTypes().size();i++)
      {
        ps.setString(1,info.getParamTypes().get(i).toString());
        rs=ps.executeQuery();
        if(!rs.next())
        {
          proposalResults.add(new Boolean(false));
          proposalResults.add("Unrecognized parameter type. Use \"Other Comments\" to describle any new param types.");
          closeConnection(conn,ps);
          return proposalResults;
        }
      }

      //make sure the return type is valid.
      ps.setString(1,info.getReturnType());
      int returnTypeId;
      rs=ps.executeQuery();
      if(!rs.next())
      {
        proposalResults.add(new Boolean(false));
        proposalResults.add("Unrecognized return type. Use \"Other Comments\" to describle a new return type.");
        closeConnection(conn,ps);
        return proposalResults;
      }
      returnTypeId=rs.getInt(1);

      //everything checked out ok, insert the problem.
      int problemId=Common.getSeqId(Common.PROBLEM_SEQ);
     
      sqlStr.replace(0,sqlStr.length(),"INSERT INTO problem (problem_id,class_name,method_name,");
      sqlStr.append(" difficulty_id,submitted_by,status,result_type_id,problem_text,modify_date,");
      sqlStr.append("param_types) VALUES (?,?,?,?,?,?,?,?,current,?)");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ps.setString(2,info.getClassName());
      ps.setString(3,info.getMethodName());
      ps.setInt(4,info.getDifficultyLevel());
      ps.setInt(5,userId);
      ps.setInt(6,MessageTypes.PROPOSAL_PENDING_APPROVAL);
      ps.setInt(7,returnTypeId);
      ps.setBytes(8,Common.serializeTextString(info.getProblemStatement()));
      ps.setBytes(9,Common.serializeBlobObject(info.getParamTypes()));
      int rowsUpdated=ps.executeUpdate();
      if(rowsUpdated!=1) throw new Exception("Wrong number of rows inserted on problem insert: "+rowsUpdated);

      sqlStr.replace(0,sqlStr.length(),"INSERT INTO problem_user (problem_id,user_id,user_type_id, paid) ");
      sqlStr.append(" VALUES (?,?,?,?)");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ps.setInt(2,userId);
      ps.setInt(3,ApplicationConstants.PROBLEM_WRITER);
      ps.setString(4, "N");
      rowsUpdated=ps.executeUpdate();
      if(rowsUpdated!=1) throw new Exception("Wrong number of rows inserted on problem_user insert: "+rowsUpdated);

      //broadcast about it
      try
      {
        ArrayList broadcast=new ArrayList(3);
        broadcast.add(new Integer(ApplicationConstants.PENDING_PROPOSAL_BROADCAST_IN));
        broadcast.add(getPendingProposalTable());

        sendToAppletServer(broadcast);
      }
      catch(Exception e1)
      {
        Common.logMsg("Error broadcast proposal for problem "+problemId);
        e1.printStackTrace();
      }
       
      proposalResults.add(new Boolean(true)); 
    }
    catch(Exception e)
    {
      Common.logMsg("Error inserting problem: ");
      e.printStackTrace();
      proposalResults.add(new Boolean(false));
      proposalResults.add(ApplicationConstants.SERVER_ERROR);
    }
    closeConnection(conn,ps);
    return proposalResults;
  }

  /**
   * getPendingProposalTable returns a table of information about
   * proposed problems.
   * The returned table's colums are writer_name, submit_time, class_name,
   * method_name, difficulty, all strings, the problem_id.
   */
  public Matrix2D getPendingProposalTable() 
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.getPendingProposalTable()...");
    Matrix2D proposalTable;
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle,p.modify_date,p.class_name,p.method_name,p.difficulty_id,p.problem_id ");
      sqlStr.append(" FROM user u,problem p WHERE u.user_id=p.submitted_by AND p.status=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,MessageTypes.PROPOSAL_PENDING_APPROVAL);
      ResultSet rs=ps.executeQuery();
 
      proposalTable=new Matrix2D(0,6);
      ArrayList tableRow;

      while(rs.next())
      {
        tableRow=new ArrayList(6);
        tableRow.add(rs.getString(1));
        tableRow.add(rs.getTimestamp(2).toString());
        tableRow.add(rs.getString(3));
        tableRow.add(rs.getString(4));
        tableRow.add(MessageTypes.getDifficultyName(rs.getInt(5)));
        tableRow.add(new Integer(rs.getInt(6)));
        proposalTable.addRow();
        proposalTable.setRow(proposalTable.numRows()-1,tableRow);
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting proposal table: ");
      e.printStackTrace();
      proposalTable=null;
    }
    closeConnection(conn,ps);
    return proposalTable;
  }

  /**
   * getPendingSubmissionTable returns a table of pending submissions.
   * handle,date,classname,methodname,difficulty,problemid
   */
  public Matrix2D getPendingSubmissionTable() 
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.getPendingProposalTable()...");
    Matrix2D proposalTable;
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle,p.modify_date,p.class_name,p.method_name,p.difficulty_id,p.problem_id ");
      sqlStr.append(" FROM user u,problem p WHERE u.user_id=p.submitted_by AND p.status=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,MessageTypes.SUBMISSION_PENDING_APPROVAL);
      ResultSet rs=ps.executeQuery();
 
      proposalTable=new Matrix2D(0,6);
      ArrayList tableRow;

      while(rs.next())
      {
        tableRow=new ArrayList(6);
        tableRow.add(rs.getString(1));
        tableRow.add(rs.getTimestamp(2).toString());
        tableRow.add(rs.getString(3));
        tableRow.add(rs.getString(4));
        tableRow.add(MessageTypes.getDifficultyName(rs.getInt(5)));
        tableRow.add(new Integer(rs.getInt(6)));
        proposalTable.addRow();
        proposalTable.setRow(proposalTable.numRows()-1,tableRow);
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting proposal table: ");
      e.printStackTrace();
      proposalTable=null;
    }
    closeConnection(conn,ps);
    return proposalTable;
  }

  /**
   * replyToProposal processes an admin's reply to a proposal or submission (approved or
   * or disproved). It returns an ArrayList constaining a boolean representing
   * if things went ok, and if not, the second element is a String that is the
   * error.
   *
   * @param problemId  The problemId the admin is replying to.
   * @param approved   A boolean representing if the problem is approved
   * @param message    A message about the problem proposal
   * @param userId     The userId of the admin replying to the problem
   */
  public ArrayList replyToProposal(int problemId,boolean approved,String message,int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.replyToProposal()..");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    ArrayList replyInfo=new ArrayList(2);
    try
    {
      conn=Common.getConnection();

      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle FROM user u,group_user gu WHERE u.user_id=gu.user_id AND gu.group_id=? AND gu.user_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,ApplicationConstants.ADMIN_GROUP);
      ps.setInt(2,userId);
      ResultSet rs=ps.executeQuery();
      if(!rs.next())
      {
        Common.logMsg("Non-Admin "+userId+" trying to reply to pending problem "+problemId+"!!!!!!!");
        replyInfo.add(new Boolean(false));
        replyInfo.add("You do not have permission to reply to a proposal.");
        closeConnection(conn,ps);
        return replyInfo;
      }
      String adminHandle=rs.getString(1);

      sqlStr.replace(0,sqlStr.length(),"SELECT p.status,p.submitted_by,p.class_name, u.email,u.handle FROM");
      sqlStr.append(" problem p, user u WHERE p.problem_id=? AND u.user_id=p.submitted_by");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      rs=ps.executeQuery();

      if(!rs.next())
      {
        replyInfo.add(new Boolean(false));
        replyInfo.add("The problem to which you are replying does not exist in the database.");
        closeConnection(conn,ps);
        return replyInfo;
      }
      int status=rs.getInt(1);
      int submittedBy=rs.getInt(2);
      String className=rs.getString(3);
      String emailAddy=rs.getString(4);
      String handle=rs.getString(5);
      int newstatus=status;

      if(status!=MessageTypes.PROPOSAL_PENDING_APPROVAL&&status!=MessageTypes.SUBMISSION_PENDING_APPROVAL)
      {
        replyInfo.add(new Boolean(false));
        replyInfo.add("The problem to which you are replying is not pending approval.");
        closeConnection(conn,ps);
        return replyInfo;
      }

      if(status==MessageTypes.PROPOSAL_PENDING_APPROVAL)
      {
        if(approved)
          newstatus=MessageTypes.PROPOSAL_APPROVED;
        else
          newstatus=MessageTypes.PROPOSAL_REJECTED;
      }
      else
      {
        if(approved)
          newstatus=MessageTypes.SUBMISSION_APPROVED;
        else
          newstatus=MessageTypes.SUBMISSION_REJECTED;
      }

      sqlStr.replace(0,sqlStr.length(),"UPDATE problem SET status=? WHERE problem_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,newstatus);
      ps.setInt(2,problemId);
      int numUpdates=ps.executeUpdate();
      if(numUpdates!=1) throw new Exception("Wrong number of rows updating: "+numUpdates);

      if(message!=null&&message.trim().length()>0)
      {
        int correspondenceId=Common.getSeqId(Common.JMA_SEQ);
        sqlStr.replace(0,sqlStr.length(),"INSERT INTO correspondence (correspondence_id, from_coder_id,problem_id,message) ");
        sqlStr.append("VALUES (?,?,?,?)");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,correspondenceId);
        ps.setInt(2,userId);
        ps.setInt(3,problemId);
        ps.setBytes(4,Common.serializeTextString(message));
        numUpdates=ps.executeUpdate();
        if(numUpdates!=1) throw new Exception("Wrong number of rows inserted on correspondence insert: "+numUpdates);
      }

      try
      {
        //send an email to the user
        EMailMessage email=new EMailMessage();
        String type=(status==MessageTypes.PROPOSAL_PENDING_APPROVAL)?"Proposal":"Submission";
        String statusS= (approved)?"Accepted":"Rejected";
        StringBuffer emailBody=new StringBuffer(256);
        emailBody.append("Hi "+handle+",\n\n");
        emailBody.append("Your "+type+" of "+className+" was "+statusS+ " by TopCoder admin "+adminHandle+".\n");
        if(message!=null&&message.trim().length()>0)
        {
          emailBody.append("\n"+adminHandle+" says: \n\n--------------------------------------\n"+message+"\n--------------------------------------\n");
        }

        emailBody.append("\nLog in to the applet to work on your problem further.\n\n");
        emailBody.append("-mpsqas\n\n");
        emailBody.append("This is an automated message from MPSQAS.\n");
        email.setMailSubject("TopCoder Problem "+type+" "+statusS);
        email.setMailSentDate(new java.sql.Date(System.currentTimeMillis()));
        email.setMailText(emailBody.toString());
        email.setMailFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
        email.setMode("S");
        email.setMailToAddress(emailAddy);
        Mail.sendMail(email);
      }
      catch(Exception e)
      {
        Common.logMsg("Error sending email.");
        e.printStackTrace();
      }
     
      //broadcast 
      try
      {
        ArrayList broadcast=new ArrayList(3);
        if(status==MessageTypes.PROPOSAL_PENDING_APPROVAL)
        {
          broadcast.add(new Integer(ApplicationConstants.PENDING_PROPOSAL_BROADCAST_IN));
          broadcast.add(getPendingProposalTable());
        }
        else
        {
          broadcast.add(new Integer(ApplicationConstants.PENDING_SUBMISSION_BROADCAST_IN));
          broadcast.add(getPendingSubmissionTable());
        }

        sendToAppletServer(broadcast);
      }
      catch(Exception e1)
      {
        Common.logMsg("Error broadcast status change for problem "+problemId);
        e1.printStackTrace();
      }
      replyInfo.add(new Boolean(true));
    }
    catch(Exception e)
    {
      replyInfo=new ArrayList(2);
      replyInfo.add(new Boolean(false));
      replyInfo.add(ApplicationConstants.SERVER_ERROR);
      Common.logMsg("Error inserting reply to problem proposal: ");
      e.printStackTrace();
    }
    closeConnection(conn,ps);
    return replyInfo;
  }

  /**
   * getUserProblems return an ArrayList containing two Matrix2Ds.  The first  is 
   * a Matrix2D of active problems the user wrote with the 
   * rows as follows:<p>
   * Date | Class Name | Method Name | Difficulty | Status | ProblemId
   * <p> The second is a Matrix2D of active problems the user is testing with the
   * rows as follows:<p>
   * WritenBy | Date | Class Name | Method Name | Difficulty | Status | ProblemId
   * <p> Note everythign is prettied up into sensible strings.
   * <p> Also, if userId=-1, all problems are returned as the second Matrix2D in the list.
   *
   * @param userId The id of the user for whom to look up problems, or -1 for all problems
   */
  public ArrayList getUserProblems(int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.getUserProblems()...");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    ArrayList problems=null;
    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT modify_date, class_name, method_name, difficulty_id, status, problem_id FROM ");
      sqlStr.append("problem WHERE submitted_by=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,userId);
      ResultSet rs=ps.executeQuery();

      Matrix2D writerProblems=new Matrix2D(0,6);
      
      ArrayList tableRow;
      while(rs.next())
      {
        tableRow=new ArrayList(6);

        tableRow.add(rs.getTimestamp(1).toString());
        tableRow.add(rs.getString(2));
        tableRow.add(rs.getString(3));
        tableRow.add(MessageTypes.getDifficultyName(rs.getInt(4)));
        tableRow.add(MessageTypes.getStatusName(rs.getInt(5)));
        tableRow.add(new Integer(rs.getInt(6)));

        writerProblems.addRow();
        writerProblems.setRow(writerProblems.numRows()-1,tableRow);
      }

      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, p.modify_date, p.class_name, p.method_name, p.difficulty_id, p.status, p.problem_id FROM ");
      sqlStr.append("problem p, user u WHERE p.submitted_by=u.user_id ");
      if(userId!=-1)
      {
        sqlStr.append(" AND p.problem_id in ");
        sqlStr.append("(SELECT problem_id FROM problem_user WHERE user_id=? AND user_type_id=?)");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,userId);
        ps.setInt(2,ApplicationConstants.PROBLEM_TESTER);
      }
      else //get all problems
      {
        sqlStr.append(" AND p.status IS NOT NULL AND p.submitted_by IS NOT NULL");
        ps=conn.prepareStatement(sqlStr.toString());
      }

      rs=ps.executeQuery();

      Matrix2D testerProblems=new Matrix2D(0,7);
      
      while(rs.next())
      {
        tableRow=new ArrayList(7);

        tableRow.add(rs.getString(1));
        tableRow.add(rs.getTimestamp(2).toString());
        tableRow.add(rs.getString(3));
        tableRow.add(rs.getString(4));
        tableRow.add(MessageTypes.getDifficultyName(rs.getInt(5)));
        tableRow.add(MessageTypes.getStatusName(rs.getInt(6)));
        tableRow.add(new Integer(rs.getInt(7)));

        testerProblems.addRow();
        testerProblems.setRow(testerProblems.numRows()-1,tableRow);
      }
      problems=new ArrayList();
      problems.add(writerProblems);
      problems.add(testerProblems);
    }
    catch(Exception e)
    {
      problems=null;
      Common.logMsg("Error getting writer problem information: ");
      e.printStackTrace();
    }
    closeConnection(conn,ps);
    return problems;
  }

  /**
   * getProblemInformation fills out a ProblemInformation class with all the
   * current information about a problem.
   *
   * @param problemId The id of the problem for which to retrieve the information.
   * @param userId    The userId of the person requesting the problem information.
   */
  public ProblemInformation getProblemInformation(int problemId,int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.getProblemInformation()...");
    ProblemInformation problemInformation;
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      //Find out the user type
      int userType=getUserType(problemId, userId);

      //get generic problem information
      sqlStr.replace(0,sqlStr.length(),"SELECT p.status, p.class_name, p.method_name, p.param_types, d.data_type_desc, p.difficulty_id, ");
      sqlStr.append("p.modify_date, p.problem_text, p.submitted_by FROM problem p, data_type d ");
      sqlStr.append("WHERE d.data_type_id=p.result_type_id AND p.problem_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ResultSet rs=ps.executeQuery();

      if (!rs.next()) throw new Exception("Problem does not exist");

      int writerId=rs.getInt(9);
      problemInformation=new ProblemInformation(rs.getString(2));
      problemInformation.setStatus(rs.getInt(1));
      problemInformation.setMethodName(rs.getString(3));
      problemInformation.setParamTypes((ArrayList)Common.getBlobObject(rs,4));
      problemInformation.setReturnType(rs.getString(5));
      problemInformation.setDifficultyLevel(rs.getInt(6));
      problemInformation.setTimestamp(rs.getTimestamp(7).toString());
      problemInformation.setProblemStatement(Common.getTextString(rs,8));
      problemInformation.setUserType(userType);

      int status = rs.getInt(1);

      //get correspondence
      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, c.sent_time, c.message FROM correspondence c,user u ");
      sqlStr.append(" WHERE c.problem_id=? AND u.user_id=c.from_coder_id ORDER BY c.sent_time");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      rs=ps.executeQuery();
      while(rs.next())
      {
        Correspondence correspondence=new Correspondence();
        correspondence.setSender(rs.getString(1));
        correspondence.setDate(rs.getString(2)); 
        correspondence.setMessage(Common.getTextString(rs,3));
        problemInformation.addCorrespondence(correspondence);
      }

      //get the users solution, if it exists
      sqlStr.replace(0,sqlStr.length(),"SELECT s.solution_text FROM solution s, problem_solution ps ");
      sqlStr.append("WHERE ps.problem_id=? AND s.coder_id=? AND ps.solution_id=s.solution_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      if(userType==ApplicationConstants.PROBLEM_ADMIN)
      {
        ps.setInt(2,writerId);
      }
      else
      {
        ps.setInt(2,userId);
      }
      rs=ps.executeQuery();

      if(rs.next())
        problemInformation.setSolution(Common.getTextString(rs,1));

      //get test cases
      sqlStr.replace(0,sqlStr.length(),"SELECT args FROM system_test_case WHERE problem_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      rs=ps.executeQuery();

      while(rs.next())
      {
        problemInformation.getTestCases().add(((ArrayList)Common.getBlobObject(rs,1)).toArray());
      }

      //get the list of all solutions
      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, ps.primary_solution, ");
      sqlStr.append("s.solution_text, s.solution_id, u.user_id  FROM user u, solution s, problem_solution ps ");
      sqlStr.append("WHERE ps.problem_id=? AND ps.solution_id=s.solution_id AND u.user_id=s.coder_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      rs=ps.executeQuery();

      ArrayList solution;
      while(rs.next())
      {
        solution=new ArrayList(4);
        solution.add(rs.getString(1));
        solution.add(rs.getString(2));
        if (userType == ApplicationConstants.PROBLEM_TESTER &&
            status < MessageTypes.FINAL_TESTING)
        {
          solution.add("Solution not available until Final Testing.");
        }
        else
        {
          solution.add(rs.getString(3));
        }
        solution.add(new Integer(rs.getInt(4)));
        problemInformation.addSolution(solution);
      }
   }
   catch(Exception e)
   {
     Common.logMsg("Error getting problem information for proposal:");
     e.printStackTrace();
     problemInformation=null;
   }
   closeConnection(conn,ps);
   return problemInformation;
  }

  /**
   * sendCorrespondence adds a correspondence message to the database for the specified problem. It 
   * returns a boolean indicating if it is successful or not.
   * 
   * @param message The correspondence message
   * @param problemId The problem corresponding to the correspondence
   * @param userId The userId of the guy sending the message
   */
  public boolean sendCorrespondence(Correspondence message, int problemId, int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.sendCorrespondence()...");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;

    try
    {
      conn=Common.getConnection();

      StringBuffer sqlStr=new StringBuffer(256);

      int correspondenceId=Common.getSeqId(Common.JMA_SEQ);

      sqlStr.replace(0,sqlStr.length(),"INSERT INTO correspondence (correspondence_id,from_coder_id,problem_id,message) VALUES ");
      sqlStr.append(" (?,?,?,?)");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,correspondenceId);
      ps.setInt(2,userId);
      ps.setInt(3,problemId);
      ps.setBytes(4,Common.serializeTextString(message.getMessage()));
      int numUpdates=ps.executeUpdate();
      if(numUpdates!=1) throw new Exception();

      //email about it
      try
      {
        sqlStr.replace(0,sqlStr.length(),"SELECT class_name FROM problem WHERE problem_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,problemId);
        ResultSet rs=ps.executeQuery();
        rs.next();
        String className=rs.getString(1);
        
        sqlStr.replace(0,sqlStr.length(),"SELECT handle FROM user WHERE user_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,userId);
        rs=ps.executeQuery();
        rs.next();
        String handle=rs.getString(1);

        //get a list of problem users affected by the correspondence
        sqlStr.replace(0,sqlStr.length(),"SELECT DISTINCT u.handle, u.email FROM user u, problem_user pu WHERE u.user_id=pu.user_id");
        sqlStr.append(" AND pu.problem_id=? AND pu.user_id != ?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,problemId);
        ps.setInt(2,userId);
        rs=ps.executeQuery();

        EMailMessage email=new EMailMessage();
        StringBuffer emailBody=new StringBuffer(256);
        while(rs.next())
        {
          //send an email to the user
          emailBody.replace(0,emailBody.length(),"Hi "+rs.getString(1)+",\n\n");
          emailBody.append("Correspondence has been added to "+className+", a problem with which you are associated.\n\n");
          emailBody.append(handle+" says: \n\n--------------------------------------\n"+message.getMessage()+"\n--------------------------------------\n");
          emailBody.append("\nLog into the applet to work on the problem further.\n\n");
          emailBody.append("-mpsqas\n\n");
          emailBody.append("This is an automated message from MPSQAS.\n");
          email.setMailSubject("New Correspondence For "+className);
          email.setMailSentDate(new java.sql.Date(System.currentTimeMillis()));
          email.setMailText(emailBody.toString());
          email.setMailFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
          email.setMode("S");
          email.setMailToAddress(rs.getString(2));
          Mail.sendMail(email);
        }
      }
      catch(Exception e)
      {
        Common.logMsg("Error sending email.");
        e.printStackTrace();
      }

      //broadcast new correspondence
      try
      {
        sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, c.sent_time FROM correspondence c,user u ");
        sqlStr.append(" WHERE c.correspondence_id=? AND u.user_id=c.from_coder_id ORDER BY c.sent_time");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,correspondenceId);
        ResultSet rs=ps.executeQuery();
        rs.next();
        message.setSender(rs.getString(1));
        message.setDate(rs.getString(2)); 

        ArrayList broadcast=new ArrayList();
        broadcast.add(new Integer(ApplicationConstants.CORRESPONDENCE_BROADCAST_IN));
        broadcast.add(message);
        broadcast.add(new Integer(problemId));

        sendToAppletServer(broadcast);
      }
      catch(Exception e1)
      {
        Common.logMsg("Error broadcasting new correspondence.");
        e1.printStackTrace();
      }
      
    }
    catch(Exception e)
    {
      Common.logMsg("Error inserting correspondence:");
      e.printStackTrace(); 
      return false;
    } 

    return true;
  }

  /**
   * submitProblem handles the inserts, updates, and status changes required when a user submits
   * a problem.
   *
   * @param info The ProblemInformation for the problem
   * @param problemId The problem's problemid
   * @param userId The user's id.
   * @param connectionId The user's connection id. (So he won't get the broadcast saying "It's been changed")
   */
  public ArrayList submitProblem(ProblemInformation info, int problemId, int userId,int connectionId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.submitProblem()...");
    ArrayList submitInfo=new ArrayList(2);
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    try
    {
      conn=Common.getConnection();

      StringBuffer sqlStr=new StringBuffer();

      //Find out the user type
      int userType=getUserType(problemId, userId);

      //next, get some simple information about the problem
      sqlStr.replace(0,sqlStr.length(),"SELECT status, submitted_by,param_types FROM problem WHERE problem_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ResultSet rs=ps.executeQuery();
      rs.next();

      int status=rs.getInt(1);
      int writerId=rs.getInt(2);
      ArrayList oldParamTypes=(ArrayList)Common.getBlobObject(rs,3);
      int numUpdates,i;

      if(userType!=ApplicationConstants.PROBLEM_TESTER)
      {
        //Make sure all required fields filled
        if(info.getMethodName().trim().length()==0||
           info.getClassName().trim().length()==0||
           info.getProblemStatement().trim().length()==0||
           info.getDifficultyLevel()<1||
           info.getDifficultyLevel()>3)
        {
          submitInfo.add(new Boolean(false));
          submitInfo.add("Please fill out all fields.");
          closeConnection(conn,ps);
          return submitInfo;
        }

        //Do some checking to make sure the input data seems ok
        boolean validInput=true;
        for(i=0;i<info.getMethodName().length();i++)
          if(!Character.isLetterOrDigit(info.getMethodName().charAt(i))) validInput=false;
        for(i=0;i<info.getClassName().length();i++)
          if(!Character.isLetterOrDigit(info.getClassName().charAt(i))) validInput=false;
        if(Character.isDigit(info.getMethodName().charAt(0))||
           Character.isDigit(info.getClassName().charAt(0)))
          validInput=false;

        if(!validInput)
        {
          submitInfo.add(new Boolean(false));
          submitInfo.add("Class or Method name contains incorrect characters.");
          closeConnection(conn,ps);
          return submitInfo;
        }

        //Make sure we have no other problems with that class name.
        sqlStr.replace(0,sqlStr.length(),"SELECT * FROM problem WHERE class_name=? AND problem_id!=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setString(1,info.getClassName());
        ps.setInt(2,problemId);
        rs=ps.executeQuery();
        if(rs.next())
        {
          submitInfo.add(new Boolean(false));
          submitInfo.add("A problem with this class name already exists.  Please rename the class.");
          closeConnection(conn,ps);
          return submitInfo;
        }

        //Make sure the param types are valid
        sqlStr.replace(0,sqlStr.length(),"SELECT data_type_id FROM data_type WHERE data_type_desc=?");
        ps=conn.prepareStatement(sqlStr.toString());
        for(i=0;i<info.getParamTypes().size();i++)
        {
          ps.setString(1,info.getParamTypes().get(i).toString());
          rs=ps.executeQuery();
          if(!rs.next())
          {
            submitInfo.add(new Boolean(false));
            submitInfo.add("Unrecognized parameter type.");
            closeConnection(conn,ps);
            return submitInfo;
          }
        }

        //make sure the return type is valid.
        ps.setString(1,info.getReturnType());
        rs=ps.executeQuery();
        if(!rs.next())
        {
          submitInfo.add(new Boolean(false));
          submitInfo.add("Unrecognized return type.");
          closeConnection(conn,ps);
          return submitInfo;
        }
        int returnTypeId=rs.getInt(1);

        //update the main problem information in the problem table
        backUpProblemStatement(problemId);
        sqlStr.replace(0,sqlStr.length(),"UPDATE problem SET class_name=?, method_name=?, param_types=?, problem_text=?,");
        sqlStr.append("result_type_id=?,difficulty_id=?, modify_date=current WHERE problem_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setString(1,info.getClassName());
        ps.setString(2,info.getMethodName());
        ps.setBytes(3,Common.serializeBlobObject(info.getParamTypes()));
        ps.setBytes(4,Common.serializeTextString(info.getProblemStatement()));
        ps.setInt(5,returnTypeId);
        ps.setInt(6,info.getDifficultyLevel());
        ps.setInt(7,problemId);
        numUpdates=ps.executeUpdate();
        if(numUpdates!=1) throw new Exception("Wrong number of rows inserted / updated: "+numUpdates);
      }

      //if the status is submitInfoaccepted, or better, insert / update the solution 
      if(status>=MessageTypes.PROPOSAL_APPROVED)
      {
        int solutionId;
        //first see if this coder already has a solution
        sqlStr.replace(0,sqlStr.length(),"SELECT ps.solution_id FROM problem_solution ps, solution s WHERE ps.problem_id=? AND s.coder_id=?");
        sqlStr.append(" AND ps.solution_id=s.solution_id");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,problemId);
        if(userType==ApplicationConstants.PROBLEM_ADMIN)
          ps.setInt(2,writerId);
        else
          ps.setInt(2,userId);
        rs=ps.executeQuery();

        if(rs.next()) //if its in there, update it
        {
          //update the solution text & date
          solutionId=rs.getInt(1);
          backUpSolution(solutionId);
          sqlStr.replace(0,sqlStr.length(),"UPDATE solution SET solution_text=?, modify_date=current WHERE solution_id=?");
          ps=conn.prepareStatement(sqlStr.toString());
          ps.setBytes(1,Common.serializeTextString(info.getSolution()));
          ps.setInt(2,solutionId);
          numUpdates=ps.executeUpdate();
          if(numUpdates!=1) throw new Exception("Wrong number of rows inserted / updated: "+numUpdates);

          sqlStr.replace(0,sqlStr.length(),"UPDATE problem_solution SET primary_solution=? WHERE solution_id=?");
          ps=conn.prepareStatement(sqlStr.toString());
          ps.setString(1,(userType!=ApplicationConstants.PROBLEM_TESTER)?("Y"):("N")); 
          ps.setInt(2,solutionId);
          numUpdates=ps.executeUpdate();
          if(numUpdates!=1) throw new Exception("Wrong number of rows updated: "+numUpdates);
        }
        else //solution does not exist, insert it, and assign solution to problem
        {
          solutionId=Common.getSeqId(Common.JMA_SEQ);
          sqlStr.replace(0,sqlStr.length(),"INSERT INTO solution (solution_id,coder_id,solution_text,modify_date)");
          sqlStr.append(" VALUES (?,?,?,current)");
          ps=conn.prepareStatement(sqlStr.toString());
          ps.setInt(1,solutionId);
          if(userType==ApplicationConstants.PROBLEM_ADMIN)
            ps.setInt(2,writerId);
          else
            ps.setInt(2,userId);
          ps.setBytes(3,Common.serializeTextString(info.getSolution()));
          numUpdates=ps.executeUpdate();
          if(numUpdates!=1) throw new Exception("Wrong number of rows inserted / updated: "+numUpdates);

          sqlStr.replace(0,sqlStr.length(),"INSERT INTO problem_solution (problem_id,solution_id,primary_solution) VALUES (?,?,?)");
          ps=conn.prepareStatement(sqlStr.toString());
          ps.setInt(1,problemId);
          ps.setInt(2,solutionId);
          ps.setString(3,(userType!=ApplicationConstants.PROBLEM_TESTER)?("Y"):("N")); 
          numUpdates=ps.executeUpdate();
          if(numUpdates!=1) throw new Exception("Wrong number of rows inserted / updated: "+numUpdates);
        }

        //see if it compiles
        String packageName="com.topcoder.tester.solutions.s"+solutionId;
        String code=info.getSolution();
        code="package "+packageName+";";
        code+=info.getSolution();
        ArrayList compiledCode=new CompilerWaiter().compile(code,info.getClassName()+".java",packageName);
        if(!((Boolean)compiledCode.get(0)).booleanValue())
        {
          submitInfo.add(new Boolean(false));
          submitInfo.add("The solution does not compile.");
          closeConnection(conn,ps);
          return submitInfo;
        }

        //insert the compiled code
        HashMap classFiles=(HashMap)compiledCode.get(1);
        sqlStr.replace(0,sqlStr.length(),"UPDATE solution SET solution_class=? WHERE solution_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setBytes(1,Common.serializeBlobObject(classFiles));
        ps.setInt(2,solutionId);
        numUpdates=ps.executeUpdate();
        if(numUpdates!=1) throw new Exception("Wrong number of rows inserted / updated: "+numUpdates);

        //make sure all test cases pass checkData and the solution returns something for them all and there are at least 
        if(info.getTestCases().size()<ApplicationConstants.MIN_TEST_CASES)
        {
          submitInfo.add(new Boolean(false));
          submitInfo.add("You must have at least "+ApplicationConstants.MIN_TEST_CASES+" test cases.");
          closeConnection(conn,ps);
          return submitInfo;
        }

        //delete old test cases if the param types changed
        if(!oldParamTypes.equals(info.getParamTypes()))
        {
          sqlStr.replace(0,sqlStr.length(),"DELETE FROM system_test_case WHERE problem_id=?");
          ps=conn.prepareStatement(sqlStr.toString());
          ps.setInt(1,problemId);
          numUpdates=ps.executeUpdate();
          Common.logMsg(numUpdates+" test cases deleted due to change in param types.");
        }

        Object testResults;
        Object[] expectedResults=new Object[info.getTestCases().size()];
        for(i=0;i<info.getTestCases().size();i++)
        {
          //does it pass checkData?
          if(userType!=ApplicationConstants.PROBLEM_TESTER)
          {
            try
            {
              testResults=new TesterWaiter().test(classFiles,packageName,info.getClassName(),"checkData",
                                                  info.getParamTypes(),(Object[])info.getTestCases().get(i)).get(1);
              if(testResults==null)
              {
                submitInfo.add(new Boolean(false));
                submitInfo.add("checkData does not return anything.");
                closeConnection(conn,ps);
                return submitInfo;
              }
              if(!((String)testResults).equals(""))
              {
                submitInfo.add(new Boolean(false));
                submitInfo.add("Test case number "+i+" does not pass checkData().");
                closeConnection(conn,ps);
                return submitInfo;
              }
            }
            catch(ClassCastException e)
            {
              submitInfo.add(new Boolean(false));
              submitInfo.add("checkData() does not return a String.");
              closeConnection(conn,ps);
              return submitInfo;
            }
          }

          //does the solution return anythign
          testResults=new TesterWaiter().test(classFiles,packageName,info.getClassName(),info.getMethodName(),
                                              info.getParamTypes(),(Object[])info.getTestCases().get(i)).get(1);
          if(testResults==null)
          {
            submitInfo.add(new Boolean(false));
            submitInfo.add(info.getMethodName()+"() does not return anything for test case "+i+".");
            closeConnection(conn,ps);
            return submitInfo;
          }

          //store the expected result
          expectedResults[i]=testResults;
        }

        sqlStr.replace(0,sqlStr.length(),"SELECT test_case_id FROM system_test_case WHERE problem_id=? ORDER BY test_case_id");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,problemId);
        rs=ps.executeQuery();

        int currentTestCaseIndex=0;
        int currentTestCaseId=0; 

        for(currentTestCaseIndex=0;currentTestCaseIndex<info.getTestCases().size();currentTestCaseIndex++)
        {
          if(rs.next())
          {
            //update any current tests
            currentTestCaseId=rs.getInt(1);
            sqlStr.replace(0,sqlStr.length(),"UPDATE system_test_case SET args=?,expected_result=? WHERE test_case_id=?");
            ps=conn.prepareStatement(sqlStr.toString());
            ps.setBytes(1,Common.serializeBlobObject(new ArrayList(Arrays.asList((Object[])info.getTestCases().get(currentTestCaseIndex)))));
            ps.setBytes(2,Common.serializeBlobObject(expectedResults[currentTestCaseIndex]));
            ps.setInt(3,currentTestCaseId);
          }
          else
          {
            //insert the test case
            currentTestCaseId=Common.getSeqId(Common.JMA_SEQ);
            sqlStr.replace(0,sqlStr.length(),"INSERT INTO system_test_case (test_case_id,problem_id,args,expected_result) VALUES (?,?,?,?)");
            ps=conn.prepareStatement(sqlStr.toString());
            ps.setInt(1,currentTestCaseId);
            ps.setInt(2,problemId);
            ps.setBytes(3,Common.serializeBlobObject(new ArrayList(Arrays.asList((Object[])info.getTestCases().get(currentTestCaseIndex)))));
            ps.setBytes(4,Common.serializeBlobObject(expectedResults[currentTestCaseIndex]));
          }
          numUpdates=ps.executeUpdate();
          if(numUpdates!=1) Common.logMsg("Wrong number of update on test case update/insert: "+numUpdates);
        }
 
        //delete any extra test cases in the db
        if(rs.next())
        {
          sqlStr.replace(0,sqlStr.length(),"DELETE FROM system_test_case WHERE test_case_id>=? AND problem_id=?");
          ps=conn.prepareStatement(sqlStr.toString());
          ps.setInt(1,rs.getInt(1));
          ps.setInt(2,problemId);
          numUpdates=ps.executeUpdate();
          Common.logMsg(numUpdates+" rows delete from system_test_case");
        } 
      }

      //the submission went ok, update the status
      if(userType==ApplicationConstants.PROBLEM_WRITER || userId==writerId)
      {
        int newStatus=status;
        if(status==MessageTypes.PROPOSAL_REJECTED) newStatus=MessageTypes.PROPOSAL_PENDING_APPROVAL;
        if(status==MessageTypes.PROPOSAL_APPROVED) newStatus=MessageTypes.SUBMISSION_PENDING_APPROVAL;
        if(status==MessageTypes.SUBMISSION_REJECTED) newStatus=MessageTypes.SUBMISSION_PENDING_APPROVAL;

        sqlStr.replace(0,sqlStr.length(),"UPDATE problem SET status=? WHERE problem_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,newStatus);
        ps.setInt(2,problemId);
        numUpdates=ps.executeUpdate();
        if(numUpdates!=1) Common.logMsg("Wrong number of update on problem status update: "+numUpdates);

        //broadcast the status changes, if necessary,  and problem change
        try
        {
          //broadcast the status change to the PENDING_APPROVAL_ROOM
          if(status!=newStatus)
          {
            ArrayList broadcast=new ArrayList(3);
            if(newStatus==MessageTypes.PROPOSAL_PENDING_APPROVAL)
            {
              broadcast.add(new Integer(ApplicationConstants.PENDING_PROPOSAL_BROADCAST_IN));
              broadcast.add(getPendingProposalTable());
            }
            else
            {
              broadcast.add(new Integer(ApplicationConstants.PENDING_SUBMISSION_BROADCAST_IN));
              broadcast.add(getPendingSubmissionTable());
            }

            sendToAppletServer(broadcast);
          }
        }
        catch(Exception e1)
        {
          Common.logMsg("Error broadcast status change for problem "+problemId);
          e1.printStackTrace();
        }
      }

      //broadcast the problem change to VIEW_PROBLEM_ROOM
      try
      {
        ArrayList broadcast2=new ArrayList();
        broadcast2.add(new Integer(ApplicationConstants.PROBLEM_MODIFIED_BROADCAST_IN));

        sqlStr.replace(0,sqlStr.length(),"SELECT handle FROM user WHERE user_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,userId);
        rs=ps.executeQuery();
        rs.next();
        String handle=rs.getString(1);
        broadcast2.add(handle+" has modified this problem.  Please reload the problem to see the changes and before submitting any other changes.");
        broadcast2.add(new Integer(problemId));
        broadcast2.add(new Integer(connectionId)); //don't send this message to the user who made the submission

        sendToAppletServer(broadcast2);
      }
      catch(Exception e1)
      {
        Common.logMsg("Error broadcast status change for problem "+problemId);
        e1.printStackTrace();
      }
      
      submitInfo.add(new Boolean(true));
    }
    catch(Exception e)
    {
      Common.logMsg("Error in submitProblem:");
      e.printStackTrace();
      submitInfo.add(new Boolean(false));
      submitInfo.add(ApplicationConstants.SERVER_ERROR);      
    }
    closeConnection(conn,ps);
    return submitInfo;
  }

  /**
   * submitProblemStatement update just the problem statement for a problem
   * Returns a String about the success.
   *
   * @param info The new problem statement.
   * @param problemId The problem's problemid
   * @param userId The user's id.
   * @param connectionId The user's connection id. 
   *                     (So he won't get the broadcast saying "It's been changed")
   */
  public String submitProblemStatement(String statement, int problemId, int userId,int connectionId)
  {
    if (VERBOSE) Common.logMsg("Updating problem statement for problemId = " + problemId);
    String result;
    java.sql.Connection conn = null;
    PreparedStatement ps = null;

    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer();

      //Find out the user type
      int userType=getUserType(problemId, userId);

      if (userType != ApplicationConstants.PROBLEM_ADMIN &&
          userType != ApplicationConstants.PROBLEM_WRITER)
      {
          result = "You do not have permission to edit this problem statement.";
          closeConnection(conn,ps);
          return result;
      }

      backUpProblemStatement(problemId);
      sqlStr.replace(0, sqlStr.length(), "UPDATE problem SET problem_text = ?, modify_date = current ");
      sqlStr.append(" WHERE problem_id = ?");
      ps = conn.prepareStatement(sqlStr.toString());
      ps.setBytes(1, Common.serializeTextString(statement));
      ps.setInt(2, problemId);
      ps.executeUpdate();

      result = "Problem statement saved.";
    }
    catch(Exception e)
    {
      Common.logMsg("Error saving problem statement for problemId " + problemId);
      e.printStackTrace();
      result = ApplicationConstants.SERVER_ERROR;
    }
    closeConnection(conn,ps);
    return result;
  }


  /**
   * compile compiles some code from a user, and if the compile is sucessful 
   * inserts the results into the database for testing
   *
   * @param info The ProblemInformation of the code to compile.
   * @param problemId The problem id to compile
   * @param userId The user id of the person compiling.
   */
  public ArrayList compile(ProblemInformation info, int problemId, int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.compile");
    ArrayList results=new ArrayList(2);
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    try
    {
      conn=Common.getConnection();

      StringBuffer sqlStr=new StringBuffer(256);

      //Find out the user type
      int userType=getUserType(problemId, userId);

      //get the writer id
      sqlStr.replace(0,sqlStr.length(),"SELECT submitted_by FROM problem WHERE problem_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ResultSet rs=ps.executeQuery();

      if(!rs.next()) throw new Exception("Problem "+problemId+" does not exist for "+userId);

      int writerId=rs.getInt(1);

      sqlStr.replace(0,sqlStr.length(),"SELECT ps.solution_id FROM problem_solution ps,solution s WHERE ps.problem_id=? AND s.coder_id=? AND ps.solution_id=s.solution_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      if(userType==ApplicationConstants.PROBLEM_ADMIN)
        ps.setInt(2,writerId);
      else
        ps.setInt(2,userId);
      rs=ps.executeQuery();

      int solutionId;
      if(rs.next())
      {
        solutionId=rs.getInt(1);
      }
      else //insert the solution into the db
      {
        solutionId=Common.getSeqId(Common.JMA_SEQ);
        sqlStr.replace(0,sqlStr.length(),"INSERT INTO solution (solution_id,coder_id,solution_text,modify_date)");
        sqlStr.append(" VALUES (?,?,?,current)");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,solutionId);
        if(userType==ApplicationConstants.PROBLEM_ADMIN)
          ps.setInt(2,writerId);
        else
          ps.setInt(2,userId);
        ps.setBytes(3,Common.serializeTextString(info.getSolution()));
        int numUpdates=ps.executeUpdate();
        if(numUpdates!=1) throw new Exception("Wrong number of rows inserted / updated: "+numUpdates);

        sqlStr.replace(0,sqlStr.length(),"INSERT INTO problem_solution (problem_id,solution_id,primary_solution) VALUES (?,?,?)");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,problemId);
        ps.setInt(2,solutionId);
        ps.setString(3,"N"); 
        numUpdates=ps.executeUpdate();
        if(numUpdates!=1) throw new Exception("Wrong number of rows inserted / updated: "+numUpdates);
      }
        
      String packageName="com.topcoder.tester.solutions.s"+solutionId;
      String fileName=info.getClassName()+".java";

      //make some pre-compile code modifications
      String code=info.getSolution();
      code="package "+packageName+";";
      code+=info.getSolution();

      //compile
      ArrayList compiledCode=new CompilerWaiter().compile(code,fileName,packageName);

      //if compile errors, return results
      if(!((Boolean)compiledCode.get(0)).booleanValue())
      {
        closeConnection(conn,ps);
        return compiledCode;
      }

      //update the solution class in the database
      sqlStr.replace(0,sqlStr.length(),"UPDATE solution SET solution_class=?, solution_text=? WHERE solution_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setBytes(1,Common.serializeBlobObject(compiledCode.get(1)));
      ps.setBytes(2,Common.serializeTextString(info.getSolution())); 
      ps.setInt(3,solutionId);
      int numUpdates=ps.executeUpdate();
      if(numUpdates!=1) throw new Exception("Wrong number of rows inserted / updated: "+numUpdates);

      results.add(new Boolean(true)); 
    }
    catch(Exception e)
    {
     Common.logMsg("Error compiling:");
     e.printStackTrace();
     results=new ArrayList();
     results.add(new Boolean(false));
     results.add(ApplicationConstants.SERVER_ERROR);
    }
    closeConnection(conn,ps);
    return results;
  }

  /**
   * test calls the tester to test some code and returns a string that is
   * the test results.  It gets the class files from the database.
   *
   * @param args An Object[] of arguments to pass to the method
   * @param problemId The problemId to test
   * @param userId The userId of the tester
   */
  public String test(Object[]args,int problemId,int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.test()..");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    String testResults="";
    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      //Find out the user type
      int userType=getUserType(problemId, userId);

      //get the writer id
      sqlStr.replace(0,sqlStr.length(),"SELECT submitted_by FROM problem WHERE problem_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ResultSet rs=ps.executeQuery();

      if(!rs.next()) throw new Exception("Problem "+problemId+" does not exist for "+userId);

      int writerId=rs.getInt(1);

      sqlStr.replace(0,sqlStr.length(),"SELECT s.solution_class,s.solution_id FROM solution s,problem_solution ps ");
      sqlStr.append(" WHERE ps.problem_id=? AND s.coder_id=? AND s.solution_class IS NOT NULL AND s.solution_id=ps.solution_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      if(userType==ApplicationConstants.PROBLEM_ADMIN)
        ps.setInt(2,writerId);
      else
        ps.setInt(2,userId);
      rs=ps.executeQuery();

      if(!rs.next())
      {
        closeConnection(conn,ps);
        return "There is no compiled solution to test.";
      }

      HashMap classFiles=(HashMap)Common.getBlobObject(rs,1);
      String packageName="com.topcoder.tester.solutions.s"+rs.getInt(2);

      sqlStr.replace(0,sqlStr.length(),"SELECT param_types, class_name, method_name FROM problem WHERE problem_id=? AND param_types IS NOT NULL");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      rs=ps.executeQuery();

      if(!rs.next())
      {
        closeConnection(conn,ps);
        return "The problem does not exists, or there are no param types associated with it. Try compiling the problem.";
      }

      ArrayList paramTypes=(ArrayList)Common.getBlobObject(rs,1);
      String className=rs.getString(2);
      String methodName=rs.getString(3);

      if(userType!=ApplicationConstants.PROBLEM_TESTER)
      {
        testResults=(String)(new TesterWaiter().test(classFiles,packageName,className,"checkData",paramTypes,args).get(0));
        testResults+="\n\n";
      }
      testResults+=(String)(new TesterWaiter().test(classFiles,packageName,className,methodName,paramTypes,args).get(0));
    }
    catch(Exception e)
    {
      Common.logMsg("Error processing test:");
      e.printStackTrace();
      testResults=ApplicationConstants.SERVER_ERROR;
    }

    closeConnection(conn,ps);
    return testResults;
  }

  /**
   * testAll calls the tester to test some code and returns a string that is
   * the test results.  It gets the class files from the database. It tests all
   * solutions for a particular submission.
   *
   * @param args An Object[] of arguments to pass to the method
   * @param problemId The problemId to test
   * @param userId The userId of the tester
   */
  public String testAll(Object[]args,int problemId,int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.testAll()..");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    String testResults="";

    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT param_types, class_name, method_name FROM problem WHERE problem_id=? AND param_types IS NOT NULL");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ResultSet rs=ps.executeQuery();

      if(!rs.next())
      {
        closeConnection(conn,ps);
        return "The problem does not exists, or there are no param types associated with it. Try compiling the problem.";
      }

      ArrayList paramTypes=(ArrayList)Common.getBlobObject(rs,1);
      String className=rs.getString(2);
      String methodName=rs.getString(3);

      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, ps.primary_solution, s.solution_class,s.solution_id FROM solution s,problem_solution ps, user u ");
      sqlStr.append(" WHERE ps.problem_id=? AND s.coder_id=u.user_id AND s.solution_class IS NOT NULL AND s.solution_id=ps.solution_id ORDER BY ps.primary_solution DESC");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      rs=ps.executeQuery();

      HashMap classFiles;
      String packageName;

      while(rs.next())
      {
        classFiles=(HashMap)Common.getBlobObject(rs,3);
        packageName="com.topcoder.tester.solutions.s"+rs.getInt(4);

        testResults+=rs.getString(1)+"'s solution:\n";
        if(rs.getString(2).equals("Y"))
        {
          testResults+=(String)(new TesterWaiter().test(classFiles,packageName,className,"checkData",paramTypes,args).get(0));
          testResults+="\n\n";
        }
        testResults+=(String)(new TesterWaiter().test(classFiles,packageName,className,methodName,paramTypes,args).get(0));
        testResults+="\n\n";
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error processing test:");
      e.printStackTrace();
      testResults=ApplicationConstants.SERVER_ERROR;
    }

    closeConnection(conn,ps);
    return testResults;
  }
  /**
   * Returns a Matrix2D of upcoming contests that the user_id has permission to view.  
   * The returned Matrix2D is of the form ContestName|Date|role|roundId.
   *
   * @param userId The userId of the user trying to view contests, or -1 to get just
   *               the round ids for the background processor.
   */
  public Matrix2D getUpcomingContests(int userId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.getUpcomingContests()..");
    Matrix2D contestTable;

    if (userId == -1)
    {
      contestTable=new Matrix2D(0,1);
    } 
    else
    {
      contestTable=new Matrix2D(0,4);
    }
    java.sql.Connection conn=null;
    PreparedStatement ps=null;

    try
    {
      conn=Common.getConnection();
 
      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT * FROM group_user WHERE group_id=? AND user_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,ApplicationConstants.ADMIN_GROUP);
      ps.setInt(2,userId);
      ResultSet rs=ps.executeQuery();

      boolean admin=false;

      if(rs.next() || userId < 0)
      {
        admin=true;
        sqlStr.replace(0,sqlStr.length(),"SELECT c.name,r.name,rs.start_time,r.round_id FROM ");
        sqlStr.append(" contest c, round r, round_segment rs WHERE c.contest_id=r.contest_id AND r.round_id=rs.round_id ");
        sqlStr.append(" AND rs.segment_id=? AND rs.start_time > ? ORDER BY rs.start_time");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,ApplicationConstants.CODING_SEGMENT);
        ps.setTimestamp(2,new Timestamp(System.currentTimeMillis()-ApplicationConstants.DISPLAY_OLD_CONTEST));
      }
      else
      {
        sqlStr.replace(0,sqlStr.length(),"SELECT c.name, r.name, rs.start_time, r.round_id FROM contest c,round r,round_segment rs WHERE ");
        sqlStr.append(" c.contest_id=r.contest_id AND rs.round_id=r.round_id AND rs.segment_id=? AND rs.start_time>? ");
        sqlStr.append(" AND r.round_id IN (SELECT DISTINCT round_id FROM round_problem WHERE problem_id IN ");
        sqlStr.append(" (SELECT DISTINCT problem_id FROM problem_user WHERE user_id=?)) ORDER BY rs.start_time");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,ApplicationConstants.CODING_SEGMENT);
        ps.setTimestamp(2,new Timestamp(System.currentTimeMillis()-ApplicationConstants.DISPLAY_OLD_CONTEST));
        ps.setInt(3,userId);
      }

      rs=ps.executeQuery();

      //find out if user is writer / tester of a contest
      sqlStr.replace(0,sqlStr.length(),"SELECT DISTINCT pu.user_type_id FROM problem_user pu WHERE pu.problem_id IN ");
      sqlStr.append(" (SELECT problem_id FROM round_problem WHERE round_id=?) AND pu.user_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(2,userId);
      ResultSet rs2;
      int count;
      String role;
      ArrayList contestRow;

      while(rs.next())
      {
        contestRow=new ArrayList(4);

        if (userId >= 0)
        {
          contestRow.add(rs.getString(1)+", "+rs.getString(2));
          contestRow.add(rs.getTimestamp(3).toString());

          //get user's role
          ps.setInt(1,rs.getInt(4));
          rs2=ps.executeQuery();
          count=0;
          role="";
          if(admin)
          {
            role+="Admin";
            count++;
          }
          while(rs2.next())
          {
            if(count>0) role+=" & ";
            switch(rs2.getInt(1))
            {
              case ApplicationConstants.PROBLEM_TESTER:
                role+="Tester";
                break;
              case ApplicationConstants.PROBLEM_WRITER:
                role+="Writer";
                break;
              default:
                role+="Unknown("+rs2.getInt(1)+")";
            }
          }
  
          contestRow.add(role);
        }
        contestRow.add(new Integer(rs.getInt(4)));
        contestTable.addRow();
        contestTable.setRow(contestTable.numRows()-1,contestRow);
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting contest table:");
      e.printStackTrace();
    }

    closeConnection(conn,ps);
    return contestTable;
    
  }

  /**
   * Gets all the contest information about a round from the database and fills out a 
   * ContestInformation instance. Returns the ContestInformation about the contest.
   *
   * @param roundId  The round for which to get information
   */
  public ContestInformation getContestInformation(int roundId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.getContestInformation()");

    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    ContestInformation contestInformation=new ContestInformation();
 
    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);
 
      //get the contest / round name    
      sqlStr.replace(0,sqlStr.length(),"SELECT c.name,r.name FROM contest c,round r ");
      sqlStr.append(" WHERE r.round_id=? AND r.contest_id=c.contest_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,roundId);
      ResultSet rs=ps.executeQuery();

      if(!rs.next())
      {
        Common.logMsg("No contest/round scheduled for requested round: "+roundId);
        throw new Exception();
      }

      contestInformation.setContestName(rs.getString(1));
      contestInformation.setRoundName(rs.getString(2));

      //get times
      sqlStr.replace(0,sqlStr.length(),"SELECT start_time,end_time FROM round_segment ");
      sqlStr.append(" WHERE round_id=? AND segment_id=?");
      ps=conn.prepareStatement(sqlStr.toString());

      //coding phase time
      ps.setInt(1,roundId);
      ps.setInt(2,ApplicationConstants.CODING_SEGMENT);
      rs=ps.executeQuery();

      if(!rs.next())
      {
        Common.logMsg("No coding segment scheduled for round "+roundId);
        contestInformation.setStartCoding("NOT SCHEDULED");
        contestInformation.setEndCoding("NOT SCHEDULED");
      }
      else
      {
        contestInformation.setStartCoding(rs.getTimestamp(1).toString());
        contestInformation.setEndCoding(rs.getTimestamp(2).toString());
      }

      //challenge phase time
      ps.setInt(2,ApplicationConstants.CHALLENGE_SEGMENT);
      rs=ps.executeQuery();

      if(!rs.next())
      {
        Common.logMsg("No challenge segment scheduled for round "+roundId);
        contestInformation.setStartChallenge("NOT SCHEDULED");
        contestInformation.setEndChallenge("NOT SCHEDULED");
      }
      else
      {
        contestInformation.setStartChallenge(rs.getTimestamp(1).toString());
        contestInformation.setEndChallenge(rs.getTimestamp(2).toString());
      }

      //get the problem information
      sqlStr.replace(0,sqlStr.length(),"SELECT p.class_name,p.problem_text,u.handle,p.difficulty_id,p.problem_id");
      sqlStr.append(" FROM problem p,user u,round_problem rp WHERE p.problem_id=rp.problem_id AND ");
      sqlStr.append(" rp.round_id=? AND p.submitted_by=u.user_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,roundId);
      rs=ps.executeQuery();

      int numProblems=0;
      ArrayList problemIds=new ArrayList(3);
      ArrayList problemInfo;
  
      //put together a "quick" problemInfo for each problem 
      while(rs.next())
      {
        problemInfo=new ArrayList(4);
        problemInfo.add(rs.getString(1));
        problemInfo.add(Common.getTextString(rs,2));
        problemInfo.add(rs.getString(3));
        problemInfo.add(MessageTypes.getDifficultyName(rs.getInt(4)));
        numProblems++;
        problemInfo.add(new Integer(rs.getInt(5)));
        problemIds.add(new Integer(rs.getInt(5)));
        contestInformation.addProblem(problemInfo);
      }

      //get the problem testers
      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle FROM user u,problem_user pu WHERE u.user_id=pu.user_id");
      sqlStr.append(" AND pu.problem_id=? AND pu.user_type_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(2,ApplicationConstants.PROBLEM_TESTER);
      for(int i=0;i<numProblems;i++)
      {
        ps.setInt(1,((Integer)problemIds.get(i)).intValue());
        rs=ps.executeQuery();
        while(rs.next())
        {
          if(contestInformation.getProblemTesters().indexOf(rs.getString(1))==-1)
            contestInformation.addTester(rs.getString(1));
        }
      }
    }
    catch(Exception e)
    {
      if (VERBOSE) Common.logMsg("Error retrieving contest information for round "+roundId);
      e.printStackTrace();
      contestInformation=null;
    }
    closeConnection(conn,ps);
    return contestInformation;
  }

  /**
   * Retrieves a list of problems from the database that are available for use in the next contest.  It returns an ArrayList
   * or ArrayLists where the inner ArrayList is class name, statement, writer, difficulty, id, currentlyScheduled
   *
   * @param roundId The roundId for which to get the available problems
   */
  public ArrayList getAvailableProblems(int roundId)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.getAvailableProblems()...");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    ArrayList problems=new ArrayList();
    try
    {
      conn=Common.getConnection();

      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT p.class_name,p.problem_text,u.handle,p.difficulty_id,p.problem_id ");
      sqlStr.append(" FROM problem p,user u WHERE (p.status=? OR p.status=? OR p.status=?) AND u.user_id=p.submitted_by AND p.problem_id NOT IN ");
      sqlStr.append(" (SELECT problem_id FROM round_problem WHERE (round_id>1999 OR round_id<1000)) ORDER BY u.handle , p.difficulty_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,MessageTypes.SUBMISSION_APPROVED);
      ps.setInt(2,MessageTypes.TESTING);
      ps.setInt(3,MessageTypes.READY);
      ResultSet rs=ps.executeQuery();

      ArrayList problemInformation;

      while(rs.next())
      {
        problemInformation=new ArrayList(5);
        problemInformation.add(rs.getString(1));
        problemInformation.add(Common.getTextString(rs,2));
        problemInformation.add(rs.getString(3));
        problemInformation.add(MessageTypes.getDifficultyName(rs.getInt(4)));
        problemInformation.add(new Boolean(false));
        problemInformation.add(new Integer(rs.getInt(5)));
        problems.add(problemInformation);
      }
 
      sqlStr.replace(0,sqlStr.length(),"SELECT p.class_name,p.problem_text,u.handle,p.difficulty_id,p.problem_id ");
      sqlStr.append(" FROM problem p,user u WHERE u.user_id=p.submitted_by AND p.problem_id IN ");
      sqlStr.append(" (SELECT problem_id FROM round_problem WHERE round_id=?) ORDER BY u.handle , p.difficulty_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,roundId);
      rs=ps.executeQuery();

      while(rs.next())
      {
        problemInformation=new ArrayList(5);
        problemInformation.add(rs.getString(1));
        problemInformation.add(Common.getTextString(rs,2));
        problemInformation.add(rs.getString(3));
        problemInformation.add(MessageTypes.getDifficultyName(rs.getInt(4)));
        problemInformation.add(new Boolean(true));
        problemInformation.add(new Integer(rs.getInt(5)));
        problems.add(problemInformation);
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting available problems: ");
      e.printStackTrace();
      problems=null;
    }
    closeConnection(conn,ps);
    return problems;
  }

  /**
   * Returns a list of people available to test a contest.  The returned value is an
   * Arraylist of Arraylist where the inner lists contain handle, user_id, currentlyScheduled
   *
   * @param id The id (problem or round) for which to get the available testers
   * @param idType Either ApplicationConstants.ROUND or ApplicationConstants.PROBLEM
   */
  public ArrayList getAvailableTesters(int id, int idType)
  {
    if (VERBOSE) Common.logMsg("In MPSQASServicesBean.getAvailableTesters("+id+")");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    ArrayList testers=new ArrayList();

    try
    {
       conn=Common.getConnection();

       StringBuffer sqlStr=new StringBuffer(256);

       sqlStr.replace(0,sqlStr.length(),"SELECT pu.user_id FROM problem_user pu WHERE pu.user_type_id=? AND pu.problem_id IN ");
       if (idType == ApplicationConstants.ROUND)
       {
         sqlStr.append(" (SELECT problem_id FROM round_problem WHERE round_id=?)");
       }
       else if (idType == ApplicationConstants.PROBLEM)
       {
         sqlStr.append(" (?)");
       }

       ps=conn.prepareStatement(sqlStr.toString());
       ps.setInt(1,ApplicationConstants.PROBLEM_TESTER);
       ps.setInt(2,id);
       ResultSet rs=ps.executeQuery();

       ArrayList schedTesters=new ArrayList();
       while(rs.next())
       {
         schedTesters.add(new Integer(rs.getInt(1)));
       }

       sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, u.user_id FROM user u, group_user g WHERE u.user_id=g.user_id AND g.group_id=?");
       ps=conn.prepareStatement(sqlStr.toString());
       ps.setInt(1,ApplicationConstants.PROBLEM_TESTER_GROUP);
       rs=ps.executeQuery();

       ArrayList tester;
       while(rs.next())
       {
         tester=new ArrayList(2);
         tester.add(rs.getString(1));
         tester.add(new Boolean(schedTesters.indexOf(new Integer(rs.getInt(2)))>=0));
         tester.add(new Integer(rs.getInt(2)));
         testers.add(tester);
       }
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting available testers:");
      e.printStackTrace();
      testers=null;
    }

    closeConnection(conn,ps);
    return testers; 
  }

  /**
   * Updates the problemIds in round_problem and the testers of the scheduled problems to match the passed data.
   * Returns a message about its success.
   *
   * @param roundId The round id to change the information.
   * @param problemIds The problemIds that should be scheduled for the round.
   * @param testerIds The user ids of the problem testers.
   */
  public String scheduleProblems(int roundId,ArrayList problemIds,ArrayList testerIds)
  {
    Common.logMsg("In MPSQASServicesBean.scheduleProblems() for round "+roundId);
    Common.logMsg("   problemIds: "+problemIds);  
    Common.logMsg("   testerIds: "+testerIds);  
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    String results="";

    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      //delete old testers from old problems
      sqlStr.replace(0,sqlStr.length(),"DELETE FROM problem_user WHERE user_type_id=? AND problem_id IN ");
      sqlStr.append(" (SELECT problem_id FROM round_problem WHERE round_id=?)");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,ApplicationConstants.PROBLEM_TESTER);
      ps.setInt(2,roundId);
      int rowsUpdated=ps.executeUpdate();
      Common.logMsg(rowsUpdated+" testers deleted from old round problems.");
       

      //delete the old scheduled problems
      sqlStr.replace(0,sqlStr.length(),"DELETE FROM round_problem WHERE round_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,roundId);
      rowsUpdated=ps.executeUpdate();

      Common.logMsg(rowsUpdated+" rows removed from round_problem");

      //insert the new problems
      sqlStr.replace(0,sqlStr.length(),"INSERT INTO round_problem (round_id,problem_id) VALUES (?,?)");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,roundId);

      int i;
      rowsUpdated=0;
      for(i=0;i<problemIds.size();i++)
      {
        ps.setInt(2,((Integer)problemIds.get(i)).intValue());
        rowsUpdated+=ps.executeUpdate();
      }

      Common.logMsg(rowsUpdated+" problems added to round "+roundId); 

      //change the status of the problems to TESTING
      sqlStr.replace(0,sqlStr.length(),"UPDATE problem SET status=? WHERE problem_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,MessageTypes.TESTING);

      rowsUpdated=0;
      for(i=0;i<problemIds.size();i++)
      {
        ps.setInt(2,((Integer)problemIds.get(i)).intValue());
        rowsUpdated+=ps.executeUpdate();
      }

      Common.logMsg(rowsUpdated+" problems status changed to TESTING."); 

      //if the problem tester is not already a tester for each problem, make him one
      int j;
      ArrayList problemTesters;
      int problemId;
      ResultSet rs;
      for(i=0;i<problemIds.size();i++)
      {
        problemId=((Integer)problemIds.get(i)).intValue();
        sqlStr.replace(0,sqlStr.length(),"SELECT user_id FROM problem_user WHERE problem_id=? AND user_type_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,problemId);
        ps.setInt(2,ApplicationConstants.PROBLEM_TESTER);
        rs=ps.executeQuery();

        problemTesters=new ArrayList();
        while(rs.next())
          problemTesters.add(new Integer(rs.getInt(1)));

        for(j=0;j<testerIds.size();j++)
        {
          if(problemTesters.indexOf(testerIds.get(j))==-1)
          {
            sqlStr.replace(0,sqlStr.length(),"INSERT INTO problem_user (problem_id,user_id,user_type_id, ");
            sqlStr.append(" paid) VALUES (?, ?, ?, ?)");
            ps=conn.prepareStatement(sqlStr.toString());
            ps.setInt(1,problemId);
            ps.setInt(2,((Integer)testerIds.get(j)).intValue());
            ps.setInt(3,ApplicationConstants.PROBLEM_TESTER);
            ps.setString(4, "N");
            rowsUpdated=ps.executeUpdate();
            if(rowsUpdated!=1) Common.logMsg("Strange number of updates inserting problem tester: "+rowsUpdated);
          }
        }
      }

      //email those involved
      try
      {
        //get some contest information
        sqlStr.replace(0,sqlStr.length(),"SELECT c.name, r.name, rs.start_time FROM contest c, round r, round_segment rs ");
        sqlStr.append("WHERE r.contest_id=c.contest_id AND r.round_id=rs.round_id AND r.round_id=? AND rs.segment_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,roundId);
        ps.setInt(2,ApplicationConstants.CODING_SEGMENT);
        rs=ps.executeQuery();
        rs.next();

        String contestName=rs.getString(1)+", "+rs.getString(2);
        String contestTime=rs.getTimestamp(3).toString();
        
        sqlStr.replace(0,sqlStr.length(),"SELECT DISTINCT u.handle, u.email FROM user u,problem_user pu ");
        sqlStr.append(" WHERE pu.user_id=u.user_id AND pu.user_type_id=? AND pu.problem_id IN ");
        sqlStr.append(" (SELECT problem_id FROM round_problem WHERE round_id=?)");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,ApplicationConstants.PROBLEM_TESTER);
        ps.setInt(2,roundId);
        rs=ps.executeQuery();

        ArrayList testerHandles=new ArrayList();
        ArrayList testerEmails=new ArrayList();
        while(rs.next())
        {
          testerHandles.add(rs.getString(1));
          testerEmails.add(rs.getString(2));
        }

        ps.setInt(1,ApplicationConstants.PROBLEM_WRITER);
        rs=ps.executeQuery();

        ArrayList writerHandles=new ArrayList();
        ArrayList writerEmails=new ArrayList();
        while(rs.next())
        {
          writerHandles.add(rs.getString(1));
          writerEmails.add(rs.getString(2));
        }


        //send an email to the problem writers and problem tester's letting them know.
        EMailMessage email=new EMailMessage();
        StringBuffer emailBody=new StringBuffer(256);
        for(i=0;i<testerHandles.size();i++)
        {
          emailBody.replace(0,emailBody.length(),"Hi "+testerHandles.get(i)+",\n\n");
          emailBody.append("You have been scheduled to problem test the following contest:\n");
          emailBody.append("Name: "+contestName+"\n");
          emailBody.append("Date: "+contestTime+"\n\n");

          if(writerHandles.size()==1)
            emailBody.append("The problem writer is:\n");
          else
            emailBody.append("The problem writers are:\n");
          for(j=0;j<writerHandles.size();j++)
            emailBody.append(writerHandles.get(j)+"\n");

          if(testerHandles.size()>1)
          {
            if(testerHandles.size()==2)
              emailBody.append("\nThe other problem tester is:\n");
            else
              emailBody.append("\nThe other problems tester are:\n");
            for(j=0;j<testerHandles.size();j++)
              if(j!=i)  emailBody.append(testerHandles.get(j)+"\n");
          } 

          emailBody.append("\nPlease log into the applet to view and test the problems.\n\n");
          emailBody.append("-mpsqas\n\n");
          emailBody.append("This is an automated message from MPSQAS.\n");
          email.setMailSubject("Problem Testing "+contestName+", "+contestTime);
          email.setMailSentDate(new java.sql.Date(System.currentTimeMillis()));
          email.setMailText(emailBody.toString());
          email.setMailFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
          email.setMode("S");
          email.setMailToAddress((String)testerEmails.get(i));
          Mail.sendMail(email);
        }

        for(i=0;i<writerHandles.size();i++)
        {
          emailBody.replace(0,emailBody.length(),"Hi "+writerHandles.get(i)+",\n\n");
          emailBody.append("Your problem(s) are being used in the following contest:\n");
          emailBody.append("Name: "+contestName+"\n");
          emailBody.append("Date: "+contestTime+"\n\n");

          if(testerHandles.size()==1)
            emailBody.append("The problem tester is:\n");
          else
            emailBody.append("The problem testers are:\n");
          for(j=0;j<testerHandles.size();j++)
            emailBody.append(testerHandles.get(j)+"\n");

          if(writerHandles.size()>1)
          {
            if(writerHandles.size()==2)
              emailBody.append("\nThe other problem writer is:\n");
            else
              emailBody.append("\nThe other problems writers are:\n");
            for(j=0;j<writerHandles.size();j++)
              if(j!=i)  emailBody.append(writerHandles.get(j)+"\n");
          } 

          emailBody.append("\nPlease log into the applet frequently between now and the contest to help polish the problems.\n\n");
          emailBody.append("-mpsqas\n\n");
          emailBody.append("This is an automated message from MPSQAS.\n");
          email.setMailSubject("Using your problems in "+contestName+", "+contestTime);
          email.setMailSentDate(new java.sql.Date(System.currentTimeMillis()));
          email.setMailText(emailBody.toString());
          email.setMailFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
          email.setMode("S");
          email.setMailToAddress((String)writerEmails.get(i));
          Mail.sendMail(email);
        }
      }
      catch(Exception e)
      {
        Common.logMsg("Error sending email.");
        e.printStackTrace();
      }

      //send a broadcast letting anyone else viewing the contest that things have changed.
      try
      {
        ArrayList broadcast=new ArrayList(3);
        broadcast.add(new Integer(ApplicationConstants.ROUND_SCHEDULE_BROADCAST_IN));
        broadcast.add(getContestInformation(roundId));
        broadcast.add(new Integer(roundId));
        sendToAppletServer(broadcast);
      }
      catch(Exception e2)
      {
        Common.logMsg("Error broadcasting problem_schedule for round "+roundId);
        e2.printStackTrace();
      }
 
      results="Scheduling successful.";
      if(problemIds.size()!=3) results+="  Warning: "+problemIds.size()+" problems scheduled.";
    }
    catch(Exception e)
    {
      Common.logMsg("Error scheduling problems:");
      e.printStackTrace();
      results=ApplicationConstants.SERVER_ERROR;
    }

    closeConnection(conn,ps);
    return results;
  }

  /**
   * Runs all the solutions to a problem through the test cases and compares the results to ensure
   * they are all the same. Returns an ArrayList who's first element is a boolean as to whether the solutions
   * always agree, and the second element is a String showing the results.
   *
   * @param problemId The problem for which to compare the results.
   */
  public ArrayList compareSolutions(int problemId)
  {
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    StringBuffer compareResults=new StringBuffer(256);
    ArrayList results=new ArrayList(2);

    try
    {
      conn=Common.getConnection();

      StringBuffer sqlStr=new StringBuffer(256);

      //get and store the test cases information
      sqlStr.replace(0,sqlStr.length(),"SELECT args, expected_result,test_case_id FROM system_test_case WHERE problem_id=? ORDER BY test_case_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ResultSet rs=ps.executeQuery();

      ArrayList args=new ArrayList(ApplicationConstants.MIN_TEST_CASES);
      ArrayList expected=new ArrayList(ApplicationConstants.MIN_TEST_CASES);

      while(rs.next())
      {
        args.add(((ArrayList)Common.getBlobObject(rs,1)).toArray());
        expected.add(Common.getBlobObject(rs,2));
      }

      if(args.size()==0)
        compareResults.append("There are no test cases for this problem.");

      //get some problem information
      sqlStr.replace(0,sqlStr.length(),"SELECT param_types, class_name, method_name FROM problem WHERE problem_id=? AND param_types IS NOT NULL");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      rs=ps.executeQuery();

      if(!rs.next())
      {
        closeConnection(conn,ps);
        results.add(new Boolean(false));
        results.add("The problem does not exists, or there are no param types associated with it. Try compiling the problem.");
        return results;
      }

      ArrayList paramTypes=(ArrayList)Common.getBlobObject(rs,1);
      String className=rs.getString(2);
      String methodName=rs.getString(3);

      //get all the solutions for the problem
      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, ps.primary_solution, s.solution_class,s.solution_id FROM solution s,problem_solution ps, user u ");
      sqlStr.append(" WHERE ps.problem_id=? AND s.coder_id=u.user_id AND s.solution_class IS NOT NULL AND s.solution_id=ps.solution_id ");
      sqlStr.append(" ORDER BY ps.primary_solution DESC");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      rs=ps.executeQuery();

      HashMap classFiles;
      String packageName;
      ArrayList testObjects=new ArrayList(2);
      ArrayList testStrings=new ArrayList(2);
      ArrayList solutionWriterNames=new ArrayList(2);
      ArrayList primarySolution=new ArrayList(2);
      ArrayList solutionResultObjects=new ArrayList(2);
      ArrayList solutionResultStrings=new ArrayList(2);
      ArrayList solutionResults;
      int i;

      //run the solutions through the test cases
      while(rs.next())
      {
        classFiles=(HashMap)Common.getBlobObject(rs,3);
        packageName="com.topcoder.tester.solutions.s"+rs.getInt(4);
        solutionResultObjects=new ArrayList(args.size());
        solutionResultStrings=new ArrayList(args.size());

        for(i=0;i<args.size();i++)
        {
          solutionResults=new TesterWaiter().test(classFiles,packageName,className,methodName,paramTypes,(Object[])args.get(i));
          solutionResultStrings.add(solutionResults.get(0));
          solutionResultObjects.add(solutionResults.get(1));
        }
 
        testObjects.add(solutionResultObjects);
        testStrings.add(solutionResultStrings);
        solutionWriterNames.add(rs.getString(1));
        primarySolution.add(new Boolean(rs.getString(2).equals("Y")));
      }

      //for each test case, see if all solutions agree
      int j;
      boolean agree;
      boolean allAlwaysAgree=true;
      for(i=0;i<args.size();i++)
      {
        compareResults.append("For test case "+i+":\n");
        compareResults.append("Args     = "+ApplicationConstants.makePretty(args.get(i))+"\n");
        compareResults.append("Expected = "+ApplicationConstants.makePretty(expected.get(i))+"\n");

        agree=true;
        for(j=0;j<testObjects.size();j++)
        {
          if(!ApplicationConstants.compare(expected.get(i),((ArrayList)testObjects.get(j)).get(i)))
          {
            agree=false;
            allAlwaysAgree=false;
            if(((Boolean)primarySolution.get(j)).booleanValue())
              compareResults.append("\nPRIMARY SOLUTION DOES NOT AGREE WITH EXPECTED RESULT:");
            compareResults.append("\n"+solutionWriterNames.get(j)+"'s solution did not agree.  It returns:\n");
            compareResults.append((String)((ArrayList)testStrings.get(j)).get(i)+"\n");
          }
        }
        if(agree)
          compareResults.append("All solutions agree.");
        compareResults.append("\n\n");
      }
      if(args.size()>0)
      {
        if(allAlwaysAgree)
        {
          compareResults.insert(0,"All solutions always agree for all test cases:\n\n"); 
          results.add(new Boolean(true));
        }
        else
        {
          compareResults.insert(0,"SOLUTIONS DISAGREE:\n\n"); 
          results.add(new Boolean(false));
        }
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error comparing results for problem "+problemId);
      e.printStackTrace();
      results.add(new Boolean(false));
      compareResults.insert(0,ApplicationConstants.SERVER_ERROR);
    }

    results.add(compareResults.toString());
    closeConnection(conn,ps);
    return results;
  }

  /**
   * Inserts an application into the database.  Does some checking first to make sure everything is going to be OK.
   *
   * @param message The message left with the application.
   * @param applicationType The type of application.
   * @param userId The user submitting the application.
   */
  public ArrayList submitApplication(String message,int applicationType,int userId)
  {
    if(VERBOSE) Common.logMsg("In MPSQASServicesBean.submitApplication().");

    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    ArrayList response;

    try
    {
      conn=Common.getConnection();;

      StringBuffer sqlStr=new StringBuffer(256);

      int applyUserGroup=-1;  //too much information that means the same thing.
      int applyUserType=-1;

      if(applicationType==MessageTypes.WRITER_APPLICATION)
      {
        applyUserGroup=ApplicationConstants.PROBLEM_WRITER_GROUP;
        applyUserType=ApplicationConstants.PROBLEM_WRITER;
      }
      else if(applicationType==MessageTypes.TESTER_APPLICATION)
      {
        applyUserGroup=ApplicationConstants.PROBLEM_TESTER_GROUP;
        applyUserType=ApplicationConstants.PROBLEM_TESTER;
      }

      sqlStr.replace(0,sqlStr.length(),"SELECT user_id FROM group_user WHERE (group_id=? OR group_id=?) AND user_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,ApplicationConstants.ADMIN_GROUP);
      ps.setInt(2,applyUserGroup);
      ps.setInt(3,userId);
      ResultSet rs=ps.executeQuery();

      if(rs.next()) //they are already in this group.
      {
        response=new ArrayList(2);
        response.add(new Boolean(false));
        response.add("You are already a member of this group.  No need to apply.");
        closeConnection(conn,ps);
        return response;
      }

      sqlStr.replace(0,sqlStr.length(),"SELECT dev_app_id FROM development_application WHERE user_id=? AND user_type_id=? AND dev_app_status_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,userId);
      ps.setInt(2,applyUserType);
      ps.setInt(3,ApplicationConstants.APPLICATION_PENDING);
      rs=ps.executeQuery();

      if(rs.next()) //they applied already
      {
        response=new ArrayList(2);
        response.add(new Boolean(false));
        response.add("You have already applied for this and the application is pending.");
        closeConnection(conn,ps);
        return response;
      }

      sqlStr.replace(0,sqlStr.length(),"INSERT INTO development_application (dev_app_id,user_id,user_type_id,");
      sqlStr.append("dev_app_status_id,message) VALUES (?,?,?,?,?)");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,Common.getSeqId(Common.JMA_SEQ));
      ps.setInt(2,userId);
      ps.setInt(3,applyUserType);
      ps.setInt(4,ApplicationConstants.APPLICATION_PENDING);
      ps.setBytes(5,Common.serializeTextString(message));
      int numUpdates=ps.executeUpdate();

      if(numUpdates!=1) throw new Exception("Wrong number of rows inserted: "+numUpdates);

      //broadcast about it
      try
      {
        ArrayList broadcast=new ArrayList(3);
        broadcast.add(new Integer(ApplicationConstants.PENDING_APPLICATION_BROADCAST_IN));
        broadcast.add(getPendingApplications());

        sendToAppletServer(broadcast);
      }
      catch(Exception e1)
      {
        Common.logMsg("Error broadcast new application:");
        e1.printStackTrace();
      }
      
      response=new ArrayList(1); 
      response.add(new Boolean(true)); 
    }
    catch(Exception e)
    {
      Common.logMsg("Error inserting into development_application: ");
      e.printStackTrace();
     
      response=new ArrayList(2);
      response.add(new Boolean(false));
      response.add(ApplicationConstants.SERVER_ERROR);
    }

    closeConnection(conn,ps);
    return response; 
  }

  /**
   * Returns a table of pending applications.
   * The columns are: <br>
   * Handle | App_Type | Rating | Events | dev_app_id
   */
  public Matrix2D getPendingApplications()
  {
    if(VERBOSE) Common.logMsg("In MPSQASServicesBean.getPendingApplications().");

    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    Matrix2D apps=null;
  
    try
    {
      conn=Common.getConnection();

      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, d.user_type_id, r.rating,r.num_ratings, d.dev_app_id FROM user u, rating r, ");
      sqlStr.append("development_application d WHERE u.user_id=d.user_id AND r.coder_id=u.user_id AND d.dev_app_status_id=? ");
      sqlStr.append(" ORDER BY d.user_type_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,ApplicationConstants.APPLICATION_PENDING);
      ResultSet rs=ps.executeQuery();

      apps=new Matrix2D(0,5,true);

      ArrayList temp;
      while(rs.next())
      {
        temp=new ArrayList(5);
        temp.add(rs.getString(1));

        if(rs.getInt(2)==ApplicationConstants.PROBLEM_WRITER)
          temp.add("Writer");
        else if(rs.getInt(2)==ApplicationConstants.PROBLEM_TESTER)
          temp.add("Tester");
        else
          temp.add("Unknown");

        temp.add(""+rs.getInt(3));
        temp.add(""+rs.getInt(4));
        temp.add(new Integer(rs.getInt(5)));

        apps.addRow();
        apps.setRow(apps.numRows()-1,temp);
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting problem testers: ");
      e.printStackTrace();
      apps=null;
    }

    closeConnection(conn,ps);
    return apps;
  }

  /**
   * Fills out an ApplicationInformation with information about an application.
   *
   * @param applicationId The dev_app_id of the application to get information about.
   */
  public ApplicationInformation getApplicationInformation(int applicationId)
  {
    if(VERBOSE) Common.logMsg("In MPSQASServices.getApplicationInformation().");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    ApplicationInformation info=null;

    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT u.handle, r.rating, r.num_ratings,c.first_name,c.last_name, u.email, d.message, d.user_type_id ");
      sqlStr.append(" FROM user u, rating r, coder c, development_application d WHERE ");
      sqlStr.append(" u.user_id=c.coder_id AND u.user_id=r.coder_id AND u.user_id=d.user_id ");
      sqlStr.append(" AND d.dev_app_id=? AND d.dev_app_status_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,applicationId);
      ps.setInt(2,ApplicationConstants.APPLICATION_PENDING);
      ResultSet rs=ps.executeQuery();

      if(!rs.next()) throw new Exception("No application with status PENDING with id "+applicationId);

      info=new ApplicationInformation();
      info.setHandle(rs.getString(1));
      info.setRating(rs.getInt(2));
      info.setEvents(rs.getInt(3));
      info.setName(rs.getString(4)+" "+rs.getString(5));
      info.setEmail(rs.getString(6));
      info.setMessage(Common.getTextString(rs,7));

      if(rs.getInt(8)==ApplicationConstants.PROBLEM_WRITER)
        info.setApplicationType("Problem Writer Application:");
      else if(rs.getInt(8)==ApplicationConstants.PROBLEM_TESTER)
        info.setApplicationType("Problem Tester Application:");
      else 
        info.setApplicationType("Unknown application type:");

    }
    catch(Exception e)
    {
      Common.logMsg("Error getting application information for dev_app_id= "+applicationId);
      e.printStackTrace();
      info=null;
    }
    closeConnection(conn,ps);
    return info;
  }

  /**
   * Replies to an application by updateding the status in the database and emailing the user letting 
   * him know the new status.
   * Returns an ArrayList with a Boolean indicating sucess, and an error message if no success.
   *
   * @param applicationId Id of the application to reply to.
   * @param accepted boolean indicating if the application was accepted.
   * @param message String indicating if a reason.
   * @param userId User Id of admin who is replying.
   */
  public ArrayList replyToApplication(int applicationId,boolean accepted,String message,int userId)
  {
    if(VERBOSE) Common.logMsg("In MPSQASServicesBean.replyToApplication()");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    ArrayList response=new ArrayList();

    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      //make sure this application exists and is pending.
      sqlStr.replace(0,sqlStr.length(),"SELECT user_id,user_type_id FROM development_application WHERE dev_app_id=? AND dev_app_status_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,applicationId);
      ps.setInt(2,ApplicationConstants.APPLICATION_PENDING);
      ResultSet rs=ps.executeQuery();

      if(!rs.next())
      {
        response.add(new Boolean(false));
        response.add("This application does not exist or is not pending approval.");
        closeConnection(conn,ps);
        return response;
      }

      int appUserId=rs.getInt(1);
      int appUserType=rs.getInt(2);
      int newStatus=accepted?ApplicationConstants.APPLICATION_ACCEPTED:ApplicationConstants.APPLICATION_REJECTED;
     
      //update the application table 
      sqlStr.replace(0,sqlStr.length(),"UPDATE development_application SET dev_app_status_id=? WHERE dev_app_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,newStatus);
      ps.setInt(2,applicationId);
      int rowsUpdated=ps.executeUpdate();
      if(rowsUpdated!=1) Common.logMsg("Strange number of rows updated on dev_app_status update: "+rowsUpdated);

      //add the user to the proper group
      if(accepted)
      {
        int newGroup=-1;
        if(appUserType==ApplicationConstants.PROBLEM_WRITER) newGroup=ApplicationConstants.PROBLEM_WRITER_GROUP;
        else if(appUserType==ApplicationConstants.PROBLEM_TESTER) newGroup=ApplicationConstants.PROBLEM_TESTER_GROUP;

        //make sure they are not already there
        sqlStr.replace(0,sqlStr.length(),"SELECT user_id FROM group_user WHERE group_id=? and user_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,newGroup);
        ps.setInt(2,appUserId);
        rs=ps.executeQuery();
        if(rs.next())
        {
          response.add(new Boolean(false));
          response.add("The user is already in the group.");
          closeConnection(conn,ps);
          return response;
        }

        sqlStr.replace(0,sqlStr.length(),"INSERT INTO group_user (user_id,group_id) VALUES (?,?)");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,appUserId);
        ps.setInt(2,newGroup);
        rowsUpdated=ps.executeUpdate();
        if(rowsUpdated!=1) Common.logMsg("Strange number of rows updated on group insert: "+rowsUpdated);
      }

      //email the user
      try
      {
        sqlStr.replace(0,sqlStr.length(),"SELECT handle, email FROM user WHERE user_id=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,appUserId);
        rs=ps.executeQuery();
        rs.next();
        String appHandle=rs.getString(1);
        String emailAddy=rs.getString(2);
       
        ps.setInt(1,userId);
        rs=ps.executeQuery();
        rs.next();
        String adminHandle=rs.getString(1);

        String accOrRej=accepted?"Accepted":"Rejected";
        String appType=appUserType==ApplicationConstants.PROBLEM_WRITER?"Problem Writer":"Problem Tester";

        EMailMessage email=new EMailMessage();
        StringBuffer emailBody=new StringBuffer(256);

        emailBody.replace(0,emailBody.length(),"Hi "+appHandle+",\n\n");
        emailBody.append("Your "+appType+" Application was "+accOrRej+" by admin "+adminHandle+".\n");

        if(message.trim().length()>0)
        {
          emailBody.append("\n"+adminHandle+" says:\n---------------------------------------------------------\n");
          emailBody.append(message);
          emailBody.append("\n---------------------------------------------------------\n");
        }

        if(accepted)
        {
          emailBody.append("\nNavigate to www.topcoder.com/contest/mpsqas/developercontract.html to get the required contract. ");
          emailBody.append("Log into MPSQAS at any time to begin proposing problems.\n");
        }

        emailBody.append("\n-mpsqas\n");
        emailBody.append("\nThis is an automated email generated by MPSQAS.");

        email.setMailSubject(appType+" Application "+accOrRej);
        email.setMailSentDate(new java.sql.Date(System.currentTimeMillis()));
        email.setMailText(emailBody.toString());
        email.setMailFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
        email.setMode("S");
        email.setMailToAddress(emailAddy);
        Mail.sendMail(email);
      }
      catch(Exception e)
      {
        Common.logMsg("Error sending email in response to application reply, id: "+applicationId);
        e.printStackTrace();
      }

      //broadcast about it
      try
      {
        ArrayList broadcast=new ArrayList(3);
        broadcast.add(new Integer(ApplicationConstants.PENDING_APPLICATION_BROADCAST_IN));
        broadcast.add(getPendingApplications());

        sendToAppletServer(broadcast);
      }
      catch(Exception e1)
      {
        Common.logMsg("Error broadcast new application");
        e1.printStackTrace();
      }

      response=new ArrayList(1);
      response.add(new Boolean(true));
    }
    catch(Exception e)
    {
      Common.logMsg("Error processing application reply, id: "+applicationId);
      e.printStackTrace();

      response=new ArrayList(2);
      response.add(new Boolean(false));
      response.add(ApplicationConstants.SERVER_ERROR);
    }

    closeConnection(conn,ps);
    return response; 
  }

  /**
   * Updates the status of a problem and the scheduled problem testers for the problem.
   * Returns a boolean about its success.
   *
   * @param status The index of the new status in STATI_IDS
   * @param testers The userIds of the problem testers.
   * @param problemId The problemId of the problem the user is editing.
   */
  public boolean adminSaveProblem(int status,ArrayList testers,int problemId)
  {
    if(VERBOSE) Common.logMsg("In MPSQASServicesBean.adminSaveProblem()");

    java.sql.Connection conn=null;
    PreparedStatement ps=null;

    try
    {
      conn=Common.getConnection();
      StringBuffer sqlStr=new StringBuffer(256);

      int statusId=MessageTypes.STATUS_IDS[status];

      sqlStr.replace(0,sqlStr.length(),"UPDATE problem SET status=? WHERE problem_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,statusId);
      ps.setInt(2,problemId);
      int rowsUpdated=ps.executeUpdate();
      if(rowsUpdated!=1) Common.logMsg("Odd number of updates in adminSaveProblem: "+rowsUpdated);

      sqlStr.replace(0,sqlStr.length(),"DELETE FROM problem_user WHERE problem_id=? AND user_type_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ps.setInt(2,ApplicationConstants.PROBLEM_TESTER);
      rowsUpdated=ps.executeUpdate();
      Common.logMsg(rowsUpdated+" rows deleted from problem user (old testers).");

      for(int i=0;i<testers.size();i++)
      {  
        sqlStr.replace(0,sqlStr.length(),"INSERT INTO problem_user (problem_id,user_id,user_type_id, ");
        sqlStr.append(" paid) VALUES (?,?,?, ?)");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,problemId);
        ps.setInt(2,((Integer)testers.get(i)).intValue());
        ps.setInt(3,ApplicationConstants.PROBLEM_TESTER);
        ps.setString(4, "N");
        rowsUpdated=ps.executeUpdate();
        if(rowsUpdated!=1) Common.logMsg("Strange number of updates inserting problem tester: "+rowsUpdated);
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error doing admin problem save: ");
      e.printStackTrace();
      closeConnection(conn,ps);
      return false;
    }  
    
    closeConnection(conn,ps);
    return true;
  }

  /**
   * Checks out a contest to make sure it looks all set to go. And returns a String
   * that is a summary of the check.
   * 
   * @param roundId The round to check
   */ 
  public String contestVerify(int roundId)
  {
    if(VERBOSE) Common.logMsg("In MPSQASServicesBean.contestVerify().");
    java.sql.Connection conn=null;
    PreparedStatement ps=null;
    StringBuffer result=new StringBuffer(1000);;

    try
    {
      conn=Common.getConnection();
      boolean ok=true;
      StringBuffer sqlStr=new StringBuffer(256);

      sqlStr.replace(0,sqlStr.length(),"SELECT rp.problem_id, p.class_name, p.status FROM round_problem rp, problem p "); 
      sqlStr.append(" WHERE rp.round_id=? AND rp.problem_id=p.problem_id");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,roundId);
      ResultSet rs=ps.executeQuery();

      ArrayList problemIds=new ArrayList(3); 
      ArrayList classNames=new ArrayList(3); 
      ArrayList statusIds=new ArrayList(3); 

      while(rs.next())
      {
        problemIds.add(new Integer(rs.getInt(1)));
        classNames.add(rs.getString(2));
        statusIds.add(new Integer(rs.getInt(3)));
      }

      if(problemIds.size()!=3)
      {
        ok=false;
        result.append(problemIds.size() + " problems scheduled!\n");
      }

      int i;
      for(i=0;i<problemIds.size();i++)
      {
        sqlStr.replace(0,sqlStr.length(),"SELECT solution_id FROM problem_solution WHERE problem_id=? AND primary_solution=?");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1,((Integer)problemIds.get(i)).intValue());
        ps.setString(2,"Y");
        rs=ps.executeQuery();

        if(!rs.next())
        {
          ok=false;
          result.append((String)classNames.get(i)+" does not have a primary solution!\n");
        }
      }

      for(i=0;i<problemIds.size();i++)
      {
        if(((Integer)statusIds.get(i)).intValue()!=MessageTypes.READY)
        {
          ok=false;
          result.append((String)classNames.get(i)+"'s status is not READY!\n");
        }
      }

      for(i=0;i<problemIds.size();i++)
      {
        //first element of compareSolutions is boolean as to whether they agree
        if(!((Boolean)compareSolutions(((Integer)problemIds.get(i)).intValue()).get(0)).booleanValue())
        {
          ok=false;
          result.append((String)classNames.get(i)+"'s solutions do not agree for the test cases!\n");
        }
      }      

      if(ok)
        result.append("Looks good: \n\nThere are three problems.\nAll three problems are ready.\nSolutions agree for all three problems.");

    }
    catch(Exception e)
    {
      Common.logMsg("Error verifying contest.");
      e.printStackTrace();
      result.append(ApplicationConstants.SERVER_ERROR);
    }

    closeConnection(conn,ps);
    return result.toString(); 
  }

  /**
   * Inserts chat messages in ArrayList into mpsqas_chat_history table 
   * in the database.
   *
   * @param chat An ArrayList of ArrayList with inner ArrayLists of form
   *             roundId | problemId | coderId | time | message
   */
  public void logChat(ArrayList chat)
  {
    if (VERBOSE) Common.logMsg("Logging MPSQAS chat.");

    java.sql.Connection conn = null;
    PreparedStatement ps = null;

    try
    {
      conn = Common.getConnection();
      StringBuffer sqlStr = new StringBuffer(256);
      ResultSet rs;

      sqlStr.replace(0, sqlStr.length(), "INSERT INTO mpsqas_chat_history");
      sqlStr.append(" (round_id, problem_id, coder_id, timestamp, message) ");
      sqlStr.append(" VALUES (?, ?, ?, ?, ?)");
      ps = conn.prepareStatement(sqlStr.toString());

      for(int i = 0; i< chat.size(); i++)
      {
        if (((Integer)((ArrayList)chat.get(i)).get(0)).intValue() != -1)
        {
          ps.setInt(1, ((Integer)((ArrayList)chat.get(i)).get(0)).intValue());
          ps.setNull(2, java.sql.Types.DECIMAL);
        }
        else
        {
          ps.setNull(1, java.sql.Types.DECIMAL);
          ps.setInt(2, ((Integer)((ArrayList)chat.get(i)).get(1)).intValue());
        }
        ps.setInt(3,((Integer)((ArrayList)chat.get(i)).get(2)).intValue());
        ps.setTimestamp(4, ((Timestamp)((ArrayList)chat.get(i)).get(3)));
        ps.setBytes(5, Common.serializeTextString(
                                 ((String)((ArrayList)chat.get(i)).get(4))));
        ps.executeUpdate();
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error logging chat:");
      e.printStackTrace();
    }

    closeConnection(conn, ps);
  }
  
  /**
   * Gets the chat history for a round from the database and returns a String containg
   * all the text, in the form time: user> message. If id type is round, also gets history for
   * all problems in the round.
   *
   * @param id The id (round or problem) to get the history for.
   * @param isRound true if id is round id, false otherwise.
   */
  public String getChatHistory(int id, boolean isRound)
  {
    if (VERBOSE) Common.logMsg("Getting chat history");

    java.sql.Connection conn = null;
    PreparedStatement ps = null;

    StringBuffer outputString = new StringBuffer(256);

    try
    {
      conn = Common.getConnection();
      StringBuffer sqlStr = new StringBuffer(256);

      if (isRound)
      {
        sqlStr.replace(0, sqlStr.length(), "SELECT ch.timestamp, u.handle, ch.message ");
        sqlStr.append(" FROM mpsqas_chat_history ch, user u ");
        sqlStr.append(" WHERE ch.coder_id = u.user_id AND ch.round_id = ?");
        sqlStr.append(" ORDER BY ch.timestamp");

        ps = conn.prepareStatement(sqlStr.toString());
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        outputString.append("----------------------------------------------------------\n");
        outputString.append("Chat history for round:\n\n");

        while (rs.next())
        {
           outputString.append(rs.getTimestamp(1).toString());
           outputString.append(": ");
           outputString.append(rs.getString(2));
           outputString.append("> ");
           outputString.append(Common.getTextString(rs, 3));
           outputString.append("\n");
        }

        sqlStr.replace(0, sqlStr.length(), "SELECT p.problem_id, p.class_name ");
        sqlStr.append(" FROM round_problem rp, problem p  ");
        sqlStr.append(" WHERE rp.round_id=? AND rp.problem_id = p.problem_id");
        ps=conn.prepareStatement(sqlStr.toString());
        ps.setInt(1, id);
        rs = ps.executeQuery();

        while(rs.next())
        {
          outputString.append("\nChat history for ");
          outputString.append(rs.getString(2));
          outputString.append(":\n");
          outputString.append(getChatHistory(rs.getInt(1), false));
        }
      }
      else
      {
        sqlStr.replace(0, sqlStr.length(), "SELECT ch.timestamp, u.handle, ch.message ");
        sqlStr.append(" FROM mpsqas_chat_history ch, user u ");
        sqlStr.append(" WHERE ch.coder_id = u.user_id AND ch.problem_id = ?");
        sqlStr.append(" ORDER BY ch.timestamp");

        ps = conn.prepareStatement(sqlStr.toString());
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        while (rs.next())
        {
           outputString.append(rs.getTimestamp(1).toString());
           outputString.append(": ");
           outputString.append(rs.getString(2));
           outputString.append("> ");
           outputString.append(Common.getTextString(rs, 3));
           outputString.append("\n");
        }
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting contest history:");
      e.printStackTrace();
      outputString.append(ApplicationConstants.SERVER_ERROR);
    }
    closeConnection(conn, ps);

    return outputString.toString();
  }

  /**
   * Sets the status of any problems in the specified round to false and, in the future,
   * can perform any other after contest tasks.
   *
   * @param roundId The round id of the contest to work with.
   */
  public void wrapUpContest(int roundId)
  {
    if (VERBOSE) Common.logMsg("Wrapping up contest "+roundId);

    if (roundId < ApplicationConstants.REAL_CONTEST_ID_LOWER_BOUND)
    {
      //either admin test or practice room, ignore.
      return; 
    }

    java.sql.Connection conn = null;
    PreparedStatement ps = null;

    try
    {
      conn = Common.getConnection();
      StringBuffer sqlStr = new StringBuffer(256);

      sqlStr.replace(0, sqlStr.length(), "UPDATE problem ");
      sqlStr.append(" SET status = ? ");
      sqlStr.append(" WHERE problem_id in ");
      sqlStr.append(" (SELECT problem_id FROM round_problem WHERE round_id = ?)"); 
      ps = conn.prepareStatement(sqlStr.toString());
      ps.setInt(1, MessageTypes.USED);
      ps.setInt(2, roundId);
      int updates = ps.executeUpdate();

      Common.logMsg(updates + " problems changed to USED in wrapping up " + roundId);
    }
    catch(Exception e)
    {
      Common.logMsg("Error wraping up " + roundId);
      e.printStackTrace();
    }
  } 

  /**
   * Returns a table of information regarding users payment.  The table is returned as a 
   * Matrix2D with columns: <br>
   * handle|name|payment to date|easy pending|med pending|hard pending|test pending|
   * total|coderid
   */
  public Matrix2D getPaymentInformation()
  {
    if (VERBOSE) Common.logMsg("Getting payment information.");

    java.sql.Connection conn = null;
    PreparedStatement ps = null; 
    PreparedStatement ps2 = null;
    Matrix2D info = new Matrix2D(0, 9);
 
    try
    {
      conn = Common.getConnection();
      StringBuffer sqlStr = new StringBuffer(256);
      ResultSet rs, rs2;

      //first get all the writers and testers
      sqlStr.replace(0, sqlStr.length(), "SELECT DISTINCT gu.user_id, ");
      sqlStr.append(" u.handle, c.first_name, c.last_name ");
      sqlStr.append(" FROM group_user gu, user u, coder c "); 
      sqlStr.append(" WHERE (group_id = ? OR group_id = ?) AND c.coder_id = gu.user_id ");
      sqlStr.append(" AND c.coder_id = u.user_id");
      ps = conn.prepareStatement(sqlStr.toString()); 
      ps.setInt(1, ApplicationConstants.PROBLEM_WRITER_GROUP);
      ps.setInt(2, ApplicationConstants.PROBLEM_TESTER_GROUP);
      rs = ps.executeQuery();

      sqlStr.replace(0, sqlStr.length(), "SELECT ");
      sqlStr.append("COUNT(pu.user_id) ");
      sqlStr.append(" FROM problem_user pu, problem p ");
      sqlStr.append(" WHERE p.problem_id=pu.problem_id ");
      sqlStr.append(" AND p.difficulty_id = ? AND pu.paid = ? AND pu.user_id = ? ");
      sqlStr.append(" AND pu.user_type_id = ? AND p.status >= ?");
      ps = conn.prepareStatement(sqlStr.toString());

      sqlStr.replace(0, sqlStr.length(), "SELECT ");
      sqlStr.append("COUNT(pu.user_id) ");
      sqlStr.append(" FROM problem_user pu, problem p ");
      sqlStr.append(" WHERE pu.paid = ? AND pu.user_type_id = ? AND pu.user_id = ? ");
      sqlStr.append(" AND p.problem_id = pu.problem_id AND p.status >= ?");
      ps2 = conn.prepareStatement(sqlStr.toString());

      int coderId;
      int easyNotPaid;
      int easyPaid;
      int mediumNotPaid;
      int mediumPaid;
      int hardNotPaid;
      int hardPaid;
      int testingNotPaid;
      int testingPaid;
      ArrayList currentRow;
 
      while(rs.next())
      {
        coderId = rs.getInt(1);
        ps.setInt(3, coderId);
        ps2.setInt(3, coderId);

        ps.setInt(1, MessageTypes.EASY_DIFFICULTY_LEVEL);
        ps.setString(2, "N");
        ps.setInt(4, ApplicationConstants.PROBLEM_WRITER);
        ps.setInt(5, MessageTypes.SUBMISSION_APPROVED);
        rs2 = ps.executeQuery();
        rs2.next();
        easyNotPaid = rs2.getInt(1);
       
        ps.setString(2, "Y");
        rs2 = ps.executeQuery();
        rs2.next();
        easyPaid = rs2.getInt(1);
         
        ps.setInt(1, MessageTypes.MEDIUM_DIFFICULTY_LEVEL);
        ps.setString(2, "N");
        rs2 = ps.executeQuery();
        rs2.next();
        mediumNotPaid = rs2.getInt(1);
       
        ps.setString(2, "Y");
        rs2 = ps.executeQuery();
        rs2.next();
        mediumPaid = rs2.getInt(1);
 
        ps.setInt(1, MessageTypes.HARD_DIFFICULTY_LEVEL);
        ps.setString(2, "N");
        rs2 = ps.executeQuery();
        rs2.next();
        hardNotPaid = rs2.getInt(1);
       
        ps.setString(2, "Y");
        rs2 = ps.executeQuery();
        rs2.next();
        hardPaid = rs2.getInt(1);

        ps2.setString(1, "N");
        ps2.setInt(2, ApplicationConstants.PROBLEM_TESTER);
        ps2.setInt(4, MessageTypes.USED);
        rs2 = ps2.executeQuery();
        rs2.next();
        testingNotPaid = rs2.getInt(1);

        ps2.setString(1, "Y");
        rs2 = ps2.executeQuery();
        rs2.next();
        testingPaid = rs2.getInt(1);

        currentRow = new ArrayList(9);
        currentRow.add(rs.getString(2)); //handle
        currentRow.add(rs.getString(3) + " " + rs.getString(4));  //name
        currentRow.add("$" + (ApplicationConstants.EASY_PAYMENT*easyPaid   //payment to date
                            +ApplicationConstants.MEDIUM_PAYMENT*mediumPaid
                            +ApplicationConstants.HARD_PAYMENT*hardPaid
                            +ApplicationConstants.TEST_PAYMENT*testingPaid) + ".00");
        currentRow.add(""+easyNotPaid);  //easy pending
        currentRow.add(""+mediumNotPaid);  //med pending
        currentRow.add(""+hardNotPaid);  //hard pending
        currentRow.add(""+testingNotPaid);  //test pending
        currentRow.add("$" + (ApplicationConstants.EASY_PAYMENT*easyNotPaid  //total pending
                            +ApplicationConstants.MEDIUM_PAYMENT*mediumNotPaid
                            +ApplicationConstants.HARD_PAYMENT*hardNotPaid
                            +ApplicationConstants.TEST_PAYMENT*testingNotPaid) + ".00");
        currentRow.add(new Integer(coderId));  //coder id

        info.addRow();
        info.setRow(info.numRows()-1, currentRow);
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting payment information: ");
      e.printStackTrace();
      info = null;  
    }

    if (ps2 != null)
    {
      try
      {
        ps2.close();
      }
      catch(Exception e1)
      {
      }
    }
    closeConnection(conn, ps);

    return info;
  }

  /**
   * Update paid to "Y" for all users in the users list.  Returns boolean corresponding to success.
   *
   * @param users ArrayList of user ids being paid.
   */
  public boolean submitPayment(ArrayList users) 
  {
    java.sql.Connection conn = null;
    PreparedStatement ps = null;
    boolean ok = true;
    try
    {
      conn = Common.getConnection();
      ResultSet rs;
      StringBuffer sqlStr = new StringBuffer(256);

      sqlStr.replace(0, sqlStr.length(), "UPDATE problem_user SET paid = 'Y' WHERE user_id = ?");
      ps = conn.prepareStatement(sqlStr.toString());
     
      for(int i=0; i<users.size(); i++) 
      {
        ps.setInt(1, ((Integer)users.get(i)).intValue());
        ps.executeUpdate();
      }
    }
    catch(Exception e)
    {
      Common.logMsg("Error updating payment.");
      e.printStackTrace();
      ok = false;
    }

    closeConnection(conn, ps);
    return ok;
  }

  /**
   * Returns an ArrayList of information about a user.  The returned ArrayList contains:
   * handle | name | email | writer(bool) | tester(bool) | paid | pending | probs (Matrix2D)
   *
   * @param userId The user id of the user to get information for.
   */
  public ArrayList getUserInfo(int userId)
  {
    if (VERBOSE) Common.logMsg("Getting user info for userId "+userId);
    java.sql.Connection conn = null;
    PreparedStatement ps = null;
    ArrayList userInfo = new ArrayList();

    try
    {
      conn = Common.getConnection();
      StringBuffer sqlStr = new StringBuffer(256);

      sqlStr.replace(0, sqlStr.length(), "SELECT u.handle, c.first_name, c.last_name, u.email ");
      sqlStr.append(" FROM user u, coder c WHERE u.user_id = c.coder_id AND u.user_id = ?");
      ps = conn.prepareStatement(sqlStr.toString());
      ps.setInt(1, userId);
      ResultSet rs = ps.executeQuery();
      rs.next();

      userInfo.add(rs.getString(1));  //will throw exception if no such user
      userInfo.add(rs.getString(2) + " " + rs.getString(3));
      userInfo.add(rs.getString(4));

      sqlStr.replace(0, sqlStr.length(), "SELECT user_id FROM group_user WHERE group_id = ?");
      ps = conn.prepareStatement(sqlStr.toString());

      ps.setInt(1, ApplicationConstants.PROBLEM_WRITER_GROUP);
      rs = ps.executeQuery();
      userInfo.add(new Boolean(rs.next()));  //if there is a row, he is a writer

      ps.setInt(1, ApplicationConstants.PROBLEM_TESTER_GROUP);
      rs = ps.executeQuery();
      userInfo.add(new Boolean(rs.next()));  //if there is a row, he is a tester

      Matrix2D problemInformation = new Matrix2D(0, 5);
      int easyPaid = 0, mediumPaid = 0, testingPaid = 0, hardPaid = 0,
          easyNotPaid = 0, mediumNotPaid = 0, testingNotPaid = 0, hardNotPaid = 0;

      sqlStr.replace(0, sqlStr.length(), "SELECT p.class_name, p.difficulty_id, p.status, pu.paid, ");
      sqlStr.append(" pu.user_type_id FROM problem_user pu, problem p");
      sqlStr.append(" WHERE p.problem_id = pu.problem_id AND pu.user_id = ?");
      ps = conn.prepareStatement(sqlStr.toString());
      ps.setInt(1, userId);
      rs = ps.executeQuery();

      ArrayList problemInfo;
      while(rs.next())
      {
        problemInfo = new ArrayList(4);
        problemInfo.add(rs.getString(1));
        problemInfo.add(MessageTypes.getDifficultyName(rs.getInt(2)));
        problemInfo.add(MessageTypes.getStatusName(rs.getInt(3)));
        problemInfo.add(rs.getInt(5) == ApplicationConstants.PROBLEM_WRITER ? "Writer" : "Tester");        
        problemInfo.add(rs.getString(4));

        if (rs.getInt(5) == ApplicationConstants.PROBLEM_TESTER)
        {
          testingNotPaid += rs.getString(4).equals("Y") ? 1 : 0;
          testingPaid += rs.getString(4).equals("Y") ? 0 : 1;
        }
        if (rs.getInt(2) == MessageTypes.EASY_DIFFICULTY_LEVEL)
        {
          easyPaid += rs.getString(4).equals("Y") ? 1 : 0;
          easyNotPaid += rs.getString(4).equals("Y") ? 0 : 1;
        }
        if (rs.getInt(2) == MessageTypes.MEDIUM_DIFFICULTY_LEVEL)
        {
          mediumPaid += rs.getString(4).equals("Y") ? 1 : 0;
          mediumNotPaid += rs.getString(4).equals("Y") ? 0 : 1;
        }
        if (rs.getInt(2) == MessageTypes.HARD_DIFFICULTY_LEVEL)
        {
          hardPaid += rs.getString(4).equals("Y") ? 1 : 0;
          hardNotPaid += rs.getString(4).equals("Y") ? 0 : 1;
        }

        problemInformation.addRow();
        problemInformation.setRow(problemInformation.numRows() - 1, problemInfo);
      }

      userInfo.add("$" + (ApplicationConstants.EASY_PAYMENT*easyPaid   //payment to date
                          +ApplicationConstants.MEDIUM_PAYMENT*mediumPaid
                          +ApplicationConstants.HARD_PAYMENT*hardPaid
                          +ApplicationConstants.TEST_PAYMENT*testingPaid) + ".00");
      userInfo.add("$" + (ApplicationConstants.EASY_PAYMENT*easyNotPaid  //total pending
                          +ApplicationConstants.MEDIUM_PAYMENT*mediumNotPaid
                          +ApplicationConstants.HARD_PAYMENT*hardNotPaid
                          +ApplicationConstants.TEST_PAYMENT*testingNotPaid) + ".00");
      userInfo.add(problemInformation);
    }
    catch(Exception e)
    {
      Common.logMsg("Error getting user information for userid "+userId);
      e.printStackTrace();
      userInfo = null;
    }
    closeConnection(conn, ps);
    return userInfo;
  }

  /**
   * Backs up a solution by adding it to solution_history.
   *
   * @param solutionId Id of solution to back up.
   */
  private void backUpSolution(int solutionId)
  {
    if (VERBOSE) Common.logMsg("Backing up solution "+solutionId);

    java.sql.Connection conn = null;
    PreparedStatement ps = null;

    try
    {
      conn = Common.getConnection();
      StringBuffer sqlStr = new StringBuffer(256);

      sqlStr.append("INSERT INTO solution_history (solution_id, solution, modify_date) ");
      sqlStr.append("SELECT solution_id, solution_text, current FROM solution WHERE solution_id = ?");
      ps = conn.prepareStatement(sqlStr.toString());
      ps.setInt(1, solutionId);
      ps.executeUpdate();
    }
    catch(Exception e)
    {
      Common.logMsg("Error backing up solution:");
      e.printStackTrace();
    }
    closeConnection(conn, ps);
  }
    
  /**
   * Backs up a problem statement by adding it to problem_statement_history.
   *
   * @param problemId id of problem statement to back up.
   */
  private void backUpProblemStatement(int problemId)
  {
    if (VERBOSE) Common.logMsg("Backing up problem statement "+problemId);

    java.sql.Connection conn = null;
    PreparedStatement ps = null;

    try
    {
      conn = Common.getConnection();
      StringBuffer sqlStr = new StringBuffer(256);

      sqlStr.append("INSERT INTO problem_statement_history (problem_id, problem_statement, modify_date) ");
      sqlStr.append("SELECT problem_id, problem_text, current FROM problem WHERE problem_id = ?");
      ps = conn.prepareStatement(sqlStr.toString());
      ps.setInt(1, problemId);
      ps.executeUpdate();
    }
    catch(Exception e)
    {
      Common.logMsg("Error backing up problem:");
      e.printStackTrace();
    }
    closeConnection(conn, ps);
  }

  /**
   * Determines the user type of a user for a problem.
   *
   * @param problemId The problem id we are figuring out the user for.
   * @param userId The userId whose status we are finding.
   */
  private int getUserType(int problemId, int userId) throws Exception
  {
    java.sql.Connection conn = Common.getConnection();
    int userType=-1;
    StringBuffer sqlStr = new StringBuffer(256);

    sqlStr.replace(0,sqlStr.length(),"SELECT user_id FROM group_user WHERE group_id=? AND user_id=?");
    PreparedStatement ps=conn.prepareStatement(sqlStr.toString());
    ps.setInt(1,ApplicationConstants.ADMIN_GROUP);
    ps.setInt(2,userId);
    ResultSet rs=ps.executeQuery();

    if(rs.next())  //user is admin
    {
      userType=ApplicationConstants.PROBLEM_ADMIN;
    }
    else
    {
      sqlStr.replace(0,sqlStr.length(),"SELECT user_type_id FROM problem_user WHERE problem_id=? AND user_id=?");
      ps=conn.prepareStatement(sqlStr.toString());
      ps.setInt(1,problemId);
      ps.setInt(2,userId);
      rs=ps.executeQuery();

       //make sure there is a row
      if(!rs.next()) throw new Exception(userId+" trying to request a problem for which he is no user!");

      userType=rs.getInt(1);
    }
    closeConnection(conn, ps);
    return userType;
  }

  private static boolean VERBOSE = false;  
  SessionContext ctx;
}
