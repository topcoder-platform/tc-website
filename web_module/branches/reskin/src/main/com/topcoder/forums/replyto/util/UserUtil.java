/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jivesoftware.base.database.ConnectionManager;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.User;

/**
 * This is the utility class to access <code>User</code> records in database.
 *
 * @author flexme
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
public final class UserUtil {
    /**
     * Represents the logger.
     */
    private static final Logger LOGGER = Logger.getLogger(UserUtil.class);
    
    /**
     * Represents the SQL to get <code>User</code> by email address.
     */
    private static final String BY_EMAIL_SQL = "SELECT u.user_id, u.handle FROM " + 
            "user u, email e WHERE u.user_id = e.user_id AND lower(e.address) = ? and u.status = 'A' and e.primary_ind = 1";
    
    /**
     * Private constructor.
     */
    private UserUtil() {
    }
    
    /**
     * Gets the users by the email address.
     *
     * @param email the email address.
     * @return the retrieved users.
     * @throws UserUtilException if any error occurs.
     */
    public static List<User> getUsersByEmail(String email) throws UserUtilException {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        LOGGER.debug("Enter UserUtil#getUsersByEmail(String email)");
        try {
            connection = ConnectionManager.getConnection();
            ps = connection.prepareStatement(BY_EMAIL_SQL);
            ps.setString(1, email.toLowerCase());
            rs = ps.executeQuery();
            List<User> users = new ArrayList<User>();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getLong(1));
                user.setHandle(rs.getString(2));
                users.add(user);
            }
            return users;
        } catch (SQLException ex) {
            // log error
            LOGGER.error("Error occurs when retrieving users", ex);
            throw new UserUtilException("Error occurs when retrieving users", ex);
        } finally {
            LOGGER.debug("Leaving UserUtil#getUsersByEmail(String email)");
            DBMS.close(connection, ps, rs);
        }
    }
}
