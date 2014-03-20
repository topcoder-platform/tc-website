/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.forums;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * The DTO for storing the data of a forum message. It's used by the Forums EJB.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class ForumMessageData implements Serializable {

    /**
     * The TopCoder user id of the creator.
     */
    private long creatorId;

    /**
     * The creator name.
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
     * The content.
     */
    private String content;

    /**
     * The replies.
     */
    private List<ForumMessageData> replies;

    /**
     * Gets the TC user id of the creator.
     *
     * @return the TC user id.
     */
    public long getCreatorId() {
        return creatorId;
    }

    /**
     * Sets the TC user id of the creator.
     *
     * @param creatorId the TC user id.
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
     * Sets the creator name.
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
     * Sets the creation time.
     *
     * @param creationTime the creation time.
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    /**
     * Gets the modification time.
     *
     * @return the modficiation time.
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
     * Gets the content.
     *
     * @return
     */
    public String getContent() {
        return content;
    }

    /**
     * Sets the content.
     *
     * @param content the content.
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * Gets the replies.
     *
     * @return the replies.
     */
    public List<ForumMessageData> getReplies() {
        return replies;
    }

    /**
     * Sets the replies.
     *
     * @param replies the replies.
     */
    public void setReplies(List<ForumMessageData> replies) {
        this.replies = replies;
    }
}
