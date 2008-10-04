package com.topcoder.web.studio.util;

import com.topcoder.shared.util.TCResourceBundle;

/**
 * <p>
 * Parameters for Studio services located in Cockpit application server.<br>
 * Values are provided by ApplicationServer.properties file located in the classpath.
 * </p>
 *
 * @author TCSDEVELOPER
 */
public class ApplicationServer {
	
	private static TCResourceBundle bundle = new TCResourceBundle("ApplicationServer");
	
    public static final String STUDIO_SERVICES_PROVIDER_URL = bundle.getProperty("STUDIO_SERVICES_PROVIDER_URL", "jnp://127.0.0.1:1399");
    public static final String STUDIO_SERVICES_USERNAME = bundle.getProperty("STUDIO_SERVICES_USERNAME", "user");
    public static final String STUDIO_SERVICES_PASSWORD = bundle.getProperty("STUDIO_SERVICES_PASSWORD", "password");
    public static final String STUDIO_SERVICES_PROTOCOL = bundle.getProperty("STUDIO_SERVICES_PROTOCOL", "172.16.20.20");
    public static final String STUDIO_SERVICES_CONTEXT_FACTORY = bundle.getProperty("STUDIO_SERVICES_CONTEXT_FACTORY", "org.jboss.security.jndi.LoginInitialContextFactory"); 
    public static final String STUDIO_SERVICES_PKG_PREFIXES = bundle.getProperty("STUDIO_SERVICES_PKG_PREFIXES", "org.jboss.naming:org.jnp.interfaces");
    public static final String STUDIO_SERVICES_JNDI_NAME = bundle.getProperty("STUDIO_SERVICES_JNDI_NAME", "StudioServiceBean/remote");

	@Override
	public String toString() {
		String retVal = "";
		retVal += "STUDIO_SERVICES_PROVIDER_URL: " + STUDIO_SERVICES_PROVIDER_URL;
		retVal += "\nSTUDIO_SERVICES_USERNAME: " + STUDIO_SERVICES_USERNAME;
		retVal += "\nSTUDIO_SERVICES_PASSWORD: " + "********** (not shown)";
		retVal += "\nSTUDIO_SERVICES_PROTOCOL: " + STUDIO_SERVICES_PROTOCOL;
		retVal += "\nSTUDIO_SERVICES_CONTEXT_FACTORY: " + STUDIO_SERVICES_CONTEXT_FACTORY;
		retVal += "\nSTUDIO_SERVICES_PKG_PREFIXES: " + STUDIO_SERVICES_PKG_PREFIXES;
		retVal += "\nSTUDIO_SERVICES_JNDI_NAME: " + STUDIO_SERVICES_JNDI_NAME;
		return retVal;
	}

    

}
