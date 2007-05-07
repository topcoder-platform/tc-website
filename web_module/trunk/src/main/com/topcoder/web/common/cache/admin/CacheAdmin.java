package com.topcoder.web.common.cache.admin;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import org.jboss.cache.CacheException;
import org.jboss.cache.Fqn;
import org.jboss.cache.TreeCacheMBean;
import org.jboss.system.ServiceMBeanSupport;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 2, 2007
 */
public class CacheAdmin extends ServiceMBeanSupport implements CacheAdminMBean {
    private static final Logger log = Logger.getLogger(CacheAdmin.class);

    public void clearAll() {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));
            cache.remove(Fqn.ROOT);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException(e);
        } finally {
            TCContext.close(ctx);
        }
    }

    public void clear(String fqn) {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));
            cache.remove(Fqn.fromString(fqn));
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException(e);
        } finally {
            TCContext.close(ctx);
        }

    }

    public String removelike(String s) {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));

            int count = removelike(s, "/", cache, 0);

            return count + " items removed from cache";
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException("Couldn't remove the root ", e);
        } finally {
            TCContext.close(ctx);
        }
    }

    public int removelike(String key, String parent, TreeCacheMBean cache, int count) throws CacheException {
        String kid;
        String fqn;
        for (Object child : cache.getChildrenNames(parent)) {
            kid = (String) child;
            fqn = parent + Fqn.SEPARATOR + kid;
            if (kid.indexOf(key) >= 0) {
                cache.remove(fqn);
                count++;
            } else {
                Set kids = cache.getChildrenNames(fqn);
                if (kids != null && !kids.isEmpty()) {
                    count += removelike(key, fqn, cache, count);
                }
            }
        }
        return count;
    }


    public int size() {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));
            return cache.getNumberOfAttributes();
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } finally {
            TCContext.close(ctx);
        }

    }


    public String getName() {
        return "JBoss Cache Admin";
    }
}
