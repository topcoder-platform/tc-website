/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.project_studio_specification</code> table.</p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #generalFeedback} property.</li>
 *   </ol>
 * </p>
 * 
 * @author isv
 * @version 1.1 (Re-platforming Studio Release 2 assembly)
 */
public class StudioProjectSpecification extends Base {

    /**
     * <p>A <code>Long</code> providing the ID for this specification.</p>
     */
    private Long id;

    /**
     * <p>A <code>String</code> providing the goals of the project.</p>
     */
    private String goals;

    /**
     * <p>A <code>String</code> providing the definition of target audience for project.</p>
     */
    private String targetAudience;

    /**
     * <p>A <code>String</code> providing the branding guidelines for project.</p>
     */
    private String brandingGuidelines;

    /**
     * <p>A <code>String</code> providing the disliked design websites.</p>
     */
    private String dislikedDesignWebsites;

    /**
     * <p>A <code>String</code> providing the other instructions for project.</p>
     */
    private String otherInstructions;

    /**
     * <p>A <code>String</code> providing the winning criteria for project.</p>
     */
    private String winningCriteria;

    /**
     * <p>A <code>String</code> providing the introduction for round 1.</p>
     */
    private String round1Introduction;

    /**
     * <p>A <code>String</code> providing the introduction for round 2.</p>
     */
    private String round2Introduction;

    /**
     * <p>A <code>String</code> providing the specification for colors.</p>
     */
    private String colors;

    /**
     * <p>A <code>String</code> providing the specification for fonts.</p>
     */
    private String fonts;

    /**
     * <p>A <code>String</code> providing the specification of layout and size.</p>
     */
    private String layoutAndSize;

    /**
     * <p>A <code>String</code> providing the introduction for project.</p>
     */
    private String contestIntroduction;

    /**
     * <p>A <code>String</code> providing the description of project.</p>
     */
    private String contestDescription;

    /**
     * <p>A <code>String</code> providing the requirements for content.</p>
     */
    private String contentRequirements;

    /**
     * <p>A <code>Boolean</code> providing the flag indicating whether the submitters are locked between rounds or
     * not.</p>
     */
    private Boolean submittersLockedBetweenRounds;

    /**
     * <p>A <code>String</code> providing the general feedback for project submissions.</p>
     * 
     * @since 1.1
     */
    private String generalFeedback;

    /**
     * <p>Constructs new <code>StudioProjectSpecification</code> instance. This implementation does nothing.</p>
     */
    public StudioProjectSpecification() {
    }

    /**
     * <p>Gets the description of project.</p>
     *
     * @return a <code>String</code> providing the description of project.
     */
    public String getContestDescription() {
        return this.contestDescription;
    }

    /**
     * <p>Sets the description of project.</p>
     *
     * @param contestDescription a <code>String</code> providing the description of project.
     */
    public void setContestDescription(String contestDescription) {
        this.contestDescription = contestDescription;
    }

    /**
     * <p>Gets the introduction for project.</p>
     *
     * @return a <code>String</code> providing the introduction for project.
     */
    public String getContestIntroduction() {
        return this.contestIntroduction;
    }

    /**
     * <p>Sets the introduction for project.</p>
     *
     * @param contestIntroduction a <code>String</code> providing the introduction for project.
     */
    public void setContestIntroduction(String contestIntroduction) {
        this.contestIntroduction = contestIntroduction;
    }

    /**
     * <p>Gets the specification of layout and size.</p>
     *
     * @return a <code>String</code> providing the specification of layout and size.
     */
    public String getLayoutAndSize() {
        return this.layoutAndSize;
    }

    /**
     * <p>Sets the specification of layout and size.</p>
     *
     * @param layoutAndSize a <code>String</code> providing the specification of layout and size.
     */
    public void setLayoutAndSize(String layoutAndSize) {
        this.layoutAndSize = layoutAndSize;
    }

    /**
     * <p>Gets the specification for fonts.</p>
     *
     * @return a <code>String</code> providing the specification for fonts.
     */
    public String getFonts() {
        return this.fonts;
    }

    /**
     * <p>Sets the specification for fonts.</p>
     *
     * @param fonts a <code>String</code> providing the specification for fonts.
     */
    public void setFonts(String fonts) {
        this.fonts = fonts;
    }

    /**
     * <p>Gets the specification for colors.</p>
     *
     * @return a <code>String</code> providing the specification for colors.
     */
    public String getColors() {
        return this.colors;
    }

    /**
     * <p>Sets the specification for colors.</p>
     *
     * @param colors a <code>String</code> providing the specification for colors.
     */
    public void setColors(String colors) {
        this.colors = colors;
    }

    /**
     * <p>Gets the introduction for round 2.</p>
     *
     * @return a <code>String</code> providing the introduction for round 2.
     */
    public String getRound2Introduction() {
        return this.round2Introduction;
    }

    /**
     * <p>Sets the introduction for round 2.</p>
     *
     * @param round2Introduction a <code>String</code> providing the introduction for round 2.
     */
    public void setRound2Introduction(String round2Introduction) {
        this.round2Introduction = round2Introduction;
    }

