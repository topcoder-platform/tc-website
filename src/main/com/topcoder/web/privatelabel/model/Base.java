package com.topcoder.web.privatelabel.model;

/**
 *
 * @author gpaul 06.26.2003
 */
public class Base {
    private boolean isNew;

    public Base() {
        isNew = true;
    }

    public boolean isNew() {
        return isNew;
    }

    public void setNew(boolean isNew) {
        this.isNew = isNew;
    }
}
