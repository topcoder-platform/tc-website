package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class RatingHistoryLong {
    private static Logger log = Logger.getLogger(RatingHistoryLong.class);

    public static void main(String[] args) {
        RatingHistoryLong r = new RatingHistoryLong();
        try {
            r.run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void run() throws Exception {
        InitialContext ctx = TCContext.getInitial();
        
        Connection conOLTP = DBMS.getConnection("OLTP"); //informixoltp
        Connection conDW = DBMS.getConnection("DW"); //informixoltp

        String q = " select distinct r.round_id, c.start_date asc " +
                   " from round r, " +
                   " long_comp_result lcr , contest c " +
                   " where lcr.rated_ind = 1 " +
                   " and c.contest_id = r.contest_id " +
                   " and lcr.round_id = r.round_id " + 
                   " order by c.start_date asc ";

        //todo also order by the time_id
        PreparedStatement ps = conOLTP.prepareStatement(q);


        String q1 = " select lcr.round_id, lcr.coder_id, lcr.new_rating as rating,  " +
            " lcr.new_vol as vol, (select count(*) from long_comp_result where rated_ind = 1 " +
            " and attended = 'Y' and coder_id = lcr.coder_id and " +
            " round_id <= lcr.round_id) as num_ratings " +
            " from long_comp_result lcr " +
            " where lcr.rated_ind = 1 " +
            " and lcr.attended = 'Y' " +
            " and lcr.round_id = ? ";
        PreparedStatement ps1 = conOLTP.prepareStatement(q1);

        
        String q2 = "insert into algo_rating_history (coder_id, round_id, algo_rating_type_id, rating, vol, num_ratings) values (?,?,?,?,?,?)";
        PreparedStatement ps2 = conDW.prepareStatement(q2);

        ResultSet rs = null;
        ResultSet rs1 = null;

        try {
            rs = ps.executeQuery();

            while (rs.next()) {
                long roundId = rs.getLong(1);
                ps1.setLong(1, roundId);
                log.debug("processing round " + rs.getLong(1));

                int count = 0;
                rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    ps2.setLong(1, rs1.getLong("coder_id"));
                    ps2.setLong(2, roundId);
                    ps2.setInt(3, 3);
                    ps2.setInt(4, rs1.getInt("rating"));
                    ps2.setInt(5, rs1.getInt("vol"));
                    ps2.setInt(6, rs1.getInt("num_ratings"));
                    count += ps2.executeUpdate();
                    if (count % 10 == 0) log.debug(count + " rows inserted");
                }

                log.debug(count + " rows inserted for round " + roundId);
            }
        } finally {
            close(rs);
            close(rs1);
            close(ps);
            close(ps1);
            close(ps2);
            close(conOLTP);
            close(conDW);
            close(ctx);
        }
    }

    class item {
        long roundId = 0;
        long coderId = 0;
        int numRatings = 0;
        int vol = 0;
        int rating = 0;

        item(long roundId, long coderId, int numRatings, int vol, int rating) {
            this.roundId = roundId;
            this.coderId = coderId;
            this.numRatings = numRatings;
            this.vol = vol;
            this.rating = rating;
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
