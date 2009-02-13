package com.topcoder.web.common.cache;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.distCache.CacheClientFactory;

import java.rmi.RemoteException;
import java.util.Set;
import java.util.HashSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 1, 2007
 */
public class DistCacheClient implements CacheClient {

    private com.topcoder.shared.distCache.CacheClient cache;

    public DistCacheClient() {
        cache = CacheClientFactory.createCacheClient();
    }

    public void set(String key, Object value) throws TCCacheException {
        try {
            cache.set(key, value, DataAccessConstants.DEFAULT_EXPIRE_TIME);
        } catch (RemoteException e) {
            throw new TCCacheException(e);
        }
    }

    public Object get(String key) throws TCCacheException {
        try {
            return cache.get(key);
        } catch (RemoteException e) {
            throw new TCCacheException(e);
        }
    }

    public Object remove(String key) throws TCCacheException {

        try {
            return cache.remove(key);
        } catch (RemoteException e) {
            throw new TCCacheException(e);
        }
    }

    public void clearCache() throws TCCacheException {
        try {
            cache.clearCache();
        } catch (RemoteException e) {
            throw new TCCacheException(e);
        }
    }

    public Set getKeys() throws TCCacheException {
        try {
            return new HashSet(cache.getKeys());
        } catch (RemoteException e) {
            throw new TCCacheException(e);
        }
    }
}