    /**
     * <p>Gets the introduction for round 1.</p>
     *
     * @return a <code>String</code> providing the introduction for round 1.
     */
    public String getRound1Introduction() {
        return this.round1Introduction;
    }

    /**
     * <p>Sets the introduction for round 1.</p>
     *
     * @param round1Introduction a <code>String</code> providing the introduction for round 1.
     */
    public void setRound1Introduction(String round1Introduction) {
        this.round1Introduction = round1Introduction;
    }

    /**
     * <p>Gets the winning criteria for project.</p>
     *
     * @return a <code>String</code> providing the winning criteria for project.
     */
    public String getWinningCriteria() {
        return this.winningCriteria;
    }

    /**
     * <p>Sets the winning criteria for project.</p>
     *
     * @param winningCriteria a <code>String</code> providing the winning criteria for project.
     */
    public void setWinningCriteria(String winningCriteria) {
        this.winningCriteria = winningCriteria;
    }

    /**
     * <p>Gets the other instructions for project.</p>
     *
     * @return a <code>String</code> providing the other instructions for project.
     */
    public String getOtherInstructions() {
        return this.otherInstructions;
    }

    /**
     * <p>Sets the other instructions for project.</p>
     *
     * @param otherInstructions a <code>String</code> providing the other instructions for project.
     */
    public void setOtherInstructions(String otherInstructions) {
        this.otherInstructions = otherInstructions;
    }

    /**
     * <p>Gets the disliked design websites.</p>
     *
     * @return a <code>String</code> providing the disliked design websites.
     */
    public String getDislikedDesignWebsites() {
        return this.dislikedDesignWebsites;
    }

    /**
     * <p>Sets the disliked design websites.</p>
     *
     * @param dislikedDesignWebsites a <code>String</code> providing the disliked design websites.
     */
    public void setDislikedDesignWebsites(String dislikedDesignWebsites) {
        this.dislikedDesignWebsites = dislikedDesignWebsites;
    }

    /**
     * <p>Gets the branding guidelines for project.</p>
     *
     * @return a <code>String</code> providing the branding guidelines for project.
     */
    public String getBrandingGuidelines() {
        return this.brandingGuidelines;
    }

    /**
     * <p>Sets the branding guidelines for project.</p>
     *
     * @param brandingGuidelines a <code>String</code> providing the branding guidelines for project.
     */
    public void setBrandingGuidelines(String brandingGuidelines) {
        this.brandingGuidelines = brandingGuidelines;
    }

    /**
     * <p>Gets the definition of target audience for project.</p>
     *
     * @return a <code>String</code> providing the definition of target audience for project.
     */
    public String getTargetAudience() {
        return this.targetAudience;
    }

    /**
     * <p>Sets the definition of target audience for project.</p>
     *
     * @param targetAudience a <code>String</code> providing the definition of target audience for project.
     */
    public void setTargetAudience(String targetAudience) {
        this.targetAudience = targetAudience;
    }

    /**
     * <p>Gets the goals of the project.</p>
     *
     * @return a <code>String</code> providing the goals of the project.
     */
    public String getGoals() {
        return this.goals;
    }

    /**
     * <p>Sets the goals of the project.</p>
     *
     * @param goals a <code>String</code> providing the goals of the project.
     */
    public void setGoals(String goals) {
        this.goals = goals;
    }

    /**
     * <p>Gets the flag indicating whether the submitters are locked between rounds or not.</p>
     *
     * @return a <code>Boolean</code> providing the flag indicating whether the submitters are locked between rounds or
     *         not.
     */
    public Boolean getSubmittersLockedBetweenRounds() {
        return this.submittersLockedBetweenRounds;
    }

    /**
     * <p>Sets the flag indicating whether the submitters are locked between rounds or not.</p>
     *
     * @param submittersLockedBetweenRounds a <code>Boolean</code> providing the flag indicating whether the submitters
     *                                      are locked between rounds or not.
     */
    public void setSubmittersLockedBetweenRounds(Boolean submittersLockedBetweenRounds) {
        this.submittersLockedBetweenRounds = submittersLockedBetweenRounds;
    }

    /**
     * <p>Gets the ID for this specification.</p>
     *
     * @return a <code>Long</code> providing the ID for this specification.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID for this specification.</p>
     *
     * @param id a <code>Long</code> providing the ID for this specification.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * <p>Gets the requirements for content.</p>
     *
     * @return a <code>String</code> providing the requirements for content.
     */
    public String getContentRequirements() {
        return this.contentRequirements;
    }

    /**
     * <p>Sets the requirements for content.</p>
     *
     * @param contentRequirements a <code>String</code> providing the requirements for content.
     */
    public void setContentRequirements(String contentRequirements) {
        this.contentRequirements = contentRequirements;
    }

    /**
     * <p>Gets the general feedback for project submissions.</p>
     *
     * @return a <code>String</code> providing the general feedback for project submissions.
     * @since 1.1
     */
    public String getGeneralFeedback() {
        return this.generalFeedback;
    }

    /**
     * <p>Sets the general feedback for project submissions.</p>
     *
     * @param generalFeedback a <code>String</code> providing the general feedback for project submissions.
     * @since 1.1
     */
    public void setGeneralFeedback(String generalFeedback) {
        this.generalFeedback = generalFeedback;
    }
}
