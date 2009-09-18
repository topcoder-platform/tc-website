package com.topcoder.web.ejb.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

}
