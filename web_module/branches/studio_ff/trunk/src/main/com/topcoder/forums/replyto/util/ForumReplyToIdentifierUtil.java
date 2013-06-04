/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jivesoftware.base.database.ConnectionManager;
import com.topcoder.forums.replyto.model.ForumReplyToIdentifier;
import com.topcoder.shared.util.logging.Logger;

/**
 * This is the utility class to access <code>ForumReplyToIdentifier</code> records in database.
 *
 * @author flexme
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
public final class ForumReplyToIdentifierUtil {
    /**
     * Represents the logger.
     */
    private static final Logger LOGGER = Logger.getLogger(ForumReplyToIdentifierUtil.class);

    /**
     * Represents the SQL to get <code>ForumReplyToIdentifier</code> by reply-to identifier.
     */
    private static final String BY_IDENTIFIER_SQL = "SELECT user_id, message_id FROM " + 
            "jive_reply_to_identifiers WHERE reply_to_identifier = ?";

    /**
     * Private constructor.
     */
    private ForumReplyToIdentifierUtil() {
    }

    /**
     * Gets <code>ForumReplyToIdentifier</code> by reply-to identifier.
     *
     * @param identifier the reply-to identifier.
     * @return the <code>ForumReplyToIdentifier</code> if found, null if not found.
     * @throws ForumReplyToIdentifierUtilException if any error occurs.
     */
    public static ForumReplyToIdentifier getByIdentifier(String identifier) throws ForumReplyToIdentifierUtilException {
        Connection connection = null;
        PreparedStatement ps = null;
        LOGGER.debug("Enter ForumReplyToIdentifier#getByIdentifier(String identifier)");
        try {
            connection = ConnectionManager.getConnection();
            ps = connection.prepareStatement(BY_IDENTIFIER_SQL);
            ps.setString(1, identifier);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ForumReplyToIdentifier forumReplyToIdentifier = new ForumReplyToIdentifier();
                forumReplyToIdentifier.setIdentifier(identifier);
                forumReplyToIdentifier.setUserId(rs.getLong(1));
                forumReplyToIdentifier.setMessageId(rs.getLong(2));
                return forumReplyToIdentifier;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            // log error
            LOGGER.error("Error occurs when retrieving ForumReplyToIdentifier", ex);
            throw new ForumReplyToIdentifierUtilException("Error occurs when retrieving ForumReplyToIdentifier", ex);
        } finally {
            LOGGER.debug("Leaving ForumReplyToIdentifier#getByIdentifier(String identifier)");
            ConnectionManager.closeConnection(ps, connection);
        }
    }
}
