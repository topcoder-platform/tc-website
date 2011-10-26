/*
* ComponentState
*
* Created Oct 1, 2007
*/
package com.topcoder.web.common.model.algo;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Coder;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: ComponentState.java 66662 2007-10-25 12:59:15Z pulky $
 */
public class ComponentState extends Base {

    public final static int NOT_OPENED = 110;// Default
    public final static int REASSIGNED = 111; //Team problem that has been assigned to another team member
    public final static int LOOKED_AT = 120;//Opened. Not yet compiled
    public final static int COMPILED_UNSUBMITTED = 121;// Compiled, but not yet submitted
    public final static int PASSED = 122;// Moving on without submitting
    public final static int NOT_CHALLENGED = 130;// Submitted
    public final static int CHALLENGE_FAILED = 131;
    public final static int CHALLENGE_SUCCEEDED = 140;
    public final static int SYSTEM_TEST_FAILED = 160;
    public final static int SYSTEM_TEST_SUCCEEDED = 150;

    private Long id = null;
    private Double points = null;
    private Integer statusId = null;
    private Integer submissionNumber = null;

    private Round round = null;
    private Coder coder = null;
    private Component component = null;
    
    public ComponentState() {
        super();
    }

    /**
     * @return the coder
     */
    public Coder getCoder() {
        return coder;
    }

    /**
     * @param coder the coder to set
     */
    public void setCoder(Coder coder) {
        this.coder = coder;
    }

    /**
     * @return the component
     */
    public Component getComponent() {
        return component;
    }

    /**
     * @param component the component to set
     */
    public void setComponent(Component component) {
        this.component = component;
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
     * @return the points
     */
    public Double getPoints() {
        return points;
    }

    /**
     * @param points the points to set
     */
    public void setPoints(Double points) {
        this.points = points;
    }

    /**
     * @return the round
     */
    public Round getRound() {
        return round;
    }

    /**
     * @param round the round to set
     */
    public void setRound(Round round) {
        this.round = round;
    }

    /**
     * @return the statusId
     */
    public Integer getStatusId() {
        return statusId;
    }

    /**
     * @param statusId the statusId to set
     */
    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    /**
     * @return the submissionNumber
     */
    public Integer getSubmissionNumber() {
        return submissionNumber;
    }

    /**
     * @param submissionNumber the submissionNumber to set
     */
    public void setSubmissionNumber(Integer submissionNumber) {
        this.submissionNumber = submissionNumber;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final ComponentState other = (ComponentState) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
    
    // todo: there's no lookup currently 
    public static String getStatusDescription(int statusId) {
        switch (statusId) {
        case NOT_OPENED:
            return "Not opened";
        case REASSIGNED:
            return "Reassigned";
        case LOOKED_AT:
            return "Looked at";
        case COMPILED_UNSUBMITTED:
            return "Compiled";
        case PASSED:
            return "Passed";
        case NOT_CHALLENGED:
            return "Not challenged";
        case CHALLENGE_FAILED:
            return "Challenge failed";
        case CHALLENGE_SUCCEEDED:
            return "Challenge succeeded";
        case SYSTEM_TEST_FAILED:
            return "Failed";
        case SYSTEM_TEST_SUCCEEDED:
            return "Succeeded";
        }
        return "Unknown";
    }
}
