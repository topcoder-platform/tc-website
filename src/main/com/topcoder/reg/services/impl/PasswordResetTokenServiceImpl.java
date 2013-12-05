/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.services.PasswordResetTokenService;
import com.topcoder.reg.dto.PasswordResetTokenDTO;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.shared.util.logging.Logger;

/**
 * This class provides an implementation for {@link PasswordResetTokenService}.
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * </p>
 *
 * @author Urmass, 
 * @version 1.0
 * @since 1.0
 */
public class PasswordResetTokenServiceImpl extends BaseImpl implements PasswordResetTokenService {
    /**
     * Qualified name of this class.
     */
    private static final String CLASS_NAME = PasswordResetTokenServiceImpl.class.getName();
	
	private static final Logger logger = Logger.getLogger(PasswordResetTokenServiceImpl.class);

    /**
     * This query should be used to insert the token.
     */
    private static final String SQL_INSERT_PASSWORD_RESET_TOKEN =
            "INSERT INTO 'common_oltp':password_reset_token (user_id, email_type_id, token, expired_at) VALUES (?, ?, ?, ?)";
    /**
     * This query should be used to update the token.
     */
    private static final String SQL_UPDATE_PASSWORD_RESET_TOKEN =
            "UPDATE 'common_oltp':password_reset_token SET token = ?, expired_at = ? WHERE user_id = ? and email_type_id = ?";

    /**
     * This query is used to select the reset code DTO.
     */
    private static final String SQL_GET_PASSWORD_RESET_TOKEN_BY_USER_ID =
            "SELECT t.user_id, t.email_type_id, t.token, t.expired_at FROM 'common_oltp':password_reset_token AS t WHERE t.user_id = ? and t.email_type_id = ?";

    /**
     * This query is used to set the expired_at date of the token.
     */
    private static final String SQL_EXPIRE_PASSWORD_RESET_TOKEN =
            "UPDATE 'common_oltp':password_reset_token SET expired_at = ? WHERE user_id = ? and email_type_id = ?";


    /**
     * Default constructor.
     */
    public PasswordResetTokenServiceImpl() {
    }

    /**
     * This method saves the given token DTO.
     *
     * @param token - The given PasswordResetTokenDTO
     *
     * @throws PersistenceException
     *             If there is any DB error.
     */
    @Transactional(rollbackFor = PersistenceException.class, propagation = Propagation.REQUIRED)
    public void save(PasswordResetTokenDTO token) throws PersistenceException {
        final String signature = CLASS_NAME + "#save(long userId)";
        logger.info(signature);
        try {
            int updateCnt = jdbcTemplate.update(SQL_UPDATE_PASSWORD_RESET_TOKEN, token.getToken(),
                    token.getExpiredAt(), token.getUserId(), token.getEmailTypeId());
            if(updateCnt == 0) {
                jdbcTemplate.update(SQL_INSERT_PASSWORD_RESET_TOKEN, token.getUserId(), token.getEmailTypeId(), 
                        token.getToken(), token.getExpiredAt());
            }
            //LoggingWrapperUtility.logExit(logger, signature, new Object[] { token });
        } catch (DataAccessException e) {
            throw new PersistenceException("Error while persisting password reset code", e);
        } catch (Exception e) {
            throw new PersistenceException("Error while persisting password reset code", e);
        }

    }


    /**
     * This searches for the token DTO with given user id and email type id.
     *
     * @param userId - The given user id.
     * @param emailTypeId - The given email type id
     * @return - the entity.

     * @throws PersistenceException
     *             If there is any DB error.
     */
    @Transactional(readOnly = true)
    public PasswordResetTokenDTO find(long userId, long emailTypeId) throws PersistenceException {

        final String signature = CLASS_NAME + "#find(long userId, long emailTypeId)";
        logger.info(signature);
        PasswordResetTokenDTO token = null;
        try {
            token = jdbcTemplate.queryForObject(SQL_GET_PASSWORD_RESET_TOKEN_BY_USER_ID,
                    new PasswordResetTokenDTORowMapper(), userId, emailTypeId);
            //LoggingWrapperUtility.logExit(logger, signature, new Object[] { userId, emailTypeId });
        } catch (DataAccessException e) {
            logger.error(signature+e);
            //throw new PersistenceException("Error while getting password reset code from DB", e);
        }
        return token;
    }

    /**
     * This method expires the token DTO with given user id and email type id.
     *
     * @param userId - The given user id.
     * @param emailTypeId - The given email type id
     * @throws PersistenceException If there is any DB error.
     *
     */
    @Transactional(rollbackFor = PersistenceException.class, propagation = Propagation.REQUIRED)
    public void expire(long userId, long emailTypeId) throws PersistenceException {
        final String signature = CLASS_NAME + "#expire(long userId, long emailTypeId)";
        logger.info(signature);
        try {
            jdbcTemplate.update(SQL_EXPIRE_PASSWORD_RESET_TOKEN, new Date(), userId, emailTypeId);
            //LoggingWrapperUtility.logExit(logger, signature, new Object[] { userId, emailTypeId });
        } catch (DataAccessException e) {
            throw new PersistenceException("Error while expiring password reset code", e);
        } catch (Exception e) {
            throw new PersistenceException("Error while expiring password reset code", e);
        }    
    }


    /**
     * Map result set to desired PasswordResetTokenDTO.
     * <p>
     * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
     * </p>
     *
     * @author TCSASSEMBLER
     * @version 1.0
     * @since 1.0
     */
    private class PasswordResetTokenDTORowMapper implements RowMapper<PasswordResetTokenDTO> {

        /**
         * Map result set to desired entity.
         *
         * @param rs
         *            The result set.
         * @param rowNum
         *            Row number.
         * @throws SQLException
         *             If there is any error.
         */
        public PasswordResetTokenDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
            PasswordResetTokenDTO t = new PasswordResetTokenDTO();
            t.setUserId(rs.getLong("user_id"));
            t.setEmailTypeId(rs.getLong("email_type_id"));
            t.setToken(rs.getString("token"));
            t.setExpiredAt(rs.getDate("expired_at"));
            return t;
        }
    }


}
