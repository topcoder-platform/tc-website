package com.topcoder.ejb.DataCache;

import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.TCException;
import com.topcoder.common.web.util.DateTime;
import com.topcoder.common.web.data.Group;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.net.InetAddress;
import java.sql.*;
import java.util.*;


public class DataCacheBean extends BaseEJB {

    private static ArrayList notifications;
    private static ArrayList rounds;
    private static ArrayList demographicAssignments;
    private static ArrayList languages;
    private static ArrayList referralTypes;
    private static ArrayList jobTypes;
    private static ArrayList editorTypes;
    private static ArrayList schools;
    private static ArrayList countries;
    private static ArrayList states;
    private static ArrayList degreeLevels;
    private static ArrayList contests;
    private static ArrayList roundProblems;
    private static HashMap contestNavs;

    private static boolean notificationsCached;
    private static boolean demographicAssignmentsCached;
    private static boolean languagesCached;
    private static boolean referralTypesCached;
    private static boolean jobTypesCached;
    private static boolean editorTypesCached;
    private static boolean contestNavsCached;
    private static boolean contestsCached;
    private static boolean schoolsCached;
    private static boolean countriesCached;
    private static boolean statesCached;
    private static boolean degreeLevelsCached;
    private static int memberCount;
    private static Calendar memberCountLastRefresh;
    private static Calendar roundsLastRefresh;
    private static final int MEMBER_COUNT_REFRESH_INTERVAL = 900000;
    private static boolean roundsCached;
    private static final int ROUND_REFRESH_INTERVAL = 1800000;

    private static Logger log = Logger.getLogger(DataCacheBean.class);

    public int getMemberCount() throws TCException {
        Calendar now = Calendar.getInstance();
        if (
                this.memberCount == 0
                || this.memberCountLastRefresh == null
                || (
                now.getTime().getTime() - this.memberCountLastRefresh.getTime().getTime() > MEMBER_COUNT_REFRESH_INTERVAL
                )
        ) {
            synchronized (this) {
                setMemberCount(popMemberCount());
            }
        }
        return this.memberCount;
    }

    public ArrayList getRounds() throws TCException {
        Calendar now = Calendar.getInstance();
        if (
                this.roundsCached == false
                || this.roundsLastRefresh == null
                || (
                now.getTime().getTime() - this.roundsLastRefresh.getTime().getTime() > ROUND_REFRESH_INTERVAL
                )
        ) {
            synchronized (this) {
                this.rounds = popRounds();
                roundsCached = true;
            }
        }
        return this.rounds;
    }

