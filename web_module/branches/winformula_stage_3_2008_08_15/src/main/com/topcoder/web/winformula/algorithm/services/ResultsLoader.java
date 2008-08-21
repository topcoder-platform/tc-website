/*
 * ResultsLoader
 * 
 * Created Aug 21, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

import com.topcoder.shared.reader.csv.CSVReader;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class ResultsLoader {
    private static final Logger log = Logger.getLogger(ResultsLoader.class);
    
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: weekId file");
            return;
        }
        int weekId = Integer.parseInt(args[0]);
        File fileName = new File(args[1]);
        try {
            DBUtils.initDBBlock(DBMS.getDirectConnection());
            new ResultsLoader().process(weekId, fileName);
        } catch (Exception e) {
            log.error("Filed to process File: "+fileName.getAbsolutePath(), e);
        } finally {
            DBUtils.endDBBlock();
        }
        
    }
    
    public void process(final int weekId, File fileName) throws Exception {
        final CSVReader reader = new CSVReader(fileName);
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            cnn = DBUtils.initDBBlock();
            String cmd = " SELECT count(*) FROM game WHERE week_id = ?";
            ps = cnn.prepareStatement(cmd, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            ps.setInt(1, weekId);
            rs = ps.executeQuery();
            int count = rs.getInt(1);
            DBMS.close(ps, rs);
            
            DBUtils.invoke(cnn, new DBUtils.UnitOfWork() {
                public Object doWork(Connection cnn) throws Exception {
                    Set processed = new HashSet();
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        String cmd = " UPDATE game SET home_score = ?, visitor_score = ? WHERE week_id = ? AND home_team_id = ? AND visitor_team_id = ? ";
                        ps = cnn.prepareStatement(cmd);
                        ps.setInt(3, weekId);
                        while (reader.next()) {
                            int homeId = reader.getInt(1);
                            int visitorId = reader.getInt(2);
                            int homeScore = reader.getInt(3);
                            int visitorScore = reader.getInt(4);
                            String key = homeId+","+visitorId;
                            if (processed.contains(key)) {
                                throw new IllegalArgumentException("The file contains duplicated games: homeId,visitorId="+homeId+","+visitorId);
                            }
                            ps.setInt(1, homeScore);
                            ps.setInt(2, visitorScore);
                            ps.setInt(4, homeId);
                            ps.setInt(5, visitorId);
                            if (ps.executeUpdate() != 1) {
                                throw new IllegalArgumentException("The file contains a game which does not belong to the week: homeId,visitorId="+homeId+","+visitorId);
                            }
                        }
                    } finally {
                        DBMS.close(ps, rs);
                    }
                    return null;
                }
            });
            
            if (count != reader.getReadCount()) {
                log.warn("The game count differs DB games: "+count+" file: "+reader.getReadCount());
            }
            log.info("Game results loaded: "+reader.getReadCount());
        } finally {
            DBMS.close(ps, rs);
            DBUtils.endDBBlock();
            reader.close();
        }
    }
}
