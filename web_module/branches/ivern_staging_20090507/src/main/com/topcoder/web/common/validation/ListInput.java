package com.topcoder.web.common.validation;

import java.util.List;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class ListInput implements ValidationInput {
    List l;

    public ListInput(List l) {
        this.l = l;

    }

    public Object getInput() {
        return Collections.unmodifiableList(l);
    }
}
