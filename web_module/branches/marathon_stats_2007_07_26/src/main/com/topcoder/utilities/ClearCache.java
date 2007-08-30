package com.topcoder.utilities;

import java.lang.reflect.Method;

import javax.naming.InitialContext;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCResourceBundle;
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
             
            Object o = ctx.lookup(b.getProperty("jndi_name"));

            Method remove = null;
            Method[] methods = o.getClass().getDeclaredMethods();
            for (Method m : methods) {
                System.out.println(m.getName());
                if ("clearCache".equals(m.getName())) {
                    remove = m;
                    break;
                }
            }
            remove.invoke(o);            

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
