package com.topcoder.dde.util.DWLoad;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.config.UnknownNamespaceException;

import java.sql.*;
import java.util.TreeMap;

//import com.topcoder.netCommon.contest.*;
//import com.topcoder.server.common.*;

public class ReliabilityRating {

    public static final String DRIVER_KEY = "DriverClass";
    public static final String CONNECTION_URL_KEY = "ConnectionURL";
    public static final String HISTORY_LENGTH_KEY = "HistoryLength";

    public static void main(String[] args) {
        int numArgs = args.length;
        boolean isFinal = true;
        boolean runAll = false;
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

        System.out.println("1");
        Connection c = null;
        try {
            Class.forName(jdbcDriver);
            c = DriverManager.getConnection(connectionURL);

            System.out.println("2");
            c.setAutoCommit(true);
            tmp.runAllScores(c, historyLength);
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

    public void runAllScores(Connection conn, String historyLength) {
        PreparedStatement ps = null;
        ResultSet rs = null;

        PreparedStatement ps2 = null;

        int i;

        try {

            //nullout existing ratings
            String sqlStr = "update project_result set old_reliability = null, new_reliability = null";

            ps = conn.prepareStatement(sqlStr);
            ps.execute();

            ps.close();
            ps = null;

            TreeMap ratings = new TreeMap();

            sqlStr = "select pr.project_id, pr.user_id, pr.valid_submission_ind, " +
                    "case when exists(select end_date from phase_instance " +
                    "                where project_id = pr.project_id and phase_id = 1 " +
                    "                and cur_version = 1) " +
                    "        then (select end_date from phase_instance " +
                    "                where project_id = pr.project_id and phase_id = 1 " +
                    "                and cur_version = 1) " +
                    "        else (select end_date from phase_instance " +
                    "                where project_id = pr.project_id and phase_id = 8 " +
                    "                and cur_version = 1) " +
                    "        end as ProjectDate " +
                    "from project_result pr, " +
                    "project p " +
                    "where p.project_id = pr.project_id " +
                    "and p.cur_version = 1 " +
                    "and pr.reliability_ind = 1 " +
                    "order by 4";

            ps = conn.prepareStatement(sqlStr);
            rs = ps.executeQuery();

            while (rs.next()) {
                if (!ratings.containsKey("" + rs.getLong("user_id"))) {
                    rating r = new rating(rs.getLong("user_id"), 0, 0);
                    ratings.put("" + rs.getLong("user_id"), r);
                }

                rating r = (rating) ratings.get("" + rs.getLong("user_id"));

                double oldRating = r.reliability();

                if (rs.getLong("valid_submission_ind") == 1) {
                    r.successful++;
                }
                r.num_components++;

                //update record
                sqlStr = "UPDATE project_result SET old_reliability = ?, new_reliability = ? ";
                sqlStr += " WHERE project_id = ? and user_id = ? ";

                ps2 = conn.prepareStatement(sqlStr);
                if (oldRating == -1) {
                    ps2.setNull(1, Types.DOUBLE);
                } else
                    ps2.setDouble(1, oldRating);
                ps2.setDouble(2, r.reliability());
                ps2.setLong(3, rs.getLong("project_id"));
                ps2.setLong(4, rs.getLong("user_id"));

                ps2.execute();
                ps2.close();
                ps2 = null;

                //reflect changes
                ratings.put("" + rs.getLong("user_id"), r);
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;

            //commit final ratings to DB
            Object[] vals = ratings.values().toArray();
            for (i = 0; i < vals.length; i++) {
                rating r = (rating) vals[i];

                System.out.println("FINAL RELIABILITY FOR " + r.user_id + ": " + r.successful + "/" + r.num_components + " = " + r.reliability());

                sqlStr = "UPDATE user_reliability set rating = ?";
                sqlStr += " where user_id = ?";

                ps = conn.prepareStatement(sqlStr);
                ps.setDouble(1, r.reliability());
                ps.setLong(2, r.user_id);

                int retVal = ps.executeUpdate();

                ps.close();
                ps = null;

                if (retVal == 0) {
                    sqlStr = "INSERT INTO user_reliability (user_id, rating, modify_date, create_date) ";
                    sqlStr += " values (?, ?, CURRENT, CURRENT )";
                    ps = conn.prepareStatement(sqlStr);
                    ps.setLong(1, r.user_id);
                    ps.setDouble(2, r.reliability());

                    ps.execute();

                    ps.close();
                    ps = null;
                }
            }
        } catch (SQLException sqe) {
            sqe.printStackTrace();
        } catch (Exception sqe) {
            sqe.printStackTrace();
        } finally {
            if (rs != null)
                try {
                    rs.close();
                } catch (Exception e) {
                    System.err.println("could not close");
                }
            if (ps != null)
                try {
                    ps.close();
                } catch (Exception e) {
                    System.err.println("could not close");
                }
            ps = null;
            rs = null;
        }

    }

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
}