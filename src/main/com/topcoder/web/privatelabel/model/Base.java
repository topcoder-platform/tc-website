package com.topcoder.web.privatelabel.model;

import java.lang.reflect.Field;

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

    public String toString() {
        Field[] f = this.getClass().getFields();
        StringBuffer buf = new StringBuffer(200);
        for (int i = 0; i < f.length; i++) {
            try {
                buf.append(f[i].getName() + " = " + f[i].get(null));
            } catch (Exception e) {
                buf.append(f[i].getName() + " is not accessible");
            }
            if (i<f.length-1) buf.append(", ");
        }
        return buf.toString();
    }
}
