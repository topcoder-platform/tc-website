package com.topcoder.web.common.cache.address.jboss;

import com.topcoder.security.TCSubject;
import com.topcoder.web.common.cache.MaxAge;

/**
 * @author dok
 * @version $Revision: 60691 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public class TCSubjectAddress implements JbossCacheAddress {

    private String fqn;
    private String key;
    private MaxAge maxAge;

    public TCSubjectAddress(TCSubject sub) {
        this.maxAge = MaxAge.MAX;
        this.key = "subject";
        this.fqn = parseFqn(sub, null);
    }

    public TCSubjectAddress(TCSubject sub, String dataSource) {
        this.maxAge = MaxAge.MAX;
        this.key = "subject";
        this.fqn = parseFqn(sub, dataSource);
    }

    public TCSubjectAddress(TCSubject sub, String dataSource, MaxAge maxAge) {
        this.key = "subject";
        this.maxAge = maxAge;
        this.fqn = parseFqn(sub, dataSource);
    }

    private String parseFqn(TCSubject sub, String dataSource) {
        StringBuilder b = new StringBuilder(100);
        b.append("/").append(maxAge.name());
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

    public String toString() {
        return fqn + "/" + key;
    }
}
