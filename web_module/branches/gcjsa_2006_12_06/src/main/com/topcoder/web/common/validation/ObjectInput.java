package com.topcoder.web.common.validation;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class ObjectInput implements ValidationInput {

    private Object o;

    public ObjectInput(Object o) {
        this.o = o;
    }

    public Object getInput() {
        return o;
    }
}
