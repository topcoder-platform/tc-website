package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;
import java.lang.reflect.Method;

/**
 *
 * @author gpaul 06.26.2003
 */
abstract public class Base implements Serializable, Cloneable {

    protected static Logger log = Logger.getLogger(Base.class);

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
        Method[] m = getClass().getMethods();
        StringBuffer buf = new StringBuffer(200);
        String methodName = null;
        for (int i = 0; i < m.length; i++) {
            try {
                methodName = m[i].getName();
                if (methodName.startsWith("get") && m[i].isAccessible()) {
                    buf.append(m[i].getName().substring(3) + " = " + m[i].invoke(this, null).toString());
                    if (i < m.length - 1) buf.append(", ");
                }
            } catch (Exception e) {
                buf.append(m[i].getName().substring(3) + " = ?????");
                if (i < m.length - 1) buf.append(", ");
            }
        }
        return buf.toString();
    }
}
