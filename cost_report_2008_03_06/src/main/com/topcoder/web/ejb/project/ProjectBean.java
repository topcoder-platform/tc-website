package com.topcoder.web.ejb.project;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 21, 2005
 */
public class ProjectBean extends BaseEJB {
    private static Logger log = Logger.getLogger(ProjectBean.class);

    public void updateForLock(long projectId, String dataSource) {
        log.debug("lock called on project " + projectId);
        String query = "update project set project_id = project_id where project_id = ?";

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query);
            ps.setLong(1, projectId);
            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw (new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

    }

    public int getProjectTypeId(long projectId, String dataSource) throws RowNotFoundException {
        log.debug("get project type id called for project " + projectId);
        return selectInt("project", "project_category_id", new String[]{"project_id"},
                new String[]{String.valueOf(projectId)}, dataSource);
    }

    private static final String componentInfo =
            "select value as component_id from project_info " +
                    "  where project_id = ? " +
                    "  and project_info_type_id = 2 ";

    public long getComponentId(long projectId, String dataSource) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement(componentInfo);
            ps.setLong(1, projectId);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getLong("component_id");
            } else {
                throw new EJBException("Invalid project id specified: " + projectId);
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }
}