package com.topcoder.web.common.security;

import java.lang.reflect.*;
import java.util.Hashtable;
import javax.naming.*;

public class Constants {

    /**
     * Get a remote instance of the named EJB from the context hardcoded below.
     * We create the context anew each time in case the JNDI provider is restarted.
     * Package scope is deliberate.
     */
    static Object createEJB(Class remoteclass) throws Exception {

        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
        env.put(Context.PROVIDER_URL, "172.16.20.40:1099");
        InitialContext ctx = new InitialContext(env);

        Class remotehomeclass = Class.forName(remoteclass.getName()+"Home");
        String refname = (String)remotehomeclass.getField("EJB_REF_NAME").get(Null);
        Object remotehome = ctx.lookup(refname);
        Method createmethod = remotehome.getClass().getMethod("create", null);
        return createmethod.invoke(rh, null);
    }
}
