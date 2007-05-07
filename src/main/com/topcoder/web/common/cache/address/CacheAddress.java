package com.topcoder.web.common.cache.address;

/**
 * This interface is intended to hide the details of determining the "key"
 * for an item that we're caching.  We're wrapping this up in an interface
 * because we're currently using jboss-cache which stores things in a tree.
 * Therefore, the location of times is fairly different than what one might
 * use for other caches.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public interface CacheAddress {

    String getKey();
}
