/*
 * Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.UserService;
import com.topcoder.security.groups.services.dto.UserDTO;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * <p>
 * This is the implementation of interface defines the contract for the
 * retrieval of users
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Invitations Approvals) change notes:
 * <ol>
 *   <li>Updated method {@link #search(String)} for the update DB query "search_users_by_handle_email".</li>
 *   <li>Added method {@link #search(String, String)} to support search by handle and email.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Release Assembly - TopCoder Security Groups Release 3) change notes:
 * <ol>
 *      <li>Modified method {@link #get(long)} to change query property name</li>
 * </ol>
 * </p>
 *
 * @author backstretlili, TCSASSEMBLER
 * @version 1.2
 */
public class HibernateUserService extends BaseGroupService implements UserService {

    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = HibernateUserService.class.getName();

    /**
     * The DataAccess used to retrieve data from informixoltp
     */
    private DataAccess dataAccess;

    /**
     * Get a user by id,if not found return null
     * 
     * @param id
     *            the id of the user
     * @return the requested UserDTO
     * @throws SecurityGroupException
     *             if there are any errors during the execution of this method
     */
    public UserDTO get(long id) throws SecurityGroupException {
        final String signature = CLASS_NAME + ".get(long id)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "id" }, new Object[] { id });

        UserDTO result = null;
        try {
            if (dataAccess == null)
                dataAccess = new DataAccess(DBMS.JTS_OLTP_DATASOURCE_NAME);
            Request request = new Request();
            ResultSetContainer resultContainer = null;
            request.setContentHandle("user_handle_email_by_user_id");
            request.setProperty("uid", String.valueOf(id));
            resultContainer = dataAccess.getData(request).get("user_handle_email_by_user_id");
            if (resultContainer != null) {
                if (resultContainer.size() > 0) {
                    ResultSetContainer.ResultSetRow row = resultContainer.get(0);
                    result = new UserDTO();
                    result.setUserId(id);
                    result.setHandle(row.getStringItem("handle"));
                    result.setEmailAddress(row.getStringItem("address"));
                }
            }
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * Retrieves the list of users with the given handle. If not found, returns
     * an empty list.
     * 
     * @param handle
     *            the handle of the desired user
     * @return the users with the given handle
     * @throws IllegalArgumentException
     *             If handle is null/empty
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public List<UserDTO> search(String handle) throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME + ".search(String handle)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "handle" }, new Object[] { handle });

        if (handle == null || handle.trim().length() == 0) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("handle is empty"), logger, signature);
        }

        List<UserDTO> result = new ArrayList<UserDTO>();
        try {
            if (dataAccess == null)
                dataAccess = new DataAccess(DBMS.JTS_OLTP_DATASOURCE_NAME);
            Request request = new Request();
            ResultSetContainer resultContainer = null;
            request.setContentHandle("search_users_by_handle_email");
            request.setProperty("ha", handle);
            request.setProperty("email", "");
            resultContainer = dataAccess.getData(request).get("search_users_by_handle_email");
            if (resultContainer != null) {
                for (ResultSetContainer.ResultSetRow row : resultContainer) {
                    UserDTO dto = new UserDTO();
                    dto.setUserId(row.getLongItem("user_id"));
                    dto.setHandle(row.getStringItem("handle"));
                    dto.setEmailAddress(row.getStringItem("address"));
                    result.add(dto);
                }
            }
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * Retrieves the list of users with the given handle and email. If not found, returns
     * an empty list.
     * 
     * @param handle
     *            the handle of the desired user
     * @param email
     *            the email of the desired user
     * @return the users with the given handle and email
     * @throws IllegalArgumentException
     *             If both handle and email is null/empty
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * @since 1.1
     */
    public List<UserDTO> search(String handle, String email) throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME + ".search(String handle, String email)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "handle", "email" },
            new Object[] { handle, email });

        if ((handle == null || handle.trim().length() == 0) && (email == null || email.trim().length() == 0)) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("both handle and email are empty"),
                logger, signature);
        }

        List<UserDTO> result = new ArrayList<UserDTO>();
        try {
            if (dataAccess == null)
                dataAccess = new DataAccess(DBMS.JTS_OLTP_DATASOURCE_NAME);
            Request request = new Request();
            ResultSetContainer resultContainer = null;
            request.setContentHandle("search_users_by_handle_email");
            request.setProperty("ha", handle == null ? "" : handle);
            request.setProperty("email", email == null ? "" : email);
            resultContainer = dataAccess.getData(request).get("search_users_by_handle_email");
            if (resultContainer != null) {
                for (ResultSetContainer.ResultSetRow row : resultContainer) {
                    UserDTO dto = new UserDTO();
                    dto.setUserId(row.getLongItem("user_id"));
                    dto.setHandle(row.getStringItem("handle"));
                    dto.setEmailAddress(row.getStringItem("address"));
                    result.add(dto);
                }
            }
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * The setter of dataAccess
     * 
     * @param dataAccess
     *            the dataAccess to set
     */
    public void setDataAccess(DataAccess dataAccess) {
        this.dataAccess = dataAccess;
    }

}
