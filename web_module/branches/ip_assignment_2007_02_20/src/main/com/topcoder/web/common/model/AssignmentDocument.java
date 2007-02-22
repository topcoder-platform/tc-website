package com.topcoder.web.common.model;

import java.sql.Timestamp;

import com.topcoder.web.studio.model.Contest;

/**
 * @author pulky
 */
public class AssignmentDocument extends Base {
    private Long id;
    private AssignmentDocumentType type;
    private AssignmentDocumentStatus status;
    private String text;
    private User user;
    private Contest studioContest;
    private Long componentProjectId;
    private Timestamp affirmedDate;
    private Timestamp expireDate;

    public AssignmentDocument() {
        type = new AssignmentDocumentType();
        status = new AssignmentDocumentStatus();
    }

    /**
     * @return the affirmedDate
     */
    public Timestamp getAffirmedDate() {
        return affirmedDate;
    }

    /**
     * @param affirmedDate the affirmedDate to set
     */
    public void setAffirmedDate(Timestamp affirmedDate) {
        this.affirmedDate = affirmedDate;
    }

    /**
     * @return the componentProjectId
     */
    public Long getComponentProjectId() {
        return componentProjectId;
    }

    /**
     * @param componentProjectId the componentProjectId to set
     */
    public void setComponentProjectId(Long componentProjectId) {
        this.componentProjectId = componentProjectId;
    }

    /**
     * @return the expireDate
     */
    public Timestamp getExpireDate() {
        return expireDate;
    }

    /**
     * @param expireDate the expireDate to set
     */
    public void setExpireDate(Timestamp expireDate) {
        this.expireDate = expireDate;
    }

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the status
     */
    public AssignmentDocumentStatus getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(AssignmentDocumentStatus status) {
        this.status = status;
    }

    /**
     * @return the text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text the text to set
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * @return the type
     */
    public AssignmentDocumentType getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(AssignmentDocumentType type) {
        this.type = type;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the studioContest
     */
    public Contest getStudioContest() {
        return studioContest;
    }

    /**
     * @param studioContest the studioContest to set
     */
    public void setStudioContest(Contest studioContest) {
        this.studioContest = studioContest;
    }

}
