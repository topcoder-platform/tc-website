package com.topcoder.web.common.cache;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCResourceBundle;
import org.jboss.cache.TreeCacheMBean;
import org.jboss.cache.Fqn;
import org.jboss.cache.CacheException;

import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 30, 2007
 */
public class JbossCacheClient implements CacheClient {

    private TreeCacheMBean cache;

    //just using the root path for now
    private Fqn path;

    public JbossCacheClient() {
        path = new Fqn();
        TCResourceBundle b = new TCResourceBundle("cache");
        //cache =
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial(new TCResourceBundle("cache").getProperty("host_url"));
            //todo consider moving this out to the factory so that we can have the cache named different things in jndi
            cache = (TreeCacheMBean)ctx.lookup("TCCache");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } finally {
            TCContext.close(ctx);
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
            cache.remove(path);
        } catch (CacheException e) {
            throw new TCCacheException(e);
        }
    }
}
