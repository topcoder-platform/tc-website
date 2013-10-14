/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.model.cloudspokes;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

import java.io.Serializable;

/**
 * <p>
 * The entity model to represent a CloudSpokes Challenge Participant. It has annotations to use by the jackson
 * to deserialize json string to the instance of this class.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Participant implements Serializable {

    /**
     * The name of the member.
     */
    @JsonProperty("membername")
    private String memberName;

    /**
     * The status.
     */
    @JsonProperty("status")
    private String status;

    /**
     * The placement.
     */
    @JsonProperty("place")
    private int place;

    /**
     * The member record
     */
    @JsonProperty("member__r")
    private MemberRecord record;

    /**
     * The score the participant gets.
     */
    @JsonProperty("score")
    private double score;

    /**
     * Gets the member name.
     *
     * @return the member name.
     */
    public String getMemberName() {
        return memberName;
    }

    /**
     * Sets the member name.
     *
     * @param memberName the member name.
     */
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    /**
     * Gets the status.
     *
     * @return the status.
     */
    public String getStatus() {
        return status;
    }

    /**
     * Sets the status.
     *
     * @param status the status.
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * Gets the placement.
     *
     * @return the placement.
     */
    public int getPlace() {
        return place;
    }

    /**
     * Sets the placement.
     *
     * @param place the placement.
     */
    public void setPlace(int place) {
        this.place = place;
    }

    /**
     * Gets the record.
     *
     * @return the record.
     */
    public MemberRecord getRecord() {
        return record;
    }

    /**
     * Sets the record.
     *
     * @param record the record.
     */
    public void setRecord(MemberRecord record) {
        this.record = record;
    }

    /**
     * Gets the score.
     *
     * @return the score.
     */
    public double getScore() {
        return score;
    }

    /**
     * Sets the score.
     *
     * @param score the score.
     */
    public void setScore(double score) {
        this.score = score;
    }
}
