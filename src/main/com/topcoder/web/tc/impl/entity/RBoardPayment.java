package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

public class RBoardPayment implements Serializable {

    private static final long serialVersionUID = -8123208441341446259L;

    private long projectId;

    private long phaseId;

    private boolean primary;

    private double amount;

    public RBoardPayment() {
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

    public boolean isPrimary() {
        return primary;
    }

    public void setPrimary(boolean primary) {
        this.primary = primary;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof RBoardPayment) {
            RBoardPayment payment = (RBoardPayment) obj;
            if (getProjectId() == payment.getProjectId() && getPhaseId() == payment.getPhaseId()
                    && isPrimary() == payment.isPrimary()) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int hashCode() {
        return (int) (getProjectId() * getPhaseId() * (isPrimary() ? 1 : -1));
    }
}
