/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.projectuser;


import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.ejb.EJBException;


import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.BaseEJB;

/**
 * <p>
 * Version 1.0 (Other Configurable Contest Terms Release Assembly 2.0 )
 * This stateless EJB bean defines the following functionalities:
 *   <ol>
 *     <li>audit project resource change behaviour.</li>
 *     <li>retrieve project id by component version id.</li>
 *   </ol>
 * </p>
 * 
 * @version 1.0
 * @author ASSEMBLER
 */
public class ProjectUserBean extends BaseEJB {
	
	/**
	 * Empty constructor.
	 */
	public ProjectUserBean() {}
	
	/**
	 * Audit the project resource (User).
	 * 
	 * @param entity the entity to audit.
	 * @param dataSource the data source name.
	 * @throws RemoteException if communication error occurs.
	 * @throws EJBException if error occurs when auditing the project resource.
	 */
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
	

	/**
	 * Get project id by the component version id.
	 * 
	 * @param componentVersionId the component version id.
	 * @param dataSource the data source name.
	 * @return the project id.
	 * @throws RemoteException if communication error occurs.
	 * @throws EJBException if error occurs when getting the project id.
	 */
	public long getProjectId(long componentVersionId, String dataSource)
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
