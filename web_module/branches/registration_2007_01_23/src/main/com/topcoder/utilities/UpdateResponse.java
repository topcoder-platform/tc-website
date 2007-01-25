package com.topcoder.utilities;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.web.common.IdGeneratorClient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UpdateResponse {
    private static Logger log = Logger.getLogger(UpdateResponse.class);

    public static void main(String[] args) {
        UpdateResponse r = new UpdateResponse();
        try {
            r.run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void run() throws Exception {
        
        Connection conOLTP  = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty("INFORMIX_CONNECT_STRING")).getConnection();
        
        PreparedStatement ps = conOLTP.prepareStatement("select response_id, question_id, answer_id, user_id from response where response_id is null order by question_id asc");
        PreparedStatement psUpd = conOLTP.prepareStatement("update response set response_id = ? where question_id = ? and answer_id = ? and user_id = ?");

        ResultSet rs = null;

        try {
            rs = ps.executeQuery();
            long responseId; 
            int count = 0;
            while (rs.next()) {
                
                responseId = IdGeneratorClient.getSeqId("RESPONSE_SEQ");

                psUpd.clearParameters();
                psUpd.setLong(1, responseId);
                psUpd.setLong(2, rs.getLong(2));
                psUpd.setLong(3, rs.getLong(3));
                psUpd.setLong(4, rs.getLong(4));
                psUpd.executeUpdate();

                count++;
                if (count % 1000 == 0) System.out.println(count + " rows inserted");
            }
            System.out.println(count + " rows updated");
        } finally {
            close(rs);
            close(ps);
            close(conOLTP);
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
