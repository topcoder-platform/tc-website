package com.topcoder.web.common.cache.address;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.RequestInt;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.cache.address.jboss.RequestAddress;
import com.topcoder.web.common.cache.address.jboss.TCSubjectAddress;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public class AddressFactory {
    //add config so that we can swap out implementations easily.
    // between the different cache implementations

    public static CacheAddress create(RequestInt request) {
        return new RequestAddress(request);
    }

    public static CacheAddress create(RequestInt request, MaxAge maxAge) {
        return new RequestAddress(request, maxAge);
    }

    public static CacheAddress create(TCSubject subject, String dataSource) {
        return new TCSubjectAddress(subject, dataSource);
    }

    public static CacheAddress create(TCSubject subject, String dataSource, MaxAge maxAge) {
        return new TCSubjectAddress(subject, dataSource, maxAge);
    }

}
