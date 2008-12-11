package com.topcoder.dde.submission;

import java.io.Serializable;

/**
 */
public class Submitter implements Serializable {

    private long submitterId;
    private long loginId;
    private long componentVersionId;
    private long phaseId;

    public Submitter(long submitterId, long loginId, long componentVersionId, long phaseId) {

        this.submitterId = submitterId;
        this.loginId = loginId;
        this.componentVersionId = componentVersionId;
        this.phaseId = phaseId;
    }

    public long getSubmitterId() {
        return submitterId;
    }

    public long getLoginId() {
        return loginId;
    }

    public long getComponentVersionId() {
        return componentVersionId;
    }

    public long getPhaseId() {
        return phaseId;
    }
}
