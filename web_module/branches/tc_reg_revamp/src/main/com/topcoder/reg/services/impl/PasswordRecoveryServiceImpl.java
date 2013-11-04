/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.services.PasswordRecoveryService;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.services.ServiceException;
import com.topcoder.web.common.model.PasswordRecovery;
import com.topcoder.web.common.model.User;
import com.topcoder.shared.util.logging.Logger;

/**
 * This class provides an implementation for {@link PasswordRecoveryService} on basis of {@link JdbcTemplate}.
 * <p>
 * <strong>Thread Safety:</strong> This class is thread-safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class PasswordRecoveryServiceImpl extends BaseImpl implements PasswordRecoveryService {

    /**
     * Qualified name of this class.
     */
    private static final String CLASS_NAME = PasswordRecoveryServiceImpl.class.getName();
	
	private static final Logger logger = Logger.getLogger(PasswordRecoveryServiceImpl.class);

    /**
     * SQL to insert new password recovery record.
     */
    private static final String SQL_INSERT_PASSWORD_RECOVERY = "INSERT INTO password_recovery(password_recovery_id, "
            + "user_id, expire_date, recovery_address, used_ind)" + " VALUES (?, ?, ?, ?, 0)";

    /**
     * SQL to query password recovery record.
     */
    private static final String SQL_QUERY_PASSWORD_RECOVERY = "SELECT user_id, expire_date, recovery_address, used_ind "
            + "FROM password_recovery WHERE password_recovery_id = ?";

    /**
     * SQL to update the use state.
     */
    private static final String SQL_UPDATE_PASSWORD_RECOVERY_USE = "UPDATE password_recovery SET used_ind = 1 "
            + "WHERE password_recovery_id = ?";

    /**
     * This method persist a password recovery request.
     * 
     * @param passwordRecovery
     *            Instance of {@link PasswordRecovery} to persist
     * @throws ServiceException
     *             If there is any error.
     */
    @Transactional(rollbackFor = ServiceException.class, propagation = Propagation.REQUIRED)
    public void create(PasswordRecovery passwordRecovery) throws ServiceException {
        final String signature = CLASS_NAME + "#create(PasswordRecovery passwordRecovery)";
        logger.info(signature);
        try {
            jdbcTemplate.update(SQL_INSERT_PASSWORD_RECOVERY, passwordRecovery.getId(), passwordRecovery.getUser()
                    .getId(), passwordRecovery.getExpireDate(), passwordRecovery.getRecoveryAddress());
        } catch (DataAccessException e) {
            logger.error(signature+e);
            throw new PersistenceException("Error while inserting password recovery record into DB", e);
        }
    }

    /**
     * This method attempts to find the password recovery record according to the given ID.
     * 
     * @param passwordRecoveryId
     *            The given ID.
     * @return The password recovery entity found.
     * @throws ServiceException
     *             If there is any error.
     */
    @Transactional(readOnly = true)
    public PasswordRecovery find(final long passwordRecoveryId) throws ServiceException {
        final String signature = CLASS_NAME + "#find(long passwordRecoveryId) ";
        logger.info(signature);

        PasswordRecovery passwordRecovery = null;
        try {
            passwordRecovery = jdbcTemplate.queryForObject(SQL_QUERY_PASSWORD_RECOVERY,
                    new RowMapper<PasswordRecovery>() {
                        /**
                         * Map result set row to model entity.
                         * 
                         * @param rs
                         *            ResultSet instance
                         * @param row
                         *            Row count.
                         */
                        public PasswordRecovery mapRow(ResultSet rs, int row) throws SQLException {
                            PasswordRecovery passwordRecovery = new PasswordRecovery();
                            passwordRecovery.setId(passwordRecoveryId);
                            passwordRecovery.setExpireDate(rs.getDate("expire_date"));
                            passwordRecovery.setRecoveryAddress(rs.getString("recovery_address"));
                            passwordRecovery.setUsed(rs.getInt("used_ind") > 0);
                            User u = new User();
                            u.setId(rs.getLong("user_id"));
                            passwordRecovery.setUser(u);
                            return passwordRecovery;
                        }
                    }, passwordRecoveryId);
        } catch (DataAccessException e) {
            logger.error(signature, e);
            throw new PersistenceException("Error while getting password recovery record from DB", e);
        }

        //.logExit(logger, signature, new Object[] { passwordRecovery });
        return passwordRecovery;
    }

    /**
     * This method would mark the password recovery as used.
     * 
     * @param passwordRecoveryId
     *            ID of the record to mark.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    public void use(long passwordRecoveryId) throws PersistenceException {
        final String signature = CLASS_NAME + "#use(long passwordRecoveryId)";
        logger.info(signature);
        try {
            jdbcTemplate.update(SQL_UPDATE_PASSWORD_RECOVERY_USE, passwordRecoveryId);
            //LoggingWrapperUtility.logExit(logger, signature, null);
        } catch (DataAccessException e) {
            logger.error(signature, e);
            throw new PersistenceException("Error while updating password recovery use state", e);
        }
    }

}
