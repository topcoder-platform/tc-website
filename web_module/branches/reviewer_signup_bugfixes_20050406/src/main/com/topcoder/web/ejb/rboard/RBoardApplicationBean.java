package com.topcoder.web.ejb.rboard;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.*;

/**
 * @author dok
 * Date: Feb 12, 2004
 */
public class RBoardApplicationBean extends BaseEJB {

    private static final Logger log = Logger.getLogger(RBoardApplicationBean.class);

    public void createRBoardApplication(String dataSource, long userId, long projectId, int phaseId) {
        int ret = insert("rboard_application",
                new String[]{"user_id", "project_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'rboard_application'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

    public void setReviewRespId(String dataSource, long userId, long projectId, int phaseId, int reviewRespId) {
        int ret = update("rboard_application",
                new String[]{"review_resp_id"},
                new String[]{String.valueOf(reviewRespId)},
                new String[]{"user_id", "project_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_application'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setPrimary(String dataSource, long userId, long projectId, int phaseId, boolean isPrimary) {
        int ret = update("rboard_application",
                new String[]{"primary_ind"},
                new String[]{String.valueOf(isPrimary ? 1 : 0)},
                new String[]{"user_id", "project_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_application'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public int getReviewRespId(String dataSource, long userId, long projectId, int phaseId) {
        return selectInt("rboard_application",
                "review_resp_id",
                new String[]{"user_id", "project_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource).intValue();
    }

    public boolean isPrimary(String dataSource, long userId, long projectId, int phaseId) {
        Integer ret = selectInt("rboard_application",
                "primary_ind",
                new String[]{"user_id", "project_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource);
        return (ret != null && ret.intValue() == 1);
    }

    public boolean exists(String dataSource, long userId, long projectId, int phaseId) {
        try {
            selectLong("rboard_application",
                    "user_id",
                    new String[]{"user_id", "project_id", "phase_id"},
                    new String[]{String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                    dataSource);
        } catch (RowNotFoundException e) {
            return false;
        }
        return true;
    }

    public ResultSetContainer getReviewers(String dataSource, long projectId, int phaseId) {
        return selectSet("rboard_application",
                new String[]{"user_id", "review_resp_id", "primary_ind", "create_date"},
                new String[]{"project_id"},
                new String[]{String.valueOf(projectId)},
                dataSource);
    }

    public Timestamp getLatestReviewApplicationTimestamp(String dataSource, long userId) {
        StringBuffer query = new StringBuffer(200);
        query.append("select create_date from rboard_application where user_id = ?");
        query.append(" order by create_date desc");

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        Timestamp ret = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getTimestamp("create_date");
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;

    }
}
