package com.topcoder.web.codinginterface.longcontest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.topcoder.shared.util.DBMS;

public class Helper {

    /**
     * Return the name to display for a round
     * 
     * @return
     */
    public static String displayName(int roundTypeId, String contestName, String roundName) {
        if (roundTypeId == Constants.LONG_ROUND_TOURNAMENT_TYPE_ID) {
            return contestName + " " + roundName;
        }
        return roundName;               
    }
    
    public static void auditViewSubmission(long coderId, long submitterId, long roundId, long problemId, long submissionNumber) {
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
            
            st = conn.prepareStatement("insert into long_submission_view_audit (coder_id, submitter_id,round_id, problem_id, submission_number) " +
                                       " values(?,?,?,?,?) ");
            st.setLong(1,coderId);
            st.setLong(2,submitterId);
            st.setLong(3,roundId);
            st.setLong(4,problemId);
            st.setLong(5,submissionNumber);

            st.executeUpdate();
        } catch (SQLException e) {
            // Just print and ignore			
            e.printStackTrace();
        } finally {
            DBMS.close(st);
            DBMS.close(conn);
        }
    }
}
