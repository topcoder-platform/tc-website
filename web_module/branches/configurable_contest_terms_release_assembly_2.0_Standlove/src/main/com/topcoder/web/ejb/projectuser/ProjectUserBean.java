package com.topcoder.web.ejb.projectuser;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.ejb.EJBException;


import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.BaseEJB;


public class ProjectUserBean extends BaseEJB {
	
	public ProjectUserBean() {}
	
	public void auditProjectUser(ProjectUserEntity entity, String dataSource)
		throws EJBException {		

        PreparedStatement ps = null;
        Connection conn = null;
        try {
            conn = DBMS.getConnection(dataSource);
            final String sql = "INSERT INTO project_user_audit " +
            		"(project_id, resource_user_id, resource_role_id, " +
            		"audit_action_type_id, action_date, action_user_id) " +
            		" values (?, ?, ?, ?, ?, ?)";
            
            if (entity.getActionDate() == null) {
            	entity.setActionDate(new java.sql.Date(new Date().getTime()));
            }

            ps = conn.prepareStatement(sql);
            ps.setLong(1, entity.getProjectId());
            ps.setLong(2, entity.getResourceUserId());
            ps.setLong(3, entity.getResourceRoleId());
            ps.setLong(4, entity.getAuditActionTypeId());
            ps.setDate(5, new java.sql.Date(entity.getActionDate().getTime()));
            ps.setLong(6, entity.getActionUserId());

            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating ProjectUserEntity");
        } catch (Exception e) {
            throw new EJBException("Exception creating ProjectUserEntity:\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
        }
	}
	
	public long getORProjectId(long componentVersionId, String dataSource)
   		throws EJBException {
		
		PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(dataSource);
            final String sql = "select project_id from project_info " +
            		"where project_info_type_id = 1 and value = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setLong(1, componentVersionId);

            rs = ps.executeQuery();
            if (rs.next()) {
            	return rs.getLong(1);
            } else {
                throw new EJBException("Unable to get the project id for component :" + componentVersionId);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException occurs when getting project id for component.");
        } catch (Exception e) {
            throw new EJBException("Exception occurs when getting project id for component:\n" +
                    e.getMessage());
        } finally {
        	close(rs);
            close(ps);
            close(conn);            
        }
	}
}
