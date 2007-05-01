package com.topcoder.web.common.cache;

import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 30, 2007
 */
public interface CacheClient {
    /**
     * set a key/value pair
     * @param key the key for the cached value
     * @param value the value to be stored
     * @throws TCCacheException if there is a problem
    */
    public void set(String key, Object value) throws TCCacheException;

    /**
     * retrieve the value associated with a key.
     * @param  key   the key to query on
     * @return the value
     * @throws TCCacheException if there is a problem
     */
    public Object get(String key) throws TCCacheException;

    /**
     *
     * @param key the key to remove
     * @return the object removed
     * @throws TCCacheException if there is a problem
     */
    public Object remove(String key) throws TCCacheException;

    /**
     *
     * @throws TCCacheException if there is a problem
     */
    public void clearCache() throws TCCacheException;

    public Set getKeys() throws TCCacheException;

}
