/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.EmailRequest;
import org.hibernate.HibernateException;

/**
 * <p>
 * The mail request DAO used in password recovery process.
 * </p>
 *
 * <p>
 * This is renamed from <code>SecondEmailRequestDAO</code>
 * in Release Assembly - TopCoder Email Address Management Update v1.0.
 * </p>
 *
 * <p>
 *   Version 1.1 (Release Assembly - TopCoder Email Address Management Update v1.0) Change notes:
 *   <ol>
 *     <li>Renamed from <code>SecondEmailRequestDAO</code> to {@link EmailRequestDAO}.</li>
 *     <li>Changed {@link save(EmailRequest)} method signature to use the new {@link EmailRequest} entity.</li>
 *     <li>Changed {@link find(long)} method to take <code>requestId</code> instead of <code>userId</code>.</li>
 *   </ol>
 * </p>
 *
 * @author vangavroche, Standlove, TCSASSEMBLER
 * @version 1.1
 */
public interface EmailRequestDAO {
    /**
     * <p>
     * Save the <code>EmailRequest</code> to persistence.
     * In version 1.1, the input is changed to a <code>EmailRequest</code> entity.
     * And the return value is changed to a <code>long</code> id of the saved request.
     * </p>
     *
     * @param request the email request
     * @return the id of the saved request
     *
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public long save(EmailRequest request);

    /**
     * <p>
     * Check the email is taken by the others or not.
     * In version 1.1, the type of <code>requestingUserId</code> is changed to <code>Long</code>.
     * </p>
     * 
     * @param email
     *            the second email.
     * @param requestingUserId
     *            the current user.
     *
     * @return true if the email does not belong to the current user, but belongs to the others.
     *
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public boolean isEmailOccupied(String email, Long requestingUserId);

    /**
     * <p>
     * Find the <code>EmailRequest</code> object by its id.
     * In version 1.1, the input is changed to a <code>requestId</code> and return value is changed to
     * <code>EmailRequest</code>.
     * </p>
     * 
     * @param requestId
     *            the request id.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     *
     * @return the <code>EmailRequest</code> object
     *
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public EmailRequest find(long requestId);
}
