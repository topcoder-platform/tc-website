package com.topcoder.ejb.DataCache;

import com.topcoder.common.web.constant.OLTP;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.TCException;
import com.topcoder.common.web.util.DateTime;
import com.topcoder.common.web.data.Group;
import com.topcoder.common.web.data.UserType;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.net.InetAddress;
import java.sql.*;
import java.util.*;


public class DataCacheBean extends BaseEJB {

    private static ArrayList notifications;
    private static ArrayList rounds;
    private static ArrayList coderTypes;
    private static ArrayList demographicAssignments;
    private static ArrayList sectorFiles;
    private static ArrayList titles;
    private static ArrayList organizations;
    private static ArrayList experienceTypes;
    private static ArrayList languages;
    private static ArrayList referralTypes;
    private static ArrayList jobTypes;
    private static ArrayList editorTypes;
    private static ArrayList newsItems;
    private static ArrayList schools;
    private static ArrayList countries;
    private static ArrayList states;
    private static ArrayList skills;
    private static ArrayList skillTypes;
    private static ArrayList degreeLevels;
    private static ArrayList contactSubjects;
    private static ArrayList coderRegions;
    private static ArrayList forums;
    private static ArrayList contests;
    private static HashMap roomresults;
    private static HashMap contestNavs;
    private static ArrayList roundProblems;

    private static boolean notificationsCached;
    private static boolean coderTypesCached;
    private static boolean demographicAssignmentsCached;
    private static boolean sectorFilesCached;
    private static boolean titlesCached;
    private static boolean organizationsCached;
    private static boolean experienceTypesCached;
    private static boolean languagesCached;
    private static boolean referralTypesCached;
    private static boolean jobTypesCached;
    private static boolean editorTypesCached;
    private static boolean newsItemsCached;
    private static boolean contestNavsCached;
    private static boolean contestsCached;
    private static boolean schoolsCached;
    private static boolean countriesCached;
    private static boolean statesCached;
    private static boolean skillsCached;
    private static boolean skillTypesCached;
    private static boolean degreeLevelsCached;
    private static boolean contactSubjectsCached;
    private static boolean coderRegionsCached;
    private static boolean forumsCached;
    private static boolean roomresultsCached;
    private static int problemCached;
    private static int contestCached;
    private static int memberCount;
    private static Calendar memberCountLastRefresh;
    private static final int MEMBER_COUNT_REFRESH_INTERVAL = 900000;
    private static boolean roundsCached;
    private static Calendar roundsLastRefresh;
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
     * @author Steve Burrows
     * @param integer of the total TopCoder member count.
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
            this.coderTypesCached = false;
            this.demographicAssignmentsCached = false;
            this.sectorFilesCached = false;
            this.titlesCached = false;
            this.organizationsCached = false;
            this.experienceTypesCached = false;
            this.languagesCached = false;
            this.degreeLevelsCached = false;
            this.referralTypesCached = false;
            this.jobTypesCached = false;
            this.editorTypesCached = false;
            this.contestNavsCached = false;
            this.contestsCached = false;
            this.newsItemsCached = false;
            this.schoolsCached = false;
            this.countriesCached = false;
            this.statesCached = false;
            this.skillsCached = false;
            this.skillTypesCached = false;
            this.contactSubjectsCached = false;
            this.coderRegionsCached = false;
            this.forumsCached = false;
            this.problemCached = 0;
            this.roundProblems = new ArrayList();
            this.contestCached = 0;
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


