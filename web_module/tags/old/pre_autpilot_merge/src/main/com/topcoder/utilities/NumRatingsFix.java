package com.topcoder.utilities;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.naming.Context;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashSet;

public class NumRatingsFix {
    private static Logger log = Logger.getLogger(NumRatingsFix.class);

    public static void main(String[] args) {
        NumRatingsFix f = new NumRatingsFix();
        try {
            f.run();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    public void run() throws Exception {
        InitialContext ctx = TCContext.getInitial();
        Connection con = DBMS.getConnection("DW");

        String roundListQuery = "select distinct round_id  from room_result where num_ratings is null order by round_id asc";
        String numRatingsQuery = "select count(*) " +
                                  " from room_result rr, round r, round r1 " +
                                 " where r.round_id =rr.round_id " +
                                   " and rr.coder_id =? " +
                                   " and r.calendar_id <= r1.calendar_id" +
                                   " and r1.round_id = ? " +
                                   " and rated_flag = 1";
        String updateQuery = " update room_result set num_ratings = ? where round_id = ? and coder_id = ?";
        String coderListQuery = "select coder_id from room_result where round_id = ?";

        PreparedStatement roundListPS = null;
        ResultSet roundListRS = null;
        PreparedStatement numRatingsPS = null;
        PreparedStatement updatePS = null;
        PreparedStatement coderListPS = null;
        ResultSet numRatingsRS = null;
        ResultSet coderListRS = null;

        try {
            roundListPS = con.prepareStatement(roundListQuery);
            roundListRS = roundListPS.executeQuery();
            numRatingsPS = con.prepareStatement(numRatingsQuery);
            updatePS = con.prepareStatement(updateQuery);
            coderListPS = con.prepareStatement(coderListQuery);

            while(roundListRS.next()) {
                log.debug("running for round id " + roundListRS.getLong(1));
                long roundId = roundListRS.getLong(1);

                coderListPS.setLong(1,roundId);
                coderListRS = coderListPS.executeQuery();

                int count = 0;
                while (coderListRS.next()) {
                    numRatingsPS.setLong(1, coderListRS.getLong(1));
                    numRatingsPS.setLong(2, roundId);
                    numRatingsRS = numRatingsPS.executeQuery();

                    while (numRatingsRS.next()) {
                        updatePS.setInt(1, numRatingsRS.getInt(1));
                        updatePS.setLong(2, roundId);
                        updatePS.setLong(3, coderListRS.getLong(1));
                        count+=updatePS.executeUpdate();
                        if (count%10==0) log.debug(count + " rows updated");
                    }
                }

                log.debug("total rows updated for round " + roundListRS.getLong(1) + " is " + count);
            }
        } finally {
            close(roundListRS);
            close(numRatingsRS);
            close(coderListRS);
            close(roundListPS);
            close(numRatingsPS);
            close(updatePS);
            close(coderListPS);
            close(con);
            close(ctx);
        }
    }

    protected void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ignore) {
                log.error("FAILED to close ResultSet.");
                ignore.printStackTrace();
            }
        }
    }

    protected void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Connection.");
                ignore.printStackTrace();
            }
        }

    }

    protected void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Context.");
                ignore.printStackTrace();
            }
        }

    }

    protected void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ignore) {
                log.error("FAILED to close PreparedStatement.");
                ignore.printStackTrace();
            }
        }

    }

}
