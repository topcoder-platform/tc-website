package com.topcoder.ejb.MPSQASServices;

import com.topcoder.mpsqas.common.*;
import com.topcoder.mpsqas.compiler.CompilerWaiter;
import com.topcoder.mpsqas.tester.TesterWaiter;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.SessionContext;
import java.io.BufferedOutputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.sql.*;
import java.util.*;

/**
 * Bean to control all application server work for
 * MPSQAS.
 *
 * @author mitalub
 */
public class MPSQASServicesBean extends BaseEJB {
    private static Logger log = Logger.getLogger(MPSQASServicesBean.class);


    /******************************************************************************
     * User Session Methods                                                       *
     ******************************************************************************/

    /**
     * Checks with the database to make sure the user exits and that
     * the user has the correct password.  Finally, it checks if the user is an admin.
     * The method returns an ArrayList containing a boolean indicating the success of the
     * login.  If false, the ArrayList also contains a String that is the error.
     * If true, the ArrayList contains an Integer (coder id) and 3 Booleans
     * (indicating admin status writer status, and tester status)
     *
     * @param handle   The handle of the user trying to log in.
     * @param password The password they are trying to use.
     */
    public ArrayList authenticateUser(String handle, String password) {
        log.debug("In MPSQASServicesBean.authenticateUser() with handle " + handle);
        log.debug(handle + " logging into MPSQAS.");
        ArrayList retVal = new ArrayList(5);
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);
            sqlStr.replace(0, sqlStr.length(),
                    "SELECT u.password ");
            sqlStr.append(",u.user_id ");
            sqlStr.append(",r.rating ");
            sqlStr.append("FROM user u ");
            sqlStr.append(",rating r ");
            sqlStr.append("WHERE UPPER(u.handle) = UPPER(?) ");
            sqlStr.append("AND u.status = 'A' ");
            sqlStr.append("AND u.user_id = r.coder_id ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setString(1, handle);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                retVal.add(new Boolean(false));
                retVal.add("Incorrect handle.");
                return retVal;
            }
            if (!password.equals(rs.getString(1))) {
                retVal.add(new Boolean(false));
                retVal.add("Incorrect password.");
                return retVal;
            }
            int userId = rs.getInt(2);
            boolean isAdmin = false;

