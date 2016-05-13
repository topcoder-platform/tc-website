/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload.cloudspokes.forum;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * The DTO is record all the data needs for migrating a CloudSpokes challenge discussion board to
 * TopCoder contest forum.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class ForumMigrationDTO implements Serializable {
    /**
     * The id of the TC contest.
     */
    private long contestId;

    /**
     * The id of the CS challenge.
     */
    private long challengeId;

    /**
     * The version id of the TC component.
     */
    private long compVersionId;

    /**
     * The CS challenge.
     */
    private Challenge challenge;

    /**
     * The participants of the CS challenge.
     */
    private List<Challenge.Participant> participants;

    /**
     * The comments of the CS challenge.
     */
    private List<Challenge.Comment> comments;

    /**
     * Gets the contest id.
     *
     * @return the contest id.
     */
    public long getContestId() {
        return contestId;
    }

    /**
     * Sets the contest id.
     *
     * @param contestId the contest id.
     */
    public void setContestId(long contestId) {
        this.contestId = contestId;
    }

    /**
     * Gets the challenge id.
     *
     * @return the challenge id.
     */
    public long getChallengeId() {
        return challengeId;
    }

    /**
     * Sets the challenge id.
     *
     * @param challengeId the challenge id.
     */
    public void setChallengeId(long challengeId) {
        this.challengeId = challengeId;
    }

    /**
     * Gets the comp version id.
     *
     * @return the comp version id.
     */
    public long getCompVersionId() {
        return compVersionId;
    }

    /**
     * Sets the comp version id.
     *
     * @param compVersionId the comp version id.
     */
    public void setCompVersionId(long compVersionId) {
        this.compVersionId = compVersionId;
    }

    /**
     * Gets the challenge.
     *
     * @return the challenge.
     */
    public Challenge getChallenge() {
        return challenge;
    }

    /**
     * Sets the challenge
     *
     * @param challenge the challenge.
     */
    public void setChallenge(Challenge challenge) {
        this.challenge = challenge;
    }

    /**
     * Gets the challenge participants.
     *
     * @return the challenge participants.
     */
    public List<Challenge.Participant> getParticipants() {
        return participants;
    }

    /**
     * Sets the challenge participants.
     *
     * @param participants the challenge participants.
     */
    public void setParticipants(List<Challenge.Participant> participants) {
        this.participants = participants;
    }

    /**
     * Gets the challenge comments.
     *
     * @return the challenge comments.
     */
    public List<Challenge.Comment> getComments() {
        return comments;
    }

    /**
     * Sets the challenge comments.
     *
     * @param comments the challenge comments.
     */
    public void setComments(List<Challenge.Comment> comments) {
        this.comments = comments;
    }
}
