package com.topcoder.web.common.cache;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.web.common.cache.address.CacheAddress;
import com.topcoder.web.common.cache.address.jboss.JbossCacheAddress;
import org.jboss.cache.CacheException;
import org.jboss.cache.Fqn;
import org.jboss.cache.TreeCacheMBean;

import javax.naming.NamingException;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 30, 2007
 */
public class JbossCacheClient implements CacheClient {

    private static TreeCacheMBean cache;
    private static boolean initialized = false;

    public JbossCacheClient() {
        init();
    }


    private synchronized void init() {
        if (!initialized) {
            TCResourceBundle b = new TCResourceBundle("cache");
            try {
                cache = (TreeCacheMBean) new CacheLocator(TreeCacheMBean.class, b.getProperty("jndi_name"), b.getProperty("host_url")).getService();
                initialized = true;
            } catch (NamingException e) {
                throw new RuntimeException(e);
            }
        }
    }


    public void set(String key, Object value) throws TCCacheException {
        try {
            cache.put(Fqn.fromString("/" + MaxAge.MAX.name() + "/" + key), key, value);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

/*    public void set(String key, Object value, MaxAge maxAge) throws TCCacheException {
        try {
            cache.put(Fqn.fromString("/" + maxAge.name() + "/" + key), key, value);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }*/

    public void set(CacheAddress address, Object value) throws TCCacheException {
        try {
            cache.put(Fqn.fromString(((JbossCacheAddress) address).getFqn()), address.getKey(), value);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public void set(CacheAddress address, Object value, MaxAge maxAge) throws TCCacheException {
        try {
            cache.put(Fqn.fromString(((JbossCacheAddress) address).getFqn()), address.getKey(), value);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public Object get(String key) throws TCCacheException {
        try {
            return cache.get(Fqn.fromString("/" + MaxAge.MAX.name() + "/" + key), key);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public Object get(CacheAddress address) throws TCCacheException {
        try {
            return cache.get(Fqn.fromString(((JbossCacheAddress) address).getFqn()), address.getKey());
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public Object remove(String key) throws TCCacheException {
        try {
            return cache.remove(Fqn.fromString("/" + MaxAge.MAX.name() + "/" + key), key);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public Object remove(CacheAddress address) throws TCCacheException {
        try {
            return cache.remove(Fqn.fromString(((JbossCacheAddress) address).getFqn()), address.getKey());
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public void clearCache() throws TCCacheException {
        try {
            cache.removeData(Fqn.ROOT);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public Set getKeys() throws TCCacheException {
        try {
            return cache.getKeys(Fqn.ROOT);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }


}
