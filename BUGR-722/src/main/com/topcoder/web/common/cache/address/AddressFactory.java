package com.topcoder.web.common.cache.address;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.RequestInt;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.web.common.cache.JbossCacheClient;
import com.topcoder.web.common.cache.MaxAge;

/**
 * @author dok
 * @version $Revision: 60728 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public class AddressFactory {
    //add config so that we can swap out implementations easily.
    // between the different cache implementations

    private static final TCResourceBundle bundle = new TCResourceBundle("cache");
    private static final boolean isJbossCache = JbossCacheClient.class.getName().equals(bundle.getProperty("cache_client_class"));

    public static CacheAddress create(RequestInt request) {
        if (isJbossCache) {
            return new com.topcoder.web.common.cache.address.jboss.RequestAddress(request);
        } else {
            return new com.topcoder.web.common.cache.address.dist.RequestAddress(request);
        }
    }

    public static CacheAddress create(RequestInt request, MaxAge maxAge) {
        if (isJbossCache) {
            return new com.topcoder.web.common.cache.address.jboss.RequestAddress(request, maxAge);
        } else {
            return new com.topcoder.web.common.cache.address.dist.RequestAddress(request);
        }
    }

    public static CacheAddress create(TCSubject subject, String dataSource) {
        if (isJbossCache) {
            return new com.topcoder.web.common.cache.address.jboss.TCSubjectAddress(subject, dataSource);
        } else {
            return new com.topcoder.web.common.cache.address.dist.TCSubjectAddress(subject, dataSource);
        }
    }

    public static CacheAddress create(TCSubject subject, String dataSource, MaxAge maxAge) {
        if (isJbossCache) {
            return new com.topcoder.web.common.cache.address.jboss.TCSubjectAddress(subject, dataSource, maxAge);
        } else {
            return new com.topcoder.web.common.cache.address.dist.TCSubjectAddress(subject, dataSource);
        }
    }

}
