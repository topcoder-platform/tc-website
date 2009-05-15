package com.topcoder.dde.util.DWLoad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class NewTracksReliabilityCalculator extends OldTracksReliabilityCalculator  {
	
    private static final String reliabilityData =
        " select pr.reliable_submission_ind" +
                " , ci.create_time" +
                " , pr.project_id" +
                " , case when pi.scheduled_start_time >= ? then 1 else 0 end as after_start_flag" +
                " , (select max(actual_end_time) from project_phase where project_id = p.project_id) as complete_date" +
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
                " and (p.project_status_id IN (4,5,6,7,8) " +
                "	OR (p.project_status_id = 1 and pi2.phase_status_id = 3))" +
                " and pr.reliability_ind = 1" +
                " and pr.reliable_submission_ind is not null" +
                " order by complete_date asc"; 

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
    
    private final static String markIncluded =
        "update project_result " +
        "set reliability_ind = 1 " +
        "where reliability_ind is null " +
        "and final_score >= ? " +       
        " and project_id in (select project_id from project " +
        "           where project_category_id = ?) " +
    	" and project_id in (select project_id from project_phase group by project_id having min(actual_start_time) > ?) ";
    
    private final static String markBeforeStartDate =
        "update project_result " +
        "set reliability_ind = 0 " +
        "where reliability_ind is null " +
        " and project_id in (select project_id from project " +
        "           where project_category_id = ?) " +
        " and project_id in (select project_id from project_phase group by project_id having min(actual_start_time) <= ?) ";

    
    protected int markForInclusionAndExclusion(Connection conn, int competitionTypeId, Date startDate, Date pivotDate) throws SQLException {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        int ret = 0;
        try {

            //mark the easy ones..people that scored over the min
            ps = conn.prepareStatement(markIncluded);
            ps.setInt(1, MIN_PASSING_SCORE);
            ps.setInt(2, competitionTypeId);
            ps.setDate(3, new java.sql.Date(startDate.getTime()));
            ret = ps.executeUpdate();

            ps2 = conn.prepareStatement(markBeforeStartDate);
            ps2.setInt(1, competitionTypeId);
            ps2.setDate(2, new java.sql.Date(startDate.getTime()));
            ret += ps2.executeUpdate();
            
            
            ret += markBasedOnPriorProjects(conn, competitionTypeId, startDate, pivotDate);
            
        } finally {
            close(ps);
            close(ps2);
        }
        return ret;
    }

}
