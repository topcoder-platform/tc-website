package com.topcoder.ejb.ContestAdminServices;

import com.topcoder.common.web.data.*;
import com.topcoder.common.web.data.Group;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.ByteArrayOutputStream;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.ArrayList;


public class ContestAdminServicesBean extends com.topcoder.shared.ejb.BaseEJB {
    private Context InitContext;
    private SessionContext ctx;
    private static Logger log = Logger.getLogger(ContestAdminServicesBean.class);


    static final int NUM_PROBLEMS = 3;


    private static final int NOT_OPENED = 110;        // Default
    private static final int LOOKED_AT = 120;                //Opened. Not yet compiled
    private static final int UNSUBMITTED = 121;      // Compiled, but not yet submitted
    private static final int PASSED = 2;                             // Moving on without submitting
    private static final int NOT_CHALLENGED = 130;    // Submitted
    private static final int CHALLENGE_FAILED = 131;
    private static final int CHALLENGE_SUCCEEDED = 140;
    private static final int SYSTEM_TEST_FAILED = 160;
    private static final int SYSTEM_TEST_SUCCEEDED = 150;
    private static final int STATUS_NORMAL = 90;
    private static final int STATUS_OVERTURNED = 91;
    private static final int STATUS_NULLIFIED = 92;


    /*****************************************************************************************
     * Saves a contest.
     *
     * @param ca - ContestAdmin
     * @exception RemoteException
     * @return int contest_id
     ******************************************************************************************
     **/
    public int saveContest(ContestAdmin ca) throws RemoteException {
        log.debug("Contest: saveContest() called ... ");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int retVal = 0;
        int contest_id = 0;

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            StringBuffer query = new StringBuffer(120);
            if (ca.getModified() == "M") {
                query.append(" UPDATE contest SET name = ?, start_date = ?, ").
                        append("                     end_date = ?, status = ?, language_id = ?, ").
                        append("                     ad_start = ?, ad_end = ? ").
                        append("  WHERE  contest_id = ? ");

                contest_id = ca.getContestId();
            } else {
                query.append(" INSERT INTO contest (name, start_date, end_date, status, ").
                        append(" language_id, ad_start, ad_end, contest_id) ").
                        append(" VALUES (?,?,?,?,?,?,?,?) ");

                //contest_id = getNextContestId();
                contest_id = DBMS.getSeqId(conn, DBMS.JMA_SEQ);
            }

            ps = conn.prepareStatement(query.toString());
            ps.setString(1, ca.getContestName());
            ps.setTimestamp(2, ca.getContestStartTimestamp());
            ps.setTimestamp(3, ca.getContestEndTimestamp());
            ps.setString(4, ca.getStatus());
            ps.setInt(5, ca.getLanguage().getLanguageId());
            ps.setTimestamp(6, ca.getAdStartTimestamp());
            ps.setTimestamp(7, ca.getAdEndTimestamp());
            ps.setInt(8, contest_id);

            retVal = ps.executeUpdate();
            if (retVal != 1)
                throw new SQLException("ContestBean saveContest retval = " + retVal);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("Contest: saveContest: Error:\n" + e);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception Ignore) {
                System.out.println("Contest: saveContest: ps close error in finally");
                Ignore.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception Ignore) {
                System.out.println("Contest: saveContest: conn close error in finally");
                Ignore.printStackTrace();
            }
        }

        return contest_id;
    }

    /**
     *****************************************************************************************
     *  method: getContestList
     *  input:  none
     *  output: ArrayList of Contest Objects
     *  Author: Jason N. Evans
     *  Created: December 20, 2000
     *  Last Modified: June 22, 2001
     *  Modified By: Steven Burrows, Anthony DeMichele
     *  Reason: To make Steve feel violated
     *
     *  Description:  This method will return an arraylist of all active contest whith all
     *                header information contained in the contest table.
     *****************************************************************************************
     **/
    public ArrayList getContestList() throws RemoteException {
        log.debug("Contest: getContestList() called ... ");

        ArrayList results = new ArrayList();
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ContestAdmin contest = null;
        Language language = null;
        Group group = null;

        StringBuffer queryContestInfo = new StringBuffer();
        queryContestInfo.append(" SELECT c.contest_id, c.name, c.start_date, ").
                append(" c.end_date, c.status, l.language_id, l.language_name, ").
                append(" g.group_id, g.group_desc, c.ad_text, c.ad_start, c.ad_end, ").
                append(" EXTEND(start_date, SECOND TO SECOND)::varchar(2)::int as startsecond, ").
                append(" EXTEND(start_date, MINUTE TO MINUTE)::varchar(2)::int as startminute, ").
                append(" EXTEND(start_date, HOUR TO HOUR)::varchar(2)::int as starthour, ").
                append(" DAY(start_date)::varchar(2)::int as startday, ").
                append(" MONTH(start_date)::varchar(2)::int as startmonth, ").
                append(" YEAR(start_date)::varchar(4)::int as startyear, ").
                append(" EXTEND(end_date, SECOND TO SECOND)::varchar(2)::int as endsecond, ").
                append(" EXTEND(end_date, MINUTE TO MINUTE)::varchar(2)::int as endminute, ").
                append(" EXTEND(end_date, HOUR TO HOUR)::varchar(2)::int as endhour, ").
                append(" DAY(end_date)::varchar(2)::int as endday, ").
                append(" MONTH(end_date)::varchar(2)::int as endmonth, ").
                append(" YEAR(end_date)::varchar(4)::int as endyear, ").
                append(" EXTEND(ad_start, SECOND TO SECOND)::varchar(2)::int as adstartsecond, ").
                append(" EXTEND(ad_start, MINUTE TO MINUTE)::varchar(2)::int as adstartminute, ").
                append(" EXTEND(ad_start, HOUR TO HOUR)::varchar(2)::int as adstarthour, ").
                append(" DAY(ad_start)::varchar(2)::int as adstartday, ").
                append(" MONTH(ad_start)::varchar(2)::int as adstartmonth, ").
                append(" YEAR(ad_start)::varchar(4)::int as adstartyear, ").
                append(" EXTEND(ad_end, SECOND TO SECOND)::varchar(2)::int as adendsecond, ").
                append(" EXTEND(ad_end, MINUTE TO MINUTE)::varchar(2)::int as adendminute, ").
                append(" EXTEND(ad_end, HOUR TO HOUR)::varchar(2)::int as adendhour, ").
                append(" DAY(ad_end)::varchar(2)::int as adendday, ").
                append(" MONTH(ad_end)::varchar(2)::int as adendmonth, ").
                append(" YEAR(ad_end)::varchar(4)::int as adendyear ").
                append(" FROM group g, language l, contest c ").
                append(" WHERE g.group_id = c.group_id AND ").
                append("  l.language_id = c.language_id AND ").
                append("  (c.status = 'A' OR c.status = 'P') ").
                append(" ORDER BY c.contest_id ");
        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            ps = conn.prepareStatement(queryContestInfo.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                contest = new ContestAdmin();
                language = new Language();
                group = new Group();
                contest.setContestId(rs.getInt(1));
                contest.setContestName(rs.getString(2));
                contest.setContestStartTimestamp(rs.getTimestamp(3));
                contest.setContestEndTimestamp(rs.getTimestamp(4));
                contest.setStatus(rs.getString(5));
                language.setLanguageId(rs.getInt(6));
                language.setName(rs.getString(7));
                contest.setLanguage(language);
                group.setGroupId(rs.getInt(8));
                group.setGroupDesc(rs.getString(9));
                contest.setGroup(group);
                contest.setAdText(rs.getString(10));
                contest.setAdStartTimestamp(rs.getTimestamp(11));
                contest.setAdEndTimestamp(rs.getTimestamp(12));
                contest.setStartSecond(rs.getInt(13));
                contest.setStartMinute(rs.getInt(14));
                contest.setStartHour(rs.getInt(15));
                contest.setStartDay(rs.getInt(16));
                contest.setStartMonthNum(rs.getInt(17));
                contest.setStartYear(rs.getInt(18));
                contest.setEndSecond(rs.getInt(19));
                contest.setEndMinute(rs.getInt(20));
                contest.setEndHour(rs.getInt(21));
                contest.setEndDay(rs.getInt(22));
                contest.setEndMonthNum(rs.getInt(23));
                contest.setEndYear(rs.getInt(24));
                contest.setAdStartSecond(rs.getInt(25));
                contest.setAdStartMinute(rs.getInt(26));
                contest.setAdStartHour(rs.getInt(27));
                contest.setAdStartDay(rs.getInt(28));
                contest.setAdStartMonthNum(rs.getInt(29));
                contest.setAdStartYear(rs.getInt(30));
                contest.setAdEndSecond(rs.getInt(31));
                contest.setAdEndMinute(rs.getInt(32));
                contest.setAdEndHour(rs.getInt(33));
                contest.setAdEndDay(rs.getInt(34));
                contest.setAdEndMonthNum(rs.getInt(35));
                contest.setAdEndYear(rs.getInt(36));
                results.add(contest);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("Contest: getContestList: queryContestInfo: Error:\n" + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception Ignore) {
                System.out.println("Contest: getContestList: rs close error in finally");
            }
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception Ignore) {
                System.out.println("Contest: getContestList: ps close error in finally");
            }
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception Ignore) {
                System.out.println("Contest: getContestList: conn close error in finally");
            }
        }
        return results;
    }


    // This function takes a number of seconds and returns (in an arraylist) the number
    // of hours, minutes and seconds.
    private ArrayList convertSeconds(int seconds) {
        ArrayList retVal = new ArrayList(3);
        int hours = seconds / 3600;
        if (hours < 0) hours = 0;
        int hoursSeconds = hours * 3600;
        int minutes = (seconds - hoursSeconds) / 60;
        if (minutes < 0) minutes = 0;
        int minutesSeconds = minutes * 60;
        int secs = seconds - hoursSeconds - minutesSeconds;
        if (secs < 0) secs = 0;
        retVal.add((new Integer(hours)).toString());
        retVal.add((new Integer(minutes)).toString());
        retVal.add((new Integer(secs)).toString());
        return retVal;
    }

    /*****************************************************************************************
     * This method is used for updating BLOB objects in the database because it can't be done through
     * SQL. An SQL update is used to update an existing row that matches the whereClause. Tables that
     * might be using this method include SYSTEM_TEST_CASES (args) and PROBLEMS (param_types)
     *
     * @param tableName - String - name of a table in the database
     * @param fieldName - String - name of a field within the table
     * @param obj - Object - the object to be inserted as a blob into the field in the table
     * @param whereClause - String - what the where clause should be of the insert statement for
     *                               inserting the blob
     * @exception RemoteException
     ******************************************************************************************
     **/
    public void insertBlobObject(String tableName, String fieldName, Object obj, String whereClause)
            throws RemoteException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] bytes = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        String sqlStr = "";

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            conn.setAutoCommit(false);
            sqlStr = "UPDATE " + tableName + " SET " + fieldName + " = ? WHERE " + whereClause;

            ps = conn.prepareStatement(sqlStr);

            bytes = DBMS.serializeBlobObject(obj);
            if (bytes != null) {
                ps.setBytes(1, bytes);
            } else {
                throw new RemoteException("Contest.insertBlobObject: error serializing the blob object");
            }

            int success = ps.executeUpdate();

            if (success < 1)
                System.out.println("UPDATE " + tableName + " FAILED");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) {
                    conn.commit();
                    conn.close();
                }
            } catch (Exception ignore) {
            }
        }
    }


    /*****************************************************************************************
     * This is a generic method deserializes a Blob from the database and returns the
     * deserialized object.
     *
     * @param tableName - String - name of a table in the database
     * @param fieldName - String - name of a field within the table
     * @param whereClause - String - what the where clause should be of the insert statement for
     *                               inserting the blob
     * @exception RemoteException
     * @return Object - the blob object retrieved from the database
     ******************************************************************************************
     **/
    public Object getBlobObject(String tableName, String fieldName, String whereClause)
            throws RemoteException {
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlStr = "";
        Object retVal = new Object();

        try {
/*
      StringBuffer infxURL = new StringBuffer(150);
      infxURL.append("jdbc:informix-sqli://dev_db:1526/informixoltp");
      infxURL.append(":INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder");
      conn = DriverManager.getConnection(infxURL.toString());
*/

            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            conn.setAutoCommit(false);

            if (whereClause.equals(""))
                sqlStr = "SELECT " + fieldName + " FROM " + tableName;
            else
                sqlStr = "SELECT " + fieldName + " FROM " + tableName + " WHERE " + whereClause;
            ps = conn.prepareStatement(sqlStr);
            rs = ps.executeQuery();

            if (rs.next()) {
                try {
                    retVal = DBMS.getBlobObject(rs, 1);
                } catch (Exception pee) {
                    throw new RemoteException("DBMS.getBlobObject - error retrieving blob object from result set: " + pee);
                }
            } else {
                System.out.println("ContestBean.getBlobObject - no rows returned in ResultSet");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (rs != null) rs.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.commit();
                    conn.close();
                }
            } catch (Exception ignore) {
            }
        }

        return retVal;

    }

    /*****************************************************************************************
     * Retrieves all rounds and corresponding characteristics from the
     * round table
     *
     * @exception RemoteException
     * @return ArrayList of Round
     ***************************************************************************************
     **/
    public ArrayList getRoundList() throws RemoteException {
        log.info("Contest.getRoundList() called ... ");
        return getRoundList(0);
    }

    /*****************************************************************************************
     * Retrieves all rounds, for a given contest, and corresponding characteristics from the
     * round table
     *
     * @exception RemoteException
     * @return ArrayList of Round
     ***************************************************************************************
     **/
    public ArrayList getRoundList(int contest_id) throws RemoteException {
        log.info("Contest.getRoundList(contest_id) called ... ");

        ArrayList rounds = new ArrayList();
        Round roundAttr = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetRounds = new StringBuffer();
        txtGetRounds.append(" SELECT r.round_id, r.name , rs.start_time, c.name ")
                .append(" FROM round r, round_segment rs, contest c ")
                .append(" WHERE r.round_id = rs.round_id and rs.segment_id = 1 ")
                .append(" and r.contest_id = c.contest_id ");
        if (contest_id != 0) {
            txtGetRounds.append(" and  r.contest_id = ? and  c.contest_id = ? ");
        }
        txtGetRounds.append(" ORDER BY r.round_id desc ");


        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            ps = conn.prepareStatement(txtGetRounds.toString());
            if (contest_id != 0) {
                ps.setInt(1, contest_id);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                roundAttr = new Round(contest_id);
                roundAttr.setRoundId(rs.getInt(1));
                roundAttr.setContestName(rs.getString(4));
                roundAttr.setRoundName(rs.getString(2));
                roundAttr.setContestId(contest_id);
                rounds.add(roundAttr);
            }

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ignore) {
            }
        }

        return rounds;

    }


    /**
     *****************************************************************************************
     *  method: removeSystemTestResult
     *  input:  int test case id, problem id, coder id, round id
     *  Author: jason n. evans
     *  Created: August 26, 2001
     *  Last Modified:
     *  Modified By:
     *  Reason:
     *
     *  Description:  This method will remove a given system_test_result for a given
     *  coder for a given round
     *****************************************************************************************
     **/
    public void removeSystemTestResult(int roundId, int coderId, int componentId, int testCaseId) throws RemoteException {
        log.info("Contest: removeSystemTestResult(roundId, coderId, componentId, testCaseId) called ... ");
        int result = 0;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(120);
        query.append(" delete from system_test_result where round_id = ? and coder_id = ? and component_id = ? ");
        query.append(" and test_case_id = ? ");

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            ps = conn.prepareStatement(query.toString());
            ps.execute();
        } catch (Exception e) {
            throw new RemoteException("Contest:removeSystemTestResult:query: Error:\n" + e);
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception Ignore) {
                Ignore.printStackTrace();
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception Ignore) {
                Ignore.printStackTrace();
            }
        }
    }


    /**
     *****************************************************************************************
     *  method: nullifyChallenge
     *  input:  int challengeId
     *  Author: jason n. evans
     *  Created: August 26, 2001
     *  Last Modified:
     *  Modified By: jason n.evans
     *  Modified date: March 12, 2002
     *  Reason:  To fix nullify
     *
     *  Description:  This method will return nullify a given challenge of a round.
     *****************************************************************************************
     **/
    public void nullifyChallenge(int challengeId) throws RemoteException {
        log.info("Contest: nullifyChallenge (int challengeId [" + challengeId + "]) called ... ");
        int result = 0;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int retVal = 0, roundId = 0, challengerId = 0, defendantId = 0, problemId = 0, succeeded = -2;
        float challengerPoints = 0.0f, defendantPoints = 0.0f;

        StringBuffer queryGetChallengeInfo = new StringBuffer(200);
        queryGetChallengeInfo.append(" select round_id, challenger_id, defendant_id, succeeded, component_id ")
                .append(" , challenger_points, defendant_points from challenge where challenge_id = ? ");

        StringBuffer queryUpdatePSSucessful = new StringBuffer(200);
        queryUpdatePSSucessful.append(" update component_state set status_id = ? , points = points - ? ")
                .append(" where round_id =  ? and coder_id = ? and component_id = ? ");

        StringBuffer queryUpdateRR = new StringBuffer(200);
        queryUpdateRR.append(" update room_result set point_total = point_total - ? ")
                .append(" where round_id =  ? and coder_id = ? ");

        StringBuffer queryUpdateChallenge = new StringBuffer(200);
        queryUpdateChallenge.append(" update challenge set status_id = ? where ")
                .append(" round_id =  ? and component_id = ? and defendant_id = ? and challenger_id = ? and challenge_id = ? ");

        try {
            try {
                conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
                conn.setAutoCommit(false);
                ps = conn.prepareStatement(queryGetChallengeInfo.toString());
                ps.setInt(1, challengeId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    roundId = rs.getInt("round_id");
                    challengerId = rs.getInt("challenger_id");
                    defendantId = rs.getInt("defendant_id");
                    problemId = rs.getInt("component_id");
                    challengerPoints = rs.getFloat("challenger_points");
                    defendantPoints = rs.getFloat("defendant_points");
                    succeeded = rs.getInt("succeeded");
                    if (rs.wasNull()) {
                        throw new Exception("Succeed was null for challenge id " + challengeId + ".");
                    }
                } else {
                    throw new Exception("Challenge for id " + challengeId + " not found.");
                }
                try {
                    if (rs != null) rs.close();
                    rs = null;
                } catch (Exception exception1) {
                    exception1.printStackTrace();
                }
                try {
                    if (ps != null) ps.close();
                    ps = null;
                } catch (Exception exception2) {
                    exception2.printStackTrace();
                }
            } catch (Exception exception3) {
                log.error(queryGetChallengeInfo.toString());
                throw exception3;
            }
            ;

            if (succeeded == 1) {
                try {
                    ps = conn.prepareStatement(queryUpdatePSSucessful.toString());
                    ps.setInt(1, NOT_CHALLENGED);
                    ps.setFloat(2, defendantPoints);
                    ps.setInt(3, roundId);
                    ps.setInt(4, defendantId);
                    ps.setInt(5, problemId);
                    retVal = ps.executeUpdate();
                    if (retVal != 1) {
                        String err = "Update of probem_state defendant points and status failed: roundId: " + roundId + " defendantId: " + defendantId;
                        err += "problemId: " + problemId;
                        throw new Exception(err);
                    }
                    try {
                        if (ps != null) ps.close();
                        ps = null;
                    } catch (Exception exception2) {
                        exception2.printStackTrace();
                    }
                } catch (Exception exception3) {
                    log.error(queryUpdatePSSucessful.toString());
                    throw exception3;
                }
                ;

                try {
                    ps = conn.prepareStatement(queryUpdateRR.toString());
                    ps.setFloat(1, defendantPoints);
                    ps.setInt(2, roundId);
                    ps.setInt(3, defendantId);
                    retVal = ps.executeUpdate();
                    if (retVal != 1) {
                        String err = "Update of room_result defendant points failed: roundId: " + roundId + " defendantId: " + defendantId;
                        err += "problemId: " + problemId;
                        throw new Exception(err);
                    }
                    try {
                        if (ps != null) ps.close();
                        ps = null;
                    } catch (Exception exception2) {
                        exception2.printStackTrace();
                    }
                } catch (Exception exception3) {
                    log.error(queryUpdateRR.toString());
                    throw exception3;
                }
                ;
            }

            try {
                ps = conn.prepareStatement(queryUpdateRR.toString());
                ps.setFloat(1, challengerPoints);
                ps.setInt(2, roundId);
                ps.setInt(3, challengerId);
                retVal = ps.executeUpdate();
                if (retVal != 1) {
                    String err = "Update of room_result challenger points failed: roundId: " + roundId + " challenger: " + challengerId;
                    err += "problemId: " + problemId;
                    throw new Exception(err);
                }
                try {
                    if (ps != null) ps.close();
                    ps = null;
                } catch (Exception exception2) {
                    exception2.printStackTrace();
                }
            } catch (Exception exception3) {
                log.error(queryUpdateRR.toString());
                throw exception3;
            }
            ;

            try {
                ps = conn.prepareStatement(queryUpdateChallenge.toString());
                ps.setInt(1, STATUS_NULLIFIED);
                ps.setInt(2, roundId);
                ps.setInt(3, problemId);
                ps.setInt(4, defendantId);
                ps.setInt(5, challengerId);
                ps.setInt(6, challengeId);
                retVal = ps.executeUpdate();
                if (retVal != 1) {
                    String err = "Update of room_result challenger points failed: roundId: " + roundId + " challenger: " + challengerId;
                    err += "problemId: " + problemId;
                    throw new Exception(err);
                }
                try {
                    if (ps != null) ps.close();
                    ps = null;
                } catch (Exception exception2) {
                    exception2.printStackTrace();
                }
            } catch (Exception exception3) {
                log.error(queryUpdateChallenge.toString());
                throw exception3;
            }
            ;
            conn.commit();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback();
            } catch (Exception exception2) {
                exception2.printStackTrace();
            }
            throw new RemoteException("ContestAdminServices: nullifyChallenge Error:\n" + e);
        } finally {
            try {
                if (rs != null) rs.close();
                rs = null;
            } catch (Exception exception1) {
                exception1.printStackTrace();
            }
            try {
                if (ps != null) ps.close();
                ps = null;
            } catch (Exception exception2) {
                exception2.printStackTrace();
            }
            try {
                if (conn != null) conn.setAutoCommit(true);
                conn.close();
                conn = null;
            } catch (Exception exception3) {
                exception3.printStackTrace();
            }
        }
    }


    /*****************************************************************************************
     * Retrieves all system test results, for a given round, and corresponding characteristics from the
     * system test result table
     *
     * @exception RemoteException
     * @return ArrayList of Challenge
     ***************************************************************************************
     **/
    public ArrayList getSystemTestCaseReportList(int round_id, int filter) throws RemoteException {
        log.info("Contest.getSystemTestResultList(round_id[" + round_id + "] filter[" + filter + "] ) called ... ");

        ArrayList systemTestCaseReportList = new ArrayList();
        SystemTestCaseReport systemTestCaseReportAttr = null;
        Problem problemAttr = null;
        Room roomAttr = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetSystemTestResult = new StringBuffer(500);
        txtGetSystemTestResult.append(" select str.coder_id, str.round_id, p.problem_id, str.test_case_id,    ");
        txtGetSystemTestResult.append("  u.handle, rs.room_id, r.name, c.class_name,  ");
        txtGetSystemTestResult.append("  str.num_iterations, str.processing_time,  ");
        txtGetSystemTestResult.append("  str.deduction_amount, str.timestamp, str.viewable, stc.args, stc.expected_result, str.received    ");
        txtGetSystemTestResult.append("  from system_test_result str, system_test_case stc , room_result rs, room r , problem p, ");
        txtGetSystemTestResult.append("       user u, component c  ");
        txtGetSystemTestResult.append("  where  ");
        txtGetSystemTestResult.append("  str.test_case_id = stc.test_case_id  ");
        txtGetSystemTestResult.append("  and str.component_id = stc.component_id  ");
        txtGetSystemTestResult.append("  and stc.component_id = c.component_id  ");
        txtGetSystemTestResult.append("  and c.problem_id = p.problem_id  ");
        txtGetSystemTestResult.append("  and str.round_id = ?  ");
        txtGetSystemTestResult.append("  and str.round_id = rs.round_id  ");
        txtGetSystemTestResult.append("  and str.coder_id = rs.coder_id  ");
        txtGetSystemTestResult.append("  and rs.room_id = r.room_id  ");
        txtGetSystemTestResult.append("  and str.coder_id = u.user_id  ");

        switch (filter) {
            case 1:
                txtGetSystemTestResult.append(" ORDER BY rs.room_id, p.problem_id, str.coder_id ");
                break;
            case 2:
                txtGetSystemTestResult.append(" ORDER BY p.problem_id, rs.room_id, str.coder_id ");
                break;
            case 3:
                txtGetSystemTestResult.append(" ORDER BY str.coder_id , p.problem_id ");
                break;
        }

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            ps = conn.prepareStatement(txtGetSystemTestResult.toString());
            ps.setInt(1, round_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                problemAttr = new Problem();
                systemTestCaseReportAttr = new SystemTestCaseReport();
                systemTestCaseReportAttr.setCoderId(rs.getInt(1));
                systemTestCaseReportAttr.setRoundId(rs.getInt(2));
                problemAttr.setProblemId(rs.getInt(3));
                systemTestCaseReportAttr.setTestCaseId(rs.getInt(4));
                systemTestCaseReportAttr.setHandle(rs.getString(5));
                systemTestCaseReportAttr.setRoomId(rs.getInt(6));
                systemTestCaseReportAttr.setRoomName(rs.getString(7));
                problemAttr.setClassName(rs.getString(8));
                systemTestCaseReportAttr.setNumIterations(rs.getInt(9));
                systemTestCaseReportAttr.setProcessingTime(rs.getLong(10));
                systemTestCaseReportAttr.setDeductionAmount(rs.getFloat(11));
                systemTestCaseReportAttr.setTimestamp(rs.getTimestamp(12));
                systemTestCaseReportAttr.setViewable(rs.getString(13));
                systemTestCaseReportAttr.setArgs(DBMS.getBlobObject(rs, 14));
                systemTestCaseReportAttr.setExpected(DBMS.getBlobObject(rs, 15));
                systemTestCaseReportAttr.setReceived(DBMS.getBlobObject(rs, 16));
                systemTestCaseReportAttr.setProblem(problemAttr);
                systemTestCaseReportList.add(systemTestCaseReportAttr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

        return systemTestCaseReportList;

    }

    /*****************************************************************************************
     * Retrieves all challenges, for a given round, and corresponding characteristics from the
     * challenge table
     *
     * @exception RemoteException
     * @return ArrayList of Challenge
     ***************************************************************************************
     **/
    public ArrayList getChallengeList(int round_id, int constraintId, int filter, int constraintType) throws RemoteException {
        log.info("Contest.getChallengeList(round_id[" + round_id + "] constraintId [" + constraintId + "] filter[" + filter + "] constraintType[" + constraintType + "]) called ... ");

        ArrayList challenges = new ArrayList();
        Challenge challengeAttr = null;
        Problem problemAttr = null;
        Room roomAttr = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetChallenges = new StringBuffer();
        txtGetChallenges.append(" SELECT c.round_id, r.room_id, c.challenge_id, c.challenger_id, ")
                .append(" c.defendant_id, p.problem_id, d.data_type_desc, cp.class_name, c.succeeded, ")
                .append(" c.submit_time, cp.method_name, c.args, c.message, c.expected, ")
                .append(" c.received, c.challenger_points, c.defendant_points, ")
                .append(" u1.handle, u2.handle, r.name, st.status_desc, c.status_id, cp.component_id ")
                .append(" FROM challenge c, room_result rs, user u1, user u2, room r, problem p, data_type d ")
                .append(" , status_lu st, component cp ")
                .append(" WHERE c.round_id  = ?  ")
                .append("   and c.round_id = rs.round_id ")
                .append("   and c.challenger_id = rs.coder_id ")
                .append("   and c.challenger_id = u1.user_id ")
                .append("   and c.defendant_id = u2.user_id ")
                .append("   and rs.room_id = r.room_id ")
                .append("   and c.component_id = cp.component_id ")
                .append("   and cp.problem_id = p.problem_id ")
                .append("   and cp.result_type_id = d.data_type_id ")
                .append("   and c.status_id = st.status_id ");
        switch (constraintType) {
            case 1:
                txtGetChallenges.append("  and r.room_id = " + constraintId);
                break;
            case 2:
                txtGetChallenges.append("  and p.problem_id = " + constraintId);
                break;
            case 3:
                txtGetChallenges.append("  and c.challenger_id = " + constraintId);
                break;
        }


        switch (filter) {
            case STATUS_NORMAL:
                txtGetChallenges.append("  and c.status_id = " + STATUS_NORMAL);
                break;
            case STATUS_OVERTURNED:
                txtGetChallenges.append("  and c.status_id = " + STATUS_OVERTURNED);
                break;
            case STATUS_NULLIFIED:
                txtGetChallenges.append("  and c.status_id = " + STATUS_NULLIFIED);
                break;
            case 0:
                txtGetChallenges.append("  and c.succeeded = 0");
                break;
            case 1:
                txtGetChallenges.append("  and c.succeeded = 1");
                break;
        }

        txtGetChallenges.append(" ORDER BY r.room_id, cp.component_id, c.challenge_id ");

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            log.debug("txtGetChallenges: " + txtGetChallenges.toString());
            ps = conn.prepareStatement(txtGetChallenges.toString());
            ps.setInt(1, round_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                challengeAttr = new Challenge();
                problemAttr = new Problem();
                roomAttr = new Room();
                challengeAttr.setRoundId(rs.getInt(1));
                roomAttr.setRoomId(rs.getInt(2));
                challengeAttr.setChallengeId(rs.getInt(3));
                challengeAttr.setChallengerId(rs.getInt(4));
                challengeAttr.setDefendantId(rs.getInt(5));
                problemAttr.setProblemId(rs.getInt(6));
                challengeAttr.setResultValueType(rs.getString(7));
                problemAttr.setClassName(rs.getString(8));
                challengeAttr.setSucceeded(rs.getInt(9));
                challengeAttr.setSubmitTime(rs.getLong(10));
                problemAttr.setMethodName(rs.getString(11));
                challengeAttr.setArgs((ArrayList) DBMS.getBlobObject(rs, 12));
                challengeAttr.setMessage(rs.getString(13));
                challengeAttr.setExpectedResult(DBMS.getBlobObject(rs, 14));
                challengeAttr.setResultValue(DBMS.getBlobObject(rs, 15));
                challengeAttr.setChallengerPoints(rs.getFloat(16));
                challengeAttr.setDefendantPoints(rs.getFloat(17));
                challengeAttr.setChalHandle(rs.getString(18));
                challengeAttr.setDefHandle(rs.getString(19));
                challengeAttr.setStatusId(rs.getInt("status_id"));
                challengeAttr.setStatusDesc(rs.getString("status_desc"));
                roomAttr.setRoomDesc(rs.getString(20));
                challengeAttr.setProblem(problemAttr);
                challengeAttr.setRoom(roomAttr);
                challenges.add(challengeAttr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                    conn = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

        return challenges;

    }


    /*****************************************************************************************
     * Retrieves all round problem_ids from the
     * ROUND_PROBLEMS table for a contest round
     *
     * @exception RemoteException
     * @return ArrayList of problem_ids
     *****************************************************************************************
     **/
    public ArrayList getRoundProblems(int round_id, int contest_id) throws RemoteException {
        log.info("Contest.getRoundProblems(round_id[" + round_id + "] contest[" + contest_id + "]) called ... ");

        ArrayList roundProblems = new ArrayList();

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetRoundProblems = new StringBuffer();
        txtGetRoundProblems.append(" SELECT problem_id ").
                append(" FROM   round_component ").
                append(" WHERE  round_id = ? ").
                append(" ORDER  BY round_id ");

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            ps = conn.prepareStatement(txtGetRoundProblems.toString());
            ps.setInt(1, round_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                roundProblems.add(new Integer(rs.getInt(1)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
            } catch (Exception ignore) {
            }
        }

        return roundProblems;

    }


    /*****************************************************************************************
     * This method retrieves all subjects from the SUBJECTS (POSTGRES)
     * or LANGUAGE (INFORMIX) table.
     *
     * @exception RemoteException
     * @return ArrayList of Language.
     *****************************************************************************************
     **/
    public ArrayList getLanguages() throws RemoteException {
        log.debug("Contest.getLanguages() called ...");

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sqlStr = new StringBuffer(100);
        ArrayList languages = new ArrayList();
        Language languageAttr = null;

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            sqlStr.append("SELECT language_id, language_name, status FROM language ");

            ps = conn.prepareStatement(sqlStr.toString());
            rs = ps.executeQuery();

            while (rs.next()) {
                languageAttr = new Language();
                languageAttr.setLanguageId(rs.getInt(1));
                languageAttr.setName(rs.getString(2));
                languageAttr.setStatus(rs.getString(3));
                languages.add(languageAttr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ignore) {
            }
        }

        return languages;
    }

    /*****************************************************************************************
     * This method returns the next contest_id (MAX(contest_id) + 1) from the CONTEST table.
     *
     * @exception RemoteException
     * @return int representing the next unique contest_id from the CONTEST table.
     *****************************************************************************************
     **/
    public int getNextContestId() throws RemoteException {
        log.debug("Contest.getNextContestId() called ...");

        int retVal = -1;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sqlStr = new StringBuffer(100);

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            sqlStr.append("SELECT MAX(contest_id) + 1 as contest_id FROM contest ");

            ps = conn.prepareStatement(sqlStr.toString());
            rs = ps.executeQuery();

            if (rs.next()) {
                retVal = rs.getInt(1);

                if (retVal <= 0) {
                    retVal = 1;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ignore) {
            }
        }

        return retVal;
    }

    /*****************************************************************************************
     * This method returns the next round_id (MAX(round_id) + 1) from the ROUND table.
     *
     * @exception RemoteException
     * @return int representing the next unique round_id from the ROUND table.
     *****************************************************************************************
     **/
    public int getNextRoundId() throws RemoteException {
        log.debug("Contest.getNextRoundId() called ...");

        int retVal = -1;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sqlStr = new StringBuffer(100);

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            sqlStr.append("SELECT MAX(round_id) + 1 as round_id FROM round ");

            ps = conn.prepareStatement(sqlStr.toString());
            rs = ps.executeQuery();

            if (rs.next()) {
                retVal = rs.getInt(1);

                if (retVal <= 0) {
                    retVal = 1;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ignore) {
            }
        }

        return retVal;
    }


    /*****************************************************************************************
     *
     *
     * @exception RemoteException
     * @return ArrayList a list of the source that a particular coder has compiled/saved
     *****************************************************************************************
     */
    public ArrayList getCoderCompilations(int roundId, int coderId) throws RemoteException {
        log.debug("ejb.ContestAdminBean.getCompilations called...");

        ArrayList result = new ArrayList();
        com.topcoder.common.web.data.admin.Compilation compilation = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        java.sql.Connection conn = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(300);
            query.append(" SELECT cs.round_id");
            query.append(" ,cs.component_id");
            query.append(" ,cp.class_name");
            query.append(" ,cp.method_name");
            query.append(" ,d.difficulty_desc");
            query.append(" ,cs.coder_id");
            query.append(" ,u.handle");
            query.append(" ,c.compilation_text");
            query.append(" ,csl.status_desc");
            query.append(" ,c.open_time");
            query.append(" ,s.submit_time");
            query.append(" ,cs.points");
            query.append(" ,s.submission_points");
            query.append(" ,s.submission_text");
            query.append(" ,l.language_name");
            query.append(" ,rp.points");
            query.append(" ,d.difficulty_id");
            query.append(" ,s.submission_number");
            query.append(" FROM component_state cs, ");
            query.append(" OUTER submission s");
            query.append(" ,user u");
            query.append(" ,OUTER compilation c");
            query.append(" ,component_status_lu csl");
            query.append(" ,OUTER language l");
            query.append(" ,difficulty d");
            query.append(" ,round_component rp");
            query.append(" ,room r");
            query.append(" ,room_result rr");
            query.append(" ,component cp");
            query.append(" WHERE cs.component_state_id = s.component_state_id");
            query.append(" AND u.user_id = cs.coder_id");
            query.append(" AND c.component_state_id = cs.component_state_id");
            query.append(" AND cs.component_id = cp.component_id");
            query.append(" AND cs.status_id = csl.component_status_id");
            query.append(" AND cs.round_id = ?");
            query.append(" AND u.user_id = ?");
            query.append(" AND cs.language_id = l.language_id");
            query.append(" AND cs.round_id = rp.round_id");
            query.append(" AND rp.component_id = cp.component_id");
            query.append(" AND rp.difficulty_id = d.difficulty_id");
            query.append(" AND rr.room_id = r.room_id");
            query.append(" AND rr.round_id = rp.round_id");
            query.append(" AND rr.coder_id = u.user_id");
            query.append(" AND rp.division_id = r.division_id");
            query.append(" ORDER BY d.difficulty_id ASC, s.submission_number ASC");


            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            log.debug("\n" + query.toString());
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, roundId);
            ps.setInt(2, coderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                compilation = new com.topcoder.common.web.data.admin.Compilation();
                compilation.setRoundId(rs.getInt(1));
                compilation.setProblemId(rs.getInt(2));
                compilation.setClassName(rs.getString(3));
                compilation.setMethodName(rs.getString(4));
                compilation.setDifficultyDesc(rs.getString(5));
                compilation.setCoderId(rs.getInt(6));
                compilation.setHandle(rs.getString(7));
                compilation.setCompilationText(rs.getString(8));
                compilation.setStatus(rs.getString(9));
                compilation.setOpenTime(rs.getLong(10));
                compilation.setSubmitTime(rs.getLong(11));
                compilation.setPoints(rs.getFloat(12));
                compilation.setSubmissionPoints(rs.getFloat(13));
                compilation.setSubmissionText(rs.getString(14));
                compilation.setLanguageName(rs.getString(15));
                compilation.setPointValue(rs.getFloat(16));

                result.add(compilation);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.error("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
        return result;
    }


    /*****************************************************************************************
     * Get a list of rounds from the db
     *
     * @exception RemoteException
     * @return ArrayList all the distinct rounds in the system
     *****************************************************************************************
     */
    public ArrayList getRounds() throws RemoteException {
        log.debug("ejb.ContestAdminBean.getRounds called...");

        ArrayList result = new ArrayList();
        Round round = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        java.sql.Connection conn = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(300);
            query.append(" SELECT r.round_id, c.name, r.name");
            query.append("   FROM contest c");
            query.append("   JOIN round r");
            query.append("     ON c.contest_id = r.contest_id");
            query.append("  ORDER By round_id DESC");
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            log.debug("\n" + query.toString());
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                round = new Round();
                round.setRoundId(rs.getInt(1));
                round.setContestName(rs.getString(2));
                round.setRoundName(rs.getString(3));
                result.add(round);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.error("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
        return result;
    }


    /*****************************************************************************************
     *
     *
     * @exception RemoteException
     * @return ArrayList all the coders from a given round
     *****************************************************************************************
     */
    public ArrayList getCodersByRound(int roundId) throws RemoteException {
        log.debug("ejb.ContestAdminBean.getCodersByRound called...");

        ArrayList result = new ArrayList();
        com.topcoder.common.web.data.admin.Coder coder = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        java.sql.Connection conn = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(300);
            query.append(" SELECT distinct cs.coder_id, u.handle");
            query.append("   FROM user u");
            query.append("  JOIN component_state cs");
            query.append("     ON cs.coder_id = u.user_id");
            query.append("   AND cs.round_id = ?");
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            log.debug("\n" + query.toString());
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, roundId);
            rs = ps.executeQuery();
            while (rs.next()) {
                coder = new com.topcoder.common.web.data.admin.Coder();
                coder.setCoderId(rs.getInt(1));
                coder.setHandle(rs.getString(2));
                result.add(coder);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.error("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
        return result;
    }

    /*****************************************************************************************
     * @exception RemoteException
     * @return ArrayList of Rooms
     ***************************************************************************************
     **/
    public ArrayList getRoomList(int round_id) throws RemoteException {
        log.debug("Contest.getRoomList(round_id) called ... ");

        ArrayList rooms = new ArrayList();
        Room roomAttr = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetRooms = new StringBuffer();
        txtGetRooms.append(" SELECT  rm.room_id, rnd.contest_id, rnd.round_id, rm.name ");
        txtGetRooms.append(" FROM room rm, round rnd WHERE rnd.round_id = ? AND rnd.round_id = rm.round_id ");
        txtGetRooms.append(" ORDER BY rm.room_id ");


        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            ps = conn.prepareStatement(txtGetRooms.toString());
            ps.setInt(1, round_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                roomAttr = new Room();
                roomAttr.setRoomId(rs.getInt(1));
                roomAttr.setContestId(rs.getInt(2));
                roomAttr.setRoundId(rs.getInt(3));
                roomAttr.setRoomDesc(rs.getString(4));
                rooms.add(roomAttr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                    conn = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

        return rooms;

    }


    public ArrayList getCoderList(int roundId) throws RemoteException {
        log.info("Contest.getCoderList(roundId[" + roundId + "]) called ... ");

        ArrayList coders = new ArrayList();
        SystemTestCaseReport sysAttr = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetCoders = new StringBuffer();
        txtGetCoders.append(" SELECT coder_id, handle, lower(handle) as u2 from room_result, user where round_id = ? ");
        txtGetCoders.append(" and coder_id = user_id ORDER BY u2 ");

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            ps = conn.prepareStatement(txtGetCoders.toString());
            ps.setInt(1, roundId);

            rs = ps.executeQuery();

            while (rs.next()) {
                sysAttr = new SystemTestCaseReport();
                sysAttr.setCoderId(rs.getInt(1));
                sysAttr.setHandle(rs.getString(2));
                coders.add(sysAttr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

        return coders;

    }

    public ArrayList getCoderList(int roundId, int problemId) throws RemoteException {
        log.debug("Contest.getCoderList(roundId,problemId) called ... ");

        ArrayList coders = new ArrayList();
        SystemTestCaseReport sysAttr = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetCoders = new StringBuffer();
        txtGetCoders.append(" SELECT coder_id, handle, lower(handle) as u2 from component_state, user where round_id = ? and component_id = ? and ");
        txtGetCoders.append(" coder_id = user_id ORDER BY u2 ");

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            ps = conn.prepareStatement(txtGetCoders.toString());
            ps.setInt(1, roundId);
            ps.setInt(2, problemId);

            rs = ps.executeQuery();

            while (rs.next()) {
                sysAttr = new SystemTestCaseReport();
                sysAttr.setCoderId(rs.getInt(1));
                sysAttr.setHandle(rs.getString(2));
                coders.add(sysAttr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

        return coders;

    }


    public ArrayList getProblemList(int round_id) throws RemoteException {
        log.info("Contest.getProblemList(round_id{" + round_id + "]) called ... ");

        ArrayList problems = new ArrayList();
        Problem problemAttr = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetProblems = new StringBuffer();
        txtGetProblems.append(" SELECT p.problem_id, cp.class_name, d.difficulty_desc, r.round_id, r.division_id, dv.division_desc  ")
                .append(" , cp.method_name from round_component r, problem p, component cp, difficulty d , division dv where d.difficulty_id = r.difficulty_id ")
                .append(" and r.round_id = ?  and r.component_id = cp.component_id and cp.problem_id = p.problem_id and r.division_id = dv.division_id ")
                .append(" group by p.problem_id, cp.class_name, d.difficulty_desc, r.round_id, r.division_id, dv.division_desc, cp.method_name ")
                .append(" ORDER BY p.problem_id ");


        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            ps = conn.prepareStatement(txtGetProblems.toString());
            ps.setInt(1, round_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                problemAttr = new Problem();
                problemAttr.setProblemId(rs.getInt(1));
                problemAttr.setClassName(rs.getString(2));
                problemAttr.setMethodName(rs.getString("method_name"));
                problemAttr.setDifficulty(rs.getString(3));
                problemAttr.setRoundId(rs.getInt(4));
                problemAttr.setDivisionId(rs.getInt("division_id"));
                problemAttr.setDivisionDesc(rs.getString("division_desc"));
                problems.add(problemAttr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

        return problems;

    }


    /*****************************************************************************************
     * Retrieves all system test results, for a given round, and corresponding characteristics from the
     * system test result table
     *
     * @exception RemoteException
     * @return ArrayList of Challenge
     ***************************************************************************************
     **/
    public ArrayList getSystemTestCaseReportList(int roundId, int problemId, int coderId, int filter) throws RemoteException {
        log.debug("Contest.getSystemTestResultList(round_id, filter) called ... ");

        ArrayList systemTestCaseReportList = new ArrayList();
        SystemTestCaseReport systemTestCaseReportAttr = null;
        Problem problemAttr = null;

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer txtGetSystemTestResult = new StringBuffer(500);
        txtGetSystemTestResult.append(" select str.coder_id, str.round_id, str.component_id, str.test_case_id,    ");
        txtGetSystemTestResult.append("  u.handle, rs.room_id, p.problem_id, cp.class_name,  ");
        txtGetSystemTestResult.append("  str.num_iterations, str.processing_time,  ");
        txtGetSystemTestResult.append("  str.deduction_amount, str.timestamp, str.viewable, stc.args, stc.expected_result, str.received ");
        txtGetSystemTestResult.append("  from system_test_result str, system_test_case stc , room_result rs, room r , problem p, user u, component c ");
        txtGetSystemTestResult.append("  where  ");
        txtGetSystemTestResult.append("  str.test_case_id = stc.test_case_id  ");
        txtGetSystemTestResult.append("  and str.coder_id = ?  ");
        txtGetSystemTestResult.append("  and str.component_id = stc.component_id  ");
        txtGetSystemTestResult.append("  and stc.component_id = cp.component_id  ");
        txtGetSystemTestResult.append("  and cp.problem_id = p.problem_id  ");
        txtGetSystemTestResult.append("  and str.round_id = ?  ");
        txtGetSystemTestResult.append("  and str.round_id = rs.round_id  ");
        txtGetSystemTestResult.append("  and str.coder_id = rs.coder_id  ");
        txtGetSystemTestResult.append("  and rs.room_id = r.room_id  ");
        txtGetSystemTestResult.append("  and str.coder_id = u.user_id  ");
        txtGetSystemTestResult.append("  and p.problem_id = ?  ");

        switch (filter) {
            case 1:
                txtGetSystemTestResult.append(" ORDER BY rs.room_id, p.problem_id, str.coder_id ");
                break;
            case 2:
                txtGetSystemTestResult.append(" ORDER BY p.problem_id, rs.room_id, str.coder_id ");
                break;
            case 3:
                txtGetSystemTestResult.append(" ORDER BY str.coder_id , p.problem_id ");
                break;
        }

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);
            ps = conn.prepareStatement(txtGetSystemTestResult.toString());
            ps.setInt(1, coderId);
            ps.setInt(2, roundId);
            ps.setInt(3, problemId);

            rs = ps.executeQuery();

            while (rs.next()) {
                problemAttr = new Problem();
                systemTestCaseReportAttr = new SystemTestCaseReport();
                systemTestCaseReportAttr.setCoderId(rs.getInt(1));
                systemTestCaseReportAttr.setRoundId(rs.getInt(2));
                problemAttr.setProblemId(rs.getInt(3));
                systemTestCaseReportAttr.setTestCaseId(rs.getInt(4));
                systemTestCaseReportAttr.setHandle(rs.getString(5));
                systemTestCaseReportAttr.setRoomId(rs.getInt(6));
                systemTestCaseReportAttr.setRoomName(rs.getString(7));
                problemAttr.setClassName(rs.getString(8));
                systemTestCaseReportAttr.setNumIterations(rs.getInt(9));
                systemTestCaseReportAttr.setProcessingTime(rs.getLong(10));
                systemTestCaseReportAttr.setDeductionAmount(rs.getFloat(11));
                systemTestCaseReportAttr.setTimestamp(rs.getTimestamp(12));
                systemTestCaseReportAttr.setViewable(rs.getString(13));
                systemTestCaseReportAttr.setArgs(DBMS.getBlobObject(rs, 14));
                systemTestCaseReportAttr.setExpected(DBMS.getBlobObject(rs, 15));
                systemTestCaseReportAttr.setReceived(DBMS.getBlobObject(rs, 16));
                systemTestCaseReportAttr.setProblem(problemAttr);
                systemTestCaseReportList.add(systemTestCaseReportAttr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }

        }

        return systemTestCaseReportList;

    }


    /**
     * This method is to reverse a challenge. First, all the pertenant challenge
     * information is retrieved from the challenge and submission tables. Then if
     * the challenge was successful, this method calls the overturnSucceededChallenge
     * method. If the challenge was unsuccessful, this method calls the
     * overturnUnsucceededChallenge method.
     *
     * @param challenge_id - int representing a unique challenge_id
     */
    public void overturnChallenge(int challenge_id) throws RemoteException {

        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sqlStr = new StringBuffer(250);

        int problem_id;
        int round_id;
        int defendant_id;
        int challenger_id;
        int succeeded;
        String message;
        double submission_points;

        try {
            conn = DBMS.getConnection(DBMS.CONTEST_ADMIN_DATASOURCE);

            sqlStr.append(" SELECT c.component_id, c.round_id, c.defendant_id, c.challenger_id, ").
                    append("        c.succeeded, c.message, s.submission_points ").
                    append(" FROM challenge c, submission s ").
                    append(" WHERE c.challenge_id = ? ").
                    append(" AND s.component_state_id = (SELECT cs.component_state_id FROM component_state cs ").
                    append("                           WHERE cs.round_id = c.round_id ").
                    append("                           AND cs.component_id = c.component_id ").
                    append("                           AND cs.coder_id = c.defendant_id) ");

            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, challenge_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                problem_id = rs.getInt(1);
                round_id = rs.getInt(2);
                defendant_id = rs.getInt(3);
                challenger_id = rs.getInt(4);
                succeeded = rs.getInt(5);
                message = rs.getString(6);
                submission_points = rs.getDouble(7);
            } else {
                throw new RemoteException("Error in ReverseChallenge: no information retrieved for challenge_id: " + challenge_id);
            }

            System.out.println("problem_id: " + problem_id);
            System.out.println("round_id: " + round_id);
            System.out.println("defendant_id: " + defendant_id);
            System.out.println("challenger_id: " + challenger_id);
            System.out.println("succeeded: " + succeeded);
            System.out.println("message: " + message);
            System.out.println("submission_points: " + submission_points);

            if (succeeded == 1)
                overturnSucceededChallenge(conn, problem_id, round_id, defendant_id, challenger_id, challenge_id, message, submission_points);
            else
                overturnUnsucceededChallenge(conn, problem_id, round_id, defendant_id, challenger_id, challenge_id, message, submission_points);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("Error in ReverseChallenge: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


    /**
     * This method is used to reverse a Succeeded challenge.
     *
     * @param conn - java.sql.Connection object
     * @param problem_id - int representing a unique problem
     * @param round_id - int representing a unique round
     * @param defendant_id - int representing a unique defendant
     * @param challenger_id - int representing a unique challenger
     * @param challenge_id - int representing a unique challenge
     * @param message - String representing the challenge message
     * @param submission_points - double representing a defendant's points earned for a problem submission
     */
    private static void overturnSucceededChallenge(java.sql.Connection conn, int problem_id, int round_id,
                                                   int defendant_id, int challenger_id, int challenge_id,
                                                   String message, double submission_points)
            throws RemoteException {

        try {

            message = modifyMessage(1, message);
            conn.setAutoCommit(false);
            updateChallenge(conn, 0, -50.00, 0.00, message, challenge_id);
            updateRoomResult(conn, round_id, defendant_id, submission_points);
            updateComponentState(conn, submission_points, CHALLENGE_FAILED, round_id, defendant_id, problem_id);
            updateRoomResult(conn, round_id, challenger_id, -100.00);
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (Exception ex) {
                System.out.println("Error Rolling Back: ");
                ex.printStackTrace();
            }
            throw new RemoteException("Error in overturnSucceededChallenge: " + e.getMessage());
        }

    }


    /**
     * This method is used to reverse an Unsucceeded challenge.
     *
     * @param conn - java.sql.Connection object
     * @param problem_id - int representing a unique problem
     * @param round_id - int representing a unique round
     * @param defendant_id - int representing a unique defendant
     * @param challenge_id - int representing a unique challenge
     * @param challenger_id - int representing a unique challenger
     * @param message - String representing the challenge message
     * @param submission_points - double representing a defendant's points earned for a problem submission
     */
    private static void overturnUnsucceededChallenge(java.sql.Connection conn, int problem_id, int round_id,
                                                     int defendant_id, int challenger_id, int challenge_id,
                                                     String message, double submission_points)
            throws RemoteException {
        //negate the submission points
        submission_points = 0 - submission_points;

        try {
            message = modifyMessage(0, message);
            conn.setAutoCommit(false);
            updateChallenge(conn, 1, 50.00, submission_points, message, challenge_id);
            updateRoomResult(conn, round_id, defendant_id, submission_points);
            updateComponentState(conn, 0.00, CHALLENGE_SUCCEEDED, round_id, defendant_id, problem_id);
            updateRoomResult(conn, round_id, challenger_id, 100.00);
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (Exception ex) {
                System.out.println("Error Rolling Back: ");
                ex.printStackTrace();
            }
            throw new RemoteException("Error in overturnUnsucceededChallenge: " + e.getMessage());
        }

    }


    /**
     * This method is to update the challenge table.
     * The columns to be updated are: succeeded, challenger_points, defendant_points and message
     *
     * @param conn - java.sql.Connection object
     * @param succeeded - int - 0 = unsuccessful challenge, 1 = successful challenge
     * @param challenger_points - double representing the amount of points the challenger should earn
     * @param defendant_points - double representing the amount of points the defendant should earn
     * @param message - String representing the new challenge message
     * @param challenge_id - int representing a unique challenge
     */
    private static void updateChallenge(java.sql.Connection conn, int succeeded, double challenger_points,
                                        double defendant_points, String message, int challenge_id)
            throws RemoteException {

        PreparedStatement ps = null;
        StringBuffer sqlStr = new StringBuffer(250);

        try {
            sqlStr.append(" UPDATE challenge SET succeeded = ?, challenger_points = ?, ").
                    append("        defendant_points = ?, message = ? ").
                    append(" WHERE  challenge_id = ? ");


            ps = conn.prepareStatement(sqlStr.toString());
            ps.setInt(1, succeeded);
            ps.setDouble(2, challenger_points);
            ps.setDouble(3, defendant_points);
            ps.setString(4, message);
            ps.setInt(5, challenge_id);

            if (ps.executeUpdate() == -1) {
                throw new RemoteException("Error in updateChallenge: record not updated for challenge_id: " +
                        challenge_id);
            }


        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("Error in updateChallenge: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * This method is to update the room_result table.
     * The columns to be updated are: point_total
     *
     * @param conn - java.sql.Connection object
     * @param round_id - int representing a unique round
     * @param coder_id - int representing a unique coder
     * @param point_change - double representing the amount of points the users point_total should change
     */
    private static void updateRoomResult(java.sql.Connection conn, int round_id, int coder_id, double point_change)
            throws RemoteException {

        PreparedStatement ps = null;
        StringBuffer sqlStr = new StringBuffer(250);

        try {
            sqlStr.append(" UPDATE room_result SET point_total = point_total + ? ").
                    append(" WHERE  round_id = ? AND coder_id = ? ");


            ps = conn.prepareStatement(sqlStr.toString());
            ps.setDouble(1, point_change);
            ps.setInt(2, round_id);
            ps.setInt(3, coder_id);

            if (ps.executeUpdate() == -1) {
                throw new RemoteException("Error in updateRoomResult: record not updated for coder_id: " +
                        coder_id + " round_id: " + round_id);
            }


        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("Error in updateRoomResult: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * This method is to update the problem_state table.
     * The columns to be updated are: points and status_id
     *
     * @param conn - java.sql.Connection object
     * @param submission_points - double representing a coder's points earned for a problem submission
     * @param status_id - int representing a status of a problem
     * @param round_id - int representing a unique round
     * @param coder_id - int representing a unique coder
     */
    private static void updateComponentState(java.sql.Connection conn, double submission_points, int status_id,
                                           int round_id, int coder_id, int component_id)
            throws RemoteException {

        PreparedStatement ps = null;
        StringBuffer sqlStr = new StringBuffer(150);

        try {
            sqlStr.append(" UPDATE component_state SET points = ?, status_id = ? ").
                    append(" WHERE  round_id = ? AND coder_id = ? AND component_id = ?");


            ps = conn.prepareStatement(sqlStr.toString());
            ps.setDouble(1, submission_points);
            ps.setInt(2, status_id);
            ps.setInt(3, round_id);
            ps.setInt(4, coder_id);
            ps.setInt(5, component_id);

            if (ps.executeUpdate() == -1) {
                throw new RemoteException("Error in updateComponentState: record not updated for coder_id: " +
                        coder_id + " round_id: " + round_id + " problem_id: " + component_id);
            }


        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("Error in updateComponentState: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                    ps = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * This method is to modify the challenge message.
     *
     * @param succeeded - int - 0 = unsuccessful challenge, 1 = successful challenge
     * @param message - String representing the old challenge message
     */
    private static String modifyMessage(int succeeded, String message) throws RemoteException {

        int index;
        StringBuffer strBuf = new StringBuffer(message);
        ;

        try {
            if (succeeded == 1) {
                index = message.indexOf("successfully");
                strBuf.replace(index, index + 12, "unsuccessfully");
            } else {
                index = message.indexOf("unsuccessfully");
                strBuf.replace(index, index + 14, "successfully");
            }

            return strBuf.toString();

        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("Error in modifyMessage: " + e.getMessage());
        }

    }


}