    private ArrayList popRounds() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popRounds():called.");
        ArrayList results = new ArrayList();
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Round round = null;
        StringBuffer query = new StringBuffer(300);
        /*************************************************************************************/
        query.append(" SELECT r.round_id");
        query.append(" ,r.contest_id");
        query.append(" ,r.name");
        query.append(" ,r.status");
        query.append(" ,r.ran_ratings");
        query.append(" ,r.paid_money");
        query.append(" ,r.registration_limit");
        query.append(" ,r.notes");
        query.append(" ,r.link");
        query.append(" FROM round r");
        query.append(" WHERE r.status IN ('A','F')");
//        query.append(" AND r.round_type_id != 3");
        query.append(" AND r.round_type_id = 1"); //get SRMs only
        query.append(" ORDER BY r.round_id");
        /*************************************************************************************/
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                round = new Round();
                round.setRoundId(rs.getInt(1));
                round.setContestId(rs.getInt(2));
                round.setRoundName(rs.getString(3));
                round.setStatus(rs.getString(4));
                round.setRanRatings(rs.getInt(5));
                round.setPaidMoney(rs.getInt(6));
                round.setRegistrationLimit(rs.getInt(7));
                round.setNotes(rs.getString(8));
                round.setLink(rs.getString(9));
                popRoundSegments(conn, round);
                results.add(round);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popRounds: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:popRounds:query: Error:\n" + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return results;
    }

    private void popRoundSegments(Connection conn, Round round)
            throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popRoundSegments():called.");
        PreparedStatement ps = null;
        ResultSet rs = null;
        RoundSegment roundSegment = null;
        StringBuffer query = new StringBuffer(300);
        /*************************************************************************************/
        query.append(" SELECT r.round_id");
        query.append(" ,r.segment_id");
        query.append(" ,s.segment_desc");
        query.append(" ,r.start_time");
        query.append(" ,r.end_time");
        query.append(" ,r.status");
        query.append(" FROM round_segment r");
        query.append(" ,segment s");
        query.append(" WHERE r.round_id = ?");
        query.append(" AND r.segment_id = s.segment_id");
        /*************************************************************************************/
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, round.getRoundId());
            rs = ps.executeQuery();
            while (rs.next()) {
                roundSegment = new RoundSegment();
                roundSegment.setRoundId(rs.getInt(1));
                roundSegment.setSegmentId(rs.getInt(2));
                roundSegment.setSegmentDesc(rs.getString(3));
                roundSegment.setStart(rs.getTimestamp(4));
                roundSegment.setEnd(rs.getTimestamp(5));
                roundSegment.setStatus(rs.getString(6));
                roundSegment.setModified("S");
                round.getRoundSegments().add(roundSegment);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popRoundSegments: ERROR: " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:popRoundSegments:query: Error:\n" + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    /*********************************************************************************************
     * setMemberCount
     * set the static member count in the data cache and return the ip of the server it has been
     * reset on to the client
     * @param memberCount of the total TopCoder member count.
     * @return an array of the bytes of the server ip address.
     * @throws TCException
     *********************************************************************************************
     */
    public byte[] setMemberCount(int memberCount) throws TCException {
        byte[] result = null;
        try {
            InetAddress localHost = InetAddress.getLocalHost();
            result = localHost.getAddress();
            synchronized (this) {
                this.memberCount = memberCount;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "ejb.DataCacheBean:setMemberCount:ERROR:" + e.getMessage()
            );
        }
        return result;
    }


    /**
     ***************************************************************************************
     * The resetAll method will be used by administrators for resetting the value
     * of all Cached booleans to false so that all ArrayLists can be rebuilt.
     ***************************************************************************************
     */
    public byte[] resetAll() throws TCException {
        byte[] result = null;
        log.debug("EJB DataCacheBean resetAll called.");
        synchronized (this) {
            this.notificationsCached = false;
            this.roundsCached = false;
            this.demographicAssignmentsCached = false;
            this.languagesCached = false;
            this.degreeLevelsCached = false;
            this.referralTypesCached = false;
            this.jobTypesCached = false;
            this.editorTypesCached = false;
            this.contestNavsCached = false;
            this.contestsCached = false;
            this.schoolsCached = false;
            this.countriesCached = false;
            this.statesCached = false;
            this.roundProblems = new ArrayList();
            this.memberCount = 0;
            this.memberCountLastRefresh = null;
        }
        log.debug("ejb.DataCacheBean:resetAll:completed.");
        try {
            InetAddress localHost = InetAddress.getLocalHost();
            result = localHost.getAddress();
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "ejb.DataCacheBean:resetAll:ERROR:" + e.getMessage()
            );
        }
        return result;
    }


    public void resetNotifications() throws TCException {
        log.debug("EJB DataCacheBean resetNotifications called.");
        synchronized (this) {
            this.notificationsCached = false;
        }
    }


    public void resetRounds() throws TCException {
        log.debug("EJB DataCacheBean resetRounds called.");
        synchronized (this) {
            this.roundsCached = false;
        }
    }


    public void resetMemberCount() throws TCException {
        log.debug("EJB DataCacheBean resetMemberCount called.");
        synchronized (this) {
            this.memberCount = 0;
        }
    }


    public void resetDemographicAssignments() throws TCException {
        log.debug("EJB DataCacheBean resetDemographicAssignments called.");
        synchronized (this) {
            this.demographicAssignmentsCached = false;
        }
    }

    public void resetLanguages() throws TCException {
        log.debug("EJB DataCacheBean resetLanguages called.");
        synchronized (this) {
            this.languagesCached = false;
        }
    }


    public void resetDegrees() throws TCException {
        log.debug("EJB DataCacheBean resetDegrees called.");
        synchronized (this) {
            this.degreeLevelsCached = false;
        }
    }

    public void resetJobTypes() throws TCException {
        log.debug("EJB DataCacheBean resetJobTypes called.");
        synchronized (this) {
            this.jobTypesCached = false;
        }
    }


    public void resetEditors() throws TCException {
        log.debug("EJB DataCacheBean resetEditors called.");
        synchronized (this) {
            this.editorTypesCached = false;
        }
    }


    public void resetReferrals() throws TCException {
        log.debug("EJB DataCacheBean resetReferrals called.");
        synchronized (this) {
            this.referralTypesCached = false;
        }
    }


    public void resetStates() throws TCException {
        log.debug("EJB DataCacheBean resetStates called.");
        synchronized (this) {
            this.statesCached = false;
        }
    }


    public void resetCountries() throws TCException {
        log.debug("EJB DataCacheBean resetCountries called.");
        synchronized (this) {
            this.countriesCached = false;
        }
    }


    public void resetSchools() throws TCException {
        log.debug("EJB DataCacheBean resetSchools called.");
        synchronized (this) {
            this.schoolsCached = false;
        }
    }


    /**
     ***************************************************************************************
     * The resetContests method will be used by administrators for resetting the value
     * of contestsCached to false so that the contests ArrayList can be rebuilt after inserting
     * and or updating records.
     ***************************************************************************************
     */
    public void resetContests() throws TCException {
        log.debug("EJB DataCacheBean resetContests called.");
        synchronized (this) {
            this.contestsCached = false;
        }
    }


    public void resetContestNavs(String strContestNo) throws TCException {
        log.debug("EJB DataCacheBean resetContestNavs(String) called.");
        if (this.contestNavs != null) {
            try {
                synchronized (this) {
                    this.contestNavs.remove(strContestNo);
                }
            } catch (Exception e) {
                StringBuffer msg = new StringBuffer(200);
                msg.append("ejb.DataCacheBean:resetContestNavs(");
                msg.append(strContestNo);
                msg.append("):ERROR:");
                msg.append(e.getMessage());
                throw new TCException(msg.toString());
            }
        }
    }


    public void resetContestNavs() {
        log.debug("EJB DataCacheBean resetContestNavs() called.");
        synchronized (this) {
            this.contestNavsCached = false;
        }
    }


    public ArrayList getAdContests() throws TCException {
        ArrayList result = null;
        try {
            ArrayList allContests = getContests();
            for (int i = 0; i < allContests.size(); i++) {
                Contest contest = (Contest) allContests.get(i);
                java.sql.Date today = getCurrentDate();
                java.sql.Date adStart = contest.getAdStart();
                if (adStart != null && (today.compareTo(adStart) >= 0)) {
                    java.sql.Date adEnd = contest.getAdEnd();
                    if (adEnd != null && (today.compareTo(adEnd) <= 0)) {
                        if (contest.getAdCommand().equals("") && contest.getAdTask().equals("")) {
                            String strContestId = Integer.toString(contest.getContestId());
                            TreeSet contestNavs = getContestNavs(strContestId);
                            if (contestNavs != null) {
                                ContestNav contestNav = (ContestNav) contestNavs.first();
                                //contest comes from DataCache, so mods must be synchronized
                                synchronized (this) {
                                    contest.setAdTask(contestNav.getTask());
                                    contest.setAdCommand(contestNav.getCommand());
                                }
                            }
                        }
                        if (result == null) result = new ArrayList();
                        result.add(contest);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException("ejb.DataCache:getAdContests:ERROR:\n" + e);
        }
        return result;
    }



    // the getCurrentDate and getCurrentTimestamp methods open a connection
    // and call the DateTime.getCurrentDate(conn) and DateTime.getCurrentTimestamp(conn) to
    // avoid the extra JNDI lookup associate with DateTime.getCurrentDate() and
    // DateTime.getCurrentTimestamp().

    private java.sql.Date getCurrentDate() throws TCException {
        java.sql.Date result = null;
        java.sql.Connection conn = null;
        try {
            conn = DBMS.getConnection();
            result = DateTime.getCurrentDate(conn);
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:getCurrentDate:ERROR:" + e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    private java.sql.Timestamp getCurrentTimestamp() throws TCException {
        java.sql.Timestamp result = null;
        java.sql.Connection conn = null;
        try {
            conn = DBMS.getConnection();
            result = DateTime.getCurrentTimestamp(conn);
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:getCurrentTimestamp:ERROR:" + e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public TreeSet getContestNavs(String strContestNo) throws TCException {
        TreeSet result = null;
        try {
            log.debug("EJB DataCacheBean getContestNavs called.");
            if (!this.contestNavsCached) {
                synchronized (this) {
                    if (this.contestNavs == null) {
                        this.contestNavs = new HashMap();
                    } else {
                        this.contestNavs.clear();
                    }
                    this.contestNavsCached = true;
                }
            }
            if (this.contestNavs.containsKey(strContestNo)) {
                result = (TreeSet) this.contestNavs.get(strContestNo);
            } else {
                int intContestNo = Integer.parseInt(strContestNo);
                result = popContestNavs(intContestNo);
                if (result != null) {
                    synchronized (this) {
                        this.contestNavs.put(strContestNo, result);
                    }
                }
            }
        } catch (Exception e) {
            throw new TCException("ejb.DataCache:getContestNavs:ERROR:\n" + e);
        }
        return result;
    }


    private TreeSet popContestNavs(int contestNo) throws TCException {
        log.debug("EJB DataCacheBean popContestNavs called.");
        TreeSet result = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(150);
            query.append(" SELECT");
            query.append(" contest_nav_id");
            query.append(" ,task");
            query.append(" ,command");
            query.append(" FROM");
            query.append(" contest_nav");
            query.append(" WHERE");
            query.append(" contest_id = ?");
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, contestNo);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (result == null) result = new TreeSet();
                ContestNav contestNav = new ContestNav();
                contestNav.setContestId(contestNo);
                contestNav.setContestNavId(rs.getInt(1));
                contestNav.setTask(rs.getString(2));
                contestNav.setCommand(rs.getString(3));
                result.add(contestNav);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean.:getContestNavs: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCacheBean:getContestNavs:ERROR:" + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /*
    *****************************************************************************
    * The getContests method determines wether the contests ArrayList is populated.
    * If the boolean contestsCached instance variable is false the method gets
    * the list of contests.  The value of contests is
    * then set to the popContests return.
    * If the contestsCached instance variable = true then the method returns the
    * the contests ArrayList without calling the ejb.
    *****************************************************************************
    */
    public ArrayList getContests() throws TCException {
        if (!this.contestsCached) {
            try {
                synchronized (this) {
                    this.contests = popContests();
                    this.contestsCached = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw new TCException("ejb.DataCache:getContests:ERROR:\n" + e);
            }
        }
        return this.contests;
    }


    /**
     *****************************************************************************************
     *  method: popContests
     *  input:  none
     *  output: ArrayList of Contest Objects
     *  Author: Jason N. Evans
     *  Created: December 20, 2000
     *  Last Modified: January 2, 2001
     *  Modified By: Steven Burrows
     *  Reason: To make Jason feel violated
     *
     *  Description:  This method will return an arraylist of all active contest whith all
     *                header information contained in the contest table.
     *****************************************************************************************
     **/
    private ArrayList popContests() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popContests():called.");
        ArrayList results = new ArrayList();
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Contest contest = null;
        Language lang = null;
        Group group = null;
        StringBuffer query = new StringBuffer(400);
        query.append(" SELECT c.contest_id");
        query.append(" ,c.name");
        query.append(" ,c.start_date");
        query.append(" ,c.end_date");
        query.append(" ,c.status");
        query.append(" ,l.language_id");
        query.append(" ,l.language_name");
        query.append(" ,g.group_id");
        query.append(" ,g.group_desc");
        query.append(" ,c.ad_text");
        query.append(" ,c.ad_start");
        query.append(" ,c.ad_end");
        query.append(" FROM group g");
        query.append(" ,language l");
        query.append(" ,contest c");
        query.append(" WHERE g.group_id = c.group_id");
        query.append(" AND l.language_id = c.language_id");
        query.append(" AND (c.status = 'A'");
        query.append(" OR c.status = 'P')");
        query.append(" ORDER BY c.start_date");

        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                contest = new Contest();
                lang = contest.getLanguage();
                group = contest.getGroup();
                contest.setContestId(rs.getInt(1));
                contest.setContestName(rs.getString(2));
                contest.setContestStart(rs.getDate(3));
                contest.setContestEnd(rs.getDate(4));
                contest.setContestStartTimestamp(rs.getTimestamp(3));
                contest.setContestEndTimestamp(rs.getTimestamp(4));
                contest.setStatus(rs.getString(5));
                lang.setLanguageId(rs.getInt(6));
                lang.setName(rs.getString(7));
                group.setGroupId(rs.getInt(8));
                group.setGroupDesc(rs.getString(9));
                contest.setAdText(rs.getString(10));
                contest.setAdStart(rs.getDate(11));
                contest.setAdEnd(rs.getDate(12));
                results.add(contest);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popContests: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:popContests:query: Error:\n" + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return results;
    }


    public ArrayList getNotifications() throws TCException {
        try {
            log.debug("EJB DataCacheBean getNotifications called.");
            if (!this.notificationsCached) {
                synchronized (this) {
                    this.notifications = popNotifications();
                    this.notificationsCached = true;
                }
            }
        } catch (Exception e) {
            throw new TCException("ejb.DataCache:getNotifications:ERROR:\n" + e);
        }
        return this.notifications;
    }


    private ArrayList popNotifications() throws TCException {
        log.debug("EJB DataCacheBean popNotifications called.");
        Connection conn = null;  //conn stands for schools connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(7);
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(375);
            /*************************************************************************************/
            query.append(" SELECT");
            query.append(" notify_id");
            query.append(" ,name");
            query.append(" ,sort");
            query.append(" FROM");
            query.append(" notify_lu");
            query.append(" WHERE");
            query.append(" status = 'A'");
            query.append(" ORDER BY");
            query.append(" sort");
            /*************************************************************************************/
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                Notify notify = new Notify();
                notify.setNotifyId(rs.getInt(1));
                notify.setName(rs.getString(2));
                notify.setSort(rs.getInt(3));
                result.add(notify);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popNotifications: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB DataCacheBean getNotifications error: " + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public ArrayList getSchools() throws TCException {
        try {
            log.debug("EJB DataCacheBean getSchools called.");
            if (!this.schoolsCached) {
                synchronized (this) {
                    this.schools = popSchools();
                    this.schoolsCached = true;
                }
            }
        } catch (Exception e) {
            throw new TCException("ejb.DataCache:getSchools:ERROR:\n" + e);
        }
        return this.schools;
    }


    private ArrayList popSchools() throws TCException {
        log.debug("EJB DataCacheBean popSchools called.");
        Connection conn = null;  //conn stands for schools connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(1710);
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(375);
            /*************************************************************************************/
            /********************************** Informix *****************************************/
            /*************************************************************************************/
            query.append(" SELECT sc.school_id");
            query.append(" ,sc.name");
            query.append(" ,sc.sort_letter");
            query.append(" ,sc.city");
            query.append(" ,sc.state_code");
            query.append(" ,st.state_name");
            query.append(" ,st.demographic_decline");
            query.append(" ,sc.country_code");
            query.append(" ,co.country_name");
            query.append(" ,co.participating");
            query.append(" FROM school sc");
            query.append(" ,state st");
            query.append(" ,country co");
            query.append(" WHERE sc.school_id != 0");
            query.append(" AND sc.user_id = 0");
            query.append(" AND sc.state_code = st.state_code");
            query.append(" AND sc.country_code = co.country_code");
            query.append(" ORDER BY sc.sort_letter");
            /*************************************************************************************/
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                School school = new School();
                State state = school.getState();
                Country country = school.getCountry();
                school.setSchoolId(rs.getInt(1));
                school.setName(rs.getString(2));
                school.setSortLetter(rs.getString(3));
                school.setCity(rs.getString(4));
                state.setStateCode(rs.getString(5));
                state.setStateName(rs.getString(6));
                state.setDemographicDecline(rs.getInt(7));
                country.setCountryCode(rs.getString(8));
                country.setCountryName(rs.getString(9));
                country.setParticipating(rs.getInt(10));
                school.setModified("S");
                result.add(school);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popSchools: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB SchoolsBean getSchools error: " + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }



    public ArrayList getDemographicAssignments(int coderTypeId) throws TCException {
        ArrayList result = null;
        try {
            log.debug("EJB DataCacheBean getDemographicAssignments called.");
            if (!this.demographicAssignmentsCached) {
                synchronized (this) {
                    this.demographicAssignments = popDemographicAssignments();
                    this.demographicAssignmentsCached = true;
                }
            }
            int size = this.demographicAssignments.size();
            boolean found = false;
            for (int i = 0; i < size; i++) {
                DemographicAssignment da = (DemographicAssignment) this.demographicAssignments.get(i);
                if (da.getCoderType().getCoderTypeId() == coderTypeId) {
                    if (result == null) {
                        result = new ArrayList(size);
                        found = true;
                    }
                    result.add(da);
                }
            }
            if (found) result.trimToSize();
        } catch (Exception e) {
            throw new TCException("ejb.DataCache:getDemographicAssignments:ERROR:\n" + e);
        }
        return result;
    }


    private ArrayList popDemographicAssignments() throws TCException {
        log.debug("EJB DataCacheBean popDemographicAssignments called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList();
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(250);
            query.append(" SELECT");
            query.append(" a.demographic_question_id");
            query.append(" ,q.demographic_question_text");
            query.append(" ,q.demographic_question_desc");
            query.append(" ,q.selectable");
            query.append(" ,a.coder_type_id");
            query.append(" ,t.coder_type_desc");
            query.append(" ,a.sort");
            query.append(" FROM ");
            query.append(" demographic_assignment a");
            query.append(" ,demographic_question q");
            query.append(" ,coder_type t");
            query.append(" WHERE ");
            query.append(" a.status = 'A'");
            query.append(" AND a.demographic_question_id = q.demographic_question_id");
            query.append(" AND a.coder_type_id = t.coder_type_id");
            query.append(" ORDER BY");
            query.append(" a.sort");
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                DemographicAssignment da = new DemographicAssignment();
                int questionId = rs.getInt(1);
                da.getDemographicQuestion().setDemographicQuestionId(questionId);
                da.getDemographicQuestion().setDemographicQuestionText(rs.getString(2));
                da.getDemographicQuestion().setDemographicQuestionDesc(rs.getString(3));
                da.getDemographicQuestion().setSelectable(rs.getString(4));
                ArrayList demographicAnswers = da.getDemographicQuestion().getDemographicAnswers();
                popDemographicAnswers(conn, demographicAnswers, questionId);
                da.getCoderType().setCoderTypeId(rs.getInt(5));
                da.getCoderType().setCoderTypeDesc(rs.getString(6));
                da.setSort(rs.getInt(7));
                da.setStatus("A");
                result.add(da);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(
                    "ejb.DataCache.DataCacheBean:popDemographicAssignments: ERROR \n " + sqe.getMessage()
            );
        } catch (Exception e) {
            throw new TCException(
                    "ejb.DataCache.DataCacheBean:popDemographicAssignments:ERROR:" + e.getMessage()
            );
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    private void popDemographicAnswers(Connection conn, ArrayList result, int questionId)
            throws TCException {
        log.debug("EJB DataCacheBean popDemographicAnswers called.");
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            StringBuffer query = new StringBuffer(200);
            query.append(" SELECT");
            query.append(" demographic_answer_id");
            query.append(" ,demographic_answer_text");
            query.append(" ,sort");
            query.append(" FROM");
            query.append(" demographic_answer");
            query.append(" WHERE");
            query.append(" status = 'A'");
            query.append(" AND demographic_question_id = ?");
            query.append(" ORDER BY");
            query.append(" sort");
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, questionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                DemographicAnswer da = new DemographicAnswer();
                da.setDemographicQuestionId(questionId);
                da.setDemographicAnswerId(rs.getInt(1));
                da.setDemographicAnswerText(rs.getString(2));
                da.setStatus("A");
                result.add(da);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(
                    "ejb.DataCache.DataCacheBean:popDemographicAnswers:questionId=" + questionId + ":ERROR \n " + sqe.getMessage()
            );
        } catch (Exception e) {
            throw new TCException(
                    "ejb.DataCache.DataCacheBean:popDemographicAnswers:questionId=" + questionId + ":ERROR:" + e.getMessage()
            );
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }



    public ArrayList getCountries() throws TCException {
        log.debug("EJB DataCacheBean getCountries called.");
        if (!this.countriesCached) {
            this.countries = popCountries();
            this.countriesCached = true;
        }
        return this.countries;
    }


    private ArrayList popCountries() throws TCException {
        log.debug("EJB DataCacheBean popCountries called.");
        Connection conn = null;  //conn stands for countries connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(250);
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(200);
            /*************************************************************************************/
            /********************************** Informix *****************************************/
            /*************************************************************************************/
            query.append(" SELECT country_code");
            query.append(" ,SUBSTR(country_name,1,18)");
            query.append(" ,participating");
            query.append(" FROM country");
            query.append(" WHERE country_code!=''");
            query.append(" ORDER BY 2");
            /*************************************************************************************/
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                Country country = new Country();
                country.setCountryCode(rs.getString(1));
                country.setCountryName(rs.getString(2));
                country.setParticipating(rs.getInt(3));
                result.add(country);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popCountries: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB DatCacheBean getCountries error: " + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }





    public ArrayList getStates() throws TCException {
        log.debug("EJB DataCacheBean getStates called.");
        try {
            if (!this.statesCached) {
                synchronized (this) {
                    this.states = popStates();
                    this.statesCached = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.states;
    }


    private ArrayList popStates() throws TCException {
        log.debug("EJB DataCacheBean popStates called.");
        Connection conn = null;  //conn stands for states connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(60);
        try {
            conn = DBMS.getConnection(); //st stansds for state connection
            StringBuffer query = new StringBuffer(200);
            /*************************************************************************************/
            /********************************** Informix *****************************************/
            /*************************************************************************************/
            query.append(" SELECT state_code");
            query.append(" ,state_name");
            query.append(" ,demographic_decline");
            query.append(" FROM state");
            query.append(" WHERE state_code != ''");
            query.append(" ORDER BY state_name");
            /*************************************************************************************/
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                State state = new State();
                state.setStateCode(rs.getString(1));
                state.setStateName(rs.getString(2));
                state.setDemographicDecline(rs.getInt(3));
                result.add(state);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popStates: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB DatCacheBean getStates error: " + e);
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
            }
        }
        return result;
    }




    public ArrayList getReferrals() throws TCException {
        log.debug("ejb.DataCacheBean:getReferrals:called.");
        if (!this.referralTypesCached) {
            synchronized (this) {
                this.referralTypes = popReferrals();
                this.referralTypesCached = true;
            }
        }
        return this.referralTypes;
    }


    private ArrayList popReferrals() throws TCException {
        log.debug("ejb.DataCacheBean:popReferrals:called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(10);
        StringBuffer query = null;
        try {
            conn = DBMS.getConnection();
            /*************************************************************************************/
            /********************************** Informix *****************************************/
            /*************************************************************************************/
            query = new StringBuffer(200);
            query.append(" SELECT");
            query.append(" referral_id");
            query.append(" ,referral_desc");
            query.append(" ,sort");
            query.append(" ,status_id");
            query.append(" FROM");
            query.append(" referral");
            query.append(" WHERE");
            query.append(" status_id = ?");
            query.append(" ORDER BY");
            query.append(" sort");
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, Referral.ACTIVE);
            rs = ps.executeQuery();
            while (rs.next()) {
                Referral referral = new Referral();
                referral.setReferralId(rs.getInt(1));
                referral.setReferralDesc(rs.getString(2));
                referral.setSort(rs.getInt(3));
                referral.setStatusId(rs.getInt(4));
                result.add(referral);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popReferrals: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "ejb.DatCacheBean:popReferrals:ERROR:" + e.getMessage()
            );
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public ArrayList getJobTypes() throws TCException {
        log.debug("ejb.DataCacheBean:getJobTypes:called.");
        if (!this.jobTypesCached) {
            synchronized (this) {
                this.jobTypes = popJobTypes();
                this.jobTypesCached = true;
            }
        }
        return this.jobTypes;
    }


    private ArrayList popJobTypes() throws TCException {
        log.debug("ejb.DataCacheBean:popJobTypes:called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(5);
        String query = null;
        try {
            conn = DBMS.getConnection();
            query = "SELECT job_type_id, job_type_desc FROM job_type_lu ORDER BY job_type_desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                JobType job = new JobType();
                job.setJobTypeId(rs.getInt(1));
                job.setJobTypeDesc(rs.getString(2));
                result.add(job);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popJobTypes: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "ejb.DatCacheBean:popJobTypes:ERROR:" + e.getMessage()
            );
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public ArrayList getEditors() throws TCException {
        log.debug("ejb.DataCacheBean:getEditors:called.");
        if (!this.editorTypesCached) {
            synchronized (this) {
                this.editorTypes = popEditors();
                this.editorTypesCached = true;
            }
        }
        return this.editorTypes;
    }


    private ArrayList popEditors() throws TCException {
        log.debug("ejb.DataCacheBean:popEditors:called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(5);
        String query = null;
        try {
            conn = DBMS.getConnection();
            query = "SELECT editor_id, editor_desc FROM editor ORDER BY editor_desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Editor editorType = new Editor();
                editorType.setEditorId(rs.getInt(1));
                editorType.setEditorDesc(rs.getString(2));
                result.add(editorType);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popEditors: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(
                    "ejb.DatCacheBean:popEditors:ERROR:" + e.getMessage()
            );
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }



    /**
     ************************
     * Begin Degrees Code
     */
    public ArrayList getDegrees() throws TCException {
        log.debug("EJB DataCacheBean getDegrees called.");
        if (!this.degreeLevelsCached) {
            synchronized (this) {
                this.degreeLevels = popDegrees();
                this.degreeLevelsCached = true;
            }
        }
        return this.degreeLevels;
    }

    /**
     ********************************************************************************************
     * The popDegrees method is a "thread safe method' which returns a ArrayList of all
     * degreeLevels data in the database and sets the degreeCached Instance variable to
     * true.
     ********************************************************************************************
     */
    private ArrayList popDegrees() throws TCException {
        log.debug("EJB DataCacheBean popDegrees called.");
        Connection conn = null;  //cconn stands for countries connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(10);
        String query = null;
        try {
            conn = DBMS.getConnection();
            query = "SELECT degree_id, degree_desc FROM degree";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Degree degree = new Degree();
                degree.setDegreeId(rs.getInt(1));
                degree.setDegreeDesc(rs.getString(2));
                result.add(degree);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popDegressLevels: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB DatCacheBean getDegrees error: " + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }



    /**
     *********************************************************************************************
     * getLanguages
     * Get the contest programming languages
     * @return ArrayList of the Languages
     * @throws TCException
     *********************************************************************************************
     */
    public ArrayList getLanguages() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:getLanguages:called.");
        if (!this.languagesCached) {
            synchronized (this) {
                this.languages = popLanguages();
                this.languagesCached = true;
            }
        }
        return this.languages;
    }


    private ArrayList popLanguages() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popLanguages:called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(3);
        try {
            conn = DBMS.getConnection();
            String query = null;
            query = "SELECT language_id, language_name, status FROM language WHERE status = 'Y' ORDER BY language_id";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Language language = new Language();
                language.setLanguageId(rs.getInt(1));
                language.setName(rs.getString(2));
                language.setStatus(rs.getString(3));
                result.add(language);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popLanguages: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:getLanguages:ERROR:" + e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }



    private int popMemberCount() throws TCException {
        PreparedStatement ps = null;
        int result = 0;
        ResultSet rs = null;
        Connection conn = null;
        try {
            conn = DBMS.getDWConnection();
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT COUNT(*)");
            query.append(" FROM coder c, rating cr");
            query.append(" WHERE c.status = 'A'");
            query.append(" AND c.coder_id = cr.coder_id");
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) {
                memberCountLastRefresh = Calendar.getInstance();
                result = rs.getInt(1);
            } else {
                throw new Exception("No Members in Data Warehouse!");
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popMemberCount: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


}
