/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.model;

import java.io.Serializable;

/**
 * This is a simple Java Bean which holds the user ID, forum message ID and the forum reply-to identifier.
 * This class directly maps to JIVE_REPLY_TO_IDENTIFIERS database table.
 *
 * @author flexme
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
public class ForumReplyToIdentifier implements Serializable {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = -3259678230932582651L;

    /**
     * Represents the reply-to identifier.
     */
    private String identifier;
    
    /**
     * Represents the user ID.
     */
    private long userId;
    
    /**
     * Represents the forum message ID.
     */
    private long messageId;
    
    /**
     * Empty constructor.
     */
    public ForumReplyToIdentifier() {
    }

    /**
     * Gets the reply-to identifier.
     * 
     * @return the reply-to identifier.
     */
    public String getIdentifier() {
        return identifier;
    }

    /**
     * Sets the reply-to identifier.
     * 
     * @param identifier the reply-to identifier.
     */
    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    /**
     * Gets the user ID.
     * @return the user ID.
     */
    public long getUserId() {
        return userId;
    }

    /**
     * Sets the user ID.
     * 
     * @param userId the user ID.
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * Gets the forum message ID.
     * 
     * @return the forum message ID.
     */
    public long getMessageId() {
        return messageId;
    }

    /**
     * Sets the forum message ID.
     * 
     * @param messageId the forum message ID.
     */
    public void setMessageId(long messageId) {
        this.messageId = messageId;
    }
}
