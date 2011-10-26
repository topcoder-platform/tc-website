package com.topcoder.web.common.cache;

import com.topcoder.web.common.cache.address.CacheAddress;

/**
 * @author dok
 * @version $Revision: 60790 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 30, 2007
 */
public interface CacheClient {
    /**
     * set a key/value pair
     *
     * @param key   the key for the cached value
     * @param value the value to be stored
     * @throws TCCacheException if there is a problem
     */
    public void set(String key, Object value) throws TCCacheException;

    /**
     * set a key/value pair
     *
     * @param address where the value goes in the cache
     * @param value   the value to be stored
     * @throws TCCacheException if there is a problem
     */
    public void set(CacheAddress address, Object value) throws TCCacheException;

    /**
     * set a key/value pair
     *
     * @param address where the value goes in the cache
     * @param value   the value to be stored
     * @param maxAge  how long (at most) the value should exist in the cache
     * @throws TCCacheException if there is a problem
     */
    public void set(CacheAddress address, Object value, MaxAge maxAge) throws TCCacheException;


    /**
     * retrieve the value associated with a key.
     *
     * @param key the key to query on
     * @return the value
     * @throws TCCacheException if there is a problem
     */
    public Object get(String key) throws TCCacheException;

    /**
     * retrieve the value associated with a key.
     *
     * @param address where the value is in the cache
     * @return the value
     * @throws TCCacheException if there is a problem
     */
    public Object get(CacheAddress address) throws TCCacheException;

    /**
     * @param key the key to remove
     * @return the object removed
     * @throws TCCacheException if there is a problem
     */
    public Object remove(String key) throws TCCacheException;

    /**
     * @param address where the value is in the cache
     * @return the object removed
     * @throws TCCacheException if there is a problem
     */
    public Object remove(CacheAddress address) throws TCCacheException;


    /**
     * @throws TCCacheException if there is a problem
     */
    public void clearCache() throws TCCacheException;


}
