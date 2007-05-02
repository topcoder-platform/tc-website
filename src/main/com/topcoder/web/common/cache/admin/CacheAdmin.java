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
    public void clearRoot() {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean)ctx.lookup(b.getProperty("jndi_name"));
            cache.removeData(new Fqn());
/*
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            //using reflection so that we don't a lot of nasty dependencies when using the class.
            Object o = ctx.lookup(b.getProperty("jndi_name"));
            Method[] methods = o.getClass().getDeclaredMethods();
            for (Method m : methods) {
                if ("removeData".equals(m.getName())) {
                    for (Class c : m.getParameterTypes()) {
                        if ("org.jboss.cache.Fqn".equals(c.getName())) {
                            m.invoke(o, new Fqn());
                        }
                    }
                }
            }
*/
        } catch (NamingException e) {
            throw new RuntimeException(e);
/*
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
*/
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

            Set keys = cache.getKeys(new Fqn());
            String key;
            int count = 0;
            for (Object key1 : keys) {
                key = (String) key1;
                if (key.indexOf(s) >= 0) {
                    cache.remove(new Fqn(), key);
                    count++;
                }
            }
            return count + " items removed from cache";
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException("Couldn't remove the root ", e);
        } finally {
            TCContext.close(ctx);
        }

    }


    public int rootSize() {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));
            return cache.getKeys(new Fqn()).size();
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException("Couldn't remove the root ", e);
        } finally {
            TCContext.close(ctx);
        }

    }


    public String getName() {
        return "JBoss Cache Admin";
    }
}
