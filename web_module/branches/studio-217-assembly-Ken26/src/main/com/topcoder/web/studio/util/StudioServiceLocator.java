package com.topcoder.web.studio.util;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.service.studio.StudioService;
import com.topcoder.shared.util.logging.Logger;

/**
 * Locator for Studio services
 */
public class StudioServiceLocator {
	
    private static Logger log = Logger.getLogger(StudioServiceLocator.class);
    
    public static StudioService getService() throws NamingException {
    	Properties env = new Properties();
		env.setProperty(Context.INITIAL_CONTEXT_FACTORY, ApplicationServer.STUDIO_SERVICES_CONTEXT_FACTORY);
		env.setProperty(Context.PROVIDER_URL, ApplicationServer.STUDIO_SERVICES_PROVIDER_URL);
		env.setProperty(Context.URL_PKG_PREFIXES, ApplicationServer.STUDIO_SERVICES_PKG_PREFIXES);
		env.setProperty(Context.SECURITY_CREDENTIALS, ApplicationServer.STUDIO_SERVICES_PASSWORD);
		env.setProperty(Context.SECURITY_PRINCIPAL, ApplicationServer.STUDIO_SERVICES_USERNAME);
		env.setProperty(Context.SECURITY_PROTOCOL, ApplicationServer.STUDIO_SERVICES_PROTOCOL);
		Context ctx = new InitialContext(env);
    	try {
			final String jndiName = ApplicationServer.STUDIO_SERVICES_JNDI_NAME;
			log.debug("About to look up jndi name " + jndiName);
			Object obj = ctx.lookup(jndiName);
			log.debug("Lookup returned " + obj);
			return (StudioService) obj;
    	} finally {
			ctx.close();
    	}
    }
 }

