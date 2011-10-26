package com.topcoder.utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.utilities.dwload.contestresult.ProjectResult;
import com.topcoder.utilities.dwload.contestresult.drv2.DRv2StudioJuly08TopPerformersCalculator;

/**
 * 
 * @author pulky
 * @version 1.0
 */
public class drv2 extends DBUtility {
    
    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    
	protected void runUtility() throws Exception {
        StringBuffer query2 = new StringBuffer(200);
        query2.append("select max(dr_points_id) as pointsId from dr_points");

        StringBuffer insert = new StringBuffer(200);
        insert.append("insert into dr_points (dr_points_id, track_id, dr_points_reference_type_id, dr_points_operation_id, dr_points_type_id, dr_points_status_id, " +
                        "dr_points_desc, user_id, amount, application_date, award_date, reference_id, is_potential, create_date, modify_date) ");
        insert.append("values (?,?,3,1,1,1,?,?,?,?,?,?,?,current,current)");

        StringBuffer delete = new StringBuffer(200);
        delete.append("delete from dr_points where track_id in (" + 
                " select track_id from track t where t.track_status_id = 1  and t.track_id >= 2086" +
                " and t.track_type_id = 3)");

        StringBuffer query = new StringBuffer(200);

        query.append(" select t.track_id, (select value from project_info pi where pi.project_info_type_id = 6 and pi.project_id = p.project_id) as desc, ");
        query.append("   u.user_id as submitter_id , nvl(reg.actual_start_time, reg.scheduled_start_time) as start_time, ");
        query.append("   nvl(rev.actual_start_time, rev.scheduled_start_time) as winner_announcement_time, p.project_id, ");
        query.append("   case when p.project_status_id = 7 then 'f' ");
        query.append("   else 't' end as potential, ");
        query.append("   s.placement as placed, ");
        query.append("                 (select count(*) from submission s3, upload u3, prize p3 ");
        query.append("                  where s3.upload_id = u3.upload_id and p3.prize_id = s3.prize_id ");
        query.append("                  and u3.project_id = p.project_id and p3.prize_type_id = 15 and s3.mark_for_purchase = 'f') as count_of_passing_subs, ");
        query.append("  dr.value as dr_points, ");
        query.append("  u.handle ");
        query.append("  from project p, ");
        query.append("       submission s, ");
        query.append("       project_info dr, ");
        query.append("       project_info drfl, ");
        query.append("       upload up, ");
        query.append("       track t, ");
        query.append("       user u, ");
        query.append("       project_phase reg, ");
        query.append("       project_phase rev, ");
        query.append("       project_category_lu pcl, ");
        query.append("       project_prize_xref ppx, ");
        query.append("       prize pz, ");
        query.append("       resource r, ");
        query.append("       resource_info ri ");
        query.append("   where p.project_id = up.project_id  ");
        query.append("   and up.upload_id = s.upload_id ");
        query.append("    and dr.project_id = p.project_id  ");
        query.append("    and dr.project_info_type_id = 30 ");
        query.append("    and drfl.project_id = p.project_id ");
        query.append("    and drfl.project_info_type_id = 26 and drfl.value = 'On' ");
        query.append("    and reg.project_id = p.project_id and reg.phase_type_id = 1 ");
        query.append("    and rev.project_id = p.project_id and rev.phase_type_id = 4 ");
        query.append("    and reg.actual_start_time is not null and reg.actual_start_time >= t.track_start_date ");
        query.append("    and nvl(rev.actual_start_time, rev.scheduled_start_time) < t.track_end_date ");
        query.append("    and p.project_category_id = pcl.project_category_id and pcl.project_type_id = 3 ");
        query.append("    and p.project_status_id in (1,7) ");
        query.append("    and p.project_id = ppx.project_id ");
        query.append("    and ppx.prize_id = pz.prize_id ");
        query.append("    and pz.prize_type_id = 15 ");
        query.append("    and r.resource_id = up.resource_id ");
        query.append("    and s.prize_id = pz.prize_id ");
        query.append("    and s.mark_for_purchase = 'f' ");
        query.append("   and r.resource_id = ri.resource_id and ri.resource_info_type_id = 1 ");
        query.append("   and t.track_type_id = 3 and t.track_id >= 2086 ");
        query.append("    and t.track_status_id = 1 ");
        query.append("    and u.user_id = ri.value");
        
        PreparedStatement psSelMaxId = prepareStatement("tcs_catalog", query2.toString());
        PreparedStatement psSelPoints = prepareStatement("tcs_catalog", query.toString());
        PreparedStatement psInsert = prepareStatement("tcs_catalog", insert.toString());
        PreparedStatement psDelete = prepareStatement("tcs_catalog", delete.toString());
        
        ResultSet rs = null;
        ResultSet rs2 = null;
        try {
            
            if (onlyAnalyze.equalsIgnoreCase("false")) {
                int rows = psDelete.executeUpdate();
                log.debug("deleted " + rows + " rows");
            } else { 
                log.debug("skipped deletion");
            }

            rs2 = psSelMaxId.executeQuery();
            rs2.next();
            int maxId = rs2.getInt("pointsId") + 1;

            rs = psSelPoints.executeQuery();
            int i = 0;
            StringBuffer result = new StringBuffer(); 
            DRv2StudioJuly08TopPerformersCalculator c = new DRv2StudioJuly08TopPerformersCalculator();
            for (; rs.next(); ) {
                psInsert.clearParameters();
                int j = 1;                
                boolean isPotential = rs.getBoolean("potential");

                psInsert.setInt(j++, maxId++); //dr_points_id
                psInsert.setInt(j++, rs.getInt("track_id")); //track_id
                psInsert.setString(j++, (isPotential ? "Potential Digital Run Points for " : "Digital Run Points won for ") 
                        + rs.getString("desc")); //dr_points_desc
                psInsert.setInt(j++, rs.getInt("submitter_id")); //user_id
                
                // calculate amount
                ProjectResult pr = new ProjectResult(1, 1, 1, 1, 
                        rs.getInt("placed"),
                        0, rs.getDouble("dr_points"), 
                        rs.getInt("count_of_passing_subs"), true);

                double pointsAwarded = 0;
                if (isPotential) {
                    pointsAwarded = c.calculatePotentialPoints(pr);
                } else {
                    pointsAwarded = c.calculatePointsAwarded(pr);
                }

                psInsert.setDouble(j++, pointsAwarded); //points

                psInsert.setDate(j++, rs.getDate("start_time")); //application_date
                psInsert.setDate(j++, rs.getDate("winner_announcement_time")); //award_date
                psInsert.setInt(j++, rs.getInt("project_id")); //reference_id
                psInsert.setBoolean(j++, isPotential); //is_potential
                
                if (pointsAwarded > 0) {
                    if (onlyAnalyze.equalsIgnoreCase("false")) {
                        psInsert.executeUpdate();
                    } else { 
    
//                    log.debug("(" + maxId + ", " +
//                    rs.getInt("track_id")  + ", 3, 1, 1, 1, " +
//                    rs.getString("desc") + ", " +
//                    rs.getInt("submitter_id") + ", " +
//                    pointsAwarded + ", " +
//                    rs.getDate("start_time") + ", " +
//                    rs.getDate("winner_announcement_time") + ", " +
//                    rs.getInt("contest_id") + ", " +
//                    rs.getBoolean("potential") + ", current, current)");

                    log.debug("+ " + rs.getString("track_id") + ", " +
                            rs.getString("desc") + ", " +
                            pointsAwarded + ", " +
                            rs.getString("handle") + ", " +
                            rs.getInt("placed") + ", " +
                            rs.getDouble("dr_points") + ", " +
                            rs.getBoolean("potential") + ", " +
                            rs.getInt("count_of_passing_subs"));
                    }    
                    
                    i++;
                }
                
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
            log.debug(result.toString());
        } finally {
            DBMS.close(rs2);
            DBMS.close(rs);
            DBMS.close(psInsert);
            DBMS.close(psSelPoints);
            DBMS.close(psSelMaxId);
        }
	}


    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
        	onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");

        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the PayRoyalties.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PayRoyalties:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        fatal_error();
    }



}
