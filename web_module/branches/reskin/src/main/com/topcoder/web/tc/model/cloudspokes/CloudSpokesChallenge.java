/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.model.cloudspokes;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * The entity model to represent a CloudSpokes Challenge. It has annotations to use by the jackson
 * to deserialize json string to the instance of this class.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class CloudSpokesChallenge implements Serializable {

    /**
     * The status name of first place winner.
     */
    private static final String FIRST_PLACE = "1st place";

    /**
     * The status name of the 2nd place winner.
     */
    private static final String SECOND_PLACE = "2nd place";

    /**
     * The challenge name.
     */
    @JsonProperty("name")
    private String name;

    /**
     * The challenge id.
     */
    @JsonProperty("challenge_id")
    private long challengeId;

    /**
     * The challenge prize.
     */
    @JsonProperty("total_prize_money")
    private double prize;

    /**
     * The challenge end date.
     */
    @JsonProperty("end_date")
    private Date endDate;

    /**
     * The registrants number.
     */
    @JsonProperty("registered_members")
    private int registrantsNumber;

    /**
     * The list of participants.
     */
    @JsonProperty("challenge_participants__r")
    private List<Participant> participants;

    /**
     * The challenge type.
     */
    @JsonProperty("challenge_type")
    private String challengeType;

    /**
     * Gets the name.
     *
     * @return the name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name.
     *
     * @param name the name.
     */
    public void setName(String name) {
        this.name = name;
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
     * Gets the prize.
     *
     * @return the prize.
     */
    public double getPrize() {
        return prize;
    }

    /**
     * Sets the prize.
     *
     * @param prize the prize.
     */
    public void setPrize(double prize) {
        this.prize = prize;
    }

    /**
     * Gets the end date.
     *
     * @return the end date.
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * Sets the end date.
     *
     * @param endDate the end date.
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
     * Gets the registrants number.
     *
     * @return the registrants number.
     */
    public int getRegistrantsNumber() {
        return registrantsNumber;
    }

    /**
     * Sets the registrants number.
     *
     * @param registrantsNumber the registrants number.
     */
    public void setRegistrantsNumber(int registrantsNumber) {
        this.registrantsNumber = registrantsNumber;
    }

    /**
     * Gets the participants list.
     *
     * @return the participants list.
     */
    public List<Participant> getParticipants() {
        return participants;
    }

    /**
     * Sets the participants list.
     *
     * @param participants the participants list.
     */
    public void setParticipants(List<Participant> participants) {
        this.participants = participants;
    }

    /**
     * Gets the challenge type.
     *
     * @return the challenge type.
     */
    public String getChallengeType() {
        return challengeType;
    }

    /**
     * Sets the challenge type.
     *
     * @param challengeType the challenge type.
     */
    public void setChallengeType(String challengeType) {
        this.challengeType = challengeType;
    }

    /**
     * Gets the winner name in review phase.
     *
     * @return the winner name in the review phase.
     */
    public String getReviewPhaseWinnerName() {
        if (participants != null && participants.size() > 0) {
            for (Participant p : participants) {
                if (p.getStatus().toLowerCase().equals(FIRST_PLACE)) {
                    return p.getMemberName();
                }
            }
        }
        return "";
    }

    /**
     * Gets the 2nd place winner name in review phase.
     *
     * @return the 2nd place winner name.
     */
    public String getReviewPhaseSecondName() {
        if (participants != null && participants.size() > 0) {
            for (Participant p : participants) {
                if (p.getStatus().toLowerCase().equals(SECOND_PLACE)) {
                    return p.getMemberName();
                }
            }
        }

        return "";
    }

    /**
     * Gets the first place winner in finished contest.
     *
     * @return the first place winner name.
     */
    public String getFinalWinnerName() {
        if (participants != null && participants.size() > 0) {
            for (Participant p : participants) {
                if (p.getStatus().toLowerCase().equals(FIRST_PLACE)) {
                    return p.getRecord().getName();
                }
            }
        }
        return "";
    }

    /**
     * Gets the second place winner in finished contest.
     *
     * @return the second place winner name.
     */
    public String getFinalSecondName() {
        if (participants != null && participants.size() > 0) {
            for (Participant p : participants) {
                if (p.getStatus().toLowerCase().equals(SECOND_PLACE)) {
                    return p.getRecord().getName();
                }
            }
        }

        return "";
    }

    /**
     * Gets the winner score.
     *
     * @return the winner score.
     */
    public Double getWinnerScore() {
        if (participants != null && participants.size() > 0) {
            for (Participant p : participants) {
                if (p.getStatus().toLowerCase().equals(FIRST_PLACE)) {
                    return p.getScore();
                }
            }
        }
        return null;
    }
}
