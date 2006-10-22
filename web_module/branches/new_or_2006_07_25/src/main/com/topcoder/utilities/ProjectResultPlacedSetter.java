package com.topcoder.utilities;

import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.shared.util.ApplicationServer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 28, 2006
 */
public class ProjectResultPlacedSetter {
    private static final String select = "select pr.user_id, pr.project_id, pr.final_score, pr.placed\n" +
            "  from project_result pr\n" +
            "     , project p\n" +
            " where pr.final_score is not null\n" +
            "   and pr.project_id = p.project_id\n" +
            "   and p.cur_version = 1\n" +
            "   and p.project_stat_id in (2,4,5,6,7)\n" +
            "   and p.project_id in (select project_id from project_result where final_score is not null and placed is null)\n" +
            " order by pr.project_id, pr.final_score desc";
    private static final String update ="update project_result set placed = ? where user_id =? and project_id = ?";

    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement ps1= null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        try {
            //InformixSimpleDataSource prod = new InformixSimpleDataSource("jdbc:informix-sqli://192.168.14.51:2020/tcs_catalog:INFORMIXSERVER=informixoltp_tcp;user=coder;password=xxx");
            InformixSimpleDataSource dev = new InformixSimpleDataSource("jdbc:informix-sqli://63.118.154.190:1526/tcs_catalog:INFORMIXSERVER=devinformix10_shm;user=coder;password=altec");
            //InformixSimpleDataSource dev = new InformixSimpleDataSource("jdbc:informix-sqli://65.112.118.221:1526/tcs_catalog:INFORMIXSERVER=devinformix10_shm;user=coder;password=altec");
            conn = dev.getConnection();

            ps1 = conn.prepareStatement(select);
            ps2 = conn.prepareStatement(update);
            rs = ps1.executeQuery();

            long lastProjectId = -1;
            int placed = 1;
            while (rs.next()) {
                long projectId = rs.getLong("project_id");
                long userId = rs.getLong("user_id");
                //double score = rs.getDouble("final_score");
                boolean hasPlaced = rs.getString("placed")!=null;

                if (projectId == lastProjectId) {
                    placed++;
                } else {
                    placed = 1;
                }

                if (!hasPlaced) {
//                    System.out.println("set placed = " + placed + " for user " + userId + " project " + projectId);
                        ps2.clearParameters();
                        ps2.setInt(1, placed);
                        ps2.setLong(2, userId);
                        ps2.setLong(3, projectId);
                    ps2.executeUpdate();
                }

                lastProjectId = projectId;
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        } finally {
            ApplicationServer.close(rs);
            ApplicationServer.close(ps1);
            ApplicationServer.close(ps2);
            ApplicationServer.close(conn);


        }
    }

}
