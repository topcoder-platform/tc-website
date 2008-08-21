/*
 * ScoreLoader
 * 
 * Created Aug 15, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StatsLoader {
    private static final Logger log = Logger.getLogger(StatsLoader.class);
    
    public static void main(String[] args) {
        if (args.length > 2 || args.length == 0) {
            System.out.println("Usage: weekId [coderId]");
            return;
        }
        int weekId = Integer.parseInt(args[0]);
        int coderId = -1;
        if (args.length > 1) {
            coderId = Integer.parseInt(args[1]);
        }
        new StatsLoader().process(weekId, coderId);
        
    }
    
    private void process(int weekId, int coderId) {
        loadWeekStats(weekId, coderId);
        // loadSeasonStats(weekId, coderId);
        // loadOverallStats(coderId);
    }

    private void loadWeekStats(int weekId, int coderId) {
        Connection cnn = null;
        PreparedStatement delete = null;
        PreparedStatement insert = null;
        try {
            cnn = DBMS.getDirectConnection();
            DBUtils.initDBBlock(cnn);
            String DELETE = " delete from user_week_stats " + 
                            " where week_id = ? ";
            
            String INSERT = "insert into user_week_stats " +
                " select p.week_id, p.coder_id, 0 as rank, 0 as rank_diff, sum(nvl(pds.prediction_detail_points,0)) as points, " + 
                " avg(pds.prediction_detail_total_score_variance) as avg_total_score_variance, " +
                " avg(pds.prediction_detail_victory_margin_variance) as avg_victory_margin_variance, " +
                " sum(case when pds.prediction_detail_picked_winner then 1 else 0 end) / count(*) * 100 as avg_picked_winner " +
                " from prediction p, prediction_detail pd, prediction_detail_score pds, game g " +
                " where p.prediction_id = pd.prediction_id " +
                " and pd.prediction_detail_id = pds.prediction_detail_id " +
                " and pd.game_id = g.game_id " +
                " and p.week_id = ? ";
            
            if (coderId > 0) {
                INSERT += " and coder_id = ? ";
                DELETE += " and coder_id = ? ";
            }

            INSERT += " group by p.week_id, p.coder_id";

            delete = cnn.prepareStatement(DELETE);
            delete.setInt(1, weekId);
            if (coderId > 0) {
                delete.setInt(2, coderId); 
            }
            delete.executeUpdate();

            insert = cnn.prepareStatement(INSERT);
            insert.setInt(1, weekId);
            if (coderId > 0) {
                insert.setInt(2, coderId); 
            }
            int retVal = insert.executeUpdate();

            log.info("" + retVal + " rows inserted");
        } catch (Exception e) {
            log.error("Failed to process", e);
        } finally {
            DBMS.close(delete);
            DBMS.close(insert);
            DBUtils.endDBBlock();
        }
    }
    
}
