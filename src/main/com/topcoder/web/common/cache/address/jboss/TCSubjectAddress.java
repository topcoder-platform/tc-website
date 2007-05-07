package com.topcoder.web.common.cache.address.jboss;

import com.topcoder.security.TCSubject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public class TCSubjectAddress implements JbossCacheAddress {

    private String fqn;
    private String key;

    public TCSubjectAddress(TCSubject sub) {
        this.key = "subject";
        this.fqn = parseFqn(sub, null);
    }

    public TCSubjectAddress(TCSubject sub, String dataSource) {
        this.key = "subject";
        this.fqn = parseFqn(sub, dataSource);
    }

    private String parseFqn(TCSubject sub, String dataSource) {
        StringBuilder b = new StringBuilder(100);
        b.append(Root.TCSUBJECT.path());
        if (dataSource != null) {
            b.append("/").append(dataSource);
        }
        b.append("/").append(sub.getUserId());
        return b.toString();
    }

    public String getFqn() {
        return fqn;
    }

    public String getKey() {
        return key;
    }
}
