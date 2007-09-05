package com.topcoder.utilities;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.naming.InitialContext;

import org.jboss.cache.Fqn;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCResourceBundle;

public class ClearCache {

    /**
     * @param args
     */
    public static void main(String[] args) {
        InitialContext ctx = null;        
        TCResourceBundle b = new TCResourceBundle("cache");
        try {
            ctx = TCContext.getInitial(b.getProperty("host_url"));
            Object o = ctx.lookup(b.getProperty("jndi_name"));
           remove(Fqn.ROOT.getName(), o);

           System.out.println("cleared!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            TCContext.close(ctx);
        }

    }
    
    private static Method remove = null;
    private static void remove(String s, Object cache) throws IllegalAccessException, InvocationTargetException {
        if (remove==null) {
            Method[] methods = cache.getClass().getDeclaredMethods();
            for (Method m : methods) {
                if ("remove".equals(m.getName()) &&
                        m.getParameterTypes().length == 1 &&
                        m.getParameterTypes()[0].equals(String.class)) {
                    remove = m;
                    break;
                }
            }
        }
        if (remove==null) {
            throw new RuntimeException("Couldn't find getChildrenNames(String) method");
        } else {
            remove.invoke(cache, s);
        }
    }


}
