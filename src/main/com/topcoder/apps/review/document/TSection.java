/*
 * TSection.java
 *
 * Copyright � 2004, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

/**
 * Represents a ScorecardSection for scorecard editing.
 *
 * @author FatClimber
 */
public class TSection {
    private TQuestion[] questions;
    private long sectionId;
    private String sectionName;
    private int sectionWeight;
    private int sectionSeqLoc;
    private long groupId;

    /**
     * @param questions
     * @param sectionId
     * @param sectionName
     * @param sectionWeight
     * @param sectionSeqLoc
     * @param groupId
     */
    public TSection(
            TQuestion[] questions,
            long sectionId,
            String sectionName,
            int sectionWeight,
            int sectionSeqLoc,
            long groupId) {
        this.questions = questions;
        this.sectionId = sectionId;
        this.sectionName = sectionName;
        this.sectionWeight = sectionWeight;
        this.sectionSeqLoc = sectionSeqLoc;
        this.groupId = groupId;
    }

    /**
     * @return Returns the groupId.
     */
    public long getGroupId() {
        return groupId;
    }

    /**
     * @param groupId The groupId to set.
     */
    public void setGroupId(long groupId) {
        this.groupId = groupId;
    }

    /**
     * @return Returns the questions.
     */
    public TQuestion[] getQuestions() {
        return questions;
    }

    /**
     * @param questions The questions to set.
     */
    public void setQuestions(TQuestion[] questions) {
        this.questions = questions;
    }

    /**
     * @return Returns the sectionId.
     */
    public long getSectionId() {
        return sectionId;
    }

    /**
     * @param sectionId The sectionId to set.
     */
    public void setSectionId(long sectionId) {
        this.sectionId = sectionId;
    }

    /**
     * @return Returns the sectionName.
     */
    public String getSectionName() {
        return sectionName;
    }

    /**
     * @param sectionName The sectionName to set.
     */
    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }

    /**
     * @return Returns the sectionSeqLoc.
     */
    public int getSectionSeqLoc() {
        return sectionSeqLoc;
    }

    /**
     * @param sectionSeqLoc The sectionSeqLoc to set.
     */
    public void setSectionSeqLoc(int sectionSeqLoc) {
        this.sectionSeqLoc = sectionSeqLoc;
    }

    /**
     * @return Returns the sectionWeight.
     */
    public int getSectionWeight() {
        return sectionWeight;
    }

    /**
     * @param sectionWeight The sectionWeight to set.
     */
    public void setSectionWeight(int sectionWeight) {
        this.sectionWeight = sectionWeight;
    }

}
