package com.topcoder.web.common.security;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.naming.NamingException;
import java.lang.reflect.Method;

/**
 * Houses a convenience method for getting EJB interfaces.
 * Package scope is deliberate.
 *
 * @author Ambrose Feinstein
 */
public class Constants {

    private static Logger log = Logger.getLogger(Constants.class);

    /** Just some random junk no one else knows.  Should really come from a config file. */
    static final String hash_secret = "746c80dbdc541fe829898aa01d9e30118bab5d6b9fe94fd052a40069385f5628";

    /**
     * Get a remote instance of the specified EJB.
     * Assumes the home class will have the same name plus "Home".
     *
     * @param remoteclass The class of the interface which should be returned.
     * @throws NamingException if we can't find the get context
     * @throws Exception if something goes wrong when creating or calling
     * the method on the ejb.
     *
     */
    public static Object createEJB(Class remoteclass) throws NamingException, Exception {

        /* create the context anew each time in case the JNDI provider is restarted. */
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            Class remotehomeclass = Class.forName(remoteclass.getName() + "Home");
            String refname = (String) remotehomeclass.getField("EJB_REF_NAME").get(null);
            Object remotehome = ctx.lookup(refname);
            Method createmethod = remotehome.getClass().getMethod("create", null);
            return createmethod.invoke(remotehome, null);
        } finally {
            TCContext.close(ctx);
        }

    }
}
