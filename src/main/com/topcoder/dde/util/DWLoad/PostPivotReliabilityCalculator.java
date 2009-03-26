package com.topcoder.dde.util.DWLoad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class PostPivotReliabilityCalculator extends ReliabilityCalculator  {
	
    private static final String reliabilityData =
        " select pr.reliable_submission_ind" +
                " , ci.create_time" +
                " , pr.project_id" +
                " , case when pi.scheduled_start_time >= ? then 1 else 0 end as after_start_flag" +
                " from project_result pr" +
                " , component_inquiry ci" +
                " , project_phase pi" +
                " , project_phase pi2" +
                " , project p" +
                " where ci.project_id = pr.project_id" +
                " and pr.user_id = ci.user_id" +
                " and pr.project_id = p.project_id" +
                " and pr.user_id = ?" +
                " and p.project_category_id+111 = ?" +
                " and pr.project_id = pi.project_id" +
                " and pi.phase_type_id = 2" + // phase type 2 is submission
                " and pr.project_id = pi2.project_id" +
                " and pi2.phase_type_id = 4" + // phase type 4 is review
                " and (p.project_status_id IN (4,5,6,7) " +
                "	OR (p.project_status_id = 1 and pi2.phase_status_id = 3))" +
                " and pr.reliability_ind = 1" +
                " and pr.reliable_submission_ind is not null" +
                " order by pr.modify_date asc"; 

    @Override
    protected List<ReliabilityInstance> retrieveReliabilityHistory(Connection conn, long userId, int historyLength, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ReliabilityInstance> history = new ArrayList<ReliabilityInstance>(10000);
    	int phaseId = competitionTypeId + 111;

    	
        try {
        	ps = conn.prepareStatement(reliabilityData);
        	ps.setDate(1, new java.sql.Date(startDate.getTime()));
        	ps.setLong(2, userId);
        	ps.setLong(3, phaseId);
        	rs = ps.executeQuery();
            while (rs.next()) {
                history.add(new ReliabilityInstance(rs.getLong("project_id"),
                        userId, rs.getInt("reliable_submission_ind") == 1, rs.getInt("after_start_flag") == 1));
            }
            
        } finally {
            close(rs);
            close(ps);
        }
        
        return history;
    	
    }
}
