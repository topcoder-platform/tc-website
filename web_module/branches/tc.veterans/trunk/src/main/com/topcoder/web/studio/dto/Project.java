/*
 * Copyright (C) 2001-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * <p>An entity class mapped to <code>tcs_catalog.project</code> table.</p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 2 Assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #INFO_TYPE_FORUM_ID} constant.</li>
 *     <li>Added {@link #INFO_TYPE_DR_POINTS} constant.</li>
 *     <li>Added {@link #INFO_TYPE_DR_ENABLED} constant.</li>
 *     <li>Added {@link #INFO_TYPE_FORUM_ID} constant.</li>
 *     <li>Added {@link #INFO_TYPE_COMP_VERSION_ID} constant.</li>
 *     <li>Added {@link #getForumId()} method.</li>
 *     <li>Added {@link #getStartTime()} method.</li>
 *     <li>Added {@link #getEndTime()} method.</li>
 *     <li>Added {@link #getMilestoneDate()} method.</li>
 *     <li>Added {@link #getWinnerAnnouncementTime()} method.</li>
 *     <li>Added {@link #getTotalPrizePurse()} method.</li>
 *     <li>Added {@link #getMaxSubmissions()} method.</li>
 *     <li>Added {@link #getMilestonePrize()} method.</li>
 *     <li>Added {@link #getPrizes()} method.</li>
 *     <li>Updated {@link #getInfo(Integer)} method to handle optional project infos correctly without throwing
 *     <code>NullPointerException</code>.</li>
 *     <li>Added {@link #createUserId} property with respective accessor/mutator methods.</li>
 *     <li>Added {@link #studioProjectSpecification} property with respective accessor/mutator methods.</li>
 *     <li>Added {@link #allPrizes} property with respective accessor/mutator methods.</li>
 *     <li>Added {@link #documents} property with respective accessor/mutator methods.</li>
 *     <li>Added {@link #fileTypes} property with respective accessor/mutator methods.</li>
 *     <li>Added {@link #category} property with respective accessor/mutator methods.</li>
 *     <li>Added {@link #eventId} property with respective accessor/mutator methods.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #INFO_ALLOW_STOCK_ART} constant.</li>
 *     <li>Added {@link #INFO_VIEWABLE_SUBMISSION_FLAG} constant.</li>
 *     <li>Added {@link #getReviewClosed()} method.</li>
 *   <ol>
 * </p>    
 *
 * <p>
 * Version 1.3 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #getMilestoneReviewClosed()} method.</li>
 *     <li>Implemeted {@link #getMilestoneFeedbackAvailable()} method.</li>
 *   </ol>
 * </p>
 * 
 * @author isv, pvmagacho
 * @version 1.3
 */
public class Project extends Base {

    public static final Integer STATUS_ACTIVE = 1;
    public static final Integer STATUS_INACTIVE = 2;
    public static final Integer STATUS_DELETED = 3;
    public static final Integer STATUS_FAILED_REVIEW = 4;
    public static final Integer STATUS_FAILED_SCREENING = 5;
    public static final Integer STATUS_ZERO_SUBMISSIONS = 6;
    public static final Integer STATUS_COMPLETED = 7;

    public static final Integer INFO_TYPE_PROJECT_NAME = 6;
    public static final Integer INFO_TYPE_PROJECT_VERSION = 7;
    public static final Integer INFO_TYPE_PROJECT_ELIGIBILITY = 14;


    /**
     * <p>An <code>Integer</code> providing the ID for <code>Component Version</code> project info type.</p>
     * 
     * @since 1.1
     */
    public static final Integer INFO_TYPE_COMP_VERSION_ID = 1;
    
    /**
     * <p>An <code>Integer</code> providing the ID for <code>Dev Forum ID</code> project info type.</p>
     * 
     * @since 1.1
     */
    public static final Integer INFO_TYPE_FORUM_ID = 4;

    /**
     * <p>An <code>Integer</code> providing the ID for <code>Maximum Submissions</code> project info type.</p>
     * 
     * @since 1.1
     */
    public static final Integer INFO_TYPE_MAX_SUBMISSIONS = 51;

    /**
     * <p>An <code>Integer</code> providing the ID for <code>Allow Stock Arts</code> project info type.</p>
     * 
     * @since 1.2
     */
    public static final Integer INFO_ALLOW_STOCK_ART = 52;

