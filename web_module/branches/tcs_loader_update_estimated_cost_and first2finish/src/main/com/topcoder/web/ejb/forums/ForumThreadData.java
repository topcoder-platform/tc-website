/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.forums;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * The DTO for storing the data for a forum thread. It's used by the Forums EJB.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0 (Module Assembly - CloudSpokes Challenge Discussions Loader Assembly)
 */
public class ForumThreadData implements Serializable {

    /**
     * The TC user id of the creator.
     */
    private long creatorId;

    /**
     * The username of the creator.
     */
    private String creatorName;

    /**
     * The creation time.
     */
    private Date creationTime;

    /**
     * The modification time.
     */
    private Date modificationTime;

    /**
     * The root message of the thread.
     */
    private ForumMessageData rootMessage;

    /**
     * Gets the TC user id of the creator.
     *
     * @return
     */
    public long getCreatorId() {
        return creatorId;
    }

    /**
     * Sets the TC user id of the creator.
     *
     * @param creatorId
     */
    public void setCreatorId(long creatorId) {
        this.creatorId = creatorId;
    }

    /**
     * Gets the creator name.
     *
     * @return the creator name.
     */
    public String getCreatorName() {
        return creatorName;
    }

    /**
     * Gets the creator name.
     *
     * @param creatorName the creator name.
     */
    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    /**
     * Gets the creation time.
     *
     * @return the creation time.
     */
    public Date getCreationTime() {
        return creationTime;
    }

    /**
     * Gets the creation time.
     *
     * @param creationTime the creation time.
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    /**
     * Gets the modification time.
     *
     * @return the modification time.
     */
    public Date getModificationTime() {
        return modificationTime;
    }

    /**
     * Sets the modification time.
     *
     * @param modificationTime the modification time.
     */
    public void setModificationTime(Date modificationTime) {
        this.modificationTime = modificationTime;
    }

    /**
     * Gets the root message.
     *
     * @return the root message.
     */
    public ForumMessageData getRootMessage() {
        return rootMessage;
    }

    /**
     * Sets the root message.
     *
     * @param rootMessage the root message.
     */
    public void setRootMessage(ForumMessageData rootMessage) {
        this.rootMessage = rootMessage;
    }
}
