package com.topcoder.web.common.cache;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.lang.reflect.UndeclaredThrowableException;
import java.rmi.RemoteException;

/**
 * Borrowed heavily from com.topcoder.shared.ejb.ServiceLocatorSupport
 *
 * @author Diego Belfer (mural), dok
 * @version $Id$
 */

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 1, 2007
 */
public class CacheLocator {
    private static final Logger log = Logger.getLogger(CacheLocator.class);

    /**
     * The jndi name where the home can be found
     */
    private final String jndiName;
    /**
     * The proxy returned to all getService calls.
     */
    private final Object proxiedServices;


    /**
     * Indicates if a new instance of the service must be obtained.
     */
    private volatile boolean mustReload = true;

    /**
     * The real service where to delegate calls.
     */
    private Object services;

    /**
     * The initial context URL
     */
    private String contextURL;

    /**
     * Creates a new Service locator.
     *
     * @param aClass     The interface class of the Service
     * @param jndiName   The jndi name where to find the Home
     * @param contextURL The initial context URL.
     */
    public CacheLocator(Class aClass, String jndiName, String contextURL) {
        this.jndiName = jndiName;
        this.contextURL = contextURL;
        this.proxiedServices = Proxy.newProxyInstance(
                aClass.getClassLoader(),
                new Class[]{aClass}, new ServiceFailureDetection());

    }

    /**
     * Returns the service instance.
     *
     * @return The service
     * @throws javax.naming.NamingException if there is a problem with the lookup
     */
    public Object getService() throws NamingException {
        checkServiceLoaded();
        return proxiedServices;
    }

    private void checkServiceLoaded() throws NamingException {
        if (mustReload) {
            createServiceInstance();
        }
    }

    private synchronized void createServiceInstance() throws NamingException {
        if (mustReload) {
            log.info("LOADING CACHE FROM JNDI");
            mustReload = false;
            InitialContext ctx = null;
            try {
                ctx = TCContext.getInitial(contextURL);
                services = ctx.lookup(jndiName);
            } finally {
                TCContext.close(ctx);
            }
        }
    }

    private class ServiceFailureDetection implements InvocationHandler {
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            try {
                try {
                    try {
                        checkServiceLoaded();
                        return method.invoke(services, args);
                    } catch (UndeclaredThrowableException e) {
                        log.debug("we got an UndeclaredThrowableException");
                        throw e.getUndeclaredThrowable();
                    } catch (InvocationTargetException e) {
                        log.debug("we got an InvocationTargetException");
                        throw e.getTargetException();
                    }
                } catch (UndeclaredThrowableException e) {
                    log.debug("we got an UndeclaredThrowableException");
                    throw e.getUndeclaredThrowable();
                } catch (InvocationTargetException e) {
                    log.debug("we got an InvocationTargetException");
                    throw e.getTargetException();
                }
            } catch (NamingException e) {
                log.debug("we got an InvocationTargetException");
                mustReload = true;
                throw e;
            } catch (RemoteException e) {
                log.debug("we got an InvocationTargetException");
                mustReload = true;
                throw e;
            }
        }
    }

}

