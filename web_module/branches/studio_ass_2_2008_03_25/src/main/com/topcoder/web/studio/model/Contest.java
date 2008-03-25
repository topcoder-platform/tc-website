package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.studio.dao.StudioDAOUtil;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 27, 2006
 */
public class Contest extends Base {
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
     * @since TopCoder Studio Modifications Assembly (Req# 5.4)
     */
    private Long createUserId = null;

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
}
