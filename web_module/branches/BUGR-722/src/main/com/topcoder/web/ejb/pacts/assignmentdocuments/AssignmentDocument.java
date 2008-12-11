package com.topcoder.web.ejb.pacts.assignmentdocuments;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.GregorianCalendar;

import com.topcoder.web.ejb.pacts.assignmentdocuments.User;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author pulky
 */
public class AssignmentDocument implements Serializable, Cloneable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    private Long id;
    private AssignmentDocumentType type;
    private AssignmentDocumentStatus status;
    private String submissionTitle;
    private String text;
    private User user;
    private Boolean hardCopy;
    private StudioContest studioContest;
    private ComponentProject componentProject;
    private Timestamp affirmedDate;
    private Timestamp expireDate;
    private Timestamp createDate;
    private Timestamp modifyDate;

    public AssignmentDocument() {
        type = new AssignmentDocumentType();
        status = new AssignmentDocumentStatus();
    }

    public Boolean isHardCopy() {
        return hardCopy;
    }

    public Boolean getHardCopy() {
        return hardCopy;
    }

    public void setHardCopy(Boolean hardCopy) {
        this.hardCopy = hardCopy;
    }

    /**
     * @return the affirmedDate
     */
    public Timestamp getAffirmedDate() {
        return affirmedDate;
    }

    public Integer getDaysLeftToExpire() {
        // if not pending return 0
        if (!status.getId().equals(AssignmentDocumentStatus.PENDING_STATUS_ID)) {
            return new Integer(0);
        }

        Calendar aux = new GregorianCalendar();
        aux.setTimeInMillis(getExpireDate().getTime());
        aux.set(aux.get(Calendar.YEAR), aux.get(Calendar.MONTH), aux.get(Calendar.DATE), 0, 0, 0);

        int difInDays = 1 + (int) ((aux.getTimeInMillis() - Calendar.getInstance().getTimeInMillis())/(1000*60*60*24));

        return new Integer((difInDays > 0) ? difInDays : 0);
    }

    /**
     * @param affirmedDate the affirmedDate to set
     */
    public void setAffirmedDate(Timestamp affirmedDate) {
        this.affirmedDate = affirmedDate;
    }

    /**
     * @return the componentProject
     */
    public ComponentProject getComponentProject() {
        return componentProject;
    }

    /**
     * @param componentProject the componentProject to set
     */
    public void setComponentProject(ComponentProject componentProject) {
        this.componentProject = componentProject;
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
     * @return the submissionTitle
     */
    public String getSubmissionTitle() {
        return submissionTitle;
    }

    /**
     * @param submissionTitle the submissionTitle to set
     */
    public void setSubmissionTitle(String submissionTitle) {
        this.submissionTitle = submissionTitle;
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
    public StudioContest getStudioContest() {
        return studioContest;
    }

    /**
     * @param studioContest the studioContest to set
     */
    public void setStudioContest(StudioContest studioContest) {
        this.studioContest = studioContest;
    }

    /**
     * @return the createDate
     */
    public Timestamp getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    /**
     * @return the modifyDate
     */
    public Timestamp getModifyDate() {
        return modifyDate;
    }

    /**
     * @param modifyDate the modifyDate to set
     */
    public void setModifyDate(Timestamp modifyDate) {
        this.modifyDate = modifyDate;
    }

}
