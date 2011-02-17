/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.studio.dao.StudioDAOUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * <p>This class represents a Contest entity.</p>
 *
 * <p>
 *   Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *     <li>Added Serial version UID.</li>
 *     <li>Added multiRound, multiRoundInformation and milestonePrize attributes.</li>
 *     <li>Added method to calculate and retrieve total prize purse.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.1 (Studio Contest Detail Pages assembly) Change notes:
 *   <ol>
 *     <li>Updated Serial version UID.</li>
 *     <li>Added {@link #isMilestoneFeedbackAvailable()} method.</li>
 *     <li>Added {@link #getMilestonePrizedSubmissions()} method.</li>
 *   </ol>
 * </p>
 *
 * <p> Version 1.2 (Studio Declaration Module Assembly) change:
 * Added allowStockArt field.
 * </p>
 *
 * @author dok, isv, pulky, orange_cloud
 * @version 1.2
 */
public class Contest extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     * @since 1.1
     */
    private static final long serialVersionUID = 2L;

    private Long id;
    private String name;
    private Timestamp startTime;
    private Timestamp endTime;
    private Set<ContestConfig> config = new HashSet<ContestConfig>();
    private Set<Prize> prizes = new TreeSet<Prize>();
    private Set<Document> documents = new HashSet<Document>();
    private ContestStatus status;
    private Integer forumId;
    private Set<Submission> submissions = new HashSet<Submission>();
    private Set<StudioFileType> fileTypes = new HashSet<StudioFileType>();
    private Set<ContestResult> results = new TreeSet<ContestResult>();
    private Event event;
    private Project project;

    /**
     * Is stock art allowed.
     */
    private boolean allowStockArt;


    /**
     * <p>A <code>ContestChannel</code> representing the contest channel which this contest originated from.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    private ContestChannel channel = null;

    /**
     * <p>A <code>ContestType</code> representing the type of this studio contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    private ContestType type = null;

    /**
     * <p>An <code>Integer</code> providing the ID of a project this contest is associated with. Such a project is
     * created by the means of <code>TopCoder Direct</code> application.</p>
     *
     * @see ContestChannel#TOPCODER_DIRECT
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    private Integer directProjectId = null;

    /**
     * <p>A <code>Long</code> providing the ID of a user who have created this contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.4)
     */
    private Long createUserId = null;

    /**
     * <p>A <code>Timestamp</code> providing the time of announcement of a winner for this contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.2)
     */
    private Timestamp winnerAnnouncementTime = null;

    /**
     * <p>A <code>Set</code> providing the mediums for the submissions submitted for this contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    private Set<Medium> mediums = new HashSet<Medium>();

    /**
     * A flag indicating whether the contest is a multi round contest
     *
     * @since 1.1
     */
    private Boolean multiRound;

    /**
     * The Contest's Multi Round Information
     *
     * @since 1.1
     */
    private ContestMultiRoundInformation multiRoundInformation;

    /**
     * The Contest's Milestone prize
     *
     * @since 1.1
     */
    private ContestMilestonePrize milestonePrize;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Set<ContestConfig> getConfig() {
        return config;
    }

    public void setConfig(Set<ContestConfig> config) {
        this.config = config;
    }

    /**
     * We'll be returning the answers in the correct order.  Really
     * this should be returning a <code>SortedSet</code> but I couldn't
     * get hibernate to work right.
     *
     * @return the prizes
     */

    public Set<Prize> getPrizes() {
        return prizes;
    }

    public void setPrizes(Set<Prize> prizes) {
        this.prizes = prizes;
    }

    /**
     * Gets the contest's total prize purse. It will sum all regular and milestone prizes
     *
     * @return the contest's total prize purse
     *
     * @since 1.1
     */
    public Float getTotalPrizePurse() {
        float total = 0;

        // add all regular prizes
        for (Prize p : prizes) {
            if (p.getAmount() != null) {
                total += p.getAmount();
            }
        }

        // add milestone prizes
        if (milestonePrize != null && milestonePrize.getAmount() != null &&
            milestonePrize.getNumberOfSubmissions() != null) {
            total += milestonePrize.getAmount() * milestonePrize.getNumberOfSubmissions();
        }

        return total;
    }


    public void addConfig(ContestConfig config) {
        config.setContest(this);
        this.config.add(config);
    }

    public void addPrize(Prize prize) {
        this.prizes.add(prize);
    }

    public ContestConfig getConfig(ContestProperty property) {
        for (ContestConfig c : config) {
            if (c.getProperty() != null && c.getProperty().equals(property)) {
                return c;
            }
        }
        return null;
    }

    public Map<Integer, String> getConfigMap() {
        HashMap<Integer, String> m = new HashMap<Integer, String>();
        for (ContestConfig anInfo : config) {
            m.put(anInfo.getProperty().getId(), anInfo.getValue());
        }
        return m;
    }


    public ContestConfig getOverview() {
        return getConfig(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT));
    }

    public ContestConfig getPrizeDescription() {
        return getConfig(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION));
    }

    public ContestConfig getViewableSubmissions() {
        return getConfig(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.VIEWABLE_SUBMISSIONS));
    }

    public ContestConfig getMaxSubmissions() {
        return getConfig(StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.MAX_SUBMISSIONS));
    }

    public Set<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(Set<Document> documents) {
        this.documents = documents;
    }

    public void addDocument(Document document) {
        this.documents.add(document);
    }

    public ContestStatus getStatus() {
        return status;
    }

    public void setStatus(ContestStatus status) {
        this.status = status;
    }

    public Integer getForumId() {
        return forumId;
    }

    public void setForumId(Integer forumId) {
        this.forumId = forumId;
    }

    public Set<Submission> getSubmissions() {
        return submissions;
    }

    public void setSubmissions(Set<Submission> submissions) {
        this.submissions = submissions;
    }

    public void addSubmission(Submission submission) {
        submission.setContest(this);
        submissions.add(submission);
    }

    public Set<StudioFileType> getFileTypes() {
        return fileTypes;
    }

    public void setFileTypes(Set<StudioFileType> fileTypes) {
        this.fileTypes = fileTypes;
    }

    public void addFileType(StudioFileType fileType) {
        this.fileTypes.add(fileType);
    }

    public Set<ContestResult> getResults() {
        return results;
    }

    public void setResults(Set<ContestResult> results) {
        this.results = results;
    }

    public void addResult(ContestResult result) {
        result.setContest(this);
        results.add(result);
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }


    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    /**
     * <p>Gets the contest channel which this contest originated from.</p>
     *
     * @return a <code>ContestChannel</code> representing the contest channel which this contest originated from.
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    public ContestChannel getChannel() {
        return this.channel;
    }

    /**
     * <p>Sets the contest channel which this contest originated from.</p>
     *
     * @param channel a <code>ContestChannel</code> representing the contest channel which this contest originated from.
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    public void setChannel(ContestChannel channel) {
        this.channel = channel;
    }

    /**
     * <p>Gets the type of this studio contest.</p>
     *
     * @return a <code>ContestType</code> representing the type of this contest.
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    public ContestType getType() {
        return this.type;
    }

    /**
     * <p>Sets the type of this studio contest.</p>
     *
     * @param type a <code>ContestType</code> representing the type of this contest.
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    public void setType(ContestType type) {
        this.type = type;
    }

    /**
     * <p>Gets the ID of a <code>TopCoder Direct</code> project which this contest is associated with. The method should
     * be used for those contests which originated from <code>TopCoder Direct</code> application.</p>
     *
     * @return an <code>Integer</code> providing the ID of <code>TopCoder Direct</code> project.
     * @see ContestChannel#TOPCODER_DIRECT
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    public Integer getDirectProjectId() {
        return this.directProjectId;
    }

    /**
     * <p>Sets the ID of a <code>TopCoder Direct</code> project which this contest is associated with. The method should
     * be used for those contests which originated from <code>TopCoder Direct</code> application.</p>
     *
     * @param directProjectId an <code>Integer</code> providing the ID of <code>TopCoder Direct</code> project.
     * @see ContestChannel#TOPCODER_DIRECT
     * @since TopCoder Studio Modifications Assembly (Req# 5.3)
     */
    public void setDirectProjectId(Integer directProjectId) {
        this.directProjectId = directProjectId;
    }

    /**
     * <p>Gets the ID of a user who have created this contest.</p>
     *
     * @return a <code>Long</code> providing the ID of a user who have created this contest.
     * @since TopCoder Studio Modifications Assembly (Req# 5.4)
     */
    public Long getCreateUserId() {
        return this.createUserId;
    }

    /**
     * <p>Sets the ID of a user who have created this contest.</p>
     *
     * @param createUserId a <code>Long</code> providing the ID of a user who have created this contest.
     * @since TopCoder Studio Modifications Assembly (Req# 5.4)
     */
    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    /**
     * <p>Gets the date and time of an announcement of a winner for this contest.</p>
     *
     * @return a <code>Timestamp</code> providing the time of announcement of a winner for this contest.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.2)
     */
    public Timestamp getWinnerAnnouncementTime() {
        return this.winnerAnnouncementTime;
    }

    /**
     * <p>Sets the date and time of an announcement of a winner for this contest.</p>
     *
     * @param winnerAnnouncementTime a <code>Timestamp</code> providing the time of announcement of a winner for this
     *                               contest.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.2)
     */
    public void setWinnerAnnouncementTime(Timestamp winnerAnnouncementTime) {
        this.winnerAnnouncementTime = winnerAnnouncementTime;
    }

    /**
     * <p>Gets the intended mediums for the submissions submitted for this contest.</p>
     *
     * @return a <code>Set</code> of medium types for this contest.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public Set<Medium> getMediums() {
        return this.mediums;
    }

    /**
     * <p>Sets the intended mediums for the submissions submitted for this contest.</p>
     *
     * @param mediums a <code>Set</code> of medium types for this contest.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void setMediums(Set<Medium> mediums) {
        this.mediums = mediums;
    }

    /**
     * <p>Adds specified medium type to list of medium types already set for this contest.</p>
     *
     * @param medium a <code>Medium</code> providing the details for the medium to be added to this contest.
     * @throws IllegalArgumentException if specified <code>medium</code> is <code>null</code>.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public void addMedium(Medium medium) {
        if (medium == null) {
            throw new IllegalArgumentException("The parameter [medium] is NULL");
        }
        this.mediums.add(medium);
    }

    /**
     * <p>Gets the contest configuration for the specified contest property.</p>
     *
     * @param propertyId a <code>Integer</code> providing the ID of a contest property to get value for.
     * @return a <code>ContestConfig</code> providing the value for specified contest property or <code>null</code> if
     *         such a value is not found.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getConfig(Integer propertyId) {
        for (ContestConfig c : this.config) {
            if (c.getProperty() != null && c.getProperty().getId().equals(propertyId)) {
                return c;
            }
        }
        return null;
    }

    /**
     * <p>Gets the contest configuration for other file types for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the other file types for contest or <code>null</code> if such a
     *         contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getOtherFileTypes() {
        return getConfig(ContestProperty.OTHER_FILE_TYPES);
    }

    /**
     * <p>Gets the contest configuration for full description for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the full description for contest or <code>null</code> if such a
     *         contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getFullDescription() {
        return getConfig(ContestProperty.FULL_DESCRIPTION);
    }

    /**
     * <p>Gets the contest configuration for color requirements for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the color requirements for contest or <code>null</code> if such a
     *         contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getColorRequirements() {
        return getConfig(ContestProperty.COLOR_REQUIREMENTS);
    }

    /**
     * <p>Gets the contest configuration for font requirements for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the font requirements for contest or <code>null</code> if such a
     *         contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getFontRequirements() {
        return getConfig(ContestProperty.FONT_REQUIREMENTS);
    }

    /**
     * <p>Gets the contest configuration for size requirements for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the size requirements for contest or <code>null</code> if such a
     *         contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getSizeRequirements() {
        return getConfig(ContestProperty.SIZE_REQUIREMENTS);
    }

    /**
     * <p>Gets the contest configuration for content requirements for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the content requirements for contest or <code>null</code> if such
     *         a contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getContentRequirements() {
        return getConfig(ContestProperty.CONTENT_REQUIREMENTS);
    }

    /**
     * <p>Gets the contest configuration for other requirements for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the other requirements for contest or <code>null</code> if such
     *         a contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getOtherRequirements() {
        return getConfig(ContestProperty.OTHER_REQUIREMENTS);
    }

    /**
     * <p>Gets the contest configuration for submission file format for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the submission file format for contest or <code>null</code> if
     *         such a contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getSubmissionFileFormat() {
        return getConfig(ContestProperty.SUBMISSION_FILE_FORMAT);
    }

    /**
     * <p>Gets the contest configuration for winner selection for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the winner selection for contest or <code>null</code> if such a
     *         contest property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getWinnerSelection() {
        return getConfig(ContestProperty.WINNER_SELECTION);
    }

    /**
     * <p>Gets the contest configuration for eligibility for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the eligibility for contest or <code>null</code> if such a contest
     *         property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getEligibility() {
        return getConfig(ContestProperty.ELIGIBILITY);
    }

    /**
     * <p>Gets the contest configuration for client name for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the client name for contest or <code>null</code> if such a contest
     *         property is not set.
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public ContestConfig getClientName() {
        return getConfig(ContestProperty.CLIENT);
    }

    /**
     * <p>Gets the contest configuration for digital run points for this contest.</p>
     *
     * @return a <code>ContestConfig</code> providing the digital run points for contest or <code>null</code> if such a contest
     *         property is not set.
     * @since Digital Run 2.0
     */
    public ContestConfig getDigitalRunPoints() {
        return getConfig(ContestProperty.DIGITAL_RUN_POINTS);
    }

    /**
     * <p>Gets the flag representing whether the contest is a multi-round contest or not.</p>
     *
     * @return a <code>Boolean</code> representing whether the contest is a multi-round contest or not
     *
     * @since 1.1
     */
    public Boolean isMultiRound() {
        return multiRound;
    }

    /**
     * <p>Gets the flag representing whether the contest is a multi-round contest or not.</p>
     *
     * @return a <code>Boolean</code> representing whether the contest is a multi-round contest or not
     *
     * @since 1.1
     */
    public Boolean getMultiRound() {
        return multiRound;
    }

    /**
     * Sets the multi-round contest flag
     *
     * @param multiRound the multi-round contest flag value to set
     *
     * @since 1.1
     */
    public void setMultiRound(Boolean multiRound) {
        this.multiRound = multiRound;
    }

    /**
     * <p>Gets the Contest's Multi Round Information.</p>
     *
     * @return a <code>ContestMultiRoundInformation</code> representing Contest's Multi Round Information
     *
     * @since 1.1
     */
    public ContestMultiRoundInformation getMultiRoundInformation() {
        return multiRoundInformation;
    }

    /**
     * Sets the multi-round contest flag
     *
     * @param multiRoundInformation the Contest's Multi Round Information to set
     *
     * @since 1.1
     */
    public void setMultiRoundInformation(ContestMultiRoundInformation multiRoundInformation) {
        this.multiRoundInformation = multiRoundInformation;
    }

    /**
     * <p>Gets the Contest's Milestone prize.</p>
     *
     * @return a <code>ContestMilestonePrize</code> representing Contest's Milestone prize
     *
     * @since 1.1
     */
    public ContestMilestonePrize getMilestonePrize() {
        return milestonePrize;
    }

    /**
     * Sets the Contest's Milestone prize
     *
     * @param milestonePrize the Contest's Milestone prize to set
     *
     * @since 1.1
     */
    public void setMilestonePrize(ContestMilestonePrize milestonePrize) {
        this.milestonePrize = milestonePrize;
    }

    /**
     * <p>Checks if this contest has at least one of submissions provided with feedback from the client or entire
     * multi-round provided with general feedback.</p>
     *
     * @return <code>true</code> if contest has milestone feedbacks available; <code>false</code> otherwise.
     * @since 1.1.1
     */
    public boolean isMilestoneFeedbackAvailable() {
        Set<Submission> submissions = getSubmissions();
        if (submissions != null) {
            for (Submission submission : submissions) {
                Boolean milestonePrizeAwarded = submission.getMilestonePrizeAwarded();
                if ((milestonePrizeAwarded != null) && (milestonePrizeAwarded)) {
                    return true;
                }
            }
        }
        ContestMultiRoundInformation information = getMultiRoundInformation();
        return (information != null) && (information.getGeneralFeedbackText() != null);

    }

    /**
     * <p>Gets the list of submissions of this contest which have been awarded milestone prize.</p>
     *
     * @return a <code>List</code> listing the milestone prized submissions for this contest. 
     * @since 1.1.1
     */
    public List<Submission> getMilestonePrizedSubmissions() {
        List<Submission> prizedSubmissions = new ArrayList<Submission>();
        Set<Submission> submissions = getSubmissions();
        if (submissions != null) {
            for (Submission submission : submissions) {
                Boolean milestonePrizeAwarded = submission.getMilestonePrizeAwarded();
                if ((milestonePrizeAwarded != null) && (milestonePrizeAwarded)) {
                    prizedSubmissions.add(submission);
                }
            }
        }
        return prizedSubmissions;
    }

    /**
     * Getter for allowStockArt property.
     *
     * @return whether stock art is allowed
     */
    public boolean getAllowStockArt() {
        return allowStockArt;
    }

    /**
     * Setter for allowStockArt property.
     *
     * @param allowStockArt whether stock art is allowed
     */
    public void setAllowStockArt(boolean allowStockArt) {
        this.allowStockArt = allowStockArt;
    }
}
