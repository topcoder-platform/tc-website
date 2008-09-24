package com.topcoder.web.studio.util;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;

import com.topcoder.service.studio.StudioService;
import com.topcoder.shared.util.logging.Logger;

/**
 * Locator for Studio services
 */
public class StudioServiceLocator {
	
    private static StudioService service = null;
    private static Logger log = Logger.getLogger(StudioServiceLocator.class);
    
    public static StudioService getService() {
        return service == null ? createService() : service;
    }
    
    private static StudioService createService() {
		try {
			Properties env = new Properties();
			env.setProperty(Context.INITIAL_CONTEXT_FACTORY, ApplicationServer.STUDIO_SERVICES_CONTEXT_FACTORY);
			env.setProperty(Context.PROVIDER_URL, ApplicationServer.STUDIO_SERVICES_PROVIDER_URL);
			env.setProperty(Context.URL_PKG_PREFIXES, ApplicationServer.STUDIO_SERVICES_PKG_PREFIXES);
			env.setProperty(Context.SECURITY_CREDENTIALS, ApplicationServer.STUDIO_SERVICES_PASSWORD);
			env.setProperty(Context.SECURITY_PRINCIPAL, ApplicationServer.STUDIO_SERVICES_USERNAME);
			env.setProperty(Context.SECURITY_PROTOCOL, ApplicationServer.STUDIO_SERVICES_PROTOCOL);
	
			final String jndiName = ApplicationServer.STUDIO_SERVICES_JNDI_NAME;
			
			Context ctx = new InitialContext(env);
			log.debug("About to look up jndi name " + jndiName);
			Object obj = ctx.lookup(jndiName);
			log.debug("Lookup returned " + obj);
			
			service = (StudioService) obj;
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
		return service;
    }
		
 }

