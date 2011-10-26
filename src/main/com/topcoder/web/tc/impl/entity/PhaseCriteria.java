package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

public class PhaseCriteria implements Serializable {

    private static final long serialVersionUID = -1507242333558481458L;

    private long projectPhaseId;

    private long phaseCriteriaTypeId;

    private String parameter;

    public PhaseCriteria() {
    }

    public long getProjectPhaseId() {
        return projectPhaseId;
    }

    public void setProjectPhaseId(long projectPhaseId) {
        this.projectPhaseId = projectPhaseId;
    }

    public long getPhaseCriteriaTypeId() {
        return phaseCriteriaTypeId;
    }

    public void setPhaseCriteriaTypeId(long phaseCriteriaTypeId) {
        this.phaseCriteriaTypeId = phaseCriteriaTypeId;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof PhaseCriteria) {
            PhaseCriteria criteria = (PhaseCriteria) obj;
            if (getProjectPhaseId() == criteria.getProjectPhaseId()
                    && getPhaseCriteriaTypeId() == criteria.getPhaseCriteriaTypeId()) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int hashCode() {
        return (int) (getProjectPhaseId() * getPhaseCriteriaTypeId());
    }
}
