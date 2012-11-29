/*
 * Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.InitializingBean;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.commons.utils.ValidationUtility;
import com.topcoder.security.groups.services.EntityNotFoundException;
import com.topcoder.security.groups.services.SecurityGroupConfigurationException;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.UserService;
import com.topcoder.security.groups.services.dto.UserDTO;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.util.log.Log;

/**
 * <p>
 * This is a base service of all the services,it contains some utility
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Miscellaneous) change notes:
 * <ol>
 *      <li>Added method {@link #GetMemberUserIds(UserService, String)} to fetch the member user ids with its handle
 *      LIKE the specified parameter.</li>
 *      <li>Added method {@link #GetProjectIds(DataAccess, String)} to fetch the project ids with its project name
 *      LIKE the specified parameter.</li>
 *      <li>Moved method {@link #getLikeString(String)} from {@link HibernateGroupService} to get the like string
 *      used in hql.</li>
 *      <li>Added method {@link #isNonNullNonEmpty(String)} to check if the given string is non-null non-empty.</li>
 * </ol>
 * </p>
 * 
 * @author backstretlili, TCSASSEMBLER
 * 
 * @version 1.1
 * 
 */
public abstract class BaseGroupService implements InitializingBean {

    /**
     * <p>
     * A Log instance used to log activities, say entering of a method. This
     * field is supposed to be injected by Spring. This field has getter/setter,
     * but is not supposed to be changed after Spring IOC.
     * </p>
     */
    protected Log logger;

    /**
     * <p>
     * An instance of {@link SessionFactory} with which to interact against
     * underlying database. This field has getter/setter, but it is not supposed
     * to be changed after Spring IOC.
     * </p>
     */
    protected SessionFactory sessionFactory;

    /**
     * <p>
     * This method wraps the exception instance into a SecurityGroupException
     * and log down the exception.
     * </p>
     * 
     * @param e
     *            original exception.
     * @param logger
     *            Log instance to log exception.
     * @param signature
     *            the method signature.
     * @throws SecurityGroupException
     *             Wrapped {@link SecurityGroupException}.
     */
    protected void wrapAndLogSecurityException(Exception e, Log logger, String signature) throws SecurityGroupException {
        SecurityGroupException securityGroupException = new SecurityGroupException(e.getMessage(), e);
        LoggingWrapperUtility.logException(logger, signature, securityGroupException);
        throw securityGroupException;
    }
    
    /**
     * <p>
     * This method wraps the exception instance of IllegalArgumentException
     * and log the exception.
     * </p>
     * 
     * @param e
     *            the exception.
     * @param logger
     *            Log instance to log exception.
     * @param signature
     *            the method signature.
     * @throws IllegalArgumentException
     *             Wrapped {@link IllegalArgumentException}.
     */
    protected void wrapAndLogIllegalArgumentException(IllegalArgumentException e, Log logger, String signature) throws IllegalArgumentException {
        LoggingWrapperUtility.logException(logger, signature, e);
        throw e;
    }
    
    /**
     * <p>
     * This method wraps the exception instance of EntityNotFoundException and log the exception.
     * </p>
     * 
     * @param e
     *            the exception.
     * @param logger
     *            Log instance to log exception.
     * @param signature
     *            the method signature.
     * @throws EntityNotFoundException
     *             Wrapped {@link EntityNotFoundException}.
     */
    protected void wrapAndLogEntityNotFoundException(EntityNotFoundException e, Log logger, String signature)
                    throws EntityNotFoundException {
        LoggingWrapperUtility.logException(logger, signature, e);
        throw e;
    }
    
    /**
     * Fetches the member user ids with its handle LIKE the specified parameter.
     * 
     * @param userService the user service instance used to fetch member ids
     * @param handle the handle to compare
     * @return the list of member user ids, or null if handle is null or empty
     * @throws IllegalArgumentException if parameter userService is null
     * @throws SecurityGroupException if any error occurred
     * @since 1.1
     */
    protected List<Long> GetMemberUserIds(UserService userService, String handle) throws SecurityGroupException {
        ValidationUtility.checkNotNull(userService, "userService", IllegalArgumentException.class);

        List<Long> memberUserIds = null;
        if (isNonNullNonEmpty(handle)) {
            memberUserIds = new ArrayList<Long>();
            List<UserDTO> users = userService.search(handle, "");
            for (UserDTO user : users) {
                memberUserIds.add(user.getUserId());
            }
        }
        return memberUserIds;
    }
    
    /**
     * Fetches the project ids with its project name LIKE the specified parameter.
     * 
     * @param dataAccessCorp the DataAccess used to retrieve data from corporate_oltp
     * @param projectName the project name to compare
     * @return the list of project ids, or null if projectName is null or empty
     * @throws IllegalArgumentException if parameter dataAccessCorp is null
     * @throws Exception if any error occurred
     * @since 1.1
     */
    protected List<Long> GetProjectIds(DataAccess dataAccessCorp, String projectName) throws Exception {
        ValidationUtility.checkNotNull(dataAccessCorp, "dataAccessCorp", IllegalArgumentException.class);

        List<Long> projectIds = null;
        if (isNonNullNonEmpty(projectName)) {
            projectIds = new ArrayList<Long>();
            Request request = new Request();
            ResultSetContainer resultContainer = null;
            request.setContentHandle("project_ids");
            request.setProperty("pname", projectName);
            resultContainer = dataAccessCorp.getData(request).get("project_ids");
            if (resultContainer != null) {
                for (int i = 0; i < resultContainer.size(); ++i) {
                    ResultSetContainer.ResultSetRow row = resultContainer.get(i);
                    projectIds.add(row.getLongItem("project_id"));
                }
            }
        }
        return projectIds;
    }
    
    /**
     * Gets the like string used in hql.
     * 
     * @param str the string to process
     * @return the like string used in hql
     * @since 1.1
     */
    protected String getLikeString(String str) {
        return "%" + str.replaceAll("\\%", "") + "%";
    }
    
    /**
     * Checks if the given string is non-null non-empty.
     * 
     * @param str the string to check
     * @return true if the given string is non-null non-empty; false otherwise
     * @since 1.1
     */
    protected boolean isNonNullNonEmpty(String str) {
        return str != null && str.trim().length() > 0;
    }

    /**
     * <p>
     * This method mainly checks if the IOC operations succeeds. It's supposed
     * to be invoked immediately after IOC completes. Generally, you need to
     * specify its name at init-method property of spring bean definition.
     * </p>
     * 
     * @throws SecurityGroupConfigurationException
     */
    public void afterPropertiesSet() throws SecurityGroupConfigurationException {
        ValidationUtility.checkNotNull(logger, "logger", SecurityGroupConfigurationException.class);
        ValidationUtility.checkNotNull(sessionFactory, "sessionFactory", SecurityGroupConfigurationException.class);
    }

    /**
     * Setter of logger
     * 
     * @param logger
     *            the logger from Spring
     */
    public void setLogger(Log logger) {
        this.logger = logger;
    }

    /**
     * Setter of sessionFactory
     * 
     * @param sessionFactory
     *            the sessionFactory from Spring
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