    /**
     * <p>An <code>Integer</code> providing the ID for <code>Viewable Submission Flag</code> project info type.</p>
     * 
     * @since 1.2
     */
    public static final Integer INFO_VIEWABLE_SUBMISSION_FLAG = 53;
    
    /**
     * <p>An <code>Integer</code> providing the ID for <code>DR Points</code> project info type.</p>
     * 
     * @since 1.1
     */
    public static final Integer INFO_TYPE_DR_POINTS = 30;

    /**
     * <p>An <code>Integer</code> providing the ID for <code>Digital Run Flag</code> project info type.</p>
     * 
     * @since 1.1
     */
    public static final Integer INFO_TYPE_DR_ENABLED = 26;

    public static final String ELIGIBILITY_OPEN = "Open";

    protected Integer id = null;
    protected Integer statusId = null;
    protected Integer categoryId = null;
    protected Map<Integer, ProjectInfo> info = new HashMap<Integer, ProjectInfo>();
    protected Map<Integer, ProjectPhase> phases = new HashMap<Integer, ProjectPhase>();

    /**
     * <p>A <code>Set</code> of resources associated with project.</p>
     */
    protected Set<Resource> resources = new HashSet<Resource>();
    
    protected Set<Contest> contests = new HashSet<Contest>();

    /**
     * <p>A <code>Long</code> providing the ID for TC Direct project associated with this project.</p>
     */
    private Long tcDirectProjectId;

    /**
     * <p>A <code>String</code> providing the ID of a user who created this project.</p>
     * 
     * @since 1.1
     */
    private String createUserId;

    /**
     * <p>A <code>StudioProjectSpecification</code> providing the specification for this project if it is a Studio
     * project.</p>
     * 
     * @since 1.1
     */
    private StudioProjectSpecification studioProjectSpecification;

    /**
     * <p>A <code>Set</code> providing the prizes associated with this project.</p>
     * 
     * @since 1.1
     */
    private Set<Prize> allPrizes = new TreeSet<Prize>();

    /**
     * <p>A <code>Set</code> providing the list of documents set for this project.</p>
     * 
     * @since 1.1
     */
    private Set<Document> documents = new HashSet<Document>();

    /**
     * <p>A <code>Set</code> providing the list of file types allowed for submission for this project.</p>
     * 
     * @since 1.1
     */
    private Set<FileType> fileTypes;

    /**
     * <p>A <code>ProjectCategory</code> providing the category of this project.</p>
     * 
     * @since 1.1
     */
    private ProjectCategory category;

    /**
     * <p>A <code>Long</code> providing the ID of an event which this project may be associated with.</p>
     * 
     * @since 1.1
     */
    private Long eventId;

    /**
     * <p>Constructs new <code>Project</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.1
     */
    public Project() {
    }

