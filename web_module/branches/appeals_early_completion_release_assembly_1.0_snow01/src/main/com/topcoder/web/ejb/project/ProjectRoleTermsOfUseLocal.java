/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.project;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

/**
 * <p>Local interface for the project role terms of use EJB.</p>
 *
 * @author pulky
 * @version 1.0 (Configurable Contest Terms Release Assembly v1.0)
 */
public interface ProjectRoleTermsOfUseLocal extends EJBLocalObject {

    /**
     * This method will create a project role terms of use association.
     *
     * @param projectId the project id to associate
     * @param resourceRoleId the role id to associate
     * @param termsOfUseId the terms of use id to associate
     * @param dataSource a <code>String</code> containing the datasource.
     * @throws EJBException if any error occurs
     * @throws RemoteException if any error occurs during remote invocation
     */
    public void createProjectRoleTermsOfUse(int projectId, int resourceRoleId, long termsOfUseId, String dataSource);

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
    public void removeProjectRoleTermsOfUse(int projectId, int resourceRoleId, long termsOfUseId, String dataSource);

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
    public boolean hasProjectRoleTermsOfUse(int projectId, int resourceRoleId, long termsOfUseId, String dataSource);

    /**
     * This method will return a list of associated terms of use ids to specific project id and roles.
     *
     * @param projectId the project id to query
     * @param resourceRoleIds the an array of roles ids to query
     * @param dataSource a <code>String</code> containing the datasource.
     * @return a <code>List<Long></code> containing associated the terms of use ids
     * @throws EJBException if any error occurs
     * @throws RemoteException if any error occurs during remote invocation
     */
    public List<Long> getTermsOfUse(int projectId, int[] resourceRoleIds, String dataSource);

    /**
     * This method will remove all project role terms of use association for a given project
     *
     * @param projectId the project id to remove
     * @param dataSource a <code>String</code> containing the datasource.
     * @throws EJBException if any error occurs
     * @throws RemoteException if any error occurs during remote invocation
     */
    public void removeAllProjectRoleTermsOfUse(int projectId, String dataSource);

}
