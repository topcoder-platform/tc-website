/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.UserApiSpin;

import java.util.List;

/**
 * <p>
 * An interface for the UserApiSpin DAO.
 * </p>
 *
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Porting CS Mashathon pages to TopCoder website) Change notes:
 *   <ol>
 *      <li>The first version of this DAO.</li>
 *   </ol>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public interface UserApiSpinDAO extends GenericDAO<UserApiSpin, UserApiSpin.Identifier> {
    /**
     * Find UserApiSpin via user id.
     * @param userId the user id
     * @return retrieved results
     */
    List<UserApiSpin> findByUserId(long userId);
}
