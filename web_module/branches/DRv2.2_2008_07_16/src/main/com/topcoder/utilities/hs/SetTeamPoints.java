package com.topcoder.utilities.hs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.topcoder.shared.util.sql.DBUtility;

/**
 * Set the team points for HS rounds.
 * 
 * @author Cucu
 * @version 1.0
 */
public class SetTeamPoints extends DBUtility {

    private long roundId = -1;

	protected void runUtility() throws Exception {
		
		if (roundId >= 0) {
			setTeamPointsForRound(roundId);
		} else {
			PreparedStatement psSelRounds= prepareStatement("informixoltp", "select round_id from round where round_type_id in (17,18)");
			
	        ResultSet rs = psSelRounds.executeQuery();
	        while (rs.next()) {
	        	setTeamPointsForRound(rs.getLong(1));
	        }
	        
	        psSelRounds.close();
		}
        log.info("Done. ");
	}

    private void setTeamPointsForRound(long id) throws SQLException {
		log.info("setTeamPointsForRound roundId=" + id);
		
		PreparedStatement psTeams = null;
		PreparedStatement psCoders = null;
		PreparedStatement psUpd = null;
		PreparedStatement psUpdDW = null;
		ResultSet rsTeams = null;
		ResultSet rsCoders = null;
       
		try {
			psUpd = prepareStatement("informixoltp","UPDATE room_result set team_points = null where round_id = ? and attended = 'Y'");
			psUpd.setLong(1, id);
			psUpd.executeUpdate();
			psUpd.close();

			psUpdDW = prepareStatement("dw","UPDATE room_result set team_points = null where round_id = ? and attended = 'Y'");
			psUpdDW.setLong(1, id);
			psUpdDW.executeUpdate();
			psUpdDW.close();

            // Get all the teams that have at least 3 coders that participated in the round
			StringBuffer query = new StringBuffer(200);
			query.append("SELECT reg.team_id  ");
			query.append("FROM room_result rr, round_registration reg ");
			query.append("WHERE rr.round_id = ? ");
			query.append("AND rr.attended = 'Y'   ");
			query.append("AND reg.coder_id = rr.coder_id "); 
			query.append("AND reg.round_id = rr.round_id  ");
            query.append("AND not reg.team_id is null ");
			query.append("GROUP BY reg.team_id  ");
			query.append("HAVING count(*) >= 3 ");

			psTeams = prepareStatement("informixoltp", query.toString());
			psTeams.setLong(1, id);
			
			rsTeams = psTeams.executeQuery();

			query = new StringBuffer(200);
			query.append("SELECT rr.coder_id, rr.division_placed "); 
			query.append("FROM room_result rr, round_registration reg ");
			query.append("WHERE rr.round_id = ? ");
			query.append("AND rr.attended = 'Y'  ");
			query.append("AND reg.coder_id = rr.coder_id "); 
			query.append("AND reg.round_id = rr.round_id  ");
			query.append("AND reg.team_id = ? ");
			query.append("ORDER BY rr.division_placed ");
			psCoders = prepareStatement("informixoltp", query.toString());

			psUpd = prepareStatement("informixoltp", "UPDATE room_result set team_points = ? where round_id = ? and coder_id = ?");
			psUpdDW = prepareStatement("dw", "UPDATE room_result set team_points = ?, team_id=? where round_id = ? and coder_id = ?");
			
			// for each team with 3 or more participants
			while(rsTeams.next()) {
				// find the coders
				psCoders.clearParameters();
				psCoders.setLong(1, id);
				psCoders.setLong(2, rsTeams.getLong(1));
				rsCoders = psCoders.executeQuery();

				// set the team points
                for(int j = 0; j < 3; j++) {
                	rsCoders.next();
                	
                	psUpd.clearParameters();
                	psUpd.setInt(1, rsCoders.getInt("division_placed"));
                	psUpd.setLong(2, id);
                	psUpd.setLong(3, rsCoders.getInt("coder_id"));
                	psUpd.executeUpdate();

                	psUpdDW.clearParameters();
                	psUpdDW.setInt(1, rsCoders.getInt("division_placed"));
                	psUpdDW.setLong(2, rsTeams.getLong(1));
                	psUpdDW.setLong(3, id);
                	psUpdDW.setLong(4, rsCoders.getInt("coder_id"));
                	psUpdDW.executeUpdate();

                }

			}
			
		} finally {
			close(rsTeams);
			close(psTeams);
			close(rsCoders);
			close(psCoders);
			close(psUpd);
		}
		
	}

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();
        if (params.get("round") != null) {
        	roundId = Long.parseLong((String) params.get("round"));
        }
        params.remove("round");

        log.debug("round : " + roundId);
}

    /**
     * Show usage of the PayReliabilityBonus.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("SetTeamPoints:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -round : the round to set team points, or empty to set it for all the HS rounds..\n");
        fatal_error();
    }

    public static void close(PreparedStatement ps) {
        if (ps == null) return;
        try {
            ps.close();
        } catch (Exception e) {
            log.error(e);
        }
    }

    public static void close(ResultSet rs) {
        if (rs == null) return;
        try {
            rs.close();
        } catch (Exception e) {
            log.error(e);
        }
    }



}
