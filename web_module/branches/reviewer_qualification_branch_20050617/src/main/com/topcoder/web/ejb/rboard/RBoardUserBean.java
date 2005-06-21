package com.topcoder.web.ejb.rboard;

import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.BaseEJB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.EJBException;

/**
 * @author dok
 * Date: Feb 13, 2004
 */
public class RBoardUserBean extends BaseEJB {


    public void createRBoardUser(String dataSource, long userId, int phaseId, int statusId,
                                 boolean hasContract, boolean canReviewJava,
                                 boolean canReviewDotNet, boolean canReviewFlash) {
        int ret = insert("rboard_user",
                new String[]{"user_id", "phase_id", "status_id", "contract_ind", "java_ind", "net_ind", "flash_ind"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId), String.valueOf(statusId),
                             hasContract ? "1" : "0", canReviewJava ? "1" : "0", canReviewDotNet ? "1" : "0",
                             canReviewFlash ? "1" : "0"},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'rboard_user'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

    public void setStatus(String dataSource, long userId, int phaseId, int statusId) {
        int ret = update("rboard_user",
                new String[]{"status_id"},
                new String[]{String.valueOf(statusId)},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setHasContract(String dataSource, long userId, int phaseId, boolean hasContract) {
        int ret = update("rboard_user",
                new String[]{"contract_ind"},
                new String[]{hasContract ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setCanReviewJava(String dataSource, long userId, int phaseId, boolean canReviewJava) {
        int ret = update("rboard_user",
                new String[]{"java_ind"},
                new String[]{canReviewJava ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setCanReviewDotNet(String dataSource, long userId, int phaseId, boolean canReviewDotNet) {
        int ret = update("rboard_user",
                new String[]{"net_ind"},
                new String[]{canReviewDotNet ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setCanReviewFlash(String dataSource, long userId, int phaseId, boolean canReviewFlash) {
        int ret = update("rboard_user",
                new String[]{"flash_ind"},
                new String[]{canReviewFlash ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setCanReviewApplication(String dataSource, long userId, int phaseId, boolean canReviewApplication) {
        int ret = update("rboard_user",
                new String[]{"application_ind"},
                new String[]{canReviewApplication ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    /**
     * Sets whether a reviewer is exempt from the qualifications requirements.
     * 
     * @param dataSource Data source to use.
     * @param userId User Id of the reviewer.
     * @param phaseId Phase.
     * @param isExempt <code>true</code> if the reviewer should be exempt, <code>false</code> otherwise.
     */
    public void setIsExempt(String dataSource, long userId, int phaseId, boolean isExempt) {
        int ret = update("rboard_user",
                new String[]{"exempt_ind"},
                new String[]{isExempt ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " + "'rboard_user'. Updated "
                    + ret + ", " + "should have updated 1."));
        }
    }

    public int getStatus(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "status_id",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue();
    }

    public boolean hasContract(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "contract_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;
    }

    public boolean canReviewJava(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "java_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;
    }

    public boolean canReviewDotNet(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "net_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;

    }

    public boolean canReviewFlash(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "flash_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;

    }

    public boolean canReviewApplication(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "application_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;

    }
    
    /**
     * Returns whether a reviewer is exempt from the qualification requirements.
     *
     * @param dataSource Data source to use.
     * @param userId User Id of the reviewer.
     * @param phaseId Phase.
     * @return <code>true</code> if the reviewer is exempt, <code>false</code> otherwise.
     */
    public boolean isExempt(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "exempt_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;
    }
        
    /**
     * Returns whether a particular reviewer is currently qualified to work in a specified phase.
     * Exempt reviewers are always qualified.
     *
     * @param dataSource Data source to use.
     * @param userId User Id of the reviewer.
     * @param phaseId Phase.
     * @return <code>true</code> if the reviewer is qualified, <code>false</code> otherwise.
     */
    public boolean isQualified(String dataSource, long userId, int phaseId) {
        // IF YOU MODIFY THE QUALIFICATION QUERY, MAKE SURE YOU UPDATE ReviewBoardTask ACCORDINGLY!
        final String QUERY =
                "SELECT pr.user_id                               " +
                "  FROM project_result pr                        " +
                "     , phase_instance pi                        " +
                "     , project p                                " +
                " WHERE pr.user_id = ?                           " +
                "   AND pr.final_score >= ?                      " +
                "   AND pr.project_id = pi.project_id            " +
                "   AND pi.phase_id = 1                          " +
                "   AND pi.cur_version = 1                       " +
                "   AND pi.start_date >= CURRENT - ? UNITS MONTH " +
                "   AND pi.project_id = p.project_id             " +
                "   AND p.cur_version = 1                        " +
                "   AND p.project_type_id = ?                    ";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            if (isExempt(dataSource, userId, phaseId)) {
                return true;
            }
            
            conn = DBMS.getConnection(dataSource);
            
            ps = conn.prepareStatement(QUERY);
            
            ps.setLong(1, userId);
            ps.setDouble(2, Constants.MINIMUM_QUALIFYING_SCORE);
            ps.setLong(3, Math.min(Constants.TEMPORARY_DEACTIVATION_THRESHOLD,
                                   Constants.PERMANENT_DEACTIVATION_THRESHOLD));
            ps.setInt(4, phaseId - 111);
        
            rs = ps.executeQuery();
        
            return rs.next();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }
}
