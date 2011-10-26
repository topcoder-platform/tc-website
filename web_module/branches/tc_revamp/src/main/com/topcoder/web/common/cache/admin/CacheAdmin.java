package com.topcoder.web.common.cache.admin;

import java.util.Set;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.jboss.cache.CacheException;
import org.jboss.cache.Fqn;
import org.jboss.cache.TreeCacheMBean;
import org.jboss.system.ServiceMBeanSupport;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author dok, pulky
 * @version $Revision: 72590 $ Date: 2005/01/01 00:00:00
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
            int count = removelike(s, "/", cache);

            return count + " items removed from cache";
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException("Couldn't remove the root ", e);
        } finally {
            TCContext.close(ctx);
        }
    }

    public String removelike(Set<String> s) {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));

            int count = removelike(s, "/", cache);

            return count + " items removed from cache";
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException("Couldn't remove the root ", e);
        } finally {
            TCContext.close(ctx);
        }
    }

    private int removelike(String key, String parent, TreeCacheMBean cache) throws CacheException {
        String kid;
        String fqn;
        int ret = 0;
        for (Object child : cache.getChildrenNames(parent)) {
            kid = (String) child;
            fqn = parent + Fqn.SEPARATOR + kid;
            if (kid.indexOf(key) >= 0) {
                if (log.isDebugEnabled()) {
                    log.debug("removing " + fqn);
                }
                cache.remove(fqn);
                ret++;
            } else {
                Set kids = cache.getChildrenNames(fqn);
                if (kids != null && !kids.isEmpty()) {
                    ret += removelike(key, fqn, cache);
                }
            }
        }
        return ret;
    }

    public String listLike(String s) {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));
            return listLike(new StringBuilder(1024), s, "/", cache).toString();
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException("Couldn't remove the root ", e);
        } finally {
            TCContext.close(ctx);
        }
    }
    
    private StringBuilder listLike(StringBuilder sb, String key, String parent, TreeCacheMBean cache) throws CacheException {
        String kid;
        String fqn;
        for (Object child : cache.getChildrenNames(parent)) {
            kid = (String) child;
            fqn = parent + Fqn.SEPARATOR + kid;
            if (kid.indexOf(key) >= 0) {
                if (log.isDebugEnabled()) {
                    log.debug("removing " + fqn);
                }
                sb.append(fqn).append("\n");
            } else {
                Set kids = cache.getChildrenNames(fqn);
                if (kids != null && !kids.isEmpty()) {
                    listLike(sb, key, fqn, cache);
                }
            }
        }
        return sb;
    }
    
    private int removelike(Set<String> s, String parent, TreeCacheMBean cache) throws CacheException {
        String kid;
        String fqn;
        int ret = 0;
        for (Object child : cache.getChildrenNames(parent)) {
            kid = (String) child;
            fqn = parent + "/" + kid;
            boolean found = false;
            for (String key : s) {
                if (kid.indexOf(key) >= 0) {
                    cache.remove(fqn);
                    ret++;
                    found = true;
                }
            }
            if (!found) {
                Set kids = cache.getChildrenNames(fqn);
                if (kids != null && !kids.isEmpty()) {
                    ret += removelike(s, fqn, cache);
                }

            }
        }
        return ret;
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

    public int size(String fqn) {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));
            int size = 0;
            Set kids = cache.getChildrenNames(fqn);
            if (kids != null) {
                //search them
                for (Object kid : kids) {
                    size += size(fqn + Fqn.SEPARATOR + (String) kid);
                }
            } else {
                Set s = cache.getKeys(fqn);
                if (s != null) {
                    size += cache.getKeys(fqn).size();
                }
            }
            return size;
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException(e);
        } finally {
            TCContext.close(ctx);
        }
    }

    public String sizeOverview() {
        InitialContext ctx = null;
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            TreeCacheMBean cache = (TreeCacheMBean) ctx.lookup(b.getProperty("jndi_name"));
            Set kids = cache.getChildrenNames("/");
            StringBuilder sb = new StringBuilder(100);
            for (Object kid : kids) {
                sb.append(kid).append(": ").append(size("/" + kid)).append("    ");
            }
            return sb.toString();
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CacheException e) {
            throw new RuntimeException(e);
        } finally {
            TCContext.close(ctx);
        }
    }


    public String getName() {
        return "JBoss Cache Admin";
    }
}
