package com.topcoder.web.privatelabel.model;

import java.lang.reflect.Method;

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
        Method[] m = this.getClass().getMethods();
        StringBuffer buf = new StringBuffer(200);
        String methodName = null;
        for (int i = 0; i < m.length; i++) {
            try {
                methodName = m[i].getName();
                if (methodName.startsWith("get")) {
                    buf.append(m[i].getName().substring(3) + " = " + m[i].invoke(this, null).toString());
                }
            } catch (Exception e) {
                buf.append(m[i].getName() + " is not accessible");
            }
            if (i<m.length-1) buf.append(", ");
        }
        return buf.toString();
    }
}
