package com.topcoder.utilities;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class RatingHistory {
    private static Logger log = Logger.getLogger(RatingHistory.class);

    public static void main(String[] args) {
        RatingHistory r = new RatingHistory();
        try {
            r.run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void run() throws Exception {
        InitialContext ctx = TCContext.getInitial();
        Connection con = DBMS.getConnection("DW");

        String q = " select distinct r.round_id, r.calendar_id " +
                     " from round r" +
                        " , room_result rr " +
                    " where rr.rated_flag = 1" +
                      " and rr.round_id = r.round_id " +
//                      " and r.calendar_id >= 482 " +
                    " order by r.calendar_id asc ";
        //todo also order by the time_id
        PreparedStatement ps = con.prepareStatement(q);

        String q1 = " select r.round_id, rr.coder_id, rr.new_rating as rating, rr.num_ratings " +
                     " from round r" +
                        " , room_result rr " +
                    " where rated_flag = 1" +
                      " and rr.round_id = r.round_id " +
                      " and rr.round_id = ?";
        PreparedStatement ps1 = con.prepareStatement(q1);

        String q2 = "insert into rating_history (round_id, coder_id, rating, num_ratings) values (?,?,?,?)";
        PreparedStatement ps2 = con.prepareStatement(q2);

        ResultSet rs = null;
        ResultSet rs1 = null;

        HashMap map = new HashMap();
        try {

            rs = ps.executeQuery();

            while(rs.next()) {
                long roundId = rs.getLong(1);
                ps1.setLong(1,roundId);
                log.debug("processing round " + rs.getLong(1));

                rs1 = ps1.executeQuery();
                while(rs1.next()) {
                    map.put(new Long(rs1.getLong("coder_id")),
                            new item(roundId, rs1.getLong("coder_id"), rs1.getInt("num_ratings"), 0, rs1.getInt("rating")));
                }

                Map.Entry me = null;
                int count= 0;
                for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
                    me = (Map.Entry)it.next();
                    item i = (item)me.getValue();
                    ps2.setLong(1,roundId);
                    ps2.setLong(2,i.coderId);
                    ps2.setInt(3,i.rating);
                    ps2.setInt(4, i.numRatings);
                    count+=ps2.executeUpdate();
                    if (count%10==0) log.debug(count+ " rows inserted");
                }
                log.debug(count + " rows inserted for round " + roundId);
            }



        } finally {
            close(rs);
            close(rs1);
            close(ps);
            close(ps1);
            close(ps2);
            close(con);
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
