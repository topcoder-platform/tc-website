/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload.cloudspokes.forum;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * The model for reading and parsing json response for CloudSpokes challenge data retrieved from CloudSpokes API.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0 (Module Assembly - CloudSpokes Challenge Discussions Loader Assembly)
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Challenge implements Serializable {

    /**
     * The challenge name.
     */
    @JsonProperty("name")
    private String name;

    /**
     * Gets the challenge name.
     *
     * @return the challenge name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the challenge name.
     *
     * @param name the challenge name.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * The static inner class represents the participant of a challenge.
     */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Participant implements Serializable {

        /**
         * The user id.
         */
        @JsonProperty("member")
        private String memberId;

        /**
         * Gets the user id.
         *
         * @return the user id.
         */
        public String getMemberId() {
            return memberId;
        }

        /**
         * Sets the user id.
         *
         * @param memberId the user id.
         */
        public void setMemberId(String memberId) {
            this.memberId = memberId;
        }
    }

    /**
     * The static inner class represents the comment of the discussions of the challenge.
     */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Comment implements Serializable {

        /**
         * Whether the comment is from the admin.
         */
        @JsonProperty("from_challenge_admin")
        private boolean fromAdmin;

        /**
         * The content of the comment.
         */
        @JsonProperty("comment")
        private String commentContent;

        /**
         * The user id of the poster of the comment.
         */
        @JsonProperty("member")
        private String memberId;

        /**
         * The create date of the comment.
         */
        @JsonProperty("createddate")
        private Date createdDate;

        /**
         * The replies data of the comment.
         */
        @JsonProperty("challenge_comments__r")
        private CommentReplies replies;

        /**
         * Gets whether the comment is from the admin.
         *
         * @return whether the comment is from the admin.
         */
        public boolean isFromAdmin() {
            return fromAdmin;
        }

        /**
         * Sets the comment is from the admin.
         *
         * @param fromAdmin whether the comment is from admin.
         */
        public void setFromAdmin(boolean fromAdmin) {
            this.fromAdmin = fromAdmin;
        }

        /**
         * Gets the comment content.
         *
         * @return the comment content.
         */
        public String getCommentContent() {
            return commentContent;
        }

        /**
         * Sets the comment content
         *
         * @param commentContent the comment content.
         */
        public void setCommentContent(String commentContent) {
            this.commentContent = commentContent;
        }

        /**
         * Gets the user id.
         *
         * @return the user id.
         */
        public String getMemberId() {
            return memberId;
        }

        /**
         * Gets the user id.
         *
         * @param memberId the user id.
         */
        public void setMemberId(String memberId) {
            this.memberId = memberId;
        }

        /**
         * Gets the create date
         *
         * @return the create date.
         */
        public Date getCreatedDate() {
            return createdDate;
        }

        /**
         * Sets the create date.
         *
         * @param createdDate the create date.
         */
        public void setCreatedDate(Date createdDate) {
            this.createdDate = createdDate;
        }

        /**
         * Gets the replies.
         *
         * @return the replies.
         */
        public CommentReplies getReplies() {
            return replies;
        }

        /**
         * Sets the replies.
         *
         * @param replies the replies.
         */
        public void setReplies(CommentReplies replies) {
            this.replies = replies;
        }
    }


    /**
     * The comment replies.
     */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CommentReplies implements Serializable {

        /**
         * The total size of the comment replies.
         */
        @JsonProperty("totalsize")
        private int totalSize;

        /**
         * The comment replies.
         */
        @JsonProperty("records")
        private List<Comment> replies;

        /**
         * Gets the total size.
         *
         * @return the total size.
         */
        public int getTotalSize() {
            return totalSize;
        }

        /**
         * Sets the total size.
         *
         * @param totalSize the total size.
         */
        public void setTotalSize(int totalSize) {
            this.totalSize = totalSize;
        }

        /**
         * Gets replies.
         *
         * @return the replies.
         */
        public List<Comment> getReplies() {
            return replies;
        }

        /**
         * Sets the replies.
         *
         * @param replies the replies.
         */
        public void setReplies(List<Comment> replies) {
            this.replies = replies;
        }
    }
}
