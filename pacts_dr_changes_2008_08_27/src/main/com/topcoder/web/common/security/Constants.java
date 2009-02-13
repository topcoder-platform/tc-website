package com.topcoder.web.common.security;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Houses a convenience method for getting EJB interfaces.
 * Package scope is deliberate.
 *
 * @author Ambrose Feinstein
 */
public class Constants {

    private static Logger log = Logger.getLogger(Constants.class);

    /**
     * Just some random junk no one else knows.  Should really come from a config file.
     */
    static final String hash_secret = "GKDKJF80dbdc541fe829898aa01d9e30118bab5d6b9fe94fd052a40069385f5628";

    /**
     * Get a remote instance of the specified EJB.
     * Assumes the home class will have the same name plus "Home".
     *
     * @param remoteclass The class of the interface which should be returned.
     * @throws NamingException if we can't find the get context
     * @throws Exception       if something goes wrong when creating or calling
     *                         the method on the ejb.
     */
    public static Object createEJB(Class remoteclass) throws NamingException, Exception {

        /* create the context anew each time in case the JNDI provider is restarted. */
        InitialContext ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            return BaseProcessor.createEJB(ctx, remoteclass);
        } finally {
            TCContext.close(ctx);
        }

    }


    /**
     * Get a local instance of the specified EJB.
     * Assumes the home class will have the same name plus "Home".
     *
     * @param localclass
     * @return the ejb
     * @throws NamingException
     * @throws Exception
     */
    public static Object createLocalEJB(Class localclass) throws NamingException, NoSuchMethodException, InvocationTargetException, IllegalAccessException {

        /* create the context anew each time in case the JNDI provider is restarted. */
        InitialContext ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            Object home = ctx.lookup("java:/" + localclass.getName() + "Home");
            Method createmethod = PortableRemoteObject.narrow(home,
                    home.getClass()).getClass().getMethod("create", null);
            return createmethod.invoke(home, null);

        } finally {
            TCContext.close(ctx);
        }

    }


}
