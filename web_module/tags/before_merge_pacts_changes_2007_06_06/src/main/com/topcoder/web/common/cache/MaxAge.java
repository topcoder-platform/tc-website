package com.topcoder.web.common.cache;

import com.topcoder.shared.dataAccess.DataAccessConstants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public enum MaxAge {
    QUARTER_HOUR(1000 * 60 * 15), HALF_HOUR(1000 * 60 * 30), HOUR(1000 * 60 * 60), MAX(DataAccessConstants.DEFAULT_EXPIRE_TIME);
    private final int age;

    MaxAge(int age) {
        this.age = age;
    }

    /**
     * @return the age in milli
     */
    public int age() {
        return age;
    }
}
