package com.topcoder.web.common;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import junit.framework.TestCase;
import org.jboss.cache.CacheException;
import org.jboss.cache.TreeCacheMBean;
import org.jboss.cache.Fqn;

import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 30, 2007
 */
public class CacheTestCase extends TestCase {
    private static final Logger log = Logger.getLogger(CacheTestCase.class);

    public void testLookup() throws NamingException {
        InitialContext ctx=null;
        try {
            ctx = TCContext.getInitial();
            TreeCacheMBean cache = (TreeCacheMBean)ctx.lookup("TCCache");
            assertTrue("could not find cache in jndi", cache!=null);


        } finally {
            TCContext.close(ctx);
        }
    }

    public void testPutAndGet() throws NamingException, CacheException {
        InitialContext ctx=null;
        try {
            log.debug("before getting context");
            ctx = TCContext.getInitial();
            log.debug("after getting context");
            TreeCacheMBean  cache = (TreeCacheMBean)ctx.lookup("TCCache");
            log.debug("after lookup");
            Fqn f = new Fqn();
            log.debug("before put");
            cache.put(f, "crumb", "ball");
            log.debug("after put");
            assertTrue("could not find our object", "ball".equals(cache.get(f,"crumb")));


        } finally {
            TCContext.close(ctx);
        }
    }

    public void testLotsOfPuts() throws NamingException, CacheException {
        InitialContext ctx=null;
        try {
            log.debug("before getting context");
            ctx = TCContext.getInitial();
            log.debug("after getting context");
            TreeCacheMBean cache = (TreeCacheMBean)ctx.lookup("TCCache");
            log.debug("after lookup");
            Fqn f = new Fqn();
            long start = System.currentTimeMillis();
            long end = start+1000*10;
            int i=0;
            while (System.currentTimeMillis()<end) {
                cache.put(f, "crumb"+i, "ball"+i);
                i++;
            }

            log.debug("nodes : " + cache.getKeys(f).size()+ " i " + i);

            assertTrue("didn't put much stuff in the cache", cache.getKeys(f).size()>10);


        } finally {
            TCContext.close(ctx);
        }
    }


}
