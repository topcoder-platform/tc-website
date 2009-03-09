package com.topcoder.web.common.cache.address.jboss;

import com.topcoder.web.common.cache.address.CacheAddress;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public interface JbossCacheAddress extends CacheAddress {
    String getFqn();
}
