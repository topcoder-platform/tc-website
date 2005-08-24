/*
 * TQuestion.java
 *
 * Copyright � 2004, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;

/**
 * Represents a ScorecardQuestionTemplate for scorecard editing.
 *
 * @author FatClimber
 */
public class TQuestion implements Serializable {
    private long qTemplateVID;
    private long qTemplateId;
    private long projectType;
    private int scorecardType;
    private String questionText;
    private int questionWeight;
    private int questionSeqLoc;
    private long sectionId;
    private int questionType;
    private long templateId;

    /**
     * @param templateVID
     * @param templateId
     * @param projectType
     * @param scorecardType
     * @param questionText
     * @param questionWeight
     * @param questionSeqLoc
     * @param sectionId
     * @param questionType
     * @param template_id
     */
    public TQuestion(
            long qTemplateVID,
            long qTemplateId,
            long projectType,
            int scorecardType,
            String questionText,
            int questionWeight,
            int questionSeqLoc,
            long sectionId,
            int questionType,
            long templateId) {
        this.qTemplateVID = qTemplateVID;
        this.qTemplateId = qTemplateId;
        this.projectType = projectType;
        this.scorecardType = scorecardType;
        this.questionText = questionText;
        this.questionWeight = questionWeight;
        this.questionSeqLoc = questionSeqLoc;
        this.sectionId = sectionId;
        this.questionType = questionType;
        this.templateId = templateId;
    }

    /**
     * @return Returns the projectType.
     */
    public long getProjectType() {
        return projectType;
    }

    /**
     * @param projectType The projectType to set.
     */
    public void setProjectType(long projectType) {
        this.projectType = projectType;
    }

    /**
     * @return Returns the qTemplateId.
     */
    public long getQTemplateId() {
        return qTemplateId;
    }

    /**
     * @param templateId The qTemplateId to set.
     */
    public void setQTemplateId(long templateId) {
        qTemplateId = templateId;
    }

    /**
     * @return Returns the qTemplateVID.
     */
    public long getQTemplateVID() {
        return qTemplateVID;
    }

    /**
     * @param templateVID The qTemplateVID to set.
     */
    public void setQTemplateVID(long templateVID) {
        qTemplateVID = templateVID;
    }

    /**
     * @return Returns the questionSeqLoc.
     */
    public int getQuestionSeqLoc() {
        return questionSeqLoc;
    }

    /**
     * @param questionSeqLoc The questionSeqLoc to set.
     */
    public void setQuestionSeqLoc(int questionSeqLoc) {
        this.questionSeqLoc = questionSeqLoc;
    }

    /**
     * @return Returns the questionText.
     */
    public String getQuestionText() {
        return questionText;
    }

    /**
     * @param questionText The questionText to set.
     */
    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    /**
     * @return Returns the questionType.
     */
    public int getQuestionType() {
        return questionType;
    }

    /**
     * @param questionType The questionType to set.
     */
    public void setQuestionType(int questionType) {
        this.questionType = questionType;
    }

    /**
     * @return Returns the questionWeight.
     */
    public int getQuestionWeight() {
        return questionWeight;
    }

    /**
     * @param questionWeight The questionWeight to set.
     */
    public void setQuestionWeight(int questionWeight) {
        this.questionWeight = questionWeight;
    }

    /**
     * @return Returns the scorecardType.
     */
    public int getScorecardType() {
        return scorecardType;
    }

    /**
     * @param scorecardType The scorecardType to set.
     */
    public void setScorecardType(int scorecardType) {
        this.scorecardType = scorecardType;
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
     * @return Returns the templateId.
     */
    public long getTemplateId() {
        return templateId;
    }

    /**
     * @param templateId The templateId to set.
     */
    public void setTemplateId(long templateId) {
        this.templateId = templateId;
    }

}
