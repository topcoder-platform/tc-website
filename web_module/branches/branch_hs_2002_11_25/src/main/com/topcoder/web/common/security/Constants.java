package com.topcoder.web.common.security;

import java.lang.reflect.*;
import javax.naming.*;
import com.topcoder.shared.util.*;

/**
 * Houses a convenience method for getting EJB interfaces.
 *
 * @author Ambrose Feinstein
 */
public class Constants {

    /**
     * Get a remote instance of the specified EJB.
     * Assumes the home class will have the same name plus "Home".
     *
     * Package scope is deliberate.
     *
     * @param remoteclass The class of the interface which should be returned.
     */
    static Object createEJB(Class remoteclass) throws Exception {

        /* create the context anew each time in case the JNDI provider is restarted. */
        Context ctx = TCContext.getContext(ApplicationServer.JBOSS_JNDI_FACTORY, ApplicationServer.SECURITY_HOST);

        Class remotehomeclass = Class.forName(remoteclass.getName()+"Home");
        String refname = (String)remotehomeclass.getField("EJB_REF_NAME").get(null);
        Object remotehome = ctx.lookup(refname);
        Method createmethod = remotehome.getClass().getMethod("create", null);
        return createmethod.invoke(remotehome, null);
    }
}
