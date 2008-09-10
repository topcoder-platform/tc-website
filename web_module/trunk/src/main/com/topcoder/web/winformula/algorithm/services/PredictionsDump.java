/*
 * ResultsLoader
 * 
 * Created Aug 21, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class PredictionsDump {
    private static final Logger log = Logger.getLogger(PredictionsDump.class);
    
    public static void main(String[] args) {
        if (args.length != 2) {
            System.err.println("args: fromWeekId toWeekId .   Export predictions as CSV to stdout");
            return;
        }
        int fromWeekId = Integer.parseInt(args[0]);
        int toWeekId = Integer.parseInt(args[1]);
        try {
            DBUtils.initDBBlock(DBMS.getDirectConnection());
            new PredictionsDump().process(fromWeekId, toWeekId);
        } catch (Exception e) {
            log.error("Failed to generate File: ");
        } finally {
            DBUtils.endDBBlock();
        }
    }
    
    private void process(int fromWeekId, int toWeekId) throws SQLException {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            cnn = DBUtils.initDBBlock();
            ps = cnn.prepareStatement(  "SELECT g.week_id, p.coder_id, u.handle, g.home_team_id, g.visitor_team_id, pd.home_score, pd.visitor_score" +
                                        " FROM game g, prediction p, user u, prediction_detail pd " +
                                        " WHERE g.week_id >= 67 AND g.week_id <= 68 AND " +
                                        "      pd.game_id = g.game_id AND p.prediction_id = pd.prediction_id AND" +
                                        "      u.user_id = p.coder_id AND" +
                                        "      pd.home_score IS NOT NULL AND pd.visitor_score IS NOT NULL"+
                                        " ORDER BY 1, 2, 4", ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);

            PrintStream output = System.out;
            output.println("week_id,coder_id,handle,home_team_id,away_team_id,predicted_home_score,predicted_away_score");
            rs = ps.executeQuery();
            while (rs.next()) {
                output.print(rs.getInt(1)-67);
                output.print(",\"");
                output.print(rs.getInt(2));
                output.print("\",");
                output.print(rs.getString(3));
                output.print(",");
                output.print(rs.getInt(4));
                output.print(",");
                output.print(rs.getInt(5));
                output.print(",");
                output.print(rs.getInt(6));
                output.print(",");
                output.println(rs.getInt(7));
            }
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
        }
    }
}
