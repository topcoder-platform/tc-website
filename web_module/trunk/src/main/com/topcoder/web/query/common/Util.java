package com.topcoder.web.query.common;

import javax.naming.NamingException;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.lang.reflect.Method;

public class Util {

    /**
     * Get a remote instance of the specified EJB.
     * Assumes the home class will have the same name plus "Home".
     *
     * @param ctx the IntialContext to use on the lookup
     * @param remoteclass The class of the interface which should be returned.
     * @throws NamingException if we can't find the get context
     * @throws Exception if something goes wrong when creating or calling
     * the method on the ejb.
     *
     */
    public static Object createEJB(InitialContext ctx, Class remoteclass) throws NamingException, Exception {
        Object remotehome = ctx.lookup(remoteclass.getName() + "Home");
        Method createmethod = remotehome.getClass().getMethod("create", null);
        return createmethod.invoke(remotehome, null);
    }
}
