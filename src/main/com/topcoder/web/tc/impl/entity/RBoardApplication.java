package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

public class RBoardApplication implements Serializable {

    private static final long serialVersionUID = 7164551751717193168L;

    private long userId;

    private long projectId;

    private long phaseId;

    public RBoardApplication() {
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public long getPhaseId() {
        return phaseId;
    }

    public void setPhaseId(long phaseId) {
        this.phaseId = phaseId;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof RBoardApplication) {
            RBoardApplication app = (RBoardApplication) obj;
            if (getUserId() == app.getUserId() && getProjectId() == app.getProjectId()
                    && getPhaseId() == app.getPhaseId()) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int hashCode() {
        return (int) (getUserId() * getProjectId() * getPhaseId());
    }
}
