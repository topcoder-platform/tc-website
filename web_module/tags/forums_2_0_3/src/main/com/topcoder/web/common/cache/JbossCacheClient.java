package com.topcoder.web.common.cache;

import com.topcoder.shared.util.TCResourceBundle;
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

    //just using the root path for now
    private static final Fqn path = new Fqn();


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
            cache.put(path, key, value);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public Object get(String key) throws TCCacheException {
        try {
            return cache.get(path, key);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public Object remove(String key) throws TCCacheException {

        try {
            return cache.remove(path, key);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public void clearCache() throws TCCacheException {
        try {
            cache.removeData(path);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }

    public Set getKeys() throws TCCacheException {
        try {
            return cache.getKeys(path);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }
}