    public void resetCoderTypes() throws TCException {
        log.debug("EJB DataCacheBean resetCoderTypes called.");
        synchronized (this) {
            this.coderTypesCached = false;
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


    public void resetSectorFiles() throws TCException {
        log.debug("EJB DataCacheBean resetSectorFiles called.");
        synchronized (this) {
            this.sectorFilesCached = false;
        }
    }


    public void resetTitles() throws TCException {
        log.debug("EJB DataCacheBean resetTitles called.");
        synchronized (this) {
            this.titlesCached = false;
        }
    }

    public void resetOrganizations() throws TCException {
        log.debug("EJB DataCacheBean resetOrganizations called.");
        synchronized (this) {
            this.organizationsCached = false;
        }
    }

    public void resetExperienceTypes() throws TCException {
        log.debug("EJB DataCacheBean resetExperienceTypes called.");
        synchronized (this) {
            this.experienceTypesCached = false;
        }
    }


    public void resetLanguages() throws TCException {
        log.debug("EJB DataCacheBean resetLanguages called.");
        synchronized (this) {
            this.languagesCached = false;
        }
    }


    public void resetContactSubjects() throws TCException {
        log.debug("EJB DataCacheBean resetContactSubjects called.");
        synchronized (this) {
            this.contactSubjectsCached = false;
        }
    }


    public void resetDegrees() throws TCException {
        log.debug("EJB DataCacheBean resetDegrees called.");
        synchronized (this) {
            this.degreeLevelsCached = false;
        }
    }


    public void resetSkills() throws TCException {
        log.debug("EJB DataCacheBean resetSkills called.");
        synchronized (this) {
            this.skillsCached = false;
        }
    }


    public void resetSkillTypes() throws TCException {
        log.debug("EJB DataCacheBean resetSkillTypes called.");
        synchronized (this) {
            this.skillTypesCached = false;
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


    public void resetForums() throws TCException {
        log.debug("EJB DataCacheBean resetForums called.");
        synchronized (this) {
            this.forumsCached = false;
        }
    }


    public void resetCoderRegions() throws TCException {
        log.debug("EJB DataCacheBean resetCoderRegions called.");
        synchronized (this) {
            this.coderRegionsCached = false;
        }
    }


    public void resetCountries() throws TCException {
        log.debug("EJB DataCacheBean resetCountries called.");
        synchronized (this) {
            this.countriesCached = false;
        }
    }


    public void resetNewsItems() throws TCException {
        log.debug("ejb.DataCacheBean:resetNewsItems:called.");
        synchronized (this) {
            this.newsItemsCached = false;
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


    public ArrayList getCoderTypes() throws TCException {
        try {
            log.debug("EJB DataCacheBean getCoderTypes called.");
            if (!this.coderTypesCached) {
                synchronized (this) {
                    this.coderTypes = popCoderTypes();
                    this.coderTypesCached = true;
                }
            }
        } catch (Exception e) {
            throw new TCException("ejb.DataCache:getCoderTypes:ERROR:\n" + e);
        }
        return this.coderTypes;
    }


    private ArrayList popCoderTypes() throws TCException {
        log.debug("EJB DataCacheBean popCoderTypes called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(5);
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(200);
            query.append(" SELECT");
            query.append(" coder_type_id");
            query.append(" ,coder_type_desc");
            query.append(" FROM ");
            query.append(" coder_type");
            query.append(" WHERE ");
            query.append(" status = 'A'");
            query.append(" ORDER BY");
            query.append(" coder_type_id");
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                CoderType coderType = new CoderType();
                coderType.setCoderTypeId(rs.getInt(1));
                coderType.setCoderTypeDesc(rs.getString(2));
                coderType.setStatus("A");
                result.add(coderType);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(
                    "ejb.DataCache.DataCacheBean:popCoderTypes:ERROR:\n" + sqe.getMessage()
            );
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:popCoderTypes:ERROR:" + e);
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


    public ArrayList getNewsItems() throws TCException {
        try {
            log.debug("EJB DataCacheBean getNewsItems called.");
            if (!this.newsItemsCached) {
                synchronized (this) {
                    this.newsItems = popNewsItems();
                    this.newsItemsCached = true;
                }
            }
        } catch (Exception e) {
            throw new TCException("ejb.DataCache:getNewsItems:ERROR:\n" + e);
        }
        return this.newsItems;
    }


    private ArrayList popNewsItems() throws TCException {
        log.debug("EJB DataCacheBean popNewsItems called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList();
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer(250);
            query.append(" SELECT");
            query.append(" news_id");
            query.append(" ,news_type_id");
            query.append(" ,headline");
            query.append(" ,news");
            query.append(" ,new_posting");
            query.append(" ,posting_date");
            query.append(" ,status");
            query.append(" FROM ");
            query.append(" news");
            query.append(" WHERE ");
            query.append(" status = 'A'");
            query.append(" ORDER BY");
            query.append(" posting_date DESC");
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setNewsId(rs.getInt(1));
                news.setNewsTypeId(rs.getString(2));
                news.setHeadline(rs.getString(3));
                news.setNews(DBMS.getTextString(rs, 4));
                news.setNewPosting(rs.getString(5));
                news.setPostingDate(rs.getTimestamp(6));
                news.setStatus(rs.getString(7));
                news.setModified("S");
                result.add(news);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popNewsItems: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB SchoolsBean getNewsItems error:" + e);
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


    public ArrayList getCoderRegions() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:getCoderRegions:called");
        if (!this.coderRegionsCached) {
            this.coderRegions = popCoderRegions();
            this.coderRegionsCached = true;
        }
        return this.coderRegions;
    }


    private ArrayList popCoderRegions() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popCoderRegions:called");
        Connection conn = null;  //conn stands for regions connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(10);
        try {
            conn = DBMS.getConnection(); //st stansds for state connection
            StringBuffer query = new StringBuffer(500);
            /*************************************************************************************/
            /********************************** Informix *****************************************/
            /*************************************************************************************/
            query.append(" SELECT u.user_type_desc");
            query.append(" ,TRIM(rs.region_code)");
            query.append(" ,r.region_name");
            query.append(" ,r.country_code");
            query.append(" ,c.country_name");
            query.append(" ,c.participating");
            query.append(" ,rs.state_code");
            query.append(" ,s.state_name");
            query.append(" ,s.demographic_decline");
            query.append(" FROM regional_state rs");
            query.append(" ,region r");
            query.append(" ,country c");
            query.append(" ,state s");
            query.append(" ,user_type u");
            query.append(" WHERE rs.user_type_id = ?");
            query.append(" AND rs.region_code = r.region_code");
            query.append(" AND r.country_code = c.country_code");
            query.append(" AND rs.state_code = s.state_code");
            query.append(" AND rs.user_type_id = u.user_type_id");
            query.append(" ORDER BY r.region_name");
            query.append(" ,s.state_name");
            /*************************************************************************************/
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, OLTP.CODER_USER_TYPE_ID);
            rs = ps.executeQuery();
            String previousRegionCode = "";
            RegionState regionState = null;
            ArrayList states = null;
            while (rs.next()) {
                String regionCode = rs.getString(2);
                if (!regionCode.equals(previousRegionCode)) {
                    if (!previousRegionCode.equals("")) {
                        result.add(regionState);
                    }
                    previousRegionCode = regionCode;
                    regionState = new RegionState();
                    states = regionState.getStates();
                    UserType userType = regionState.getUserType();
                    Region region = regionState.getRegion();
                    Country country = region.getCountry();
                    userType.setUserTypeId(OLTP.CODER_USER_TYPE_ID);
                    userType.setUserTypeDesc(rs.getString(1));
                    userType.setModified("S");
                    region.setRegionCode(regionCode);
                    region.setRegionName(rs.getString(3));
                    country.setCountryCode(rs.getString(4));
                    country.setCountryName(rs.getString(5));
                    country.setParticipating(rs.getInt(6));
                }
                State state = new State();
                state.setStateCode(rs.getString(7));
                state.setStateName(rs.getString(8));
                state.setDemographicDecline(rs.getInt(9));
                states.add(state);
            }
            result.add(regionState);
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popCoderRegions: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB DatCacheBean getCoderRegions error: " + e);
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


    public ArrayList getForums() throws TCException {
        log.debug("EJB DataCacheBean getForums called.");
        if (!this.forumsCached) {
            synchronized (this) {
                this.forums = popForums();
                this.forumsCached = true;
            }
        }
        return this.forums;
    }


    private ArrayList popForums() throws TCException {
        log.debug("EJB DataCacheBean popForums called.");
        Connection conn = null;  //conn stands for forums connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(10);
        StringBuffer sqlStr = new StringBuffer(49);
        try {
            conn = DBMS.getConnection();
            sqlStr.append("SELECT forumid, name, description FROM jiveforum");
            ps = conn.prepareStatement(sqlStr.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                Forum forum = new Forum();
                forum.setForumId(rs.getInt(1));
                forum.setForumName(rs.getString(2));
                forum.setForumDescription(rs.getString(3));
                result.add(forum);
            }
            if (result != null) result.trimToSize();
        } catch (Exception e) {
            throw new TCException("EJB DatCacheBean getForums error: " + e);
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


    public ArrayList getSkills() throws TCException {
        log.debug("EJB DataCacheBean getSkills called.");
        if (!this.skillsCached) {
            synchronized (this) {
                this.skills = popSkills();
                this.skillsCached = true;
            }
        }
        return this.skills;
    }


    private ArrayList popSkills() throws TCException {
        log.debug("EJB DataCacheBean popSkills called.");
        Connection skconn = null;  //skconn stands for skills connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(100);
        try {
            skconn = DBMS.getConnection(); //sk stands for skills connection
            StringBuffer query = new StringBuffer(222);
            query.append("SELECT s.skill_id");                                     //1
            query.append(" ,s.skill_type_id");                               //2
            query.append(" ,s.skill_desc");                                  //3
            query.append(" ,LOWER(s.skill_desc) AS lower_skill_desc");       //4
            query.append(" ,s.status");                                      //5
            query.append(" ,s.skill_order");                                 //6
            query.append(" ,t.skill_type_id");                               //7
            query.append(" ,t.skill_type_desc");                             //8
            query.append(" ,t.skill_type_order");                            //9
            query.append(" ,t.status");                                      //10
            query.append(" FROM skill s");
            query.append(" ,skill_type t");
            query.append(" WHERE s.skill_type_id = t.skill_type_id");
            query.append(" ORDER BY");
            query.append(" t.skill_type_id");
            query.append(" ,lower_skill_desc");
            ps = skconn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                Skill skill = new Skill();
                skill.setSkillId(rs.getInt(1));
                SkillType skilltype = new SkillType();
                skilltype.setSkillTypeId(rs.getInt(2));
                skilltype.setSkillTypeDesc(rs.getString(8));
                skilltype.setSkillTypeOrder(rs.getInt(9));
                skilltype.setActiveInd(rs.getString(10));
                skill.setSkillType(skilltype);
                skill.setSkillDesc(rs.getString(3));
                skill.setSkillOrder(rs.getInt(6));
                skill.setActiveInd(rs.getString(5));
                result.add(skill);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popSkills: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB SkillsBean getSkills error: " + e);
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
                if (skconn != null) skconn.close();
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


    public ArrayList getSkillTypes() throws TCException {
        log.debug("EJB DataCacheBean getSkillTypes called.");
        if (!this.skillTypesCached) {
            synchronized (this) {
                this.skillTypes = popSkillTypes();
                this.skillTypesCached = true;
            }
        }
        return this.skillTypes;
    }


    private ArrayList popSkillTypes() throws TCException {
        log.debug("EJB DataCacheBean popSkillTypes called.");
        Connection conn = null;  //conn stands for skillTypes connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(10);
        try {
            conn = DBMS.getConnection();
            StringBuffer query = new StringBuffer();
            query.append(" SELECT skill_type_id");
            query.append(" ,skill_type_desc");
            query.append(" ,skill_type_order");
            query.append(" ,status");
            query.append(" FROM skill_type");
            query.append("  ORDER BY skill_type_desc");

            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                SkillType skillTypes = new SkillType();
                skillTypes.setSkillTypeId(rs.getInt(1));
                skillTypes.setSkillTypeDesc(rs.getString(2));
                skillTypes.setSkillTypeOrder(rs.getInt(3));
                skillTypes.setActiveInd(rs.getString(4));
                result.add(skillTypes);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popSkillTypes: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB DatCacheBean popSkillTypes error: " + e);
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
     ************************
     * Begin ContactSubjects Code
     */

    public ArrayList getContactSubjects() throws TCException {
        log.debug("EJB DataCacheBean getContactSubjects called.");
        if (!this.contactSubjectsCached) {
            synchronized (this) {
                this.contactSubjects = popContactSubjects();
                this.contactSubjectsCached = true;
            }
        }
        return this.contactSubjects;
    }

    /**
     ***********************************************************************************************
     * The popContactSubjects method is a "thread safe method' which returns a ArrayList of all
     * contactSubjects data in the database and sets the contactSubjectsCached Instance variable to
     * true.
     ***********************************************************************************************
     */
    private ArrayList popContactSubjects() throws TCException {
        log.debug("EJB DataCacheBean popContactSubjects called.");
        Connection conn = null;  //conn stands for contactSubjects connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(6);
        try {
            conn = DBMS.getConnection();
            String query = null;
            query = "SELECT contact_us_subject_id, subject_desc, status FROM contact_us_subject";

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ContactSubject contactsubject = new ContactSubject();
                contactsubject.setContactSubjectId(rs.getInt(1));
                contactsubject.setSubjectDesc(rs.getString(2));
                contactsubject.setActiveInd(rs.getString(3));
                result.add(contactsubject);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popContactSubjects: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("EJB DatCacheBean getContactSubjects error:" + e);
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
     * @author Steve Burrows
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


    /*********************************************************************************************
     * getSectorFiles
     * Get the secure files available for download to those given access.
     * @author Steve Burrows
     * @return ArrayList of the secure files available for download to those given access
     * @throws TCException
     *********************************************************************************************
     */
    public ArrayList getSectorFiles() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:getSectorFiles:called.");
        if (!this.sectorFilesCached) {
            synchronized (this) {
                this.sectorFiles = popSectorFiles();
                this.sectorFilesCached = true;
            }
        }
        return this.sectorFiles;
    }


    /*********************************************************************************************
     * getTitles
     * Get the experience job titles
     * @author Steve Burrows
     * @return ArrayList of the Job Titles
     * @throws TCException
     *********************************************************************************************
     */
    public ArrayList getTitles() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:getTitles:called.");
        if (!this.titlesCached) {
            synchronized (this) {
                this.titles = popTitles();
                this.titlesCached = true;
            }
        }
        return this.titles;
    }

    /*********************************************************************************************
     * getOrganizations
     * Get the organizations coders belong to
     * @author Steve Burrows
     * @return ArrayList of Organizations
     * @throws TCException
     *********************************************************************************************
     */
    public ArrayList getOrganizations() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:getOrganizations:called.");
        if (!this.organizationsCached) {
            synchronized (this) {
                this.organizations = popOrganizations();
                this.organizationsCached = true;
            }
        }
        return this.organizations;
    }

    /*********************************************************************************************
     * getExperienceTypes
     * Get the types of experience for coders (work, clubs...)
     * @author Steve Burrows
     * @return ArrayList of ExperienceTypes
     * @throws TCException
     *********************************************************************************************
     */
    public ArrayList getExperienceTypes() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:getExperienceTypes:called.");
        if (!this.experienceTypesCached) {
            synchronized (this) {
                this.experienceTypes = popExperienceTypes();
                this.experienceTypesCached = true;
            }
        }
        return this.experienceTypes;
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


    private ArrayList popSectorFiles() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popSectorFiles:called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(20);
        try {
            conn = DBMS.getConnection();
            String query = "SELECT sector_id, file, system FROM sector_file WHERE status = 'A'";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                SectorFile sectorFile = new SectorFile();
                sectorFile.setSectorId(rs.getInt(1));
                sectorFile.setName(rs.getString(2));
                sectorFile.setSystem(rs.getString(3));
                sectorFile.setStatus("A");
                result.add(sectorFile);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popSectorFiles: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:popSectorFiles:ERROR:" + e);
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


    private ArrayList popTitles() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popTitles:called.");
        Connection conn = null;  //conn stands for contactTitles connection
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(80);
        try {
            conn = DBMS.getConnection();
            String query = "SELECT title_id, title_desc, title FROM title WHERE title_id > 0";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Title title = new Title();
                title.setTitleId(rs.getInt(1));
                title.setTitleDesc(rs.getString(2));
                title.setTitle(rs.getString(3));
                result.add(title);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popTitles: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:popTitles:ERROR:" + e);
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

    private ArrayList popOrganizations() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popOrganizations:called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(80);
        try {
            conn = DBMS.getConnection(); //get connection from the pool
            String query = "SELECT organization_id, organization_desc, organization FROM organization WHERE organization_id > 0";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Organization organization = new Organization();
                organization.setOrganizationId(rs.getInt(1));
                organization.setOrganizationDesc(rs.getString(2));
                organization.setOrganization(rs.getString(3));
                result.add(organization);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popOrganizations: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:popOrganizations:ERROR:" + e);
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

    private ArrayList popExperienceTypes() throws TCException {
        log.debug("ejb.DataCache.DataCacheBean:popExperienceTypes:called.");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList(3);
        try {
            conn = DBMS.getConnection();
            String query = "SELECT experience_type_id, experience_type_desc FROM experience_type_lu WHERE experience_type_id > 0";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ExperienceType experienceType = new ExperienceType();
                experienceType.setExperienceTypeId(rs.getInt(1));
                experienceType.setExperienceTypeDesc(rs.getString(2));
                result.add(experienceType);
            }
            if (result != null) result.trimToSize();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException("ejb.DataCache.DataCacheBean:popExperienceTypes: ERROR \n " + sqe.getMessage());
        } catch (Exception e) {
            throw new TCException("ejb.DataCache.DataCacheBean:popExperienceTypes:ERROR:" + e);
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
