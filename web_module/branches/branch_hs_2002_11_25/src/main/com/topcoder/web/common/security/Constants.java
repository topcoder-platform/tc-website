package com.topcoder.web.common.security;

import java.lang.reflect.*;
import java.util.Hashtable;
import javax.naming.*;

public class Constants {
    private static InitialContext ctx;

    static {
        try {
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
            env.put(Context.PROVIDER_URL, "172.16.20.40:1099");
            ctx = new InitialContext(env);
        } catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }

    /**
     * Get a remote instance of the named EJB from the default context defined above.
     * Has package scope on purpose.
     */
    static Object createEJB(String cn) {
        Class c = Class.forName(cn);
        Field f = c.getField("EJB_REF_NAME");
        String ern = (String)f.get(null);
        Object rh = context.lookup(ern);
        Method m = rh.getClass().getMethod("create", null);
        return m.invoke(rh, null);
    }
}
