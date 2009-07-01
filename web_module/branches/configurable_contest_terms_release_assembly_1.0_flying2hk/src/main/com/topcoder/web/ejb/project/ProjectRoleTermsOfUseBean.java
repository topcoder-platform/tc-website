package com.topcoder.web.ejb.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.EJBException;
import javax.naming.InitialContext;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

public class ProjectRoleTermsOfUseBean extends BaseEJB {
	private static Logger log = Logger.getLogger(ProjectRoleTermsOfUseBean.class);
	
	public void createProjectRoleTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource) throws EJBException {
		Connection conn = null;
        PreparedStatement ps = null;
        
        InitialContext ctx = null;
        try {
        	log.debug("enter ProjectRoleTermsOfUseBean.createProjectRoleTermsOfUse");
            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO project_role_terms_of_use_xref (project_id, resource_role_id, terms_of_use_id) ");
            query.append("VALUES (?,?,?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);
            ps.setLong(2, resourceRoleId);
            ps.setLong(3, termsOfUseId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'project_role_terms_of_use_xref'. Inserted " + rc + ", " +
                        "should have inserted 1."));
            }
            log.debug("exit ProjectRoleTermsOfUseBean.createProjectRoleTermsOfUse");
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
	}

	public void removeProjectRoleTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource) throws EJBException {
		Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("DELETE ");
            query.append("FROM project_role_terms_of_use_xref ");
            query.append("WHERE project_id=? AND resource_role_id=? AND terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);
            ps.setLong(2, resourceRoleId);
            ps.setLong(3, termsOfUseId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows deleted from " +
                        "'project_role_terms_of_use_xref'. Deleted " + rc + ", " +
                        "should have deleted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
	}

	public boolean hasTermsOfUse(long projectId, long resourceRoleId,
			long termsOfUseId, String dataSource) throws EJBException {
		Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;
        InitialContext ctx = null;
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT '1' ");
            query.append("FROM project_role_terms_of_use_xref ");
            query.append("WHERE project_id=? AND resource_role_id=? AND terms_of_use_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);
            ps.setLong(2, resourceRoleId);
            ps.setLong(3, termsOfUseId);

            rs = ps.executeQuery();
            ret = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;
	}
}