    public Integer getCategoryId() {
        return this.category.getId();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Map<Integer, ProjectInfo> getInfo() {
        return info;
    }

    public void setInfo(Map<Integer, ProjectInfo> info) {
        this.info = info;
    }

    /**
     * <p>Gets the value of project info of specified type.</p>
     * 
     * @param id an <code>Integer</code> providing the ID for project info type to get value for. 
     * @return a <code>String</code> providing the value of specified project info or <code>null</code> if such info is
     *         not set.
     */
    public String getInfo(Integer id) {
        if (this.info.containsKey(id)) {
            return info.get(id).getValue();
        } else {
            return null;
        }
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public Set<Contest> getContests() {
        return contests;
    }

    public void setContests(Set<Contest> contests) {
        this.contests = contests;
    }

    public void addContest(Contest contest) {
        contests.add(contest);
    }

    public void removeContest(Contest contest) {
        contests.remove(contest);
    }

    public String getProjectName() {
        return getInfo(INFO_TYPE_PROJECT_NAME);
    }

    public String getProjectVersion() {
        return getInfo(INFO_TYPE_PROJECT_VERSION);
    }

    public String getProjectEligibility() {
        return getInfo(INFO_TYPE_PROJECT_ELIGIBILITY);
    }

    public boolean isEligibilityOpen() {
        return ELIGIBILITY_OPEN.equals(getProjectEligibility());
    }

    public Map<Integer, ProjectPhase> getPhases() {
        return phases;
    }

    public void setPhases(Map<Integer, ProjectPhase> phases) {
        this.phases = phases;
    }

    public ProjectPhase getPhase(Integer phaseTypeId) {
        return phases.get(phaseTypeId);
    }

    public ProjectPhase getRegistrationPhase() {
        return getPhase(ProjectPhase.REGISTRATION);
    }

    /**
     * <p>Gets the resources associated with project.</p>
     * 
     * @return <code>Set</code> of resources associated with project.
     */
    public Set<Resource> getResources() {
        return resources;
    }

    /**
     * <p>Sets the resources associated with project.</p>
     * 
     * @param resources <code>Set</code> of resources associated with project.
     */
    public void setResources(Set<Resource> resources) {
        this.resources = resources;
    }

    /**
     * <p>Gets the ID for TC Direct project associated with this project.</p>
     *
     * @return a <code>Long</code> providing the ID for TC Direct project associated with this project.
     */
    public Long getTcDirectProjectId() {
        return this.tcDirectProjectId;
    }

    /**
     * <p>Sets the ID for TC Direct project associated with this project.</p>
     *
     * @param tcDirectProjectId a <code>Long</code> providing the ID for TC Direct project associated with this
     *                          project.
     */
    public void setTcDirectProjectId(Long tcDirectProjectId) {
        this.tcDirectProjectId = tcDirectProjectId;
    }

    /**
     * <p>Gets the ID of a user who created this project.</p>
     *
     * @return a <code>String</code> providing the ID of a user who created this project.
     * @since 1.1
     */
    public String getCreateUserId() {
        return this.createUserId;
    }

    /**
     * <p>Sets the ID of a user who created this project.</p>
     *
     * @param createUserId a <code>String</code> providing the ID of a user who created this project.
     * @since 1.1
     */
    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    /**
     * <p>Gets the ID of a forum which may be associated with this project.</p>
     * 
     * @return a <code>Long</code> providing the ID of a forum associated with this project or <code>null</code> if
     *         there is no such forum.
     * @since 1.1
     */
    public Long getForumId() {
        String forumId = getInfo(INFO_TYPE_FORUM_ID);
        if ((forumId != null) && (forumId.trim().length() > 0)) {
            return new Long(forumId);
        } else {
            return null;
        }
    }

    /**
     * <p>Gets the DR points which may have been set for this project.</p>
     * 
     * @return a <code>Double</code> providing the DR points for this project or <code>null</code> if there is no such
     *         points available.
     * @since 1.1
     */
    public Double getDigitalRunPoints() {
        String digitalRunEnabled = getInfo(INFO_TYPE_DR_ENABLED);
        if ("On".equals(digitalRunEnabled)) {
            String drPoints = getInfo(INFO_TYPE_DR_POINTS);
            if ((drPoints != null) && (drPoints.trim().length() > 0)) {
                return new Double(drPoints); 
            }
        }
        return null;
    }

    /**
     * <p>Gets the start time for this project.</p>
     * 
     * @return a <code>Date</code> providing the start time for this project or <code>null</code> if this project has no
     *         phases set.
     * @since 1.1
     */
    public Date getStartTime() {
        ProjectPhase registrationPhase = getPhase(ProjectPhase.REGISTRATION);
        if (registrationPhase != null) {
            if (registrationPhase.getStatusId() == ProjectPhase.STATUS_SCHEDULED) {
                return registrationPhase.getScheduledStartTime();
            } else {
                return registrationPhase.getActualStartTime();
            }
        } else {
            return null;
        }
    }

    /**
     * <p>Gets the end time for this project.</p>
     * 
     * @return a <code>Date</code> providing the end time for this project or <code>null</code> if this project has no
     *         phases set.
     * @since 1.1
     */
    public Date getEndTime() {
        ProjectPhase submissionPhase = getPhase(ProjectPhase.SUBMISSION);
        if (submissionPhase != null) {
            if (submissionPhase.getStatusId() == ProjectPhase.STATUS_CLOSED) {
                return submissionPhase.getActualEndTime();
            } else {
                return submissionPhase.getScheduledEndTime();
            }
        } else {
            return null;
        }
    }

    /**
     * <p>Gets the end time for milestone for this project.</p>
     * 
     * @return a <code>Date</code> providing the end time for milestone for this project or <code>null</code> if this
     *         project has no phases set.
     * @since 1.1
     */
    public Date getMilestoneDate() {
        ProjectPhase milestoneSubmissionPhase = getPhase(ProjectPhase.MILESTONE_SUBMISSION);
        if (milestoneSubmissionPhase != null) {
            if (milestoneSubmissionPhase.getStatusId() == ProjectPhase.STATUS_CLOSED) {
                return milestoneSubmissionPhase.getActualEndTime();
            } else {
                return milestoneSubmissionPhase.getScheduledEndTime();
            }
        } else {
            return null;
        }
    }

    /**
     * <p>Gets the time for winner announcement for this project.</p>
     * 
     * @return a <code>Date</code> providing the time for winner announcement for this project or <code>null</code> if 
     *         this project has no phases set.
     * @since 1.1
     */
    public Date getWinnerAnnouncementTime() {
        ProjectPhase reviewPhase = getPhase(ProjectPhase.REVIEW);
        if (reviewPhase != null) {
            if (reviewPhase.getStatusId() == ProjectPhase.STATUS_CLOSED) {
                return reviewPhase.getActualEndTime();
            } else {
                return reviewPhase.getScheduledEndTime();
            }
        } else {
            return null;
        }
    }

    /**
     * <p>Indicates whether the Milestone Review phase is closed.</p>
     *
     * @return true if Milestone Review phase is closed, false otherwise
     * @since 1.3
     */
    public Boolean getMilestoneReviewClosed() {
        ProjectPhase milestoneReviewPhase = getPhase(ProjectPhase.MILESTONE_REVIEW);
        if (milestoneReviewPhase != null) {
            return (milestoneReviewPhase.getStatusId() == ProjectPhase.STATUS_CLOSED);
        }
        return false;
    }
    
    /**
     * <p>Indicates whether the Review phase is closed.</p>
     *
     * @return true if Review phase is closed, false otherwise
     * @since 1.2
     */
    public Boolean getReviewClosed() {
        ProjectPhase reviewPhase = getPhase(ProjectPhase.REVIEW);
        if (reviewPhase != null) {
            return (reviewPhase.getStatusId() == ProjectPhase.STATUS_CLOSED);
        }
        return false;
    }


	/**
     * <p>Indicates whether the Review phase is closed.</p>
     *
     * @return true if Review phase is closed, false otherwise
     * @since 1.2
     */
    public Boolean getScreeningClosed() {
        ProjectPhase reviewPhase = getPhase(ProjectPhase.SCREENING);
        if (reviewPhase != null) {
            return (reviewPhase.getStatusId() == ProjectPhase.STATUS_CLOSED);
        }
        return false;
    }

    /**
     * <p>Indicates whether the Submission phase is open.</p>
     *
     * @return true if Submission phase is open, false otherwise
     * @since 1.3
     */
    public Boolean getSubmissionOpen() {
        ProjectPhase submissionPhase = getPhase(ProjectPhase.SUBMISSION);
        if (submissionPhase != null) {
            return (submissionPhase.getStatusId() == ProjectPhase.STATUS_OPEN);
        }
        return false;
    }
    
    /**
     * <p>Indicates whether the Submission phase is closed.</p>
     *
     * @return true if Submission phase is closed, false otherwise
     * @since 1.4
     */
    public Boolean getSubmissionClosed() {
        ProjectPhase submissionPhase = getPhase(ProjectPhase.SUBMISSION);
        return submissionPhase.getStatusId() == ProjectPhase.STATUS_CLOSED;
    }

    /**
     * <p>Indicates whether the Milestone Submission phase is closed.</p>
     *
     * @return true if Review phase is closed, false otherwise
     * @since 1.2
     */
    public Boolean getMilestoneSubmissionClosed() {
        ProjectPhase milestoneSubmissionPhase = getPhase(ProjectPhase.MILESTONE_SUBMISSION);
        if (milestoneSubmissionPhase != null) {
            return (milestoneSubmissionPhase.getStatusId() == ProjectPhase.STATUS_CLOSED);
        }
        return false;
    }

    /**
    * <p>Indicates whether the contest was started.</p>
    *
    * @return true if Specification Submission phase is started or closed
    * @since 1.2
    */
    public Boolean getSpecSubmissionStarted() {
        ProjectPhase specificationSubmissionPhase = getPhase(ProjectPhase.SPECIFICATION_SUBMISSION);
        if (specificationSubmissionPhase != null) {
            return (specificationSubmissionPhase.getStatusId() != ProjectPhase.STATUS_SCHEDULED);
        }
        return false;
    }
    
    /**
     * <p>Gets the maximum number of submissions allowed to be submitted for this project by single submitter.</p>
     * 
     * @return an <code>Integer</code> providing the max number of submissions allowed for this project or
     *         <code>null</code> if such a limit is not set.  
     */
    public Integer getMaxSubmissions() {
        String maxSubmissions = getInfo(INFO_TYPE_MAX_SUBMISSIONS);
        if ((maxSubmissions != null) && (maxSubmissions.trim().length() > 0)) {
            return new Integer(maxSubmissions);
        } else {
            return null;
        }
    }

    /**
     * <p>Gets the allow stock art flag.</p>
     * 
     * @return an <code>Integer</code> providing the allow stock art flag. If not set, false is returned.
     * @since 1.2  
     */
    public Boolean getAllowStockArt() {
        return parseBooleanInfoType(INFO_ALLOW_STOCK_ART);
    }
    
    /**
     * <p>Gets the viewable submission flag.</p>
     * 
     * @return an <code>Integer</code> providing the viewable submission flag. If not set, false is returned.
     * @since 1.2  
     */
    public Boolean getViewableSubmissions() {
        return parseBooleanInfoType(INFO_VIEWABLE_SUBMISSION_FLAG);
    }

    /**
     * <p>Convert the value of the project info type to a boolean value.</p>
     * 
     * @param infoType the info type id
     * @return the boolean value corresponding to the info type. If not set, false is returned.
     * @since 1.2
     */
    private Boolean parseBooleanInfoType(Integer infoType) {
        String flag = getInfo(infoType);
        if (log.isDebugEnabled()) {
                log.debug("Project#parseBooleanInfoType : boolean parse for " + infoType + " = " + flag);
        }
        if ((flag != null) && (flag.trim().length() > 0)) {
            try {
                return Boolean.parseBoolean(flag);
            } catch (NumberFormatException e) {
                // ignore
            }
        }
        
        return false;
    }

    /**
     * <p>Gets the ID of component version associated with this project.</p>
     * 
     * @return an <code>Long</code> providing the ID of component version associated with this project or
     *         <code>null</code> if such a limit is not set.  
     */
    public Long getComponentVersionId() {
        String compVersionId = getInfo(INFO_TYPE_COMP_VERSION_ID);
        if ((compVersionId != null) && (compVersionId.trim().length() > 0)) {
            return new Long(compVersionId);
        } else {
            return null;
        }
    }

    /**
     * <p>Sets the ID of component version associated with this project.</p>
     * 
     * @param componentVersionId an <code>Long</code> providing the ID of component version associated with this project
     *        or <code>null</code> if such a limit is not set.  
     */
    public void setComponentVersionId(Long componentVersionId) {
    }
    
    /**
     * <p>Gets the specification for this project if it is a Studio project.</p>
     *
     * @return a <code>StudioProjectSpecification</code> providing the specification for this project if it is a Studio
     *         project.
     * @since 1.1
     */
    public StudioProjectSpecification getStudioProjectSpecification() {
        return this.studioProjectSpecification;
    }

    /**
     * <p>Sets the specification for this project if it is a Studio project.</p>
     *
     * @param studioProjectSpecification a <code>StudioProjectSpecification</code> providing the specification for this
     *                                   project if it is a Studio project.
     * @since 1.1
     */
    public void setStudioProjectSpecification(StudioProjectSpecification studioProjectSpecification) {
        this.studioProjectSpecification = studioProjectSpecification;
    }

    /**
     * <p>Gets the list of documents set for this project.</p>
     *
     * @return a <code>Set</code> providing the list of documents set for this project.
     * @since 1.1
     */
    public Set<Document> getDocuments() {
        return this.documents;
    }

    /**
     * <p>Sets the list of documents set for this project.</p>
     *
     * @param documents a <code>Set</code> providing the list of documents set for this project.
     * @since 1.1
     */
    public void setDocuments(Set<Document> documents) {
        this.documents = documents;
    }

    /**
     * <p>Gets the prizes associated with this project.</p>
     *
     * @return a <code>Set</code> providing the prizes associated with this project.
     * @since 1.1
     */
    public Set<Prize> getAllPrizes() {
        return this.allPrizes;
    }

    /**
     * <p>Sets the prizes associated with this project.</p>
     *
     * @param allPrizes a <code>Set</code> providing the prizes associated with this project.
     * @since 1.1
     */
    public void setAllPrizes(Set<Prize> allPrizes) {
        this.allPrizes = allPrizes;
    }

    /**
     * <p>Gets the project's total prize purse which is a sum of all regular and milestone prizes.</p>
     *
     * @return a <code>Float</code> providing the the project's total prize purse.
     * @since 1.1
     */
    public Float getTotalPrizePurse() {
        float total = 0;
        for (Prize p : this.allPrizes) {
            total += (p.getAmount() * p.getNumberOfSubmissions());
        }
        return total;
    }

    /**
     * <p>Gets the milestone prize for this project.</p>
     * 
     * @return a <code>Prize</code> providing the details for <code>Milestone</code> prize set for project or
     *         <code>null</code> if there is no such prize set.   
     * @since 1.1
     */
    public Prize getMilestonePrize() {
        for (Prize p : this.allPrizes) {
            if (p.getType().getId() == Prize.MILESTONE_PRIZE_TYPE_ID) {
                return p;
            }
        }
        return null;
    }

    /**
     * <p>Gets the contest prizes set for this project.</p>
     * 
     * @return a <code>List</code> of contest prizes for this project. 
     * @since 1.1
     */
    public List<Prize> getPrizes() {
        List<Prize> contestPrizes = new ArrayList<Prize>();
        for (Prize p : this.allPrizes) {
            if (p.getType().getId() == Prize.CONTEST_PRIZE_TYPE_ID) {
                contestPrizes.add(p);
            }
        }
        return contestPrizes;
    }

    /**
     * <p>Checks if milestone feedback is available for this project.</p>
     * 
     * @return <code>true</code> if milestone feedback is available; <code>false</code> otherwise.
     * @since 1.1
     */
    public boolean getMilestoneFeedbackAvailable() {
        ProjectPhase milestoneReviewPhase = getPhase(ProjectPhase.MILESTONE_REVIEW);
        return (milestoneReviewPhase != null) && (milestoneReviewPhase.getStatusId() == ProjectPhase.STATUS_CLOSED);
    }
    
    /**
     * <p>Gets the list of file types allowed for submission for this project.</p>
     *
     * @return a <code>Set</code> providing the list of file types allowed for submission for this project.
     * @since 1.1
     */
    public Set<FileType> getFileTypes() {
        return this.fileTypes;
    }

    /**
     * <p>Sets the list of file types allowed for submission for this project.</p>
     *
     * @param fileTypes a <code>Set</code> providing the list of file types allowed for submission for this project.
     * @since 1.1
     */
    public void setFileTypes(Set fileTypes) {
        this.fileTypes = fileTypes;
    }

    /**
     * <p>Gets the category of this project.</p>
     *
     * @return a <code>ProjectCategory</code> providing the category of this project.
     * @since 1.1
     */
    public ProjectCategory getCategory() {
        return this.category;
    }

    /**
     * <p>Sets the category of this project.</p>
     *
     * @param category a <code>ProjectCategory</code> providing the category of this project.
     * @since 1.1
     */
    public void setCategory(ProjectCategory category) {
        this.category = category;
    }

    /**
     * <p>Gets the ID of an event which this project may be associated with.</p>
     *
     * @return a <code>Long</code> providing the ID of an event which this project may be associated with.
     * @since 1.1
     */
    public Long getEventId() {
        return this.eventId;
    }

    /**
     * <p>Sets the ID of an event which this project may be associated with.</p>
     *
     * @param eventId a <code>Long</code> providing the ID of an event which this project may be associated with.
     * @since 1.1
     */
    public void setEventId(Long eventId) {
        this.eventId = eventId;
    }

}