            sqlStr.replace(0, sqlStr.length(), "SELECT * FROM group_user WHERE user_id=? AND group_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            ps.setInt(2, ApplicationConstants.ADMIN_GROUP);
            rs = ps.executeQuery();
            isAdmin = rs.next();

            sqlStr.replace(0, sqlStr.length(), "SELECT * FROM group_user WHERE user_id=? AND group_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            ps.setInt(2, ApplicationConstants.PROBLEM_WRITER_GROUP);
            rs = ps.executeQuery();
            boolean isWriter = rs.next() || isAdmin;

            sqlStr.replace(0, sqlStr.length(), "SELECT * FROM group_user WHERE user_id=? AND group_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            ps.setInt(2, ApplicationConstants.PROBLEM_TESTER_GROUP);
            rs = ps.executeQuery();
            boolean isTester = rs.next() || isAdmin;

            retVal.add(new Boolean(true));
            retVal.add(new Integer(userId));
            retVal.add(new Boolean(isAdmin));
            retVal.add(new Boolean(isWriter));
            retVal.add(new Boolean(isTester));
        } catch (Exception e) {
            log.debug("Error authenticating user:");
            e.printStackTrace();
            retVal = new ArrayList();
            retVal.add(new Boolean(false));
            retVal.add(ApplicationConstants.SERVER_ERROR);
        } finally {
            closeConnection(conn, ps);
        }
        return retVal;
    }

    /******************************************************************************
     * Correspondence Services                                                    *
     ******************************************************************************/

    /**
     * Adds a correspondence message to the database for the specified
     * problem. It returns a boolean indicating if it is successful or not.
     * The addition of the correspondence message is broadcasted to the
     * applet servers so all users viewing the problem hear about it.
     *
     * @param message The correspondence message
     * @param problemId The problem corresponding to the correspondence
     * @param userId The userId of the guy sending the message
     */
    public boolean sendCorrespondence(Correspondence message, int problemId, int userId) {
        log.debug("In MPSQASServicesBean.sendCorrespondence()...");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();

            StringBuffer sqlStr = new StringBuffer(256);

            int correspondenceId = DBMS.getSeqId(DBMS.JMA_SEQ);

            sqlStr.append("INSERT INTO correspondence ");
            sqlStr.append("(correspondence_id ");
            sqlStr.append(",from_coder_id ");
            sqlStr.append(",problem_id ");
            sqlStr.append(",message)");
            sqlStr.append("VALUES (?, ?, ?, ?)");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, correspondenceId);
            ps.setInt(2, userId);
            ps.setInt(3, problemId);
            ps.setBytes(4, DBMS.serializeTextString(message.getMessage()));
            ps.executeUpdate();

            //mark the correspondence as read by this user.
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("INSERT INTO correspondence_read_xref ");
            sqlStr.append("(correspondence_id ");
            sqlStr.append(",user_id ");
            sqlStr.append(",timestamp) ");
            sqlStr.append("VALUES (?, ?, current) ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, correspondenceId);
            ps.setInt(2, userId);
            ps.executeUpdate();

            //email about it
            try {
                sqlStr.replace(0, sqlStr.length(), "SELECT class_name FROM problem WHERE problem_id=?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, problemId);
                ResultSet rs = ps.executeQuery();
                rs.next();
                String className = rs.getString(1);

                sqlStr.replace(0, sqlStr.length(), "SELECT handle FROM user WHERE user_id=?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, userId);
                rs = ps.executeQuery();
                rs.next();
                String handle = rs.getString(1);

                //get a list of problem users affected by the correspondence
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT DISTINCT u.handle ");
                sqlStr.append(",u.email ");
                sqlStr.append("FROM user u ");
                sqlStr.append(",problem_user pu ");
                sqlStr.append("WHERE u.user_id = pu.user_id ");
                sqlStr.append("AND pu.problem_id = ? ");
                sqlStr.append("AND pu.user_id != ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, problemId);
                ps.setInt(2, userId);
                rs = ps.executeQuery();

                TCSEmailMessage email = null;
                StringBuffer emailBody = null;
                while (rs.next()) {
                    email = new TCSEmailMessage();
                    emailBody = new StringBuffer(256);
                    emailBody.append("Hi " + rs.getString(1) + ",\n\n");
                    emailBody.append("Correspondence has been added to ");
                    emailBody.append(className);
                    emailBody.append(", a problem with which you are associated.\n\n");
                    emailBody.append(handle);
                    emailBody.append(" says: \n\n");
                    emailBody.append(ApplicationConstants.HORIZONTAL_RULE);
                    emailBody.append(message.getMessage());
                    emailBody.append("\n");
                    emailBody.append(ApplicationConstants.HORIZONTAL_RULE);
                    emailBody.append("\nLog into the applet to work on the problem further.\n\n");
                    emailBody.append("-mpsqas\n\n");
                    emailBody.append("This is an automated message from MPSQAS.\n");
                    email.setSubject("New Correspondence For " + className);
                    email.setBody(emailBody.toString());
                    email.setFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
                    email.addToAddress(rs.getString(2), TCSEmailMessage.TO);
                    EmailEngine.send(email);
                }
            } catch (Exception e) {
                log.debug("Error sending email.");
                e.printStackTrace();
            }

            //broadcast new correspondence
            try {
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT u.handle ");
                sqlStr.append(",c.sent_time ");
                sqlStr.append("FROM correspondence c ");
                sqlStr.append(",user u ");
                sqlStr.append("WHERE c.correspondence_id = ? ");
                sqlStr.append("AND u.user_id = c.from_coder_id ");
                sqlStr.append("ORDER BY c.sent_time");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, correspondenceId);
                ResultSet rs = ps.executeQuery();
                rs.next();
                message.setSender(rs.getString(1));
                message.setDate(rs.getString(2));

                ArrayList broadcast = new ArrayList();
                broadcast.add(new Integer(ApplicationConstants.CORRESPONDENCE_BROADCAST_IN));
                broadcast.add(message);
                broadcast.add(new Integer(problemId));

                sendToAppletServer(broadcast);
            } catch (Exception e1) {
                log.debug("Error broadcasting new correspondence.");
                e1.printStackTrace();
            }

        } catch (Exception e) {
            log.debug("Error inserting correspondence:");
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     * Returns a list of ProblemIds of problems with correspondence not
     * yet read by the specified user.
     *
     * @param userId The user to get new correspondence fot.
     */
    public ArrayList getUnreadCorrespondence(int userId) {
        ArrayList problems = new ArrayList();
        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();

            boolean isAdmin = isAdmin(userId);

            StringBuffer sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT DISTINCT p.problem_id ");
            sqlStr.append(",p.class_name ");
            sqlStr.append("FROM problem p ");
            sqlStr.append(",correspondence c ");
            sqlStr.append("WHERE p.problem_id = c.problem_id ");
            sqlStr.append("AND c.correspondence_id NOT IN (SELECT correspondence_id ");
            sqlStr.append("FROM correspondence_read_xref ");
            sqlStr.append("WHERE user_id = ?)");
            if (!isAdmin) {
                sqlStr.append("AND p.problem_id IN (SELECT problem_id ");
                sqlStr.append("FROM problem_user ");
                sqlStr.append("WHERE user_id = ?) ");
            }
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            if (!isAdmin) {
                ps.setInt(2, userId);
            }
            ResultSet rs = ps.executeQuery();

            ProblemInformation problemInfo;
            while (rs.next()) {
                problemInfo = new ProblemInformation(rs.getString(2));
                problemInfo.setProblemId(rs.getInt(1));
                problems.add(problemInfo);
            }
        } catch (Exception e) {
            log.debug("Error getting unread messages for " + userId);
            e.printStackTrace();
        } finally {
            closeConnection(conn, ps);
        }

        return problems;
    }


    /******************************************************************************
     * Problem Services                                                           *
     ******************************************************************************/

    /**
     * Retrieves a list of problems from the database that are available for use
     * for a contest (Status is between Submission Approved and Ready).
     * Returns an ArrayList of ProblemInformation.
     *
     * @param forType Integer describing which problems to get.
     * @param id An id further describing which problems to get (round_id, etc..)
     *
     * forType = ApplicationConstants.PROBLEMS_FOR_CONTEST
     *   All available problems for a contest, id = round_id
     * forType = ApplicationConstants.SCHEDULED_PROBLEMS_FOR_CONTEST
     *   All problems scheduled for contest, id = round_id
     * forType = ApplicationConstants.PROBLEMS_WITH_STATUS
     *   All problems with specified status, id = status
     * forType = ApplicationConstants.USER_WRITTEN_PROBLEMS
     *   All problems a user is writing, id = user_id
     * forType = ApplicationConstants.USER_TESTING_PROBLEMS
     *   All problems a user is testing, id = user_id
     * forType = ApplicationConstants.ALL_PROBLEMS
     *   All problems, id = n.a.
     */
    public ArrayList getProblems(int forType, int id) {
        log.debug("In MPSQASServicesBean.getAvailableProblems()...");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ArrayList problems = new ArrayList();
        try {
            conn = DBMS.getConnection();

            //First, build the query
            StringBuffer sqlStr = new StringBuffer(256);
            //Selects:
            sqlStr.append("SELECT p.class_name ");
            sqlStr.append(",NVL(u.handle, 'unknown') ");
            sqlStr.append(",NVL(u.user_id, -1) ");
            if (forType == ApplicationConstants.SCHED_PROBLEMS_FOR_CONTEST) {
                sqlStr.append(",rp.difficulty_id ");
                sqlStr.append(",rp.division_id ");
                sqlStr.append(",rp.points ");
            } else {
                sqlStr.append(",p.proposed_difficulty_id ");
                sqlStr.append(",p.proposed_division_id ");
            }
            sqlStr.append(",p.problem_id ");
            sqlStr.append(",p.modify_date ");
            sqlStr.append(",p.method_name ");
            sqlStr.append(",p.status ");

            //Froms:
            sqlStr.append("FROM problem p ");
            sqlStr.append("LEFT OUTER JOIN problem_user pu ON p.problem_id = pu.problem_id ");
            sqlStr.append("AND pu.user_type_id = ? ");
            sqlStr.append("LEFT OUTER JOIN user u ON u.user_id = pu.user_id ");
            if (forType == ApplicationConstants.SCHED_PROBLEMS_FOR_CONTEST) {
                sqlStr.append(",round_problem rp ");
            }

            //Wheres:
            if (forType == ApplicationConstants.PROBLEMS_FOR_CONTEST) {
                sqlStr.append("WHERE (p.status >= ? AND p.status <= ?) ");
            }
            if (forType == ApplicationConstants.SCHED_PROBLEMS_FOR_CONTEST) {
                sqlStr.append("WHERE p.problem_id = rp.problem_id ");
                sqlStr.append("AND rp.round_id = ? ");
            }
            if (forType == ApplicationConstants.PROBLEMS_WITH_STATUS) {
                sqlStr.append("WHERE p.status = ? ");
            }
            if (forType == ApplicationConstants.USER_WRITTEN_PROBLEMS) {
                sqlStr.append("WHERE u.user_id = ? ");
            }
            if (forType == ApplicationConstants.USER_TESTING_PROBLEMS) {
                sqlStr.append("WHERE p.problem_id IN ");
                sqlStr.append("(SELECT problem_id ");
                sqlStr.append("FROM problem_user ");
                sqlStr.append("WHERE user_id = ? ");
                sqlStr.append("AND user_type_id = ?)");
            }
            ps = conn.prepareStatement(sqlStr.toString());

            int index = 1;

            //Fill in fields
            ps.setInt(index++, ApplicationConstants.PROBLEM_WRITER);
            if (forType == ApplicationConstants.PROBLEMS_FOR_CONTEST) {
                ps.setInt(index++, MessageTypes.SUBMISSION_APPROVED);
                ps.setInt(index++, MessageTypes.READY);
            }
            if (forType == ApplicationConstants.SCHED_PROBLEMS_FOR_CONTEST) {
                ps.setInt(index++, id);
            }
            if (forType == ApplicationConstants.PROBLEMS_WITH_STATUS) {
                ps.setInt(index++, id);
            }
            if (forType == ApplicationConstants.USER_WRITTEN_PROBLEMS) {
                ps.setInt(index++, id);
            }
            if (forType == ApplicationConstants.USER_TESTING_PROBLEMS) {
                ps.setInt(index++, id);
                ps.setInt(index++, ApplicationConstants.PROBLEM_TESTER);
            }

            ResultSet rs = ps.executeQuery();

            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT paid ");
            sqlStr.append(",pending_payment ");
            sqlStr.append("FROM problem_user ");
            sqlStr.append("WHERE user_id = ? ");
            sqlStr.append("AND problem_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, id);
            ResultSet rs2;

            ProblemInformation problemInfo;

            //extract info
            while (rs.next()) {
                index = 1;
                problemInfo = new ProblemInformation(rs.getString(index++));
                problemInfo.setWriter(new UserInformation(rs.getString(index++),
                        rs.getInt(index++)));
                problemInfo.setDifficultyLevel(rs.getInt(index++));
                problemInfo.setDivision(rs.getInt(index++));
                if (forType == ApplicationConstants.SCHED_PROBLEMS_FOR_CONTEST) {
                    problemInfo.setPoints(rs.getDouble(index++));
                }
                problemInfo.setProblemId(rs.getInt(index++));
                problemInfo.setTimestamp(rs.getTimestamp(index++).toString());
                problemInfo.setMethodName(rs.getString(index++));
                problemInfo.setStatus(rs.getInt(index++));
                if (forType == ApplicationConstants.USER_TESTING_PROBLEMS
                        || forType == ApplicationConstants.USER_WRITTEN_PROBLEMS) {
                    ps.setInt(2, problemInfo.getProblemId());
                    rs2 = ps.executeQuery();
                    rs2.next();
                    problemInfo.setPaid(rs2.getDouble(1));
                    problemInfo.setPendingPayment(rs2.getDouble(2));
                }
                problems.add(problemInfo);
            }
        } catch (Exception e) {
            log.debug("Error getting available problems: ");
            e.printStackTrace();
            problems = null;
        }
        closeConnection(conn, ps);
        return problems;
    }

    /**
     * Fills out a ProblemInformation object with all the
     * current information about a problem.
     *
     * @param problemId The id of the problem.
     * @param userId    The userId of the person requesting the information.
     */
    public ProblemInformation getProblemInformation(int problemId, int userId) {
        log.debug("In MPSQASServicesBean.getProblemInformation()...");
        ProblemInformation problemInformation;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr;

            //Find out the user type
            int userType = getUserType(problemId, userId);

            //get generic problem information
            sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT p.status ");
            sqlStr.append(",p.class_name ");
            sqlStr.append(",p.method_name ");
            sqlStr.append(",p.param_types ");
            sqlStr.append(",d.data_type_desc ");
            sqlStr.append(",p.proposed_difficulty_id ");
            sqlStr.append(",p.proposed_division_id ");
            sqlStr.append(",p.modify_date ");
            sqlStr.append(",p.problem_text ");
            sqlStr.append(",NVL(pu.user_id, -1) ");
            sqlStr.append("FROM problem p ");
            sqlStr.append("LEFT OUTER JOIN problem_user pu ON p.problem_id = pu.problem_id ");
            sqlStr.append("AND pu.user_type_id = ? ");
            sqlStr.append(",data_type d ");
            sqlStr.append("WHERE d.data_type_id = p.result_type_id ");
            sqlStr.append("AND p.problem_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, ApplicationConstants.PROBLEM_WRITER);
            ps.setInt(2, problemId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            problemInformation = new ProblemInformation(rs.getString(2));
            problemInformation.setStatus(rs.getInt(1));
            problemInformation.setMethodName(rs.getString(3));
            problemInformation.setParamTypes((ArrayList) DBMS.getBlobObject(rs, 4));
            problemInformation.setReturnType(rs.getString(5));
            problemInformation.setDifficultyLevel(rs.getInt(6));
            problemInformation.setDivision(rs.getInt(7));
            problemInformation.setTimestamp(rs.getTimestamp(8).toString());
            problemInformation.setProblemStatement(DBMS.getTextString(rs, 9));
            problemInformation.setUserType(userType);

            int status = rs.getInt(1);

            //get correspondence
            sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT u.handle ");
            sqlStr.append(",c.sent_time ");
            sqlStr.append(",c.message ");
            sqlStr.append("FROM correspondence c ");
            sqlStr.append(",user u ");
            sqlStr.append("WHERE c.problem_id = ? ");
            sqlStr.append("AND u.user_id = c.from_coder_id ");
            sqlStr.append("ORDER BY c.sent_time ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Correspondence correspondence = new Correspondence();
                correspondence.setSender(rs.getString(1));
                correspondence.setDate(rs.getString(2));
                correspondence.setMessage(DBMS.getTextString(rs, 3));
                problemInformation.addCorrespondence(correspondence);
            }

            //get the users solution, if it exists
            sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT s.solution_text ");
            sqlStr.append(",s.solution_id ");
            sqlStr.append(",ps.primary_solution ");
            sqlStr.append("FROM solution s ");
            sqlStr.append(",problem_solution ps ");
            sqlStr.append("WHERE ps.problem_id = ? ");
            sqlStr.append("AND ps.solution_id = s.solution_id ");
            if (userType == ApplicationConstants.PROBLEM_ADMIN) {
                sqlStr.append("AND primary_solution = ? ");
            } else {
                sqlStr.append("AND s.coder_id = ? ");
            }
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            if (userType == ApplicationConstants.PROBLEM_ADMIN) {
                ps.setString(2, "Y");
            } else {
                ps.setInt(2, userId);
            }
            rs = ps.executeQuery();

            SolutionInformation solutionInfo;
            if (rs.next()) {
                solutionInfo = new SolutionInformation();
                solutionInfo.setSolutionId(rs.getInt(2));
                solutionInfo.setText(DBMS.getTextString(rs, 1));
                solutionInfo.setPrimary(rs.getString(3).equals("Y"));
                problemInformation.setSolution(solutionInfo);
            } else {
                problemInformation.setSolution(null);
            }

            //get test cases
            sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT args FROM system_test_case WHERE problem_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            rs = ps.executeQuery();

            while (rs.next()) {
                problemInformation.getTestCases().add(
                        ((ArrayList) DBMS.getBlobObject(rs, 1)).toArray());
            }

            //get the list of all solutions
            sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT u.handle ");
            sqlStr.append(",ps.primary_solution ");
            sqlStr.append(",s.solution_text ");
            sqlStr.append(",s.solution_id ");
            sqlStr.append(",u.user_id ");
            sqlStr.append("FROM user u ");
            sqlStr.append(",solution s ");
            sqlStr.append(",problem_solution ps ");
            sqlStr.append("WHERE ps.problem_id = ? ");
            sqlStr.append("AND ps.solution_id = s.solution_id ");
            sqlStr.append("AND u.user_id = s.coder_id ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            rs = ps.executeQuery();

            while (rs.next()) {
                solutionInfo = new SolutionInformation();
                solutionInfo.setHandle(rs.getString(1));
                solutionInfo.setPrimary(rs.getString(2).equals("Y"));
                solutionInfo.setSolutionId(rs.getInt(4));
                if (userType == ApplicationConstants.PROBLEM_TESTER &&
                        status < MessageTypes.FINAL_TESTING &&
                        rs.getInt(5) != userId) {
                    solutionInfo.setText("Solution not available until Final Testing.");
                } else {
                    solutionInfo.setText(rs.getString(3));
                }
                problemInformation.addSolution(solutionInfo);
            }

            problemInformation.setTesters(getUsers(
                    ApplicationConstants.TESTERS_FOR_PROBLEM, problemId));

            //Mark the correspondence as read for the user
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("INSERT INTO correspondence_read_xref ");
            sqlStr.append("(correspondence_id ");
            sqlStr.append(",user_id ");
            sqlStr.append(",timestamp) ");
            sqlStr.append("SELECT correspondence_id ");
            sqlStr.append(",");
            sqlStr.append(userId); //XXX: no ? allowed in select
            sqlStr.append(",current ");
            sqlStr.append("FROM correspondence ");
            sqlStr.append("WHERE problem_id = ? ");
            sqlStr.append("AND correspondence_id NOT IN (SELECT correspondence_id ");
            sqlStr.append("FROM correspondence_read_xref ");
            sqlStr.append("WHERE user_id = ?) ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            problemInformation = null;
        } catch (Exception e) {
            log.debug("Error getting problem information for problem:");
            e.printStackTrace();
            problemInformation = null;
        }
        closeConnection(conn, ps);
        return problemInformation;
    }

    /**
     * Checks the validity of a problem proposal and, if
     * the proposal is ok, it inserts the proposal into the DB.
     *
     * @param info  The ProblemInformation containing proposal information
     * @param userId  The coder id of the user proposing the problem.
     * @returns An ArrayList consisting of a Boolean that is true if the proposal
     *          is valid, and false otherwise, and, if false, a String that is
     *          the reason.
     */
    public ArrayList saveProposal(ProblemInformation info, int userId) {
        log.debug("In MPSQASServices.saveProposal()");
        ArrayList proposalResults = new ArrayList();
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);
            int i;
            boolean validInput;

            String errorMessage = checkGeneralProblemInfo(info, -1);
            if (errorMessage.length() == 0) //no error message
            {
                int problemId = DBMS.getSeqId(DBMS.PROBLEM_SEQ);

                //get the return type
                sqlStr.append("SELECT data_type_id FROM data_type WHERE data_type_desc = ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setString(1, info.getReturnType());
                int returnTypeId;
                rs = ps.executeQuery();
                rs.next();
                returnTypeId = rs.getInt(1);

                sqlStr.replace(0, sqlStr.length(),
                        "INSERT INTO problem ");
                sqlStr.append("(problem_id ");
                sqlStr.append(",class_name ");
                sqlStr.append(",method_name ");
                sqlStr.append(",proposed_difficulty_id ");
                sqlStr.append(",proposed_division_id");
                sqlStr.append(",status ");
                sqlStr.append(",result_type_id ");
                sqlStr.append(",problem_text ");
                sqlStr.append(",param_types) ");
                sqlStr.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, problemId);
                ps.setString(2, info.getClassName());
                ps.setString(3, info.getMethodName());
                ps.setInt(4, info.getDifficultyLevel());
                ps.setInt(5, info.getDivision());
                ps.setInt(6, MessageTypes.PROPOSAL_PENDING_APPROVAL);
                ps.setInt(7, returnTypeId);
                ps.setBytes(8, DBMS.serializeTextString(info.getProblemStatement()));
                ps.setBytes(9, DBMS.serializeBlobObject(info.getParamTypes()));
                int rowsUpdated = ps.executeUpdate();

                sqlStr.replace(0, sqlStr.length(),
                        "INSERT INTO problem_user ");
                sqlStr.append("(problem_id ");
                sqlStr.append(",user_id ");
                sqlStr.append(",user_type_id ");
                sqlStr.append(",paid ");
                sqlStr.append(",pending_payment ) ");
                sqlStr.append("VALUES (?, ?, ?, ?, ?)");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, problemId);
                ps.setInt(2, userId);
                ps.setInt(3, ApplicationConstants.PROBLEM_WRITER);
                ps.setDouble(4, 0);
                ps.setDouble(5, 0);

                ps.executeUpdate();

                //broadcast about it
                try {
                    ArrayList broadcast = new ArrayList(3);
                    broadcast.add(new Integer(ApplicationConstants.PENDING_PROPOSAL_BROADCAST_IN));
                    broadcast.add(getProblems(ApplicationConstants.PROBLEMS_WITH_STATUS,
                            MessageTypes.PROPOSAL_PENDING_APPROVAL));

                    sendToAppletServer(broadcast);
                } catch (Exception e1) {
                    log.debug("Error broadcasting proposal for problem " + problemId);
                    e1.printStackTrace();
                }
                proposalResults.add(new Boolean(true));
            } else {
                proposalResults.add(new Boolean(false));
                proposalResults.add(errorMessage);
            }
        } catch (Exception e) {
            log.debug("Error inserting problem: ");
            e.printStackTrace();
            proposalResults = new ArrayList(2);
            proposalResults.add(new Boolean(false));
            proposalResults.add(ApplicationConstants.SERVER_ERROR);
        } finally {
            closeConnection(conn, ps);
        }

        return proposalResults;
    }

    /**
     * Handles the inserts, updates, and status changes required when a
     * user submits a problem.
     *
     * @param info The ProblemInformation for the problem
     * @param problemId The problem's problemid
     * @param userId The user's id.
     * @param connectionId The user's connection id. (So he won't get the broadcast
     *                     saying "It's been changed")
     */
    public ArrayList saveProblem(ProblemInformation info, int problemId, int userId,
                                 int connectionId) {
        log.debug("In MPSQASServicesBean.saveProblem()...");
        ArrayList submitInfo = new ArrayList(2);
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();

            StringBuffer sqlStr = new StringBuffer();

            //Find out the user type
            int userType = getUserType(problemId, userId);

            //next, get some quick info about the problem
            sqlStr.append("SELECT status ");
            sqlStr.append(",param_types ");
            sqlStr.append("FROM problem ");
            sqlStr.append("WHERE problem_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int status = rs.getInt(1);
            ArrayList oldParamTypes = (ArrayList) DBMS.getBlobObject(rs, 2);

            int numUpdates, i;

            if (userType != ApplicationConstants.PROBLEM_TESTER) {
                String errorMessage = checkGeneralProblemInfo(info, problemId);
                if (errorMessage.length() != 0) {
                    submitInfo.add(new Boolean(false));
                    submitInfo.add(errorMessage);
                    return submitInfo;
                }

                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT data_type_id FROM data_type WHERE data_type_desc=?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setString(1, info.getReturnType());
                rs = ps.executeQuery();
                rs.next();
                int returnTypeId = rs.getInt(1);

                //update the main problem information in the problem table
                backUpProblemStatement(problemId, userId);
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("UPDATE problem ");
                sqlStr.append("SET class_name = ? ");
                sqlStr.append(",method_name = ? ");
                sqlStr.append(",param_types = ? ");
                sqlStr.append(",problem_text = ? ");
                sqlStr.append(",result_type_id = ? ");
                sqlStr.append(",proposed_difficulty_id = ? ");
                sqlStr.append(",proposed_division_id = ? ");
                sqlStr.append("WHERE problem_id = ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setString(1, info.getClassName());
                ps.setString(2, info.getMethodName());
                ps.setBytes(3, DBMS.serializeBlobObject(info.getParamTypes()));
                ps.setBytes(4, DBMS.serializeTextString(info.getProblemStatement()));
                ps.setInt(5, returnTypeId);
                ps.setInt(6, info.getDifficultyLevel());
                ps.setInt(7, info.getDivision());
                ps.setInt(8, problemId);
                numUpdates = ps.executeUpdate();
            }

            //if the status is proposal accepted, or better, insert / update the solution
            if (status >= MessageTypes.PROPOSAL_APPROVED) {
                int solutionId = getSolutionId(problemId, userId);

                //update the solution text & date
                backUpSolution(solutionId, userId);
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("UPDATE solution ");
                sqlStr.append("SET solution_text = ? ");
                sqlStr.append(",modify_date = current ");
                sqlStr.append("WHERE solution_id = ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setBytes(1, DBMS.serializeTextString(info.getSolution().getText()));
                ps.setInt(2, solutionId);
                ps.executeUpdate();

                //see if it compiles
                String packageName = "com.topcoder.tester.solutions.s" + solutionId;
                String code = "package " + packageName + ";";
                code += info.getSolution().getText();
                ArrayList compiledCode = new CompilerWaiter().compile(code,
                        info.getClassName() + ".java", packageName);
                if (!((Boolean) compiledCode.get(0)).booleanValue()) {
                    submitInfo.add(new Boolean(false));
                    submitInfo.add("The solution does not compile.");
                    return submitInfo;
                }

                //insert the compiled code
                HashMap classFiles = (HashMap) compiledCode.get(1);
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("UPDATE solution SET solution_class = ? WHERE solution_id = ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setBytes(1, DBMS.serializeBlobObject(classFiles));
                ps.setInt(2, solutionId);
                ps.executeUpdate();

                //make sure all test cases pass checkData and the solution returns something
                //for them all and there are at least
                if (info.getTestCases().size() < ApplicationConstants.MIN_TEST_CASES) {
                    submitInfo.add(new Boolean(false));
                    submitInfo.add("You must have at least "
                            + ApplicationConstants.MIN_TEST_CASES + " test cases.");
                    return submitInfo;
                }

                //delete old test cases if the param types changed
                if (!oldParamTypes.equals(info.getParamTypes())) {
                    sqlStr.replace(0, sqlStr.length(), "");
                    sqlStr.append("DELETE FROM system_test_case WHERE problem_id = ?");
                    ps = conn.prepareStatement(sqlStr.toString());
                    ps.setInt(1, problemId);
                    numUpdates = ps.executeUpdate();
                    log.debug(numUpdates + " test cases deleted due to change in param types.");
                }

                //get the primary solution
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT s.solution_id ");
                sqlStr.append(",s.solution_class ");
                sqlStr.append("FROM solution s ");
                sqlStr.append(",problem_solution ps ");
                sqlStr.append("WHERE s.solution_id = ps.solution_id ");
                sqlStr.append("AND ps.primary_solution = ? ");
                sqlStr.append("AND ps.problem_id = ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setString(1, "Y");
                ps.setInt(2, problemId);
                rs = ps.executeQuery();

                String primaryPackage = null;
                HashMap primarySolution = null;

                if (rs.next()) {
                    primaryPackage = "com.topcoder.tester.solutions.s" + rs.getInt(1);
                    primarySolution = (HashMap) DBMS.getBlobObject(rs, 2);
                }

                Object testResults;
                Object[] expectedResults = new Object[info.getTestCases().size()];
                for (i = 0; i < info.getTestCases().size(); i++) {
                    //does it pass checkData?
                    if (userType != ApplicationConstants.PROBLEM_TESTER) {
                        try {
                            testResults = new TesterWaiter().test(classFiles, packageName,
                                    info.getClassName(), "checkData", info.getParamTypes(),
                                    (Object[]) info.getTestCases().get(i)).get(1);
                            if (testResults == null) {
                                submitInfo.add(new Boolean(false));
                                submitInfo.add("checkData does not return anything.");
                                return submitInfo;
                            }
                            if (!((String) testResults).equals("")) {
                                submitInfo.add(new Boolean(false));
                                submitInfo.add("Test case number " + i
                                        + " does not pass checkData().");
                                return submitInfo;
                            }
                        } catch (ClassCastException e) {
                            submitInfo.add(new Boolean(false));
                            submitInfo.add("checkData() does not return a String.");
                            return submitInfo;
                        }
                    } else if (primarySolution != null) {
                        //allow checkdata to return null or throw exception so the user is able
                        //to submit even if there are errors in checkData.  Does not allow a
                        //checkdata failure.
                        try {
                            testResults = new TesterWaiter().test(primarySolution, primaryPackage,
                                    info.getClassName(), "checkData", info.getParamTypes(),
                                    (Object[]) info.getTestCases().get(i)).get(1);
                            if (!((String) testResults).equals("")) {
                                submitInfo.add(new Boolean(false));
                                submitInfo.add("Test case number " + i
                                        + " does not pass checkData().");
                                return submitInfo;
                            }
                        } catch (Exception e) {
                        }
                    }

                    //does the solution return anythign
                    testResults = new TesterWaiter().test(classFiles, packageName,
                            info.getClassName(), info.getMethodName(),
                            info.getParamTypes(),
                            (Object[]) info.getTestCases().get(i)).get(1);
                    if (testResults == null) {
                        submitInfo.add(new Boolean(false));
                        submitInfo.add(info.getMethodName() +
                                "() does not return anything for test case " + i + ".");
                        return submitInfo;
                    }

                    //store the expected result
                    if (userType == ApplicationConstants.PROBLEM_TESTER
                            && primarySolution != null) {
                        testResults = new TesterWaiter().test(primarySolution, primaryPackage,
                                info.getClassName(), info.getMethodName(),
                                info.getParamTypes(),
                                (Object[]) info.getTestCases().get(i)).get(1);
                    }
                    expectedResults[i] = testResults;
                }

                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT test_case_id ");
                sqlStr.append("FROM system_test_case ");
                sqlStr.append("WHERE problem_id = ? ");
                sqlStr.append("ORDER BY test_case_id");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, problemId);
                rs = ps.executeQuery();

                int currentTestCaseIndex = 0;
                int currentTestCaseId = 0;

                for (currentTestCaseIndex = 0;
                     currentTestCaseIndex < info.getTestCases().size();
                     currentTestCaseIndex++) {
                    if (rs.next()) {
                        //update any current tests
                        currentTestCaseId = rs.getInt(1);
                        sqlStr.replace(0, sqlStr.length(), "");
                        sqlStr.append("UPDATE system_test_case ");
                        sqlStr.append("SET args = ? ");
                        sqlStr.append(",expected_result = ? ");
                        sqlStr.append("WHERE test_case_id = ?");
                        ps = conn.prepareStatement(sqlStr.toString());
                        ps.setBytes(1, DBMS.serializeBlobObject(new ArrayList(
                                Arrays.asList((Object[]) info.getTestCases()
                                .get(currentTestCaseIndex)))));
                        ps.setBytes(2, DBMS.serializeBlobObject(
                                expectedResults[currentTestCaseIndex]));
                        ps.setInt(3, currentTestCaseId);
                    } else {
                        //insert the test case
                        currentTestCaseId = DBMS.getSeqId(DBMS.JMA_SEQ);
                        sqlStr.replace(0, sqlStr.length(), "");
                        sqlStr.append("INSERT INTO system_test_case ");
                        sqlStr.append("(test_case_id ");
                        sqlStr.append(",problem_id ");
                        sqlStr.append(",args ");
                        sqlStr.append(",expected_result) ");
                        sqlStr.append("VALUES (?, ?, ?, ?)");
                        ps = conn.prepareStatement(sqlStr.toString());
                        ps.setInt(1, currentTestCaseId);
                        ps.setInt(2, problemId);
                        ps.setBytes(3, DBMS.serializeBlobObject(
                                new ArrayList(Arrays.asList((Object[]) info
                                .getTestCases().get(currentTestCaseIndex)))));
                        ps.setBytes(4, DBMS.serializeBlobObject(
                                expectedResults[currentTestCaseIndex]));
                    }
                    ps.executeUpdate();
                }

                //delete any extra test cases in the db
                if (rs.next()) {
                    sqlStr.replace(0, sqlStr.length(), "");
                    sqlStr.append("DELETE FROM system_test_case ");
                    sqlStr.append("WHERE test_case_id >= ? ");
                    sqlStr.append("AND problem_id = ?");
                    ps = conn.prepareStatement(sqlStr.toString());
                    ps.setInt(1, rs.getInt(1));
                    ps.setInt(2, problemId);
                    numUpdates = ps.executeUpdate();
                    log.debug(numUpdates + " rows delete from system_test_case");
                }
            }

            //the submission went ok, update the status
            if (userType == ApplicationConstants.PROBLEM_WRITER) {
                int newStatus = status;
                if (status == MessageTypes.PROPOSAL_REJECTED) {
                    newStatus = MessageTypes.PROPOSAL_PENDING_APPROVAL;
                }
                if (status == MessageTypes.PROPOSAL_APPROVED
                        || status == MessageTypes.SUBMISSION_REJECTED) {
                    newStatus = MessageTypes.SUBMISSION_PENDING_APPROVAL;
                }

                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("UPDATE problem SET status = ? WHERE problem_id = ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, newStatus);
                ps.setInt(2, problemId);
                ps.executeUpdate();

                //broadcast the status changes, if necessary, and problem change
                try {
                    //broadcast the status change to the PENDING_APPROVAL_ROOM
                    if (status != newStatus) {
                        ArrayList broadcast = new ArrayList(3);
                        if (newStatus == MessageTypes.PROPOSAL_PENDING_APPROVAL) {
                            broadcast.add(new Integer(ApplicationConstants.PENDING_PROPOSAL_BROADCAST_IN));
                            broadcast.add(getProblems(ApplicationConstants.PROBLEMS_WITH_STATUS,
                                    MessageTypes.PROPOSAL_PENDING_APPROVAL));
                        } else {
                            broadcast.add(new Integer(ApplicationConstants.PENDING_SUBMISSION_BROADCAST_IN));
                            broadcast.add(getProblems(ApplicationConstants.PROBLEMS_WITH_STATUS,
                                    MessageTypes.SUBMISSION_PENDING_APPROVAL));
                        }

                        sendToAppletServer(broadcast);
                    }
                } catch (Exception e1) {
                    log.debug("Error broadcast status change for problem " + problemId);
                    e1.printStackTrace();
                }
            }

            broadcastProblemUpdate(problemId, userId, connectionId);

            submitInfo.add(new Boolean(true));
        } catch (Exception e) {
            log.debug("Error in submitProblem:");
            e.printStackTrace();
            submitInfo.add(new Boolean(false));
            submitInfo.add(ApplicationConstants.SERVER_ERROR);
        } finally {
            closeConnection(conn, ps);
        }
        return submitInfo;
    }

    /**
     * Updates just the problem statement for a problem and
     * returns a String about the success.
     *
     * @param info The new problem statement.
     * @param problemId The problem's problemid
     * @param userId The user's id.
     * @param connectionId The user's connection id.
     *                     (So he won't get the broadcast saying "It's been changed")
     */
    public String saveProblemStatement(String statement, int problemId, int userId,
                                       int connectionId) {
        log.debug("Updating problem statement for problemId = " + problemId);
        String result;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer();

            //Find out the user type
            int userType = getUserType(problemId, userId);

            if (userType == ApplicationConstants.PROBLEM_TESTER) {
                result = "You do not have permission to edit this problem statement.";
                return result;
            }

            backUpProblemStatement(problemId, userId);
            sqlStr.append("UPDATE problem SET problem_text = ? ");
            sqlStr.append(" WHERE problem_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setBytes(1, DBMS.serializeTextString(statement));
            ps.setInt(2, problemId);
            ps.executeUpdate();

            result = "Problem statement saved.";

            //broadcast the problem change to VIEW_PROBLEM_ROOM
            broadcastProblemUpdate(problemId, userId, connectionId);
        } catch (Exception e) {
            log.debug("Error saving problem statement for problemId " + problemId);
            e.printStackTrace();
            result = ApplicationConstants.SERVER_ERROR;
        } finally {
            closeConnection(conn, ps);
        }
        return result;
    }

    /**
     * Processes an admin's reply to a proposal or submission
     * (approved or disproved). It returns an ArrayList constaining a boolean
     * representing if things went ok, and if not, the second element is a
     * String that is the error.
     *
     * @param problemId  The problemId the admin is replying to.
     * @param approved   A boolean representing if the problem is approved
     * @param message    A message about the problem proposal
     * @param userId     The userId of the admin replying to the problem
     */
    public ArrayList processPendingReply(int problemId, boolean approved,
                                         String message, int userId) {
        log.debug("In MPSQASServicesBean.processPendingReply()..");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ArrayList replyInfo = new ArrayList(2);
        try {
            conn = DBMS.getConnection();

            StringBuffer sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT handle ");
            sqlStr.append("FROM user ");
            sqlStr.append("WHERE user_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String adminHandle = rs.getString(1);

            sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT p.status ");
            sqlStr.append(",pu.user_id ");
            sqlStr.append(",p.class_name ");
            sqlStr.append(",u.email ");
            sqlStr.append(",u.handle ");
            sqlStr.append("FROM problem p ");
            sqlStr.append(",user u ");
            sqlStr.append(",problem_user pu ");
            sqlStr.append("WHERE p.problem_id = ? ");
            sqlStr.append("AND p.problem_id = pu.problem_id ");
            sqlStr.append("AND pu.user_id = u.user_id ");
            sqlStr.append("AND pu.user_type_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ps.setInt(2, ApplicationConstants.PROBLEM_WRITER);
            rs = ps.executeQuery();

            if (rs.next()) {
                int status = rs.getInt(1);
                int submittedBy = rs.getInt(2);
                String className = rs.getString(3);
                String emailAddy = rs.getString(4);
                String handle = rs.getString(5);
                int newstatus = status;

                if (status == MessageTypes.PROPOSAL_PENDING_APPROVAL
                        || status == MessageTypes.SUBMISSION_PENDING_APPROVAL) {
                    if (status == MessageTypes.PROPOSAL_PENDING_APPROVAL) {
                        if (approved)
                            newstatus = MessageTypes.PROPOSAL_APPROVED;
                        else
                            newstatus = MessageTypes.PROPOSAL_REJECTED;
                    } else {
                        if (approved)
                            newstatus = MessageTypes.SUBMISSION_APPROVED;
                        else
                            newstatus = MessageTypes.SUBMISSION_REJECTED;
                    }

                    sqlStr = new StringBuffer(256);
                    sqlStr.append("UPDATE problem ");
                    sqlStr.append("SET status = ? ");
                    sqlStr.append("WHERE problem_id = ?");
                    ps = conn.prepareStatement(sqlStr.toString());
                    ps.setInt(1, newstatus);
                    ps.setInt(2, problemId);
                    int numUpdates = ps.executeUpdate();

                    if (message != null && message.trim().length() > 0) {
                        int correspondenceId = DBMS.getSeqId(DBMS.JMA_SEQ);
                        sqlStr = new StringBuffer(256);
                        sqlStr.append("INSERT INTO correspondence ");
                        sqlStr.append("(correspondence_id ");
                        sqlStr.append(",from_coder_id ");
                        sqlStr.append(",problem_id ");
                        sqlStr.append(",message) ");
                        sqlStr.append("VALUES (?, ?, ?, ?)");
                        ps = conn.prepareStatement(sqlStr.toString());
                        ps.setInt(1, correspondenceId);
                        ps.setInt(2, userId);
                        ps.setInt(3, problemId);
                        ps.setBytes(4, DBMS.serializeTextString(message));
                        numUpdates = ps.executeUpdate();
                    }

                    if (newstatus != status &&
                            newstatus == MessageTypes.SUBMISSION_APPROVED) {
                        reconcilePayment(problemId);
                    }

                    try {
                        //send an email to the user
                        TCSEmailMessage email = new TCSEmailMessage();
                        String type = (status == MessageTypes.PROPOSAL_PENDING_APPROVAL)
                                ? "Proposal"
                                : "Submission";
                        String statusS = (approved) ? "Accepted" : "Rejected";
                        StringBuffer emailBody = new StringBuffer(256);
                        emailBody.append("Hi ");
                        emailBody.append(handle);
                        emailBody.append(",\n\n");
                        emailBody.append("Your ");
                        emailBody.append(type);
                        emailBody.append(" of ");
                        emailBody.append(className);
                        emailBody.append(" was ");
                        emailBody.append(statusS);
                        emailBody.append(" by TopCoder admin ");
                        emailBody.append(adminHandle);
                        emailBody.append(".\n");
                        if (message != null && message.trim().length() > 0) {
                            emailBody.append("\n");
                            emailBody.append(adminHandle);
                            emailBody.append(" says: \n\n");
                            emailBody.append(ApplicationConstants.HORIZONTAL_RULE);
                            emailBody.append(message);
                            emailBody.append("\n");
                            emailBody.append(ApplicationConstants.HORIZONTAL_RULE);
                        }

                        emailBody.append("\nLog in to the applet to work on your problem ");
                        emailBody.append("further.\n\n");
                        emailBody.append("-mpsqas\n\n");
                        emailBody.append("This is an automated message from MPSQAS.\n");
                        email.setSubject("TopCoder Problem " + type + " " + statusS);
                        email.setBody(emailBody.toString());
                        email.setFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
                        email.addToAddress(emailAddy, TCSEmailMessage.TO);
                        EmailEngine.send(email);
                    } catch (Exception e) {
                        log.debug("Error sending email.");
                        e.printStackTrace();
                    }

                    //broadcast
                    try {
                        ArrayList broadcast = new ArrayList(3);
                        if (status == MessageTypes.PROPOSAL_PENDING_APPROVAL) {
                            broadcast.add(new Integer(
                                    ApplicationConstants.PENDING_PROPOSAL_BROADCAST_IN));
                            broadcast.add(getProblems(ApplicationConstants.PROBLEMS_WITH_STATUS,
                                    MessageTypes.PROPOSAL_PENDING_APPROVAL));
                        } else {
                            broadcast.add(new Integer(
                                    ApplicationConstants.PENDING_SUBMISSION_BROADCAST_IN));
                            broadcast.add(getProblems(ApplicationConstants.PROBLEMS_WITH_STATUS,
                                    MessageTypes.SUBMISSION_PENDING_APPROVAL));
                        }

                        sendToAppletServer(broadcast);
                    } catch (Exception e1) {
                        log.debug("Error broadcast status change for problem " + problemId);
                        e1.printStackTrace();
                    }
                    replyInfo.add(new Boolean(true));
                } else  //Not PENDING status
                {
                    replyInfo.add(new Boolean(false));
                    replyInfo.add("The problem to which you are replying is not pending approval.");
                }
            } else //!rs.next() when getting problem
            {
                replyInfo.add(new Boolean(false));
                replyInfo.add("The problem to which you are replying does not exist in the database.");
            }
        } catch (Exception e) {
            replyInfo = new ArrayList(2);
            replyInfo.add(new Boolean(false));
            replyInfo.add(ApplicationConstants.SERVER_ERROR);
            log.debug("Error inserting reply to problem proposal: ");
            e.printStackTrace();
        } finally {
            closeConnection(conn, ps);
        }
        return replyInfo;
    }

    /**
     * Updates the status of a problem and the scheduled problem testers for the problem.
     * Returns a boolean about its success.
     *
     * @param problemInfo The ProblemInformation of the problem being saved.
     * @param problemId The problemId of the problem the user is editing.
     */
    public boolean saveAdminProblemInformation(ProblemInformation problemInfo, int problemId) {
        log.debug("In MPSQASServicesBean.adminSaveProblem()");

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        boolean ok = true;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            //save status
            sqlStr.replace(0, sqlStr.length(), "UPDATE problem SET status=? WHERE problem_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemInfo.getStatus());
            ps.setInt(2, problemId);
            ps.executeUpdate();

            //save primary solution
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("UPDATE problem_solution ");
            sqlStr.append("SET primary_solution = ? ");
            sqlStr.append("WHERE problem_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setString(1, "N");
            ps.setInt(2, problemId);
            ps.executeUpdate();

            if (problemInfo.getPrimarySolutionId() >= 0) {
                sqlStr.append("AND solution_id = ? ");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setString(1, "Y");
                ps.setInt(2, problemId);
                ps.setInt(3, problemInfo.getPrimarySolutionId());
                ps.executeUpdate();
            }

            sqlStr.replace(0, sqlStr.length(), "DELETE FROM problem_user WHERE problem_id=? AND user_type_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ps.setInt(2, ApplicationConstants.PROBLEM_TESTER);
            int rowsUpdated = ps.executeUpdate();

            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("INSERT INTO problem_user ");
            sqlStr.append("(problem_id ");
            sqlStr.append(",user_id ");
            sqlStr.append(",user_type_id  ");
            sqlStr.append(",paid ");
            sqlStr.append(",pending_payment ) ");
            sqlStr.append("VALUES (?, ?, ?, ?, ?)");
            ps = conn.prepareStatement(sqlStr.toString());
            for (int i = 0; i < problemInfo.getTesters().size(); i++) {
                ps.setInt(1, problemId);
                ps.setInt(2, ((UserInformation) problemInfo.getTesters().get(i)).getUserId());
                ps.setInt(3, ApplicationConstants.PROBLEM_TESTER);
                ps.setDouble(4, 0);
                ps.setDouble(5, 0);
                ps.executeUpdate();
            }
            reconcilePayment(problemId);
        } catch (Exception e) {
            log.debug("Error doing admin problem save: ");
            e.printStackTrace();
            ok = false;
        }

        closeConnection(conn, ps);
        return ok;
    }


    /******************************************************************************
     * Compile and Testing services                                               *
     ******************************************************************************/

    /**
     * Compiles code from a user, and if the compile is sucessful
     * inserts the results into the database for testing
     *
     * @param info The ProblemInformation of the code to compile.
     * @param problemId The problem id to compile
     * @param userId The user id of the person compiling.
     */
    public ArrayList compile(ProblemInformation info, int problemId, int userId) {
        log.debug("In MPSQASServicesBean.compile");
        ArrayList results = new ArrayList(2);
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();

            StringBuffer sqlStr = new StringBuffer(256);

            //get the solution id
            int solutionId = getSolutionId(problemId, userId);

            String packageName = "com.topcoder.tester.solutions.s" + solutionId;
            String fileName = info.getClassName() + ".java";

            //make some pre-compile code modifications
            String code = "package " + packageName + ";";
            code += info.getSolution().getText();

            //compile
            ArrayList compiledCode = new CompilerWaiter().compile(code, fileName, packageName);

            //if compile errors, return results
            if (!((Boolean) compiledCode.get(0)).booleanValue()) {
                closeConnection(conn, ps);
                return compiledCode;
            }

            //update the solution class in the database
            backUpSolution(solutionId, userId);
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("UPDATE solution ");
            sqlStr.append("SET solution_class = ? ");
            sqlStr.append(",solution_text = ? ");
            sqlStr.append("WHERE solution_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setBytes(1, DBMS.serializeBlobObject(compiledCode.get(1)));
            ps.setBytes(2, DBMS.serializeTextString(info.getSolution().getText()));
            ps.setInt(3, solutionId);
            ps.executeUpdate();

            results.add(new Boolean(true));
        } catch (Exception e) {
            log.debug("Error compiling:");
            e.printStackTrace();
            results = new ArrayList();
            results.add(new Boolean(false));
            results.add(ApplicationConstants.SERVER_ERROR);
        }
        closeConnection(conn, ps);
        return results;
    }

    /**
     * Calls the tester to test some code and returns a string that is
     * the test results.  It gets the class files from the database.
     * Can test just the user's solution or all solutions.
     *
     * @param args An Object[] of arguments to pass to the method
     * @param problemId The problemId to test
     * @param userId The userId of the tester
     * @param type Specifies whether to test users solution only
     *                       or all solutions. (TEST_ONE or TEST_ALL)
     */
    public String test(Object[] args, int problemId, int userId, int type) {
        log.debug("In MPSQASServicesBean.test()..");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer testResults = new StringBuffer(256);
        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            sqlStr.append("SELECT param_types ");
            sqlStr.append(",class_name ");
            sqlStr.append(",method_name ");
            sqlStr.append("FROM problem ");
            sqlStr.append("WHERE problem_id = ? ");
            sqlStr.append("AND param_types IS NOT NULL");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ResultSet rs = ps.executeQuery();
            rs.next();

            ArrayList paramTypes = (ArrayList) DBMS.getBlobObject(rs, 1);
            String className = rs.getString(2);
            String methodName = rs.getString(3);

            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT u.handle ");
            sqlStr.append(",ps.primary_solution ");
            sqlStr.append(",s.solution_class ");
            sqlStr.append(",s.solution_id ");
            sqlStr.append("FROM solution s ");
            sqlStr.append(",problem_solution ps ");
            sqlStr.append(",user u ");
            sqlStr.append("WHERE ps.problem_id = ? ");
            sqlStr.append("AND s.coder_id = u.user_id ");
            sqlStr.append("AND s.solution_class IS NOT NULL ");
            sqlStr.append("AND s.solution_id = ps.solution_id ");
            if (type == MessageTypes.TEST_ONE) {
                sqlStr.append("AND s.solution_id = ? ");
            }
            sqlStr.append("ORDER BY ps.primary_solution DESC");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            if (type == MessageTypes.TEST_ONE) {
                ps.setInt(2, getSolutionId(problemId, userId));
            }
            rs = ps.executeQuery();

            if (!rs.next()) {
                return "There is no compiled solution to test.";
            }

            boolean more = true;
            HashMap classFiles;
            String packageName;
            while (more) {
                classFiles = (HashMap) DBMS.getBlobObject(rs, 3);
                packageName = "com.topcoder.tester.solutions.s" + rs.getInt(4);

                if (type == MessageTypes.TEST_ALL) {
                    testResults.append(rs.getString(1));
                    testResults.append("'s solution:\n");
                }

                if (rs.getString(2).equals("Y")) {
                    testResults.append((String) (new TesterWaiter().test(classFiles,
                            packageName, className, "checkData",
                            paramTypes, args).get(0)));
                    testResults.append("\n\n");
                }
                testResults.append((String) (new TesterWaiter().test(classFiles,
                        packageName, className, methodName, paramTypes, args).get(0)));

                if (rs.next()) {
                    more = true;
                    testResults.append("\n\n");
                } else {
                    more = false;
                }
            }
        } catch (Exception e) {
            log.debug("Error processing test:");
            e.printStackTrace();
            testResults.replace(0, testResults.length(),
                    ApplicationConstants.SERVER_ERROR);
        } finally {
            closeConnection(conn, ps);
        }

        return testResults.toString();
    }

    /**
     * Runs all the solutions to a problem through the test cases and compares the
     * results to ensure they are all the same.  Returns an ArrayList who's
     * first element is a boolean as to whether the solutions
     * always agree, and the second element is a String showing the results.
     *
     * @param problemId The problem for which to compare the results.
     */
    public ArrayList compareSolutions(int problemId) {
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer compareResults = new StringBuffer(256);
        ArrayList results = new ArrayList(2);

        try {
            conn = DBMS.getConnection();

            StringBuffer sqlStr = new StringBuffer(256);

            //get and store the test cases information
            sqlStr.replace(0, sqlStr.length(), "SELECT args, expected_result,test_case_id FROM system_test_case WHERE problem_id=? ORDER BY test_case_id");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ResultSet rs = ps.executeQuery();

            ArrayList args = new ArrayList(ApplicationConstants.MIN_TEST_CASES);
            ArrayList expected = new ArrayList(ApplicationConstants.MIN_TEST_CASES);

            while (rs.next()) {
                args.add(((ArrayList) DBMS.getBlobObject(rs, 1)).toArray());
                expected.add(DBMS.getBlobObject(rs, 2));
            }

            if (args.size() == 0)
                compareResults.append("There are no test cases for this problem.");

            //get some problem information
            sqlStr.replace(0, sqlStr.length(), "SELECT param_types, class_name, method_name FROM problem WHERE problem_id=? AND param_types IS NOT NULL");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            rs = ps.executeQuery();

            if (!rs.next()) {
                closeConnection(conn, ps);
                results.add(new Boolean(false));
                results.add("The problem does not exists, or there are no param types associated with it. Try compiling the problem.");
                return results;
            }

            ArrayList paramTypes = (ArrayList) DBMS.getBlobObject(rs, 1);
            String className = rs.getString(2);
            String methodName = rs.getString(3);

            //get all the solutions for the problem
            sqlStr.replace(0, sqlStr.length(), "SELECT u.handle, ps.primary_solution, s.solution_class,s.solution_id FROM solution s,problem_solution ps, user u ");
            sqlStr.append(" WHERE ps.problem_id=? AND s.coder_id=u.user_id AND s.solution_class IS NOT NULL AND s.solution_id=ps.solution_id ");
            sqlStr.append(" ORDER BY ps.primary_solution DESC");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            rs = ps.executeQuery();

            HashMap classFiles;
            String packageName;
            ArrayList testObjects = new ArrayList(2);
            ArrayList testStrings = new ArrayList(2);
            ArrayList solutionWriterNames = new ArrayList(2);
            ArrayList primarySolution = new ArrayList(2);
            ArrayList solutionResultObjects = new ArrayList(2);
            ArrayList solutionResultStrings = new ArrayList(2);
            ArrayList solutionResults;
            int i;

            //run the solutions through the test cases
            while (rs.next()) {
                classFiles = (HashMap) DBMS.getBlobObject(rs, 3);
                packageName = "com.topcoder.tester.solutions.s" + rs.getInt(4);
                solutionResultObjects = new ArrayList(args.size());
                solutionResultStrings = new ArrayList(args.size());

                for (i = 0; i < args.size(); i++) {
                    solutionResults = new TesterWaiter().test(classFiles, packageName,
                            className, methodName, paramTypes, (Object[]) args.get(i));
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
            boolean allAlwaysAgree = true;
            for (i = 0; i < args.size(); i++) {
                compareResults.append("For test case " + i + ":\n");
                compareResults.append("Args     = "
                        + ApplicationConstants.makePretty(args.get(i)) + "\n");
                compareResults.append("Expected = "
                        + ApplicationConstants.makePretty(expected.get(i)) + "\n");

                agree = true;
                for (j = 0; j < testObjects.size(); j++) {
                    if (!ApplicationConstants.compare(expected.get(i), ((ArrayList) testObjects.get(j)).get(i))) {
                        agree = false;
                        allAlwaysAgree = false;
                        if (((Boolean) primarySolution.get(j)).booleanValue()) {
                            compareResults.append("\nPRIMARY SOLUTION DOES NOT AGREE WITH EXPECTED RESULT:");
                        }
                        compareResults.append("\n" + solutionWriterNames.get(j)
                                + "'s solution did not agree.  It returns:\n");
                        compareResults.append((String) ((ArrayList) testStrings.get(j)).get(i) + "\n");
                    }
                }
                if (agree) {
                    compareResults.append("All solutions agree.");
                }
                compareResults.append("\n\n");
            }
            if (args.size() > 0) {
                if (allAlwaysAgree) {
                    compareResults.insert(0, "All solutions always agree for all test cases:\n\n");
                    results.add(new Boolean(true));
                } else {
                    compareResults.insert(0, "SOLUTIONS DISAGREE:\n\n");
                    results.add(new Boolean(false));
                }
            } else {
                compareResults.insert(0, "No test cases to test.\n\n");
                results.add(new Boolean(true));
            }
        } catch (Exception e) {
            log.debug("Error comparing results for problem " + problemId);
            e.printStackTrace();
            results.add(new Boolean(false));
            compareResults.insert(0, ApplicationConstants.SERVER_ERROR);
        }

        results.add(compareResults.toString());
        closeConnection(conn, ps);
        return results;
    }

    /******************************************************************************
     * Contest Services                                                           *
     ******************************************************************************/

    /**
     * Returns an ArrayList of upcoming contests that the user_id has permission
     * to view.
     *
     * @param userId The userId of the user trying to view contests, or -1 for
     * all contests
     */
    public ArrayList getContests(int userId) {
        log.debug("In MPSQASServicesBean.getUpcomingContests()..");
        ArrayList contestTable = new ArrayList();

        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();

            StringBuffer sqlStr = new StringBuffer(256);

            sqlStr.append("SELECT * FROM group_user WHERE group_id=? AND user_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, ApplicationConstants.ADMIN_GROUP);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();

            boolean admin = false;

            if (rs.next() || userId < 0) {
                admin = true;
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT c.name ");
                sqlStr.append(",r.name ");
                sqlStr.append(",rs.start_time ");
                sqlStr.append(",r.round_id ");
                sqlStr.append("FROM contest c ");
                sqlStr.append(",round r ");
                sqlStr.append(",round_segment rs ");
                sqlStr.append("WHERE c.contest_id = r.contest_id ");
                sqlStr.append("AND r.round_id = rs.round_id ");
                sqlStr.append("AND rs.segment_id = ? ");
                sqlStr.append("AND rs.start_time > ? ");
                sqlStr.append("ORDER BY rs.start_time ");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, ApplicationConstants.CODING_SEGMENT);
                ps.setTimestamp(2, new Timestamp(
                        System.currentTimeMillis() - ApplicationConstants.DISPLAY_OLD_CONTEST));
            } else {
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT c.name ");
                sqlStr.append(",r.name ");
                sqlStr.append(",rs.start_time ");
                sqlStr.append(",r.round_id ");
                sqlStr.append("FROM contest c ");
                sqlStr.append(",round r ");
                sqlStr.append(",round_segment rs ");
                sqlStr.append("WHERE c.contest_id = r.contest_id ");
                sqlStr.append("AND rs.round_id = r.round_id ");
                sqlStr.append("AND rs.segment_id = ? ");
                sqlStr.append("AND rs.start_time > ? ");
                sqlStr.append("AND r.round_id IN (SELECT DISTINCT round_id ");
                sqlStr.append("FROM round_problem ");
                sqlStr.append("WHERE problem_id IN (SELECT DISTINCT problem_id ");
                sqlStr.append("FROM problem_user ");
                sqlStr.append("WHERE user_id = ?)) ");
                sqlStr.append("ORDER BY rs.start_time");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, ApplicationConstants.CODING_SEGMENT);
                ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()
                        - ApplicationConstants.DISPLAY_OLD_CONTEST));
                ps.setInt(3, userId);
            }

            rs = ps.executeQuery();

            //find out if user is writer / tester of a contest
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT DISTINCT pu.user_type_id ");
            sqlStr.append("FROM problem_user pu ");
            sqlStr.append("WHERE pu.problem_id IN (SELECT problem_id ");
            sqlStr.append("FROM round_problem ");
            sqlStr.append("WHERE round_id = ?) ");
            sqlStr.append("AND pu.user_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(2, userId);
            ResultSet rs2;
            int count;
            String role;
            ContestInformation contestInfo;

            while (rs.next()) {
                contestInfo = new ContestInformation();

                if (userId >= 0) {
                    contestInfo.setContestName(rs.getString(1) + ", " + rs.getString(2));
                    contestInfo.setStartCoding(rs.getTimestamp(3).toString());

                    //get user's role
                    ps.setInt(1, rs.getInt(4));
                    rs2 = ps.executeQuery();
                    count = 0;
                    role = "";
                    if (admin) {
                        role += "Admin";
                        count++;
                    }
                    while (rs2.next()) {
                        if (count > 0) role += " & ";
                        switch (rs2.getInt(1)) {
                            case ApplicationConstants.PROBLEM_TESTER:
                                role += "Tester";
                                break;
                            case ApplicationConstants.PROBLEM_WRITER:
                                role += "Writer";
                                break;
                            default:
                                role += "Unknown(" + rs2.getInt(1) + ")";
                        }
                    }

                    contestInfo.setRole(role);
                }
                contestInfo.setRoundId(rs.getInt(4));
                contestTable.add(contestInfo);
            }
        } catch (Exception e) {
            log.debug("Error getting contest table:");
            e.printStackTrace();
        }

        closeConnection(conn, ps);
        return contestTable;
    }

    /**
     * Gets all the contest information about a round from the database and fills out a
     * ContestInformation instance. Returns the ContestInformation about the contest.
     *
     * @param roundId  The round for which to get information
     * @param adminInfo Get admin info for problem if true
     */
    public ContestInformation getContestInformation(int roundId, boolean adminInfo) {
        log.debug("In MPSQASServicesBean.getContestInformation()");

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ContestInformation contestInformation = new ContestInformation();

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            //get the contest / round name
            sqlStr.replace(0, sqlStr.length(),
                    "SELECT c.name ");
            sqlStr.append(",r.name ");
            sqlStr.append("FROM contest c ");
            sqlStr.append(",round r ");
            sqlStr.append("WHERE r.round_id = ? ");
            sqlStr.append("AND r.contest_id = c.contest_id ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, roundId);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                log.debug("No contest/round scheduled for requested round: " + roundId);
                throw new Exception();
            }

            contestInformation.setContestName(rs.getString(1));
            contestInformation.setRoundName(rs.getString(2));

            //get times
            sqlStr.replace(0, sqlStr.length(),
                    "SELECT start_time ");
            sqlStr.append(",end_time ");
            sqlStr.append("FROM round_segment ");
            sqlStr.append("WHERE round_id=? ");
            sqlStr.append("AND segment_id=? ");
            ps = conn.prepareStatement(sqlStr.toString());

            //coding phase time
            ps.setInt(1, roundId);
            ps.setInt(2, ApplicationConstants.CODING_SEGMENT);
            rs = ps.executeQuery();

            if (!rs.next()) {
                log.debug("No coding segment scheduled for round " + roundId);
                contestInformation.setStartCoding("NOT SCHEDULED");
                contestInformation.setEndCoding("NOT SCHEDULED");
            } else {
                contestInformation.setStartCoding(rs.getTimestamp(1).toString());
                contestInformation.setEndCoding(rs.getTimestamp(2).toString());
            }

            //challenge phase time
            ps.setInt(2, ApplicationConstants.CHALLENGE_SEGMENT);
            rs = ps.executeQuery();

            if (!rs.next()) {
                log.debug("No challenge segment scheduled for round " + roundId);
                contestInformation.setStartChallenge("NOT SCHEDULED");
                contestInformation.setEndChallenge("NOT SCHEDULED");
            } else {
                contestInformation.setStartChallenge(rs.getTimestamp(1).toString());
                contestInformation.setEndChallenge(rs.getTimestamp(2).toString());
            }

            ArrayList schedProblems =
                    getProblems(ApplicationConstants.SCHED_PROBLEMS_FOR_CONTEST
                            , roundId);

            for (int i = 0; i < schedProblems.size(); i++) {
                ((ProblemInformation) schedProblems.get(i)).setTesters(
                        getUsers(ApplicationConstants.TESTERS_FOR_PROBLEM
                                , ((ProblemInformation) schedProblems.get(i)).getProblemId()));
            }

            contestInformation.setScheduledProblems(schedProblems);

            if (adminInfo) {
                contestInformation.setAvailableProblems(getProblems(
                        ApplicationConstants.PROBLEMS_FOR_CONTEST, roundId));
                contestInformation.setAvailableTesters(
                        getUsers(ApplicationConstants.ALL_TESTERS, 0));
            }
        } catch (Exception e) {
            log.debug("Error retrieving contest information for round "
                    + roundId);
            e.printStackTrace();
            contestInformation = null;
        }

        closeConnection(conn, ps);
        return contestInformation;
    }

    /**
     * Updates the problemIds in round_problem and the testers of the scheduled problems to
     * match the passed data.  Returns a message about its success.
     *
     * @param roundId The round id to change the information.
     * @param problem ArrayList of ProblemInformation objects to be scheduled for contest.
     */
    public String saveContestProblems(int roundId, ArrayList problems) {
        log.debug("In MPSQASServicesBean.scheduleProblems() for round " + roundId);
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        String results = "";

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            //delete old testers from old problems
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("DELETE FROM problem_user ");
            sqlStr.append("WHERE user_type_id = ? ");
            sqlStr.append("AND problem_id IN ");
            sqlStr.append("(SELECT problem_id ");
            sqlStr.append("FROM round_problem ");
            sqlStr.append("WHERE round_id = ?) ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, ApplicationConstants.PROBLEM_TESTER);
            ps.setInt(2, roundId);
            int rowsUpdated = ps.executeUpdate();
            log.debug(rowsUpdated + " testers deleted from scheduled problems.");

            //delete the old scheduled problems
            sqlStr.replace(0, sqlStr.length(),
                    "DELETE FROM round_problem WHERE round_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, roundId);
            rowsUpdated = ps.executeUpdate();

            log.debug(rowsUpdated + " rows removed from round_problem.");

            //insert the new problems
            sqlStr.replace(0, sqlStr.length(),
                    "INSERT INTO round_problem ");
            sqlStr.append("(round_id ");
            sqlStr.append(",problem_id ");
            sqlStr.append(",difficulty_id ");
            sqlStr.append(",points ");
            sqlStr.append(",division_id) ");
            sqlStr.append("VALUES (?, ?, ?, ?, ?)");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, roundId);

            int i, j;
            rowsUpdated = 0;
            ProblemInformation problemInfo;

            for (i = 0; i < problems.size(); i++) {
                problemInfo = (ProblemInformation) problems.get(i);
                ps.setInt(2, problemInfo.getProblemId());
                ps.setInt(3, problemInfo.getDifficultyLevel());
                ps.setDouble(4, problemInfo.getPoints());
                ps.setInt(5, problemInfo.getDivision());
                rowsUpdated += ps.executeUpdate();
            }

            log.debug(rowsUpdated + " problems added to round " + roundId);

            //change the status of the problems to TESTING:
            sqlStr.replace(0, sqlStr.length(),
                    "UPDATE problem SET status=? WHERE problem_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, MessageTypes.TESTING);

            rowsUpdated = 0;
            for (i = 0; i < problems.size(); i++) {
                ps.setInt(2, ((ProblemInformation) problems.get(i)).getProblemId());
                ps.executeUpdate();
            }

            //if the problem tester is not already a tester for each problem, make him one
            ArrayList newTesters;
            ArrayList oldTesters;
            int problemId;
            int testerId;
            ResultSet rs;
            for (i = 0; i < problems.size(); i++) {
                problemId = ((ProblemInformation) problems.get(i)).getProblemId();
                newTesters = ((ProblemInformation) problems.get(i)).getTesters();

                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT user_id ");
                sqlStr.append("FROM problem_user ");
                sqlStr.append("WHERE problem_id = ? ");
                sqlStr.append("AND user_type_id = ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, problemId);
                ps.setInt(2, ApplicationConstants.PROBLEM_TESTER);
                rs = ps.executeQuery();

                oldTesters = new ArrayList();
                while (rs.next()) {
                    oldTesters.add(new Integer(rs.getInt(1)));
                }

                for (j = 0; j < newTesters.size(); j++) {
                    testerId = ((UserInformation) newTesters.get(j)).getUserId();
                    if (oldTesters.indexOf(new Integer(testerId)) == -1) {
                        sqlStr.replace(0, sqlStr.length(), "");
                        sqlStr.append("INSERT INTO problem_user ");
                        sqlStr.append("(problem_id ");
                        sqlStr.append(",user_id ");
                        sqlStr.append(",user_type_id ");
                        sqlStr.append(",paid ");
                        sqlStr.append(",pending_payment) ");
                        sqlStr.append("VALUES (?, ?, ?, ?, ?)");
                        ps = conn.prepareStatement(sqlStr.toString());
                        ps.setInt(1, problemId);
                        ps.setInt(2, testerId);
                        ps.setInt(3, ApplicationConstants.PROBLEM_TESTER);
                        ps.setDouble(4, 0);
                        ps.setDouble(5, 0);
                        ps.executeUpdate();
                    }
                }

                reconcilePayment(problemId);
            }

            //email those involved
            try {
                //get some contest information
                ContestInformation contestInfo = getContestInformation(roundId, true);

                String contestName = contestInfo.getContestName()
                        + ", " + contestInfo.getRoundName();
                String contestTime = contestInfo.getStartCoding();

                problems = contestInfo.getScheduledProblems();

                HashMap writerProblems = new HashMap();
                HashMap testerProblems = new HashMap();
                ArrayList testers;
                int writerId;

                for (i = 0; i < problems.size(); i++) {
                    writerId = ((ProblemInformation) problems.get(i)).getWriter().getUserId();
                    if (writerProblems.get(new Integer(writerId)) == null) {
                        writerProblems.put(new Integer(writerId), new ArrayList());
                        System.out.println("Putting: " + writerId);
                    }
                    ((ArrayList) writerProblems.get(new Integer(writerId))).add(
                            ((ProblemInformation) problems.get(i)).getClassName());

                    testers = ((ProblemInformation) problems.get(i)).getTesters();
                    for (j = 0; j < testers.size(); j++) {
                        testerId = ((UserInformation) testers.get(j)).getUserId();
                        if (testerProblems.get(new Integer(testerId)) == null) {
                            testerProblems.put(new Integer(testerId), new ArrayList());
                        }
                        ((ArrayList) testerProblems.get(new Integer(testerId))).add(
                                ((ProblemInformation) problems.get(i)).getClassName());
                    }
                }

                ArrayList writerIds = new ArrayList(writerProblems.keySet());
                ArrayList testerIds = new ArrayList(testerProblems.keySet());

                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT handle ");
                sqlStr.append(",email ");
                sqlStr.append("FROM user ");
                sqlStr.append("WHERE user_id = ? ");
                ps = conn.prepareStatement(sqlStr.toString());

                TCSEmailMessage email;
                StringBuffer emailBody = new StringBuffer(256);

                //compose email to writers
                for (i = 0; i < writerIds.size(); i++) {
                    System.out.println(writerIds);
                    ps.setInt(1, ((Integer) writerIds.get(i)).intValue());
                    rs = ps.executeQuery();
                    rs.next();

                    emailBody.replace(0, emailBody.length(), "");
                    emailBody.append("Hi ");
                    emailBody.append(rs.getString(1));
                    emailBody.append(",\n\n");
                    emailBody.append("Your problems have been scheduled for the ");
                    emailBody.append("following contest:\n");
                    emailBody.append("Name: ");
                    emailBody.append(contestName);
                    emailBody.append("\nDate: ");
                    emailBody.append(contestTime);
                    emailBody.append("\n\nThe problems being used are: \n");

                    problems = (ArrayList) writerProblems.get(writerIds.get(i));
                    for (j = 0; j < problems.size(); j++) {
                        emailBody.append(problems.get(j).toString());
                        emailBody.append("\n");
                    }

                    emailBody.append("\nPlease log into the applet frequently between ");
                    emailBody.append("now and the contest to help polish the problems.");
                    emailBody.append("\n\n-mpsqas\n\n");
                    emailBody.append("This is an automated message from MPSQAS.\n");
                    email = new TCSEmailMessage();
                    email.setSubject("Using your problems in "
                            + contestName + ", " + contestTime);
                    email.setBody(emailBody.toString());
                    email.setFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
                    email.addToAddress(rs.getString(2), TCSEmailMessage.TO);
                    EmailEngine.send(email);
                }

                for (i = 0; i < testerIds.size(); i++) {
                    ps.setInt(1, ((Integer) testerIds.get(i)).intValue());
                    rs = ps.executeQuery();
                    rs.next();

                    emailBody.replace(0, emailBody.length(), "");
                    emailBody.append("Hi ");
                    emailBody.append(rs.getString(1));
                    emailBody.append(",\n\n");
                    emailBody.append("Your have been scheduled to problem test the ");
                    emailBody.append("following contest:\n");
                    emailBody.append("Name: ");
                    emailBody.append(contestName);
                    emailBody.append("\nDate: ");
                    emailBody.append(contestTime);
                    emailBody.append("\n\nThe problems you are testing are: \n");

                    problems = (ArrayList) testerProblems.get(testerIds.get(i));
                    for (j = 0; j < problems.size(); j++) {
                        emailBody.append(problems.get(j).toString());
                        emailBody.append("\n");
                    }

                    emailBody.append("\nPlease log into the applet frequently between ");
                    emailBody.append("now and the contest to help polish the problems.");
                    emailBody.append("\n\n-mpsqas\n\n");
                    emailBody.append("This is an automated message from MPSQAS.\n");
                    email = new TCSEmailMessage();
                    email.setSubject("You are problem testing "
                            + contestName + ", " + contestTime);
                    email.setBody(emailBody.toString());
                    email.setFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
                    email.addToAddress(rs.getString(2), TCSEmailMessage.TO);
                    EmailEngine.send(email);
                }
            } catch (Exception e) {
                log.debug("Error sending email.");
                e.printStackTrace();
            }

            //send a broadcast letting anyone else viewing the contest that things have changed.
            try {
                ArrayList broadcast = new ArrayList(3);
                broadcast.add(new Integer(ApplicationConstants.ROUND_SCHEDULE_BROADCAST_IN));
                broadcast.add(getContestInformation(roundId, false));
                broadcast.add(new Integer(roundId));
                sendToAppletServer(broadcast);
            } catch (Exception e2) {
                log.debug("Error broadcasting problem_schedule for round " + roundId);
                e2.printStackTrace();
            }

            results = "Scheduling successful.";
        } catch (Exception e) {
            log.debug("Error scheduling problems:");
            e.printStackTrace();
            results = ApplicationConstants.SERVER_ERROR;
        }

        closeConnection(conn, ps);
        return results;
    }

    /**
     * Sets the status of any problems in the specified round to false.
     * Reconcile payments.  (And any other post contest matters can be added
     * to this)
     *
     * @param roundId The round id of the contest to work with.
     */
    public void wrapUpContest(int roundId) {
        log.debug("Wrapping up contest " + roundId);

        if (roundId < ApplicationConstants.REAL_CONTEST_ID_LOWER_BOUND) {
            //either admin test or practice room, ignore.
            return;
        }

        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            //Update status to used of all problems used
            sqlStr.append("UPDATE problem ");
            sqlStr.append("SET status = ? ");
            sqlStr.append("WHERE problem_id in ");
            sqlStr.append("(SELECT problem_id FROM round_problem WHERE round_id = ?)");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, MessageTypes.USED);
            ps.setInt(2, roundId);
            int updates = ps.executeUpdate();
            log.debug(updates + " problems changed to USED in wrapping up " + roundId);

            //reconcile payments for users of problems
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT problem_id FROM round_problem WHERE round_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, roundId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                reconcilePayment(rs.getInt(1));
            }
        } catch (Exception e) {
            log.debug("Error wraping up " + roundId);
            e.printStackTrace();
        }
    }

    /**
     * Checks out a contest to make sure it looks all set to go. And returns a String
     * that is a summary of the check.
     *
     * @param roundId The round to check
     */
    public String verifyContest(int roundId) {
        log.debug("In MPSQASServicesBean.contestVerify().");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer result = new StringBuffer(1000);
        ;

        try {
            conn = DBMS.getConnection();
            boolean ok = true;
            StringBuffer sqlStr = new StringBuffer(256);

            sqlStr.append("SELECT rp.problem_id ");
            sqlStr.append(",p.class_name ");
            sqlStr.append(",p.status ");
            sqlStr.append("FROM round_problem rp ");
            sqlStr.append(",problem p ");
            sqlStr.append("WHERE rp.round_id = ? ");
            sqlStr.append("AND rp.problem_id = p.problem_id");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, roundId);
            ResultSet rs = ps.executeQuery();

            ArrayList problemIds = new ArrayList(6);
            ArrayList classNames = new ArrayList(6);
            ArrayList statusIds = new ArrayList(6);

            while (rs.next()) {
                problemIds.add(new Integer(rs.getInt(1)));
                classNames.add(rs.getString(2));
                statusIds.add(new Integer(rs.getInt(3)));
            }

            int i;
            for (i = 0; i < problemIds.size(); i++) {
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("SELECT solution_id ");
                sqlStr.append("FROM problem_solution ");
                sqlStr.append("WHERE problem_id = ? ");
                sqlStr.append("AND primary_solution = ?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, ((Integer) problemIds.get(i)).intValue());
                ps.setString(2, "Y");
                rs = ps.executeQuery();

                if (!rs.next()) {
                    ok = false;
                    result.append((String) classNames.get(i) + " does not have a primary solution!\n");
                }
            }

            for (i = 0; i < problemIds.size(); i++) {
                if (((Integer) statusIds.get(i)).intValue() != MessageTypes.READY) {
                    ok = false;
                    result.append((String) classNames.get(i) + "'s status is not READY!\n");
                }
            }

            ArrayList checked = new ArrayList();
            int problemId;
            for (i = 0; i < problemIds.size(); i++) {
                problemId = ((Integer) problemIds.get(i)).intValue();
                if (!checked.contains(new Integer(problemId))) {
                    //first element of compareSolutions is boolean as to whether they agree
                    if (!((Boolean) compareSolutions(problemId).get(0)).booleanValue()) {
                        ok = false;
                        result.append((String) classNames.get(i) + "'s solutions do not agree for the test cases!\n");
                    }
                    checked.add(new Integer(problemId));
                }
            }

            if (ok) {
                result.append("Looks good: ");
                result.append(problemIds.size());
                result.append(" problems are scheduled, all problems are READY, and the solutions agree.");
            }

        } catch (Exception e) {
            log.debug("Error verifying contest.");
            e.printStackTrace();
            result.append(ApplicationConstants.SERVER_ERROR);
        }

        closeConnection(conn, ps);
        return result.toString();
    }

    /******************************************************************************
     * Application Services                                                       *
     ******************************************************************************/

    /**
     * Returns a list of pending applications (ApplicationInformations).
     */
    public ArrayList getPendingApplications() {
        log.debug("In MPSQASServicesBean.getPendingApplications().");

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ArrayList apps = null;

        try {
            conn = DBMS.getConnection();

            StringBuffer sqlStr = new StringBuffer(256);

            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT u.handle ");
            sqlStr.append(",d.user_type_id ");
            sqlStr.append(",r.rating ");
            sqlStr.append(",r.num_ratings ");
            sqlStr.append(",d.dev_app_id ");
            sqlStr.append("FROM user u ");
            sqlStr.append(",rating r ");
            sqlStr.append(",development_application d ");
            sqlStr.append("WHERE u.user_id = d.user_id ");
            sqlStr.append("AND r.coder_id = u.user_id ");
            sqlStr.append("AND d.dev_app_status_id = ? ");
            sqlStr.append("ORDER BY d.user_type_id");

            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, ApplicationConstants.APPLICATION_PENDING);
            ResultSet rs = ps.executeQuery();

            apps = new ArrayList();
            ApplicationInformation appInfo;

            while (rs.next()) {
                appInfo = new ApplicationInformation();
                appInfo.setHandle(rs.getString(1));

                if (rs.getInt(2) == ApplicationConstants.PROBLEM_WRITER) {
                    appInfo.setApplicationType("Writer");
                } else if (rs.getInt(2) == ApplicationConstants.PROBLEM_TESTER) {
                    appInfo.setApplicationType("Tester");
                } else {
                    appInfo.setApplicationType("Unknown");
                }

                appInfo.setRating(rs.getInt(3));
                appInfo.setEvents(rs.getInt(4));
                appInfo.setId(rs.getInt(5));

                apps.add(appInfo);
            }
        } catch (Exception e) {
            log.debug("Error getting problem testers: ");
            e.printStackTrace();
            apps = null;
        }

        closeConnection(conn, ps);
        return apps;
    }

    /**
     * Fills out an ApplicationInformation with information about an application.
     *
     * @param applicationId The dev_app_id of the application to get information about.
     */
    public ApplicationInformation getApplicationInformation(int applicationId) {
        log.debug("In MPSQASServices.getApplicationInformation().");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ApplicationInformation info = null;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT u.handle ");
            sqlStr.append(",r.rating ");
            sqlStr.append(",r.num_ratings ");
            sqlStr.append(",c.first_name ");
            sqlStr.append(",c.last_name ");
            sqlStr.append(",u.email ");
            sqlStr.append(",d.message ");
            sqlStr.append(",d.user_type_id ");
            sqlStr.append("FROM user u ");
            sqlStr.append(",rating r ");
            sqlStr.append(",coder c ");
            sqlStr.append(",development_application d ");
            sqlStr.append("WHERE u.user_id = c.coder_id ");
            sqlStr.append("AND u.user_id = r.coder_id ");
            sqlStr.append("AND u.user_id = d.user_id ");
            sqlStr.append("AND d.dev_app_id = ? ");
            sqlStr.append("AND d.dev_app_status_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, applicationId);
            ps.setInt(2, ApplicationConstants.APPLICATION_PENDING);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                throw new Exception("No application with status PENDING with id " + applicationId);
            }

            info = new ApplicationInformation();
            info.setHandle(rs.getString(1));
            info.setRating(rs.getInt(2));
            info.setEvents(rs.getInt(3));
            info.setName(rs.getString(4) + " " + rs.getString(5));
            info.setEmail(rs.getString(6));
            info.setMessage(DBMS.getTextString(rs, 7));

            if (rs.getInt(8) == ApplicationConstants.PROBLEM_WRITER) {
                info.setApplicationType("Problem Writer Application:");
            } else if (rs.getInt(8) == ApplicationConstants.PROBLEM_TESTER) {
                info.setApplicationType("Problem Tester Application:");
            } else {
                info.setApplicationType("Unknown application type:");
            }
        } catch (Exception e) {
            log.debug("Error getting application information for dev_app_id = " + applicationId);
            e.printStackTrace();
            info = null;
        }
        closeConnection(conn, ps);
        return info;
    }

    /**
     * Inserts an application into the database.  Does some checking first to
     * make sure everything is going to be OK.
     *
     * @param message The message left with the application.
     * @param applicationType The type of application.
     * @param userId The user submitting the application.
     */
    public ArrayList saveApplication(String message, int applicationType, int userId) {
        log.debug("In MPSQASServicesBean.saveApplication().");

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ArrayList response;

        try {
            conn = DBMS.getConnection();
            ;

            StringBuffer sqlStr = new StringBuffer(256);

            int applyUserGroup = -1;  //too much information that means the same thing.
            int applyUserType = -1;

            if (applicationType == MessageTypes.WRITER_APPLICATION) {
                applyUserGroup = ApplicationConstants.PROBLEM_WRITER_GROUP;
                applyUserType = ApplicationConstants.PROBLEM_WRITER;
            } else if (applicationType == MessageTypes.TESTER_APPLICATION) {
                applyUserGroup = ApplicationConstants.PROBLEM_TESTER_GROUP;
                applyUserType = ApplicationConstants.PROBLEM_TESTER;
            }

            sqlStr.replace(0, sqlStr.length(), "SELECT user_id FROM group_user WHERE (group_id=? OR group_id=?) AND user_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, ApplicationConstants.ADMIN_GROUP);
            ps.setInt(2, applyUserGroup);
            ps.setInt(3, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) //they are already in this group.
            {
                response = new ArrayList(2);
                response.add(new Boolean(false));
                response.add("You are already a member of this group.  No need to apply.");
                closeConnection(conn, ps);
                return response;
            }

            sqlStr.replace(0, sqlStr.length(), "SELECT dev_app_id FROM development_application WHERE user_id=? AND user_type_id=? AND dev_app_status_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            ps.setInt(2, applyUserType);
            ps.setInt(3, ApplicationConstants.APPLICATION_PENDING);
            rs = ps.executeQuery();

            if (rs.next()) //they applied already
            {
                response = new ArrayList(2);
                response.add(new Boolean(false));
                response.add("You have already applied for this and the application is pending.");
                closeConnection(conn, ps);
                return response;
            }

            sqlStr.replace(0, sqlStr.length(), "INSERT INTO development_application (dev_app_id,user_id,user_type_id,");
            sqlStr.append("dev_app_status_id,message) VALUES (?,?,?,?,?)");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, DBMS.getSeqId(DBMS.JMA_SEQ));
            ps.setInt(2, userId);
            ps.setInt(3, applyUserType);
            ps.setInt(4, ApplicationConstants.APPLICATION_PENDING);
            ps.setBytes(5, DBMS.serializeTextString(message));
            int numUpdates = ps.executeUpdate();

            if (numUpdates != 1) throw new Exception("Wrong number of rows inserted: " + numUpdates);

            //broadcast about it
            try {
                ArrayList broadcast = new ArrayList(3);
                broadcast.add(new Integer(ApplicationConstants.PENDING_APPLICATION_BROADCAST_IN));
                broadcast.add(getPendingApplications());

                sendToAppletServer(broadcast);
            } catch (Exception e1) {
                log.debug("Error broadcast new application:");
                e1.printStackTrace();
            }

            response = new ArrayList(1);
            response.add(new Boolean(true));
        } catch (Exception e) {
            log.debug("Error inserting into development_application: ");
            e.printStackTrace();

            response = new ArrayList(2);
            response.add(new Boolean(false));
            response.add(ApplicationConstants.SERVER_ERROR);
        }

        closeConnection(conn, ps);
        return response;
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
    public ArrayList processApplicationReply(int applicationId, boolean accepted,
                                             String message, int userId) {
        log.debug("In MPSQASServicesBean.replyToApplication()");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ArrayList response = new ArrayList();

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            //make sure this application exists and is pending.
            sqlStr.append("SELECT user_id ");
            sqlStr.append(",user_type_id ");
            sqlStr.append("FROM development_application ");
            sqlStr.append("WHERE dev_app_id = ? ");
            sqlStr.append("AND dev_app_status_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, applicationId);
            ps.setInt(2, ApplicationConstants.APPLICATION_PENDING);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                response.add(new Boolean(false));
                response.add("This application does not exist or is not pending approval.");
                closeConnection(conn, ps);
                return response;
            }

            int appUserId = rs.getInt(1);
            int appUserType = rs.getInt(2);
            int newStatus = accepted ? ApplicationConstants.APPLICATION_ACCEPTED
                    : ApplicationConstants.APPLICATION_REJECTED;

            //update the application table
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("UPDATE development_application ");
            sqlStr.append("SET dev_app_status_id = ? ");
            sqlStr.append("WHERE dev_app_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, newStatus);
            ps.setInt(2, applicationId);
            int rowsUpdated = ps.executeUpdate();

            //add the user to the proper group
            if (accepted) {
                int newGroup = -1;
                if (appUserType == ApplicationConstants.PROBLEM_WRITER) {
                    newGroup = ApplicationConstants.PROBLEM_WRITER_GROUP;
                } else if (appUserType == ApplicationConstants.PROBLEM_TESTER) {
                    newGroup = ApplicationConstants.PROBLEM_TESTER_GROUP;
                }

                //make sure they are not already there
                sqlStr.replace(0, sqlStr.length(), "SELECT user_id FROM group_user WHERE group_id=? and user_id=?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, newGroup);
                ps.setInt(2, appUserId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    response.add(new Boolean(false));
                    response.add("The user is already in the group.");
                    closeConnection(conn, ps);
                    return response;
                }

                sqlStr.replace(0, sqlStr.length(), "INSERT INTO group_user (user_id,group_id) VALUES (?,?)");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, appUserId);
                ps.setInt(2, newGroup);
                rowsUpdated = ps.executeUpdate();
            }

            //email the user
            try {
                sqlStr.replace(0, sqlStr.length(), "SELECT handle, email FROM user WHERE user_id=?");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, appUserId);
                rs = ps.executeQuery();
                rs.next();
                String appHandle = rs.getString(1);
                String emailAddy = rs.getString(2);

                ps.setInt(1, userId);
                rs = ps.executeQuery();
                rs.next();
                String adminHandle = rs.getString(1);

                String accOrRej = accepted?"Accepted":"Rejected";
                String appType = appUserType == ApplicationConstants.PROBLEM_WRITER?"Problem Writer":"Problem Tester";

                TCSEmailMessage email = new TCSEmailMessage();
                StringBuffer emailBody = new StringBuffer(256);

                emailBody.replace(0, emailBody.length(), "Hi " + appHandle + ",\n\n");
                emailBody.append("Your " + appType + " Application was " + accOrRej + " by admin " + adminHandle + ".\n");

                if (message.trim().length() > 0) {
                    emailBody.append("\n");
                    emailBody.append(adminHandle);
                    emailBody.append(" says:\n");
                    emailBody.append(ApplicationConstants.HORIZONTAL_RULE);
                    emailBody.append(message);
                    emailBody.append("\n");
                    emailBody.append(ApplicationConstants.HORIZONTAL_RULE);
                }

                if (accepted) {
                    emailBody.append("\nNavigate to www.topcoder.com/contest/mpsqas/developercontract.html to get the required contract. ");
                    emailBody.append("Log into MPSQAS at any time to begin proposing problems.\n");
                }

                emailBody.append("\n-mpsqas\n");
                emailBody.append("\nThis is an automated email generated by MPSQAS.");

                email.setSubject(appType + " Application " + accOrRej);
                email.setBody(emailBody.toString());
                email.setFromAddress(ApplicationConstants.FROM_EMAIL_ADDRESS);
                email.addToAddress(emailAddy, TCSEmailMessage.TO);
                EmailEngine.send(email);
            } catch (Exception e) {
                log.debug("Error sending email in response to application reply, id: " + applicationId);
                e.printStackTrace();
            }

            //broadcast about it
            try {
                ArrayList broadcast = new ArrayList(3);
                broadcast.add(new Integer(ApplicationConstants.PENDING_APPLICATION_BROADCAST_IN));
                broadcast.add(getPendingApplications());

                sendToAppletServer(broadcast);
            } catch (Exception e1) {
                log.debug("Error broadcast new application");
                e1.printStackTrace();
            }

            response = new ArrayList(1);
            response.add(new Boolean(true));
        } catch (Exception e) {
            log.debug("Error processing application reply, id: " + applicationId);
            e.printStackTrace();

            response = new ArrayList(2);
            response.add(new Boolean(false));
            response.add(ApplicationConstants.SERVER_ERROR);
        }

        closeConnection(conn, ps);
        return response;
    }

    /******************************************************************************
     * Chat Services                                                              *
     ******************************************************************************/

    /**
     * Inserts chat messages in ArrayList into mpsqas_chat_history table
     * in the database.
     *
     * @param chat An ArrayList of ArrayList with inner ArrayLists of form
     *             roundId | problemId | coderId | time | message
     */
    public void logChat(ArrayList chat) {
        log.debug("Logging MPSQAS chat.");

        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);
            ResultSet rs;

            sqlStr.replace(0, sqlStr.length(), "INSERT INTO mpsqas_chat_history");
            sqlStr.append(" (round_id, problem_id, coder_id, timestamp, message) ");
            sqlStr.append(" VALUES (?, ?, ?, ?, ?)");
            ps = conn.prepareStatement(sqlStr.toString());

            for (int i = 0; i < chat.size(); i++) {
                if (((Integer) ((ArrayList) chat.get(i)).get(0)).intValue() != -1) {
                    ps.setInt(1, ((Integer) ((ArrayList) chat.get(i)).get(0)).intValue());
                    ps.setNull(2, java.sql.Types.DECIMAL);
                } else {
                    ps.setNull(1, java.sql.Types.DECIMAL);
                    ps.setInt(2, ((Integer) ((ArrayList) chat.get(i)).get(1)).intValue());
                }
                ps.setInt(3, ((Integer) ((ArrayList) chat.get(i)).get(2)).intValue());
                ps.setTimestamp(4, ((Timestamp) ((ArrayList) chat.get(i)).get(3)));
                ps.setBytes(5, DBMS.serializeTextString(
                        ((String) ((ArrayList) chat.get(i)).get(4))));
                ps.executeUpdate();
            }
        } catch (Exception e) {
            log.debug("Error logging chat:");
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
    public String getChatHistory(int id, boolean isRound) {
        log.debug("Getting chat history");

        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        StringBuffer outputString = new StringBuffer(256);

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            if (isRound) {
                sqlStr.replace(0, sqlStr.length(), "SELECT ch.timestamp, u.handle, ch.message ");
                sqlStr.append(" FROM mpsqas_chat_history ch, user u ");
                sqlStr.append(" WHERE ch.coder_id = u.user_id AND ch.round_id = ?");
                sqlStr.append(" ORDER BY ch.timestamp");

                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                outputString.append("Chat history for round:\n\n");

                while (rs.next()) {
                    outputString.append(rs.getTimestamp(1).toString());
                    outputString.append(": ");
                    outputString.append(rs.getString(2));
                    outputString.append("> ");
                    outputString.append(DBMS.getTextString(rs, 3));
                    outputString.append("\n");
                }

                sqlStr.replace(0, sqlStr.length(), "SELECT p.problem_id, p.class_name ");
                sqlStr.append(" FROM round_problem rp, problem p  ");
                sqlStr.append(" WHERE rp.round_id=? AND rp.problem_id = p.problem_id");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, id);
                rs = ps.executeQuery();

                while (rs.next()) {
                    outputString.append("\nChat history for ");
                    outputString.append(rs.getString(2));
                    outputString.append(":\n");
                    outputString.append(getChatHistory(rs.getInt(1), false));
                }
            } else {
                sqlStr.replace(0, sqlStr.length(), "SELECT ch.timestamp, u.handle, ch.message ");
                sqlStr.append(" FROM mpsqas_chat_history ch, user u ");
                sqlStr.append(" WHERE ch.coder_id = u.user_id AND ch.problem_id = ?");
                sqlStr.append(" ORDER BY ch.timestamp");

                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    outputString.append(rs.getTimestamp(1).toString());
                    outputString.append(": ");
                    outputString.append(rs.getString(2));
                    outputString.append("> ");
                    outputString.append(DBMS.getTextString(rs, 3));
                    outputString.append("\n");
                }
            }
        } catch (Exception e) {
            log.debug("Error getting contest history:");
            e.printStackTrace();
            outputString.append(ApplicationConstants.SERVER_ERROR);
        }
        closeConnection(conn, ps);

        return outputString.toString();
    }

    /******************************************************************************
     * User Services                                                              *
     ******************************************************************************/

    /**
     * Returns a list of UserInformations for users specified by forType and id.
     *
     * forType = ALL_TESTERS
     *  Returns a list of all testers, id ignored
     * forType = TESTERS_FOR_PROBLEM
     *  Returns a list of testers for a problem id = problem_id
     * forType = ALL_USERS
     *  Returns a list of all registered testers and writers, id ignored.
     *  Payment info also filled out.
     *
     * @param forType Constants describing which type of users to get.
     * @param id If required, specify an id to specify which users to get
     */
    public ArrayList getUsers(int forType, int id) {
        log.debug("Getting users.");

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ArrayList users = new ArrayList();

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);
            ResultSet rs, rs2;

            //first get all the writers and testers
            sqlStr.append("SELECT DISTINCT u.user_id ");
            sqlStr.append(",u.handle ");
            sqlStr.append(",c.first_name ");
            sqlStr.append(",c.last_name ");
            sqlStr.append("FROM user u ");
            sqlStr.append(",coder c ");
            if (forType == ApplicationConstants.TESTERS_FOR_PROBLEM
                    || forType == ApplicationConstants.ALL_USERS) {
                sqlStr.append(",problem_user pu ");
            }
            if (forType == ApplicationConstants.ALL_TESTERS
                    || forType == ApplicationConstants.ALL_USERS) {
                sqlStr.append(",group_user gu ");
            }
            sqlStr.append("WHERE c.coder_id = u.user_id ");
            if (forType == ApplicationConstants.ALL_USERS) {
                sqlStr.append("AND (gu.group_id = ? OR gu.group_id = ?) ");
                sqlStr.append("AND gu.user_id = u.user_id ");
                sqlStr.append("AND pu.user_id = u.user_id ");
            } else if (forType == ApplicationConstants.TESTERS_FOR_PROBLEM) {
                sqlStr.append("AND pu.user_type_id = ? ");
                sqlStr.append("AND pu.problem_id = ? ");
                sqlStr.append("AND pu.user_id = u.user_id ");
            } else if (forType == ApplicationConstants.ALL_TESTERS) {
                sqlStr.append("AND gu.user_id = u.user_id ");
                sqlStr.append("AND gu.group_id = ? ");
            }
            if (forType == ApplicationConstants.ALL_USERS) {
                sqlStr.append("GROUP BY u.user_id ");
                sqlStr.append(",u.handle ");
                sqlStr.append(",c.first_name ");
                sqlStr.append(",c.last_name ");
            }

            ps = conn.prepareStatement(sqlStr.toString());
            int index = 0;
            if (forType == ApplicationConstants.ALL_USERS) {
                ps.setInt(++index, ApplicationConstants.PROBLEM_WRITER_GROUP);
                ps.setInt(++index, ApplicationConstants.PROBLEM_TESTER_GROUP);
            } else if (forType == ApplicationConstants.ALL_TESTERS) {
                ps.setInt(++index, ApplicationConstants.PROBLEM_TESTER_GROUP);
            } else if (forType == ApplicationConstants.TESTERS_FOR_PROBLEM) {
                ps.setInt(++index, ApplicationConstants.PROBLEM_TESTER);
                ps.setInt(++index, id);
            }

            rs = ps.executeQuery();

            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT sum(paid) ");
            sqlStr.append(",sum(pending_payment)  ");
            sqlStr.append("FROM problem_user ");
            sqlStr.append("WHERE user_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());

            //get payment information about each user and fill in a UserInformation
            //for them
            UserInformation userInfo;
            while (rs.next()) {
                userInfo = new UserInformation(rs.getString(2), rs.getInt(1));
                index = 2;
                userInfo.setFirstName(rs.getString(++index));
                userInfo.setLastName(rs.getString(++index));

                if (forType == ApplicationConstants.ALL_USERS) {
                    ps.setInt(1, userInfo.getUserId());
                    rs2 = ps.executeQuery();
                    rs2.next();
                    userInfo.setPaid(rs2.getDouble(1));
                    userInfo.setPendingPayment(rs2.getDouble(2));
                }
                users.add(userInfo);
            }
        } catch (Exception e) {
            log.debug("Error getting user information: ");
            e.printStackTrace();
            users = null;
        }

        closeConnection(conn, ps);

        return users;
    }

    /**
     * Returns a UserInformation with information about the specified user.
     *
     * @param userId The user id of the user to get information for.
     */
    public UserInformation getUserInformation(int userId) {
        log.debug("Getting user info for userId " + userId);
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        UserInformation userInfo = null;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            //get general information
            sqlStr.append("SELECT u.handle ");
            sqlStr.append(",c.first_name ");
            sqlStr.append(",c.last_name ");
            sqlStr.append(",u.email ");
            sqlStr.append("FROM user u ");
            sqlStr.append(",coder c ");
            sqlStr.append("WHERE u.user_id = c.coder_id ");
            sqlStr.append("AND u.user_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            rs.next();

            userInfo = new UserInformation(rs.getString(1), userId);
            userInfo.setFirstName(rs.getString(2));
            userInfo.setLastName(rs.getString(3));
            userInfo.setEmail(rs.getString(4));

            //get user type
            sqlStr.replace(0, sqlStr.length(), "SELECT user_id FROM group_user WHERE group_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, ApplicationConstants.PROBLEM_WRITER_GROUP);
            rs = ps.executeQuery();
            userInfo.setWriter(rs.next());

            ps.setInt(1, ApplicationConstants.PROBLEM_TESTER_GROUP);
            rs = ps.executeQuery();
            userInfo.setTester(rs.next());

            //get payment information
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT sum(paid) ");
            sqlStr.append(",sum(pending_payment) ");
            sqlStr.append("FROM problem_user ");
            sqlStr.append("WHERE user_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            rs.next();
            userInfo.setPaid(rs.getDouble(1));
            userInfo.setPendingPayment(rs.getDouble(2));

            userInfo.setWritingProblems(
                    getProblems(ApplicationConstants.USER_WRITTEN_PROBLEMS, userId));
            userInfo.setTestingProblems(
                    getProblems(ApplicationConstants.USER_TESTING_PROBLEMS, userId));
        } catch (Exception e) {
            log.debug("Error getting user information for userid " + userId);
            e.printStackTrace();
            userInfo = null;
        } finally {
            closeConnection(conn, ps);
        }

        return userInfo;
    }

    /**
     * Update paid to be paid + pending_payment for all users in list to record
     * payment in DB.
     *
     * @param users ArrayList of user ids being paid.
     */
    public boolean recordPayment(ArrayList userIds) {
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        boolean ok = true;
        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            sqlStr.append("UPDATE problem_user ");
            sqlStr.append("SET paid = paid + pending_payment ");
            sqlStr.append(",pending_payment = 0 ");
            sqlStr.append("WHERE user_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());

            for (int i = 0; i < userIds.size(); i++) {
                ps.setInt(1, ((Integer) userIds.get(i)).intValue());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            log.debug("Error updating payment.");
            e.printStackTrace();
            ok = false;
        }

        closeConnection(conn, ps);
        return ok;
    }

    /******************************************************************************
     * Private utility methods                                                    *
     ******************************************************************************/

    /**
     * Backs up a solution by adding it to solution_history.
     *
     * @param solutionId Id of solution to back up.
     */
    private void backUpSolution(int solutionId, int userId) {
        log.debug("Backing up solution " + solutionId);

        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            sqlStr.append("INSERT INTO solution_history ");
            sqlStr.append("(solution_id ");
            sqlStr.append(",solution ");
            sqlStr.append(",modify_date ");
            sqlStr.append(",user_id) ");
            sqlStr.append("SELECT solution_id ");
            sqlStr.append(",solution_text ");
            sqlStr.append(",current ");
            sqlStr.append("," + userId + " ");
            sqlStr.append("FROM solution ");
            sqlStr.append("WHERE solution_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, solutionId);
            ps.executeUpdate();
        } catch (Exception e) {
            log.debug("Error backing up solution:");
            e.printStackTrace();
        }
        closeConnection(conn, ps);
    }

    /**
     * Backs up a problem statement by adding it to problem_statement_history.
     *
     * @param problemId id of problem statement to back up.
     */
    private void backUpProblemStatement(int problemId, int userId) {
        log.debug("Backing up problem statement " + problemId);

        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            sqlStr.append("INSERT INTO problem_statement_history ");
            sqlStr.append("(problem_id ");
            sqlStr.append(",problem_statement ");
            sqlStr.append(",modify_date ");
            sqlStr.append(",user_id) ");
            sqlStr.append("SELECT problem_id ");
            sqlStr.append(",problem_text ");
            sqlStr.append(",current ");
            sqlStr.append("," + userId + " ");
            sqlStr.append("FROM problem ");
            sqlStr.append("WHERE problem_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ps.executeUpdate();
        } catch (Exception e) {
            log.debug("Error backing up problem:");
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
    private int getUserType(int problemId, int userId) throws Exception {
        java.sql.Connection conn = DBMS.getConnection();
        int userType = -1;
        StringBuffer sqlStr = new StringBuffer(256);

        sqlStr.append("SELECT user_id FROM group_user WHERE group_id=? AND user_id=?");
        PreparedStatement ps = conn.prepareStatement(sqlStr.toString());
        ps.setInt(1, ApplicationConstants.ADMIN_GROUP);
        ps.setInt(2, userId);
        ResultSet rs = ps.executeQuery();

        if (rs.next())  //user is admin
        {
            userType = ApplicationConstants.PROBLEM_ADMIN;
        } else {
            sqlStr.replace(0, sqlStr.length(), "SELECT user_type_id FROM problem_user WHERE problem_id=? AND user_id=?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ps.setInt(2, userId);
            rs = ps.executeQuery();

            //make sure there is a row
            if (!rs.next()) throw new Exception(userId + " trying to request a problem for which he is no user!");

            userType = rs.getInt(1);
        }
        closeConnection(conn, ps);
        return userType;
    }

    /**
     * Returns true iff the user is an admin.
     *
     * @param userId The id of the user to check.
     */
    private boolean isAdmin(int userId) {
        boolean isAdmin = false;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sqlStr;

        try {
            conn = DBMS.getConnection();
            sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT u.handle ");
            sqlStr.append("FROM user u ");
            sqlStr.append(",group_user gu ");
            sqlStr.append("WHERE u.user_id = gu.user_id ");
            sqlStr.append("AND gu.group_id = ? ");
            sqlStr.append("AND gu.user_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, ApplicationConstants.ADMIN_GROUP);
            ps.setInt(2, userId);
            rs = ps.executeQuery();
            isAdmin = rs.next();
        } catch (Exception e) {
            log.debug("Error checking admin status: ");
            e.printStackTrace();
        } finally {
            closeConnection(conn, ps);
        }
        return isAdmin;
    }

    /**
     * Checks if the general problem information for a problem is valid.
     * Returns an error message if it is not, or the empty string if it is.
     *
     * @param info The ProblemInformation of the problem to check.
     * @param problemId The problems problem id, if it has one, or -1 if not.
     */
    private String checkGeneralProblemInfo(ProblemInformation info, int problemId) {
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs;
        StringBuffer errorMessage = new StringBuffer();

        try {
            conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);
            int i;

            //Make sure all required fields filled
            if (info.getMethodName().trim().length() == 0 ||
                    info.getClassName().trim().length() == 0 ||
                    info.getProblemStatement().trim().length() == 0) {
                errorMessage.append("Please fill out all fields.  ");
            }

            //Do some checking to make sure the input data seems ok
            boolean charactersOk = true;
            for (i = 0; i < info.getMethodName().length(); i++) {
                if (!Character.isLetterOrDigit(info.getMethodName().charAt(i))) {
                    charactersOk = false;
                }
            }

            for (i = 0; i < info.getClassName().length(); i++) {
                if (!Character.isLetterOrDigit(info.getClassName().charAt(i))) {
                    charactersOk = false;
                }
            }

            if (errorMessage.length() == 0 &&
                    (Character.isDigit(info.getMethodName().charAt(0)) ||
                    Character.isDigit(info.getClassName().charAt(0)))) {
                charactersOk = false;
            }

            if (!charactersOk) {
                errorMessage.append("Class or Method name contains incorrect characters.  ");
            }

            //Make sure we have no other problems with that class name.
            sqlStr.replace(0, sqlStr.length(),
                    "SELECT 1 ");
            sqlStr.append("FROM problem ");
            sqlStr.append("WHERE class_name = ? ");
            sqlStr.append("AND problem_id != ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setString(1, info.getClassName());
            ps.setInt(2, problemId);
            rs = ps.executeQuery();
            if (rs.next()) {
                errorMessage.append("A problem with this class name already exists.  Please rename the class.  ");
            }

            //Make sure the param types are valid
            sqlStr.replace(0, sqlStr.length(), "SELECT data_type_id FROM data_type WHERE data_type_desc = ?");
            ps = conn.prepareStatement(sqlStr.toString());

            for (i = 0; i < info.getParamTypes().size(); i++) {
                ps.setString(1, info.getParamTypes().get(i).toString());
                rs = ps.executeQuery();
                if (!rs.next()) {
                    errorMessage.append("Unrecognized parameter type.  ");
                }
            }

            //make sure the return type is valid.
            ps.setString(1, info.getReturnType());
            rs = ps.executeQuery();
            if (!rs.next()) {
                errorMessage.append("Unrecognized return type.  ");
            }
        } catch (Exception e) {
            log.debug("Error checking problem statement.");
            e.printStackTrace();
            errorMessage.append(ApplicationConstants.SERVER_ERROR);
        } finally {
            closeConnection(conn, ps);
        }

        return errorMessage.toString();
    }

    /**
     * Checks and updates the pending_payment amount for the problem writer
     * and problem testers of a specified problem. The division and difficulty
     * used to pay is the division and difficulty with the highest payout among
     * the proposed values and used values.
     * NOTE: Assumes lower division_id -> harder problem
     *           and higher difficulty_id -> harder problem
     *
     * @param problemId The problem id of the problem to test.
     */
    private void reconcilePayment(int problemId) {
        log.debug("Reconciling payment for problemId = " + problemId);
        java.sql.Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBMS.getConnection();

            //first, find the problem's maximum difficulty and division
            int difficulty, division;
            StringBuffer sqlStr = new StringBuffer(256);
            sqlStr.append("SELECT proposed_difficulty_id ");
            sqlStr.append(",proposed_division_id ");
            sqlStr.append(",status ");
            sqlStr.append("FROM problem ");
            sqlStr.append("WHERE problem_id = ?");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            difficulty = rs.getInt(1);
            division = rs.getInt(2);
            int status = rs.getInt(3);

            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT difficulty_id ");
            sqlStr.append(",division_id ");
            sqlStr.append("FROM round_problem ");
            sqlStr.append("WHERE problem_id = ? ");
            sqlStr.append("AND round_id >= ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            ps.setInt(2, ApplicationConstants.REAL_CONTEST_ID_LOWER_BOUND);
            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getInt(2) < division
                        || (rs.getInt(2) == division
                        && rs.getInt(1) > difficulty)) {
                    division = rs.getInt(2);
                    difficulty = rs.getInt(1);
                }
            }

            //next get the payment amount for the writer and testers
            int divisionIndex = -1;
            int difficultyIndex = -1;
            while (MessageTypes.DIFFICULTY_IDS[++difficultyIndex] != difficulty) ;
            while (MessageTypes.DIVISION_IDS[++divisionIndex] != division) ;

            int writerPayment = ApplicationConstants.WRITING_PAYMENT[divisionIndex]
                    [difficultyIndex];
            int testerPayment = ApplicationConstants.TESTING_PAYMENT[divisionIndex]
                    [difficultyIndex];

            //finally check writer and testers have this amount over paid and
            //payment_pending and, if not, update so they do.
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT user_id ");
            sqlStr.append(",user_type_id ");
            sqlStr.append(",paid ");
            sqlStr.append(",pending_payment ");
            sqlStr.append("FROM problem_user ");
            sqlStr.append("WHERE problem_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            rs = ps.executeQuery();

            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("UPDATE problem_user ");
            sqlStr.append("SET pending_payment = ? ");
            sqlStr.append("WHERE user_id = ? ");
            sqlStr.append("AND problem_id = ? ");
            sqlStr.append("AND user_type_id = ? ");
            ps = conn.prepareStatement(sqlStr.toString());

            int thisUserShouldGet;
            while (rs.next()) {
                thisUserShouldGet = 0;
                if (rs.getInt(2) == ApplicationConstants.PROBLEM_WRITER
                        && status >= MessageTypes.SUBMISSION_APPROVED) {
                    thisUserShouldGet = writerPayment;
                } else if (rs.getInt(2) == ApplicationConstants.PROBLEM_TESTER
                        && status >= MessageTypes.READY) {
                    thisUserShouldGet = testerPayment;
                }

                if (rs.getDouble(3) + rs.getDouble(4) != thisUserShouldGet) {
                    ps.setDouble(1, Math.max(thisUserShouldGet - rs.getDouble(3), 0));
                    //pending = should_get - already_got
                    ps.setInt(2, rs.getInt(1));
                    ps.setInt(3, problemId);
                    ps.setInt(4, rs.getInt(2));
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            log.debug("Error updating payment for problem_id = " + problemId);
            e.printStackTrace();
        } finally {
            closeConnection(conn, ps);
        }
    }

    /**
     * Looks up the solution id for a user's solution to a problem.
     * If the user does not have a solution, one is inserted.
     */
    private int getSolutionId(int problemId, int userId) {
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        int solutionId = -1;

        try {
            conn = DBMS.getConnection();
            int userType = getUserType(problemId, userId);
            StringBuffer sqlStr = new StringBuffer(256);

            //see if this coder already has a solution
            sqlStr.replace(0, sqlStr.length(), "");
            sqlStr.append("SELECT ps.solution_id ");
            sqlStr.append("FROM problem_solution ps ");
            sqlStr.append(",solution s ");
            sqlStr.append("WHERE ps.problem_id = ? ");
            sqlStr.append("AND ps.solution_id = s.solution_id ");
            if (userType == ApplicationConstants.PROBLEM_ADMIN) {
                sqlStr.append("AND ps.primary_solution = ? ");
            } else {
                sqlStr.append("AND s.coder_id = ? ");
            }
            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, problemId);
            if (userType == ApplicationConstants.PROBLEM_ADMIN) {
                ps.setString(2, "Y");
            } else {
                ps.setInt(2, userId);
            }
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                solutionId = rs.getInt(1);
            } else //insert it
            {
                solutionId = DBMS.getSeqId(DBMS.JMA_SEQ);
                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("INSERT INTO solution ");
                sqlStr.append("(solution_id ");
                sqlStr.append(",coder_id ");
                sqlStr.append(",solution_text ");
                sqlStr.append(",modify_date) ");
                sqlStr.append("VALUES (?, ?, ?, current)");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, solutionId);
                ps.setInt(2, userId);
                ps.setBytes(3, DBMS.serializeTextString(""));
                ps.executeUpdate();

                sqlStr.replace(0, sqlStr.length(), "");
                sqlStr.append("INSERT INTO problem_solution ");
                sqlStr.append("(problem_id, ");
                sqlStr.append("solution_id ");
                sqlStr.append(",primary_solution) ");
                sqlStr.append("VALUES (?, ?, ?)");
                ps = conn.prepareStatement(sqlStr.toString());
                ps.setInt(1, problemId);
                ps.setInt(2, solutionId);
                ps.setString(3,
                        (userType != ApplicationConstants.PROBLEM_TESTER) ? ("Y") : ("N"));
                ps.executeUpdate();
            }
        } catch (Exception e) {
            log.debug("Error getting solution id:");
            e.printStackTrace();
        } finally {
            closeConnection(conn, ps);
        }

        return solutionId;
    }

    /**
     * Broadcasts a problem update to the applet server.
     *
     * @param problemId The problem updated.
     * @param userId The userId of the coder updating it.
     * @param connectionId The connectionId of the coder updating it.
     *                     (so they don't get the update message)
     */
    private void broadcastProblemUpdate(int problemId, int userId, int connectionId) {
        //broadcast the problem change to VIEW_PROBLEM_ROOM
        try {
            java.sql.Connection conn = DBMS.getConnection();
            StringBuffer sqlStr = new StringBuffer(256);

            ArrayList broadcast2 = new ArrayList();
            broadcast2.add(new Integer(ApplicationConstants.PROBLEM_MODIFIED_BROADCAST_IN));

            sqlStr.append("SELECT handle FROM user WHERE user_id = ?");
            PreparedStatement ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String handle = rs.getString(1);
            broadcast2.add(handle + " has modified this problem.  Please reload the "
                    + "problem to see the changes and before submitting any "
                    + "other changes.");
            broadcast2.add(new Integer(problemId));
            broadcast2.add(new Integer(connectionId));
            //don't send this message to the user who made the submission
            sendToAppletServer(broadcast2);
        } catch (Exception e1) {
            log.debug("Error broadcasting problem update for problem " + problemId);
            e1.printStackTrace();
        }
    }

    /**
     * Closes a prepared statement and a connection, if
     * they are not null.
     */
    private void closeConnection(java.sql.Connection conn, PreparedStatement ps) {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            log.debug("Error closing connection: ");
            e.printStackTrace();
        }
    }

    /**
     * Sends a message to the MainAppletProcessor on the applet server.
     *
     * @param data Message to send.
     */
    private void sendToAppletServer(ArrayList data) {
        try {
            Socket s = new Socket(ApplicationConstants.APPLET_SERVER_IP,
                    ApplicationConstants.INTERNAL_COMMUNICATION_PORT);
            ObjectOutputStream outputStream = new ObjectOutputStream(
                    new BufferedOutputStream(s.getOutputStream()));
            outputStream.flush();
            outputStream.writeObject(new ZippedObject(data));
            outputStream.flush();
        } catch (Exception e) {
            log.debug("Error sending message to applet server. data: " + data);
            e.printStackTrace();
        }
    }


    /******************************************************************************
     * Required Bean Methods                                                      *
     ******************************************************************************/

    public void ejbCreate() {
        log.debug("MPSQASServicesBean: ejbCreate called.");
    }

    private synchronized void cleanUp() {
        log.debug("Cleaning up MPSQASServicesBean");
    }

    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    SessionContext ctx;
}
