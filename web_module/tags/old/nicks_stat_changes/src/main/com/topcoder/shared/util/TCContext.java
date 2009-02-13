package com.topcoder.shared.util;

import com.topcoder.shared.util.logging.Logger;

import javax.naming.*;
import java.util.Hashtable;
import java.util.Properties;


/**
 * @author Steve Burrows
 * @version  $Revision$
 */
public class TCContext {

    private static Logger log = Logger.getLogger(TCContext.class);

    /**
     *
     */
    private TCContext() {
    }

    /**
     *
     * @return
     * @throws NamingException
     */
    public static InitialContext getInitial() throws NamingException {
        return getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.HOST_URL);
    }

    /**
     *
     * @param url
     * @return
     * @throws NamingException
     */
    public static InitialContext getInitial(String url) throws NamingException {
        return getContext(ApplicationServer.JNDI_FACTORY, url);
    }

    /**
     *
     * @return
     * @throws NamingException
     */
    public static InitialContext getContestInitial() throws NamingException {
        return getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.CONTEST_HOST_URL);
    }

    /**
     * Instatiates a context specifically for the Pacts Message Queue
     * This doesn't seem to make sense because Sample.properties doesn't seem to work anywhere.
     * @return
     * @throws NamingException
     */
    public static final InitialContext getPactsInitial()
            throws NamingException {
        Hashtable env = new Hashtable();
        try {
            Properties prop = new XProperties();
            java.io.InputStream in = new java.io.FileInputStream("Sample.properties");
            prop.load(in);
            env.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY, prop.getProperty("JNDI_FACTORY"));
            env.put(javax.naming.Context.PROVIDER_URL, prop.getProperty("PACTS_HOST_URL"));
        } catch (java.io.FileNotFoundException exception1) {
            log.error("Error locating properties file for Pacts context");
        } catch (java.io.IOException exception2) {
            log.error("Error reading properties file for Pacts context");
        } catch (java.lang.Exception exception3) {
            log.error("Error getting context for Pacts");
        }
        return new InitialContext(env);
    }

    /**
     *
     * @param initialContextFactory
     * @param providerUrl
     * @return
     * @throws NamingException
     */
    public static InitialContext getContext(String initialContextFactory, String providerUrl) throws NamingException {
        log.debug("get context for " + initialContextFactory + " on " +  providerUrl);
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, initialContextFactory);
        env.put(Context.PROVIDER_URL, providerUrl);
        return new InitialContext(env);
    }

}

