package com.topcoder.utilities;

import java.lang.reflect.InvocationTargetException;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.web.common.cache.CacheClient;
import com.topcoder.web.common.cache.JbossCacheClient;
import com.topcoder.web.common.cache.TCCacheException;

public class ClearCache {

    /**
     * @param args
     */
    public static void main(String[] args) {
        InitialContext ctx = null;        
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            //using reflection so that we don't a lot of nasty dependencies when using the class.
            CacheClient cache = (CacheClient) ctx.lookup(b.getProperty("jndi_name"));

            cache.clearCache();
            
            System.out.println("1. cleared");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            TCContext.close(ctx);
        }

        try {
            JbossCacheClient cache = new JbossCacheClient();
            cache.set("test", "hi");
            int size = cache.getKeys().size();
            cache.clearCache();
            
            System.out.println("cleared " + size + " elements");
        } catch (TCCacheException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
