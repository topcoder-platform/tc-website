/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import java.util.Date;

import org.hibernate.criterion.Restrictions;
import org.hibernate.HibernateException;

import com.topcoder.json.object.JSONObject;
import com.topcoder.web.common.dao.SecondEmailRequestDAO;
import com.topcoder.web.common.model.SecondEmailRequest;

/**
 * <p>
 * The implementation of second mail request DAO used in password recovery process.
 * </p>
 * 
 * <p>
 * Thread safety: The DAO instances are created for each controller when they are used, thus there won't be
 * multiple threads accessing the same DAO. No multiple threads share the same model class instances. Thus there's
 * no thread-safety concern.
 * </p>
 * 
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public class SecondEmailRequestDAOHibernate extends Base implements SecondEmailRequestDAO {

    /**
     * The class name.
     */
    public final String CLASS_NAME = SecondEmailRequestDAOHibernate.class.getName();

    /**
     * <p>
     * Save the SecondEmailRequest to persistence.
     * </p>
     * 
     * @param userId
     *            the user id.
     * @param email
     *            the email.
     * @param randomKey
     *            the random key.
     * @param expiredAt
     *            the expired date.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public void save(long userId, String email, int randomKey, Date expiredAt) {
        String signature = CLASS_NAME + "#save(long , String , int , Date )";

        log.debug("Entrance: "
            + signature
            + String.format(" with parameter userId = %s, email = %s, randomKey=%s, expiredAt = %s ", userId, email,
                randomKey, expiredAt));

        if (userId < 0) {
            throw new IllegalArgumentException("The userId must be a non-negetive decimal.");
        }

        if (email == null || email.trim().equals("")) {
            throw new IllegalArgumentException("The email must be not null or empty.");
        }

        if (expiredAt == null) {
            throw new IllegalArgumentException("The expiredAt must be not null.");
        }
        SecondEmailRequest request = new SecondEmailRequest();
        request.setExpiredAt(expiredAt);
        request.setRandomeKey(randomKey);
        request.setSecondMail(email);
        request.setUserId(userId);
        this.saveOrUpdate(request);

        log.debug("Exit: " + signature + " with no result");
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
    public boolean isEmailOccupied(String email, long requestingUserId) {
        String signature = CLASS_NAME + "#isEmailOccupied(String, long)";

        log.debug("Entrance: " + signature
            + String.format(" with parameter email = %s, requestingUserId = %s", email, requestingUserId));

        if (requestingUserId < 0) {
            throw new IllegalArgumentException("The requestingUserId must be a non-negetive decimal.");
        }

        if (email == null || email.trim().equals("")) {
            throw new IllegalArgumentException("The email must be not null or empty.");
        }

        boolean result =
            !session.createCriteria(SecondEmailRequest.class).add(Restrictions.eq("secondMail", email))
                .add(Restrictions.ne("userId", requestingUserId)).add(Restrictions.gt("expiredAt", new Date())).list()
                .isEmpty();
        log.debug("Exit: " + signature + " with result = " + result);

        return result;
    }

    /**
     * <p>
     * Find the SecondEmailRequest object by its id.
     * </p>
     * 
     * @param userId
     *            the id.
     * @return the SecondEmailRequest object
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public SecondEmailRequest find(long userId) {
        String signature = CLASS_NAME + "#find(long)";

        log.debug("Entrance: " + signature + String.format(" with parameter userId = %s", userId));

        if (userId < 0) {
            throw new IllegalArgumentException("The userId must be a non-negetive decimal.");
        }

        SecondEmailRequest result =
            (SecondEmailRequest) session.createCriteria(SecondEmailRequest.class)
                .add(Restrictions.eq("userId", userId)).uniqueResult();

        log.debug("Exit: " + signature + " with result = " + toJSON(result));

        return result;
    }

    /**
     * <p>
     * Get the JSON String of SecondEmailRequest instance
     * </p>
     * 
     * @param request
     *            the SecondEmailRequest instance.
     * @return The JSON string.
     */
    String toJSON(SecondEmailRequest request) {
        if (request == null) {
            return "null";
        } else {
            JSONObject object = new JSONObject();
            object.setLong("expiredAt", request.getExpiredAt().getTime());
            object.setInt("randomKey", request.getRandomeKey());
            object.setString("secondMail", request.getSecondMail());
            object.setLong("userId", request.getUserId());
            return object.toJSONString();
        }
    }

}
