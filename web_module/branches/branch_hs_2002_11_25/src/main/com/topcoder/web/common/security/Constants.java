package com.topcoder.web.common.security;

import java.lang.reflect.*;
import java.util.Hashtable;
import javax.naming.*;

/**
 * Houses a convenience method for getting EJB interfaces.
 *
 * @author Ambrose Feinstein
 */
public class Constants {

    static Hashtable env = null;
 
    /**
     * Specify where to find the security component EJB on the network.  Must be called
     * before using {@link #createEJB(java.lang.String)}.
     *
     * @param addr The value to use for PROVIDER_URL when building the naming context.
     */   
    public static void init(String addr) {
        env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
        env.put(Context.PROVIDER_URL, addr);
    }

    /**
     * Get a remote instance of the specified EJB from the context set via {@link #init(java.lang.String)}.
     * Assumes the home class will have the same name plus "Home".
     *
     * Package scope is deliberate.
     *
     * @param remoteclass The class of the interface which should be returned.
     */
    static Object createEJB(Class remoteclass) throws Exception {

        /* create the context anew each time in case the JNDI provider is restarted. */
        InitialContext ctx = new InitialContext(env);

        Class remotehomeclass = Class.forName(remoteclass.getName()+"Home");
        String refname = (String)remotehomeclass.getField("EJB_REF_NAME").get(null);
        Object remotehome = ctx.lookup(refname);
        Method createmethod = remotehome.getClass().getMethod("create", null);
        return createmethod.invoke(remotehome, null);
    }
}
