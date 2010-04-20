package com.topcoder.web.common.cache.address.dist;

import com.topcoder.security.TCSubject;
import com.topcoder.web.common.cache.address.CacheAddress;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2007
 */
public class TCSubjectAddress implements CacheAddress {
    private String key;

    public TCSubjectAddress(TCSubject sub) {
        this.key = "subject:" + sub.getUserId();
    }

    public TCSubjectAddress(TCSubject sub, String dataSource) {
        this.key = "subject:" + (dataSource == null ? "" : dataSource) + sub.getUserId();
    }

    public String getKey() {
        return key;
    }


}
