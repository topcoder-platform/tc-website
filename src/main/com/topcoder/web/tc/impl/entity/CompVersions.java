package com.topcoder.web.tc.impl.entity;

public class CompVersions {

    private long compVersId;

    private long componentId;

    private long phaseId;

    public CompVersions() {
    }

    public long getCompVersId() {
        return compVersId;
    }

    public void setCompVersId(long compVersId) {
        this.compVersId = compVersId;
    }

    public long getComponentId() {
        return componentId;
    }

    public void setComponentId(long componentId) {
        this.componentId = componentId;
    }

    public long getPhaseId() {
        return phaseId;
    }

    public void setPhaseId(long phaseId) {
        this.phaseId = phaseId;
    }
}
