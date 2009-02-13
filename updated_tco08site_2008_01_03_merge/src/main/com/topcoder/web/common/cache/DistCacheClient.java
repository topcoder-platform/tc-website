package com.topcoder.web.common.cache;

import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.web.common.cache.address.CacheAddress;

import java.rmi.RemoteException;
import java.util.HashSet;
import java.util.Set;

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
            cache.set(key, value, MaxAge.MAX.age());
        } catch (RemoteException e) {
            throw new TCCacheException(e);
        }
    }

    public void set(String key, Object value, MaxAge maxAge) throws TCCacheException {
        try {
            cache.set(key, value, maxAge.age());
        } catch (RemoteException e) {
            throw new TCCacheException(e);
        }
    }

    public void set(CacheAddress address, Object value) throws TCCacheException {
        try {
            cache.set(address.getKey(), value, MaxAge.MAX.age());
        } catch (RemoteException e) {
            throw new TCCacheException(e);
        }
    }

    public void set(CacheAddress address, Object value, MaxAge maxAge) throws TCCacheException {
        try {
            cache.set(address.getKey(), value, maxAge.age());
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

    public Object get(CacheAddress address) throws TCCacheException {
        try {
            return cache.get(address.getKey());
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

    public Object remove(CacheAddress address) throws TCCacheException {
        try {
            return cache.remove(address.getKey());
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
