/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import java.util.Date;

import org.hibernate.criterion.Restrictions;
import org.hibernate.HibernateException;

import com.topcoder.json.object.JSONObject;
import com.topcoder.web.common.dao.PasswordResetTokenDAO;
import com.topcoder.web.common.model.PasswordResetToken;

/**
 * <p>
 * The hibernate implementation of password reset token DAO used in Password Recovery Process.
 * </p>
 * <p>
 * Thread safety: The DAO instances are created for each controller when they are used, thus there won't be
 * multiple threads accessing the same DAO. No multiple threads share the same model class instances. Thus there's
 * no thread-safety concern.
 * </p>
 * 
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public class PasswordResetTokenDAOHibernate extends Base implements PasswordResetTokenDAO {

    /**
     * <p>
     * The class name.
     * </p>
     */
    public final String CLASS_NAME = PasswordResetTokenDAOHibernate.class.getName();

    /**
     * <p>
     * Find the PasswordResetToken object by id.
     * </p>
     * 
     * @param userId
     *            the unique id.
     * @return the matched PasswordResetToken object;
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public PasswordResetToken find(long userId) {
        String signature = CLASS_NAME + "# find(long userId)";

        log.debug("Entrance: " + signature + " with parameter userId = " + userId);

        if (userId < 0) {
            throw new IllegalArgumentException("The userId must be a non-negetive decimal.");
        }
        PasswordResetToken result =
            (PasswordResetToken) session.createCriteria(PasswordResetToken.class)
                .add(Restrictions.eq("userId", userId)).uniqueResult();

        log.debug("Exit: " + signature + " with result" + toJSON(result));
        return result;
    }

    /**
     * <p>
     * Expire the token.
     * </p>
     * 
     * @param userId
     *            the user id to find the PasswordResetToken object.
     * @param token
     *            the token to expire.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public void expireToken(long userId, String token) {
        String signature = CLASS_NAME + "#expireToken(long userId, String token)";
        log.debug("Entrance: " + signature + String.format(" with parameter userId = %d, token = %s", userId, token));

        if (userId < 0) {
            throw new IllegalArgumentException("The userId must be a non-negetive decimal.");
        }

        if (token == null || token.trim().equals("")) {
            throw new IllegalArgumentException("The token must be not null or empty.");
        }

        PasswordResetToken passwordResetToken = find(userId);
        if (passwordResetToken != null) {
            passwordResetToken.setExpiredAt(new Date());
            session.saveOrUpdate(passwordResetToken);
        }
        log.debug("Exit: " + signature + " with no result");
    }

    /**
     * <p>
     * Save the token to persistence.
     * </p>
     * 
     * 
     * @param userId
     *            the user id to find the PasswordResetToken object.
     * @param token
     *            the token to expire.
     * @param expiredAt
     *            the expired date.
     * @throws IllegalArgumentException
     *             if the argument is invalid.
     * @throws HibernateException
     *             if any SQL errors occurs.
     */
    public void saveToken(long userId, String token, Date expiredAt) {
        String signature = CLASS_NAME + "#saveToken(long userId, String token, Date expiredAt)";
        log.debug("Entrance: " + signature
            + String.format(" with parameter userId = %d, token = %s, exipredAt=%s", userId, token, expiredAt));

        if (userId < 0) {
            throw new IllegalArgumentException("The userId must be a non-negetive decimal.");
        }

        if (token == null || token.trim().equals("")) {
            throw new IllegalArgumentException("The token must be not null or empty.");
        }

        if (expiredAt == null) {
            throw new IllegalArgumentException("The expiredAt must be not null.");
        }

        PasswordResetToken passwordResetToken = find(userId);
        if (passwordResetToken == null) {
            passwordResetToken = new PasswordResetToken();
        }
        passwordResetToken.setUserId(userId);
        passwordResetToken.setToken(token);
        passwordResetToken.setExpiredAt(expiredAt);
        session.saveOrUpdate(passwordResetToken);
        log.debug("Exit: " + signature + " with no result");
    }

    /**
     * <p>
     * Get the JSON String of PasswordResetToken instance
     * </p>
     * 
     * @param token
     *            the PasswordResetToken instance.
     * @return The JSON string.
     */
    String toJSON(PasswordResetToken token) {
        if (token == null) {
            return "null";
        } else {
            JSONObject object = new JSONObject();
            object.setLong("expiredAt", token.getExpiredAt().getTime());
            object.setString("token", token.getToken());
            object.setLong("userId", token.getUserId());
            return object.toJSONString();
        }
    }
}
