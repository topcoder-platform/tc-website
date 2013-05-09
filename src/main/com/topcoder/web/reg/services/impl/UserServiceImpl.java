/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.dto.UserDTO;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.services.UserService;
import com.topcoder.security.Util;
import com.topcoder.security.ldap.LDAPClient;
import com.topcoder.security.ldap.LDAPClientException;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;
import com.topcoder.util.log.Level;
import com.topcoder.web.common.StringUtils;

/**
 * This class provides an implementation for {@link UserService}.
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class UserServiceImpl extends BaseImpl implements UserService {

    /**
     * Qualified name of this class.
     */
    private static final String CLASS_NAME = UserServiceImpl.class.getName();

    /**
     * SQL to insert a new user.
     */
    private static final String SQL_INSERT_USER = "INSERT INTO user(user_id, first_name, last_name, handle, status, "
            + "activation_code, reg_source) VALUES (?, ?, ?, ?, 'U', ?, ?)";

    /**
     * SQL to insert new coder while registering new user.
     */
    private static final String SQL_INSERT_CODER = "INSERT INTO 'informixoltp':coder(coder_id, quote, coder_type_id,"
            + " comp_country_code, display_quote, quote_location, quote_color, display_banner, banner_style) "
            + "VALUES(?, '', null, ?,  1, 'md', '#000000', 1, 'bannerStyle4')";

    /**
     * SQL to insert into security_user while registering new user.
     */
    private static final String SQL_INSERT_SECURITY_USER = "INSERT INTO security_user(login_id, user_id, password, "
            + "create_user_id) VALUES(?, ?, ?, ?)";

    /**
     * SQL to insert new email record to email table when registering new user. The default email status_id is 2,
     * meaning inactive.
     */
    private static final String SQL_INSERT_EMAIL = "INSERT INTO email (user_id, email_id, email_type_id, address, "
            + "primary_ind, status_id) VALUES(?, ?, 1, ?, 1, 2)";

    /**
     * SQL to query user info by given handle.
     */
    private static final String SQL_GET_USER_BY_HANDLE = "SELECT u.user_id, u.first_name, u.last_name, u.handle, "
            + "u.status, u.reg_source AS source, e.address, c.comp_country_code AS country "
            + "FROM user AS u JOIN email AS e ON e.user_id = u.user_id "
            + "JOIN 'informixoltp':coder AS c ON c.coder_id = u.user_id WHERE u.handle = ?";

    /**
     * SQL to get user by given email address.
     */
    private static final String SQL_GET_USER_BY_EMAIL = "SELECT u.user_id, u.first_name, u.last_name, u.handle, "
            + "u.status, u.reg_source AS source, e.address, c.comp_country_code AS country "
            + "FROM user AS u JOIN email as e ON e.user_id = u.user_id "
            + "JOIN 'informixoltp':coder AS c ON c.coder_id = u.user_id WHERE e.address=?";

    /**
     * SQL to check group ID validity.
     */
    private static final String SQL_QUERY_GROUP_IDS = "SELECT group_id FROM security_groups WHERE group_id IN ";

    /**
     * SQL to query group IDs the given user already joined.
     */
    private static final String SQL_QUERY_PERTAINED_GROUP_IDS = "SELECT group_id FROM user_group_xref "
            + "WHERE login_id = ?";

    /**
     * SQL to add user to groups.
     */
    private static final String SQL_ADD_USER_TO_GROUPS = "INSERT INTO user_group_xref (user_group_id, login_id, "
            + "group_id, create_user_id, security_status_id) VALUES (?, ?, ?, 1, 1)";

    /**
     * SQL to query user status before activation.
     */
    private static final String SQL_USER_STATUS = "SELECT u.activation_code, u.status, e.status_id FROM user AS u "
            + "JOIN email AS e ON u.user_id = e.user_id WHERE u.user_id = ?";

    /**
     * SQL to activate user.
     */
    private static final String SQL_ACTIVATE_USER = "UPDATE user SET status = 'A' WHERE user_id = ?";

    /**
     * SQL to activate email.
     */
    private static final String SQL_ACTIVATE_EMAIL = "UPDATE email SET status_id = 1 WHERE user_id = ?";

    /**
     * Anonymous group id.
     */
    private static final long ANONYMOUS_GROUP_ID = 2000118;

    /**
     * Users group id.
     */
    private static final long USERS_GROUP_ID = 2;

    /**
     * This method saves user to database.
     * 
     * @param user
     *            User to persist.
     * @return User ID after persisting.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    @Transactional(rollbackFor = PersistenceException.class, propagation = Propagation.REQUIRED)
    public long registerUser(UserDTO user) throws PersistenceException {
        final String signature = CLASS_NAME + "#registerUser(User user)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "user" }, new Object[] { user });
        try {
            long userId = IDGeneratorFactory.getIDGenerator("USER_SEQ").getNextID();
            user.setUserId(userId);
            user.setActivationCode(StringUtils.getActivationCode(userId));
            jdbcTemplate.update(SQL_INSERT_USER, userId, user.getFirstName(), user.getLastName(), user.getHandle(),
                    user.getActivationCode(), user.getSource());
            jdbcTemplate.update(SQL_INSERT_CODER, userId, user.getCountry());
            jdbcTemplate.update(SQL_INSERT_SECURITY_USER, userId, userId,
                    Util.encodePassword(user.getPassword(), "users"), null);
            long emailId = IDGeneratorFactory.getIDGenerator("EMAIL_SEQ").getNextID();
            jdbcTemplate.update(SQL_INSERT_EMAIL, userId, emailId, user.getEmail());

            addTopCoderMemberProfile(userId, user.getHandle(), user.getPassword());

            addUserToGroups(userId, new long[] { ANONYMOUS_GROUP_ID, USERS_GROUP_ID });
            LoggingWrapperUtility.logExit(logger, signature, new Object[] { userId });
            return userId;
        } catch (IDGenerationException e) {
            throw new PersistenceException("Unable to generate id for new user", e);
        } catch (DataAccessException e) {
            throw new PersistenceException("Error while persisting user", e);
        } catch (Exception e) {
            throw new PersistenceException("Error while encrypting password or inserting LADP record", e);
        }

    }

    /**
     * Updates the <code>status</code> attributed for <code>LDAP</code> entry corresponding to specified
     * <code>TopCoder</code> member profile with <code>Active</code> status.
     * 
     * @param userId
     *            a <code>long</code> providing the user ID.
     * @throws LDAPClientException
     *             if an unexpected error occurs while communicating to <code>LDAP</code> server.
     */
    private void addTopCoderMemberProfile(long userId, String handle, String password) throws Exception {
        LDAPClient ldapClient = new LDAPClient();
        try {
            ldapClient.connect();
            ldapClient.addTopCoderMemberProfile(userId, handle, password, "U");
        } catch (LDAPClientException e) {
            throw new Exception("Failed to connect to LDAP server while activating user account. "
                    + "The process is not interrupted.", e);
        } finally {
            try {
                ldapClient.disconnect();
            } catch (LDAPClientException e) {
                throw new Exception("Failed to disconnect from LDAP server while activating user account. "
                        + "The process is not interrupted.", e);
            }
        }
    }

    /**
     * This method find User by given handle.
     * 
     * @param handle
     *            The given handle.
     * @return Instance of {@link UserDTO} if found; null otherwise.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    @Transactional(readOnly = true)
    public UserDTO getUserByHandle(final String handle) throws PersistenceException {
        final String signature = CLASS_NAME + "#getUserByHandle(String handle)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "handle" }, new String[] { handle });
        UserDTO user = null;
        try {
            user = jdbcTemplate.queryForObject(SQL_GET_USER_BY_HANDLE, new UserDTORowMapper(), handle);
            LoggingWrapperUtility.logExit(logger, signature, new Object[] { user });
            return user;
        } catch (DataAccessException e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while getting user from DB", e);
        }

    }

    /**
     * This method find User by given email address.
     * 
     * @param email
     *            Email address.
     * @return Instance of the {@link UserDTO} if found; null otherwise.
     * @throws PersistenceException
     *             If there is any DB error.
     */
    @Transactional(readOnly = true)
    public UserDTO getUserByEmail(final String email) throws PersistenceException {
        final String signature = CLASS_NAME + "#getUserByEmail(final String email)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "email" }, new String[] { email });
        UserDTO user = null;

        try {
            user = jdbcTemplate.queryForObject(SQL_GET_USER_BY_EMAIL, new UserDTORowMapper(), email);
            LoggingWrapperUtility.logExit(logger, signature, new Object[] { user });
            return user;
        } catch (DataAccessException e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while getting user from DB", e);
        }

    }

    /**
     * Map result set to desired UserDTO.
     * <p>
     * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
     * </p>
     * 
     * @author leo_lol
     * @version 1.0
     * @since 1.0
     */
    private class UserDTORowMapper implements RowMapper<UserDTO> {

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
        public UserDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
            UserDTO u = new UserDTO();
            u.setFirstName(rs.getString("first_name"));
            u.setLastName(rs.getString("last_name"));
            u.setEmail(rs.getString("address"));
            u.setCountry(rs.getString("country"));
            u.setSource(rs.getString("source"));
            u.setUserId(rs.getLong("user_id"));
            u.setHandle(rs.getString("handle"));
            u.setStatus(rs.getString("status").charAt(0));
            return u;
        }
    }

    /**
     * This method adds user to groups.
     * 
     * @param userId
     *            User ID.
     * @param groupIds
     *            Group IDs.
     * @throws PersistenceException
     *             If there is any error.
     */
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = PersistenceException.class)
    public void addUserToGroups(long userId, long[] groupIds) throws PersistenceException {
        final String signature = CLASS_NAME + "#addUserToGroups(long userId, long[] groupIds)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "userId", "groupIds" }, new Object[] {
                userId, groupIds });
        if (null == groupIds || groupIds.length == 0) {
            LoggingWrapperUtility.logExit(logger, signature, null);
            return;
        }

        try {
            List<Map<String, Object>> existingGroupIds = jdbcTemplate.queryForList(SQL_QUERY_GROUP_IDS
                    + convertArrayToSqlList(groupIds));
            if (existingGroupIds.size() < groupIds.length) {
                throw new PersistenceException("At least one of the groupIds is invalid");
            }
            List<Long> joinedGroups = jdbcTemplate.queryForList(SQL_QUERY_PERTAINED_GROUP_IDS, Long.class, userId);
            IDGenerator userGroupIDGenerator = IDGeneratorFactory.getIDGenerator("USER_GROUP_SEQ");
            for (long groupId : groupIds) {
                if (!joinedGroups.contains(groupId)) {
                    long userGroupId = userGroupIDGenerator.getNextID();
                    jdbcTemplate.update(SQL_ADD_USER_TO_GROUPS, userGroupId, userId, groupId);
                }
            }

        } catch (IDGenerationException e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while generating user_group_xref#user_group_id using id_generator", e);
        } catch (DataAccessException e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while joining user to groups", e);
        }

        LoggingWrapperUtility.logExit(logger, signature, null);
    }

    /**
     * This method converts array to SQL snippet.
     * 
     * @param data
     *            Array to convert.
     * @return SQL String.
     */
    private String convertArrayToSqlList(long[] data) {
        if (null == data || data.length == 0) {
            return "";
        }

        final int len = data.length;
        StringBuilder sb = new StringBuilder(100);
        sb.append(" (");
        for (int i = 0; i < len - 1; i++) {
            sb.append(data[i]).append(", ");
        }
        sb.append(data[len - 1]).append(" )");
        return sb.toString();
    }

    /**
     * This method activates the account according to the given code.
     * 
     * @param activationCode
     *            Activation code. Assumed Not null.
     * @throws PersistenceException
     *             If there Any error. Say activation code wrong.
     */
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = PersistenceException.class)
    public void activate(String activationCode) throws PersistenceException {
        final String signature = CLASS_NAME + "#activate(String activationCode)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "activationCode" },
                new String[] { activationCode });
        long userId = StringUtils.getCoderId(activationCode);
        try {
            SqlRowSet rowSet = jdbcTemplate.queryForRowSet(SQL_USER_STATUS, userId);
            if (rowSet.first()) {
                String activationCodeInDB = rowSet.getString("activation_code");
                String status = rowSet.getString("status");
                int emailStatusId = rowSet.getInt("status_id");

                if (!activationCode.equals(activationCodeInDB)) {
                    throw new PersistenceException("Invalid activation code");
                }

                if (!"U".equals(status)) {
                    throw new PersistenceException("User has been activated");
                }

                if (1 == emailStatusId) {
                    throw new PersistenceException("Email has been activated");
                }
            } else {
                throw new PersistenceException("Invalid activation code");
            }
            jdbcTemplate.update(SQL_ACTIVATE_USER, userId);
            jdbcTemplate.update(SQL_ACTIVATE_EMAIL, userId);
            activateLDAPEntry(userId);
        } catch (InvalidResultSetAccessException e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while activating account", e);
        } catch (DataAccessException e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while activating account", e);
        } catch (LDAPClientException e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            throw new PersistenceException("Error while activating LDAP status", e);
        }
        LoggingWrapperUtility.logExit(logger, signature, null);
    }

    /**
     * <p>
     * Updates the status attributed of LDAP entry corresponding to specified TopCoder member profile with Active
     * status.
     * </p>
     * 
     * @param userId
     *            a providing the user ID.
     * @throws LDAPClientException
     *             if an unexpected error occurs while communicating to LDAP server.
     */
    private void activateLDAPEntry(long userId) throws LDAPClientException {
        final String signature = CLASS_NAME + "#activateLDAPEntry(long userId)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "userId" }, new Object[] { userId });
        LDAPClient ldapClient = new LDAPClient();
        try {
            ldapClient.connect();
            ldapClient.activateTopCoderMemberProfile(userId);
        } finally {
            try {
                ldapClient.disconnect();
            } catch (LDAPClientException e) {
                LoggingWrapperUtility.logException(logger, signature, e);
                logger.log(Level.ERROR, "Failed to disconnect from LDAP server while activating user account. "
                        + "The process is not interrupted.");
            }
        }
        LoggingWrapperUtility.logExit(logger, signature, null);
    }

}
