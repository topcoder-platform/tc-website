package com.topcoder.dde.util.DWLoad;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.config.UnknownNamespaceException;

import javax.naming.Context;
import java.sql.*;
import java.util.Calendar;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;

//import com.topcoder.netCommon.contest.*;
//import com.topcoder.server.common.*;

public class ReliabilityRating {

    public static final String DRIVER_KEY = "DriverClass";
    public static final String CONNECTION_URL_KEY = "ConnectionURL";
    public static final String HISTORY_LENGTH_KEY = "HistoryLength";
    public static final int MIN_PASSING_SCORE = 70;
    public static final int MIN_RELIABLE_SCORE = 70;

    /**
     * the date when the new rules go into effect
     */
    public static final Date START_DATE = getDate(2005, Calendar.OCTOBER, 5, 9, 0);


    public static void main(String[] args) {
        ReliabilityRating tmp = new ReliabilityRating();

        //Load our configuration
        String namespace = ReliabilityRating.class.getName();
        ConfigManager config = ConfigManager.getInstance();
        String historyLength;
        if (!config.existsNamespace(namespace)) {
            try {
                config.add(namespace, ConfigManager.CONFIG_XML_FORMAT);
            } catch (ConfigManagerException cme) {
                System.err.println("Couldn't add " + namespace.replace('.', '/') + ".xml to namespace");
                return;
            }
        } else {
            try {
                config.refresh(namespace);
            } catch (ConfigManagerException cme) {
                System.err.println("Exception while refreshing namespace: " + namespace);
                return;
            }
        }

        String jdbcDriver;
        String connectionURL;
        try {
            jdbcDriver = config.getString(namespace, DRIVER_KEY);
            connectionURL = config.getString(namespace, CONNECTION_URL_KEY);
            historyLength = config.getString(namespace, HISTORY_LENGTH_KEY);
            if (jdbcDriver == null) {
                System.err.println("No JDBC Driver specified.  (Config param '" + DRIVER_KEY + "')");
                return;
            }

            if (connectionURL == null) {
                System.err.println("No Connection URL specified.  (Config param '" + CONNECTION_URL_KEY + "')");
                return;
            }
        } catch (UnknownNamespaceException e) {
            System.err.println("Initialized ConfigManager and namespace '" + namespace + "' without trouble but could not retrieve resource bundle");
            return;
        }

        Connection c = null;
        try {
            Class.forName(jdbcDriver);
            c = DriverManager.getConnection(connectionURL);
            c.setAutoCommit(true);

            Set developers = tmp.getIncludedUsers(c, 113);
            Set designers = tmp.getIncludedUsers(c, 112);
            int newMarked = tmp.markNewReliableResults(c);
            int oldMarked = tmp.markOldReliableResults(c);
            int oldUpdated = tmp.updateOldProjectResult(c);
            int designersUpdated = tmp.updateReliability(c, designers, Integer.parseInt(historyLength), 112);
            int developersUpdated = tmp.updateReliability(c, developers, Integer.parseInt(historyLength), 113);

            System.out.println(newMarked + " new records marked");
            System.out.println(oldMarked + " new records marked");
            System.out.println(oldUpdated + " old project result records updated");
            System.out.println(designersUpdated + " designer records updated");
            System.out.println(developersUpdated + " developer records updated");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (c != null) c.close();
            } catch (Exception e1) {
                System.out.println("exception B: " + e1);
            }
        }
    }

    private static final String updateProjectResult =
            "UPDATE project_result SET old_reliability = ?, new_reliability = ? " +
            " WHERE project_id = ? and user_id = ? ";

    private static final String updateUserReliability =
            "update user_reliability set rating = ? where user_id = ? and phase_id = ?";

    private static final String insertUserReliability =
            "insert into user_reliability (rating, user_id, phase_id) values (?,?,?)";


    /**
     * go through the list of users and do two things.
     * 1.  update project result with reliability information
     * 2.  update user_reliability with current data
     * @param conn
     * @param users
     * @return
     */
    public int updateReliability(Connection conn, Set users, int historyLength, long phaseId) throws SQLException {
        int ret = 0;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        PreparedStatement insert = null;
        PreparedStatement update = null;
        ResultSet rs = null;

        try {

            ps = conn.prepareStatement(reliabilityData);
            ps2 = conn.prepareStatement(updateProjectResult);
            insert = conn.prepareStatement(insertUserReliability);
            update = conn.prepareStatement(updateUserReliability);

            long userId = 0;
            for (Iterator it = users.iterator(); it.hasNext();) {
                try {
                    userId = ((Long) it.next()).longValue();
                    ReliabilityHistory rh = new ReliabilityHistory(conn, userId, phaseId, historyLength);

                    ReliabilityInstance instance = null;
                    for (Iterator records = rh.getHistory(); records.hasNext();) {
                        instance = (ReliabilityInstance)records.next();
                        if (instance.isAfterStart()) {
                            ps2.clearParameters();
                            ps2.setDouble(1, instance.getRecentOldReliability());
                            ps2.setDouble(2, instance.getRecentNewReliability());
                            ps2.setLong(3, instance.getProjectId());
                            ps2.setLong(4, userId);
                            ps2.executeUpdate();
                        }
                    }
                    if (instance!=null) {
                        update.clearParameters();
                        update.setDouble(1, instance.getRecentNewReliability());
                        update.setLong(2, userId);
                        update.setLong(3, phaseId);
                        int num = update.executeUpdate();
                        if (num == 0) {
                            insert.clearParameters();
                            insert.setDouble(1, instance.getRecentNewReliability());
                            insert.setLong(2, userId);
                            insert.setLong(3, phaseId);
                            insert.executeUpdate();
                        }
                        System.out.println("reliability for " + userId + " set to " + instance.getRecentNewReliability());
                    }

                } finally {
                    close(rs);
                }
            }
        } finally {
            close(rs);
            close(ps);
            close(insert);
            close(update);
        }

        return ret;
    }

    private static final String reliabilityData =
            " select pr.reliable_submission_ind" +
            " , ci.create_time" +
            " , pr.project_id" +
            " , pi.start_date" +
            " from project_result pr" +
            " , component_inquiry ci" +
            " , phase_instance pi" +
            " where ci.project_id = pr.project_id" +
            " and pr.user_id = ci.user_id" +
            " and pr.user_id = ?" +
            " and ci.phase = ?" +
            " and pr.project_id = pi.project_id" +
            " and pi.cur_version = 1" +
            " and pi.phase_id = 1" +
            " and pr.reliability_ind = 1" +
            " order by ci.create_time asc";

    private class ReliabilityHistory {
        private List history = new ArrayList();

        private ReliabilityHistory(Connection conn, long userId, long phaseId, int historyLength) throws SQLException {

            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                ps = conn.prepareStatement(reliabilityData);
                ps.setLong(1, userId);
                ps.setLong(2, phaseId);
                rs = ps.executeQuery();
                while (rs.next()) {
                    history.add(new ReliabilityInstance(rs.getLong("project_id"),
                            userId, rs.getInt("reliable_submission_ind")==1, rs.getDate("start_date")));
                }

                if (!history.isEmpty()) {
                    ((ReliabilityInstance)history.get(0)).setFirst(true);
                }

                //calculate/populate reliabilities for the given history length. that means only incuode historyLength records
                ReliabilityInstance cur = null;
                double fullOldRel = 0.0d;
                double fullNewRel = 0.0d;
                int fullReliableCount = 0;
                for (int i=0; i<history.size(); i++) {
                    fullOldRel = fullNewRel;
                    if (((ReliabilityInstance)history.get(i)).isReliable()) {
                        fullReliableCount++;
                    }
                    fullNewRel = (double)fullReliableCount / (double) (i+1);

                    int window = 0;
                    double oldRel = 0.0d;
                    double newRel = 0.0d;
                    int reliableCount = 0;
                    for (int j=i; j>=0 && window<historyLength; j--,window++) {
                        cur = (ReliabilityInstance)history.get(j);
                        oldRel = newRel;
                        if (cur.reliable) {
                            reliableCount++;
                        }
                        newRel =(double)reliableCount / (double) (window+1);
                    }

                    ((ReliabilityInstance)history.get(i)).setRecentNewReliability(newRel);
                    ((ReliabilityInstance)history.get(i)).setRecentOldReliability(oldRel);
                    ((ReliabilityInstance)history.get(i)).setNewReliability(fullNewRel);
                    ((ReliabilityInstance)history.get(i)).setOldReliability(fullOldRel);
                }
            } finally {
                close(rs);
                close(ps);
            }

        }

        Iterator getHistory() {
            return history.iterator();
        }
    }

    private class ReliabilityInstance {
        private long projectId = 0;
        private long userId = 0;
        private boolean reliable = false;
        private boolean afterStart = false;
        private double oldReliability = 0.0d;
        private double newReliability = 0.0d;
        private double recentOldReliability = 0.0d;
        private double recentNewReliability = 0.0d;
        private boolean first = false;


        private ReliabilityInstance(long projectId, long userId, boolean reliable, Date start) {
            this.projectId = projectId;
            this.userId = userId;
            this.reliable = reliable;
            this.afterStart = !start.before(START_DATE);
        }

        public long getProjectId() {
            return projectId;
        }

        public long getUserId() {
            return userId;
        }

        public boolean isReliable() {
            return reliable;
        }

        public boolean isAfterStart() {
            return afterStart;
        }

        public double getOldReliability() {
            return oldReliability;
        }

        public void setOldReliability(double oldReliability) {
            this.oldReliability = oldReliability;
        }

        public double getRecentNewReliability() {
            return recentNewReliability;
        }

        public void setRecentNewReliability(double recentNewReliability) {
            this.recentNewReliability = recentNewReliability;
        }

        public double getNewReliability() {
            return newReliability;
        }

        public void setNewReliability(double newReliability) {
            this.newReliability = newReliability;
        }

        public double getRecentOldReliability() {
            return recentOldReliability;
        }

        public void setRecentOldReliability(double recentOldReliability) {
            this.recentOldReliability = recentOldReliability;
        }

        public boolean isFirst() {
            return first;
        }

        public void setFirst(boolean first) {
            this.first = first;
        }

    }

    private static final String oldReliabilityData =
            " select pr.reliable_submission_ind" +
            " , ci.create_time" +
            " , pr.project_id" +
            " from project_result pr" +
            " , component_inquiry ci" +
            " , phase_instance pi" +
            " where ci.project_id = pr.project_id" +
            " and pr.user_id = ci.user_id" +
            " and pr.user_id = ?" +
            " and pi.phase_id = 1" +
            " and pi.cur_version = 1" +
            " and pi.start_date < ?" +
            " and pi.project_id = pr.project_id" +
            " and pr.reliability_ind = 1" +
            " order by ci.create_time asc";

    private static final String oldReliabilityUsers =
            " select distinct pr.user_id" +
            " from project_result pr" +
            " , phase_instance pi" +
            " where pi.phase_id = 1" +
            " and pi.cur_version = 1" +
            " and pi.start_date < ?" +
            " and pi.project_id = pr.project_id" +
            " and pr.reliability_ind = 1";


    public int updateOldProjectResult(Connection conn) throws SQLException {
        int ret = 0;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        ResultSet rs = null;
        ResultSet rs3 = null;

        try {

            ps = conn.prepareStatement(oldReliabilityData);
            ps2 = conn.prepareStatement(updateProjectResult);
            ps3 = conn.prepareStatement(oldReliabilityUsers);
            ps3.setDate(1, START_DATE);
            rs3 = ps3.executeQuery();
            long userId = 0;
            while (rs3.next()) {
                try {
                    userId = rs3.getLong("user_id");
                    ps.clearParameters();
                    ps.setLong(1, userId);
                    rs = ps.executeQuery();
                    int projectCount = 0;
                    int reliableCount = 0;
                    double oldReliability = 0.0d;
                    double newReliability = 0.0d;
                    while (rs.next()) {
                        projectCount++;
                        reliableCount += rs.getInt("reliable_submission_ind");
                        oldReliability = newReliability;
                        newReliability = (double) reliableCount / (double) projectCount;
                        ps2.clearParameters();
                        //if it's their first project,then old is null
                        if (projectCount > 1) {
                            ps2.setDouble(1, oldReliability);
                        } else {
                            ps2.setNull(1, Types.DOUBLE);
                        }
                        ps2.setDouble(2, newReliability);
                        ps2.setLong(3, rs.getLong("project_id"));
                        ps2.setLong(4, userId);
                        ret += ps2.executeUpdate();
                    }
                } finally {
                    close(rs);
                }
            }
        } finally {
            close(rs);
            close(ps);
        }

        return ret;
    }


    /**
     * this first query is for projects before our reliability rule change.
     * in this case, anyone that has make a submission that passed screening
     * will have a reliability rating.  the second query is for the new way.
     * in this case, anyone that has scored over the minimum review
     * score will be included.
     */
    private static final String includedUsers =
            " select pr.user_id" +
            " from project_result pr" +
            " , phase_instance pi" +
            " , project p" +
            " where pr.project_id = pi.project_id" +
            " and pi.phase_id = 1" +
            " and pi.cur_version = 1" +
            " and pi.start_date < ?" +
            " and pr.valid_submission_ind = 1" +
            " and pr.reliability_ind = 1" +
            " and pr.project_id = p.project_id" +
            " and p.cur_version = 1" +
            " and p.project_type_id+111=?" +
            " union" +
            " select pr.user_id" +
            " from project_result pr" +
            " , phase_instance pi" +
            " , project p" +
            " where pr.project_id = pi.project_id" +
            " and pi.phase_id = 1" +
            " and pi.cur_version = 1" +
            " and pi.start_date >= ?" +
            " and pr.reliability_ind = 1" +
            " and pr.final_score >= ?" +
            " and pr.project_id = p.project_id" +
            " and p.cur_version = 1" +
            " and p.project_type_id+111=?";

    private Set getIncludedUsers(Connection conn, long phaseId) throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        HashSet ret = new HashSet();

        try {

            ps = conn.prepareStatement(includedUsers);
            ps.setDate(1, START_DATE);
            ps.setLong(2, phaseId);
            ps.setDate(3, START_DATE);
            ps.setInt(4, MIN_PASSING_SCORE);
            ps.setLong(5, phaseId);
            rs = ps.executeQuery();

            while (rs.next()) {
                ret.add(new Long(rs.getLong("user_id")));
            }
        } finally {
            close(rs);
            close(ps);
        }
        return ret;
    }


    private static final String getNewRecordsToMark =
            " select pr.user_id" +
            " , pr.project_id" +
            " , pr.final_score" +
            " from project_result pr" +
            " , phase_instance pi" +
            " where pr.project_id = pi.project_id" +
            " and pi.phase_id = 1" +
            " and pi.cur_version = 1" +
            " and pi.start_date >= ?" +
            " and pr.reliability_ind = 1" +
            " and pr.final_score is not null" +
            " and pr.reliable_submission_ind is null";

    private static final String updateReliableSubmission =
            "update project_result set reliable_submission_ind = ?" +
            "where user_id = ? and project_id = ?";

    /**
     * mark all the project result records after the change date
     * as reliable or not reliable as appropriate.
     *
     * that means mark everyone that did a project that started
     * after the change date, that has a final score populated
     * that is greater than or equal to the min reliability score,
     * that should be included inthe calc (reliability_ind)
     * and has reliable_submission_ind flag that is null set the
     * reliable_submission_ind flag to 1.  if the record
     * meets three of those criteria but scores less than the min
     * reliable score, then set to 0.
     * @return the number of records marked
     */
    private int markNewReliableResults(Connection conn) throws SQLException {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        int ret = 0;
        try {

            ps = conn.prepareStatement(getNewRecordsToMark);
            ps2 = conn.prepareStatement(updateReliableSubmission);
            ps.setDate(1, START_DATE);
            rs = ps.executeQuery();
            while (rs.next()) {
                ps2.clearParameters();
                ps2.setInt(1, Double.compare(rs.getDouble("final_score"), MIN_RELIABLE_SCORE) < 0 ? 0 : 1);
                ps2.setLong(2, rs.getLong("user_id"));
                ps2.setLong(3, rs.getLong("project_id"));
                ret += ps2.executeUpdate();
            }

        } finally {
            close(rs);
            close(ps);
            close(ps2);
        }
        return ret;

    }

    private static final String getOldRecordsToMark =
            " select pr.user_id" +
            " , pr.project_id" +
            " , pr.valid_submission_ind" +
            " from project_result pr" +
            " , phase_instance pi" +
            " where pr.project_id = pi.project_id" +
            " and pi.phase_id = 1" +
            " and pi.cur_version = 1" +
            " and pi.start_date < ?" +
            " and pr.reliability_ind = 1" +
            " and pr.reliable_submission_ind is null";

    /**
     * mark all the project result records before the change date
     * as reliable or not reliable as appropriate.
     *
     * that means mark everyone that did a project that started
     * before the change date that should be included in the calculation
     * to 1 if it's a valid submission and 0 if not.
     * @return the number of records marks
     * @param conn
     */
    private int markOldReliableResults(Connection conn) throws SQLException {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        int ret = 0;
        try {

            ps = conn.prepareStatement(getOldRecordsToMark);
            ps2 = conn.prepareStatement(updateReliableSubmission);
            ps.setDate(1, START_DATE);
            rs = ps.executeQuery();
            while (rs.next()) {
                ps2.clearParameters();
                ps2.setInt(1, rs.getInt("valid_submission_ind"));
                ps2.setLong(2, rs.getLong("user_id"));
                ps2.setLong(3, rs.getLong("project_id"));
                ret += ps2.executeUpdate();
            }
        } finally {
            close(rs);
            close(ps);
            close(ps2);
        }
        return ret;

    }


/*
    private class rating {
        public long user_id;
        public int successful;
        public int num_components;

        public rating(long user_id, int successful, int num_components) {
            this.user_id = user_id;
            this.successful = successful;
            this.num_components = num_components;
        }

        public double reliability() {
            if (num_components == 0)
                return -1;
            else
                return (double) successful / (double) num_components;
        }
    }
*/

    private static Date getDate(int year, int month, int day, int hour, int minute) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DAY_OF_MONTH, day);
        cal.set(Calendar.HOUR_OF_DAY, hour);
        cal.set(Calendar.MINUTE, minute);
        return new Date(cal.getTime().getTime());
    }


    protected void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }
    }

    protected void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }

    protected void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }

    protected void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }


}