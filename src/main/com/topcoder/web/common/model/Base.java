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

    /**
     * when true, this means that the person registering does not currently have an acccount for this event
     * in the past it meant something a little different, however, the past is the past and we're moving
     * forward.  since we don't ever execute the old code, i've chosen not to back-port this
     * change in meaning.
     */
    private boolean isNew;
    private boolean isAccountConversion;

    public Base() {
        isNew = true;
        isAccountConversion = false;
    }

    public boolean isNew() {
        return isNew;
    }

    public void setNew(boolean isNew) {
        this.isNew = isNew;
    }

    public boolean isAccountConversion() {
        return isAccountConversion;
    }

    public void setAccountConversion(boolean accountConversion) {
        isAccountConversion = accountConversion;
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
