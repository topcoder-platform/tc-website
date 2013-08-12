/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import java.util.Date;

import com.topcoder.web.common.dao.EmailRequestDAO;
import com.topcoder.web.common.model.EmailRequest;
import com.topcoder.web.common.model.EmailRequestType;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.HibernateException;

import com.topcoder.json.object.JSONObject;

/**
 * <p>
 * The implementation of mail request DAO used in password recovery process.
 * </p>
 * <p>
 * In version 1.1, it is renamed to <code>EmailRequestDAOHibernate</code>
 * from <code>SecondEmailRequestDAOHibernate</code>. The interface is also changed accordingly.
 * </p>
 *
 * <p>
 * Thread safety: The DAO instances are created for each controller when they are used, thus there won't be
 * multiple threads accessing the same DAO. No multiple threads share the same model class instances. Thus there's
 * no thread-safety concern.
 * </p>
 *
 * <p>
 *   Version 1.1 (Release Assembly - TopCoder Email Address Management Update v1.0) Change notes:
 *   <ol>
 *     <li>Renamed from <code>SecondEmailRequestDAOHibernate</code> to {@link EmailRequestDAOHibernate}.</li>
 *     <li>Changed to implement {@link EmailRequestDAO}.</li>
 *     <li>Changed {@link save(EmailRequest)} method signature to use the new {@link EmailRequest} entity.</li>
 *     <li>Changed {@link find(long)} method to take <code>requestId</code> instead of <code>userId</code>.</li>
 *   </ol>
 * </p>
 *
 * @author vangavroche, Standlove, TCSASSEMBLER
 * @version 1.1
 */
public class EmailRequestDAOHibernate extends Base implements EmailRequestDAO {

    /**
     * The class name.
     */
    public final String CLASS_NAME = EmailRequestDAOHibernate.class.getName();

    /**
     * <p>
     * Save the <code>EmailRequest</code> to persistence.
     * </p>
     *
     * @param request request
     * @return the saved request id
     * @throws IllegalArgumentException
     *             if request is null, request.userId &lt; 0, request.email is null or empty string,
     *             or request.expiredAt is null, or request.requestType is none of the enum value.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public long save(EmailRequest request) {
        String signature = CLASS_NAME + "#save(request)";

        if (request == null) {
            log.debug("Entrance: " + signature + " request:null");
            throw new IllegalArgumentException("The request must not be null.");
        } else {
            log.debug("Entrance: "
                + signature
                + String.format(
                " with userId = %s, email = %s, randomKey=%s, expiredAt = %s, requestType = %s, requestId = %s",
                    request.getUserId(), request.getEmail(), request.getRandomKey(), request.getExpiredAt(),
                    request.getRequestType(), request.getRequestId())
                );
        }

        if (request.getUserId() < 0) {
            throw new IllegalArgumentException("The userId must be a non-negetive decimal.");
        }
        if (request.getEmail() == null || request.getEmail().trim().equals("")) {
            throw new IllegalArgumentException("The email must be not null or empty.");
        }
        if (request.getExpiredAt() == null) {
            throw new IllegalArgumentException("The expiredAt must be not null.");
        }
        if (request.getRequestType() != EmailRequestType.PrimaryEmailChangeConfirmation &&
            request.getRequestType() != EmailRequestType.SecondaryEmailConfirmation) {
            throw new IllegalArgumentException("The requestType must either primary or secondary.");
        }
        this.saveOrUpdate(request);

        log.debug("Exit: " + signature + " with request id : " + request.getRequestId());

        return request.getRequestId();
    }

    /**
     * <p>
     * Check the email is taken by the others or not.
     * </p>
     * 
     * @param email
     *            the second email.
     * @param requestingUserId
     *            the current user.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     * @return true if the email does not belong to the current user, but belongs to the others.
     * 
     */
    public boolean isEmailOccupied(String email, Long requestingUserId) {
        String signature = CLASS_NAME + "#isEmailOccupied(String, long)";

        log.debug("Entrance: " + signature
            + String.format(" with parameter email = %s, requestingUserId = %s", email, requestingUserId));

        if (requestingUserId != null && requestingUserId < 0) {
            throw new IllegalArgumentException("The requestingUserId must be a non-negative decimal when presented.");
        }

        if (email == null || email.trim().length() == 0) {
            throw new IllegalArgumentException("The email must be not null or empty.");
        }

        Criteria criteria = session.createCriteria(EmailRequest.class).add(Restrictions.eq("email", email));
        criteria = criteria.add(Restrictions.gt("expiredAt", new Date()));
        if (requestingUserId != null) {
            criteria = criteria.add(Restrictions.ne("userId", requestingUserId));
        }

        boolean result = !criteria.list().isEmpty();

        log.debug("Exit: " + signature + " with result = " + result);

        return result;
    }

    /**
     * <p>
     * Find the <code>EmailRequest</code> object by its id.
     * </p>
     * 
     * @param requestId
     *            the request id.
     * @return the <code>EmailRequest</code> object
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public EmailRequest find(long requestId) {
        String signature = CLASS_NAME + "#find(long)";

        log.debug("Entrance: " + signature + String.format(" with parameter requestId = %s", requestId));

        if (requestId < 0) {
            throw new IllegalArgumentException("The request id must be a non-negative decimal.");
        }

        EmailRequest result = (EmailRequest) session.createCriteria(EmailRequest.class)
                .add(Restrictions.eq("requestId", requestId)).uniqueResult();

        log.debug("Exit: " + signature + " with result = " + toJSON(result));

        return result;
    }

    /**
     * <p>
     * Get the JSON String of <code>EmailRequest</code> instance
     * </p>
     * 
     * @param request
     *            the <code>EmailRequest</code> instance.
     * @return The JSON string.
     */
    String toJSON(EmailRequest request) {
        if (request == null) {
            return "null";
        } else {
            JSONObject object = new JSONObject();
            object.setLong("expiredAt", request.getExpiredAt().getTime());
            object.setInt("randomKey", request.getRandomKey());
            object.setString("secondMail", request.getEmail());
            object.setLong("userId", request.getUserId());
            object.setLong("requestId", request.getRequestId());
            object.setString("requestType", request.getRequestType().name());
            return object.toJSONString();
        }
    }

}
