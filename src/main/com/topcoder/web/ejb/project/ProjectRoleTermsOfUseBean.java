/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.project;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJBException;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.BaseEJB;

/**
 * <p>EJB to handle project_role_terms_of_use_xref table.</p>
 *
 * <p>Version 1.1 (Configurable Contest Terms Release Assembly v2.0) Change notes:
 *   <ol>
 *     <li>Added sort order to creation.</li>
 *     <li>Added sort order to terms list retrieval.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (TopCoder Online Review Switch To Local Calls Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Removed unused references and import for <code>InitialContext</code> class as such context was not used in
 *     methods and could provide undesired impact when doing local library calls to methods of this class.</li>
 *   </ol>
 * </p>
 *
 * @author pulky, isv
 * @version 1.2
 * @since Configurable Contest Terms Release Assembly v1.0
 */
public class ProjectRoleTermsOfUseBean extends BaseEJB {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     *
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 3L;

    /**
     * This method will create a project role terms of use association.
     *
     * @param projectId the project id to associate
     * @param resourceRoleId the role id to associate
     * @param sortOrder the association sort order
     * @param termsOfUseId the terms of use id to associate
     * @param dataSource a <code>String</code> containing the datasource.
     * @throws EJBException if any error occurs
     * @throws RemoteException if any error occurs during remote invocation
     */
    public void createProjectRoleTermsOfUse(int projectId, int resourceRoleId, long termsOfUseId, int sortOrder, 
        String dataSource) throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO project_role_terms_of_use_xref ").
                  append("(project_id, resource_role_id, terms_of_use_id, sort_order) ");
            query.append("VALUES (?, ?, ?, ?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);
            ps.setInt(2, resourceRoleId);
            ps.setLong(3, termsOfUseId);
            ps.setInt(4, sortOrder);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into 'project_role_terms_of_use_xref'. Inserted "
                                       + rc + ", should have inserted 1."));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
    }

    /**
     * This method will remove a project role terms of use association.
     *
     * @param projectId the project id to remove
     * @param resourceRoleId the role id to remove
     * @param termsOfUseId the terms of use id to remove
     * @param dataSource a <code>String</code> containing the datasource.
     * @throws EJBException if any error occurs
     * @throws RemoteException if any error occurs during remote invocation
     */
    public void removeProjectRoleTermsOfUse(int projectId, int resourceRoleId, long termsOfUseId, String dataSource)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("DELETE ");
            query.append("FROM project_role_terms_of_use_xref ");
            query.append("WHERE project_id = ? and resource_role_id = ? and terms_of_use_id = ?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);
            ps.setInt(2, resourceRoleId);
            ps.setLong(3, termsOfUseId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows deleted from " +
                        "'project_role_terms_of_use_xref'. Deleted " + rc + ", " +
                        "should have deleted 1."));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
    }

    /**
     * This method will check if a project role terms of use association exists.
     *
     * @param projectId the project id to check
     * @param resourceRoleId the role id to check
     * @param termsOfUseId the terms of use id to check
     * @param dataSource a <code>String</code> containing the datasource.
     * @return true if the project role terms of use association exists
     * @throws EJBException if any error occurs
     * @throws RemoteException if any error occurs during remote invocation
     */
    public boolean hasProjectRoleTermsOfUse(int projectId, int resourceRoleId, long termsOfUseId, String dataSource)
        throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT '1' ");
            query.append("FROM project_role_terms_of_use_xref ");
            query.append("WHERE project_id = ? and resource_role_id = ? and terms_of_use_id = ?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);
            ps.setInt(2, resourceRoleId);
            ps.setLong(3, termsOfUseId);

            rs = ps.executeQuery();
            ret = rs.next();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
        return ret;
    }

    /**
     * This method will return a list of associated terms of use ids to specific project id and roles.
     *
     * @param projectId the project id to query
     * @param resourceRoleIds the an array of roles ids to query
     * @param dataSource a <code>String</code> containing the datasource.
     * @return an array of <code>List<Long></code> containing associated the terms of use ids in sort_order position
     * @throws EJBException if any error occurs
     * @throws RemoteException if any error occurs during remote invocation
     */
    @SuppressWarnings("unchecked")
    public List<Long>[] getTermsOfUse(int projectId, int[] resourceRoleIds, String dataSource)
        throws EJBException {

        // validate resourceRoleIds array
        if (resourceRoleIds.length == 0) {
            throw new EJBException("You must specify at least one resourceRoleId.");
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Long>[] ret = (List<Long>[]) new ArrayList[10];        
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT DISTINCT terms_of_use_id, sort_order ");
            query.append("FROM project_role_terms_of_use_xref ");
            query.append("WHERE project_id = ? and resource_role_id in (");

            StringBuffer inClause = new StringBuffer(200);
            for (int i = 0; i < resourceRoleIds.length; i++) {
                inClause.append(String.valueOf(resourceRoleIds[i]));
                if (i != resourceRoleIds.length - 1) {
                    inClause.append(", ");
                }
            }

            query.append(inClause).append(")");
            query.append(" order by terms_of_use_id");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);

            rs = ps.executeQuery();
            while (rs.next()) {
                if (ret[rs.getInt("sort_order")] == null) {
                    ret[rs.getInt("sort_order")] = new ArrayList<Long>();
                }
                
                ret[rs.getInt("sort_order")].add(rs.getLong("terms_of_use_id"));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
        return ret;
    }

    /**
     * This method will remove all project role terms of use association for a given project
     *
     * @param projectId the project id to remove
     * @param dataSource a <code>String</code> containing the datasource.
     * @throws EJBException if any error occurs
     * @throws RemoteException if any error occurs during remote invocation
     */
    public void removeAllProjectRoleTermsOfUse(int projectId, String dataSource)
        throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("DELETE ");
            query.append("FROM project_role_terms_of_use_xref ");
            query.append("WHERE project_id = ? ");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, projectId);

            ps.executeUpdate();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
    }
}

