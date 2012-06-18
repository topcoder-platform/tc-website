/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import java.util.List;

/**
 * <p>
 * This interface is responsible for finding invalid handles from persistence.
 * </p>
 * <p>
 * Thread safety: Implementations should be thread-safety.
 * </p>
 * @author TCSDEVELOPER
 * @version 1.0
 */
public interface InvalidHandleDAO {

    /**
     * Retrieves handle from persistence that is equal to passed handle or null if not found.
     * @param handle the handle to be retrieved from persistence
     * @return retrieved handle from persistence that is equal to passed handle or null if not found
     * @throws IllegalArgumentException if given argument is null/empty
     * @throws InvalidHandleDAOException if any error occurs while retrieving handle
     */
    String find(String handle) throws InvalidHandleDAOException;

    /**
     * Retrieves list of invalid handles from persistence.
     * @return list of invalid handles from persistence
     * @throws InvalidHandleDAOException if any error occurs while retrieving handle
     */
    List<String> list() throws InvalidHandleDAOException;;
}