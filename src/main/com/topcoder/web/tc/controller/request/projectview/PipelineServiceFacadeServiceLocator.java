/*
 * Copyright (c) 2001 - 2009 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.projectview;

import java.util.Properties;

import javax.naming.CommunicationException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.service.pipeline.PipelineServiceFacade;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;

/**
 * <p>A simple locator for the Pipeline Service Facade Service EJB</p>
 *
 * @author pulky
 * @version 1.0
 * @since Project View
 */
public class PipelineServiceFacadeServiceLocator {

    /**
     * The logger for this class
     */
    private static Logger log = Logger.getLogger(PipelineServiceFacadeServiceLocator.class);

    /**
     * Retrieves the Pipeline Service Facade service instance
     *
     * @return the Pipeline Service Facade service instance
     *
     * @throws NamingException if any errors occur during lookup
     */
    public static PipelineServiceFacade getServices() throws NamingException {
        Properties env = new Properties();
        env.setProperty(Context.INITIAL_CONTEXT_FACTORY, ApplicationServer.PIPELINE_SERVICE_FACADE_CONTEXT_FACTORY);
        env.setProperty(Context.PROVIDER_URL, ApplicationServer.COCKPIT_PROVIDER_URL);
        env.setProperty(Context.URL_PKG_PREFIXES, ApplicationServer.PIPELINE_SERVICE_FACADE_PKG_PREFIXES);
        env.setProperty(Context.SECURITY_PRINCIPAL, ApplicationServer.PIPELINE_SERVICE_FACADE_USERNAME);
        env.setProperty(Context.SECURITY_CREDENTIALS, ApplicationServer.PIPELINE_SERVICE_FACADE_PASSWORD);
        env.setProperty(Context.SECURITY_PROTOCOL, ApplicationServer.PIPELINE_SERVICE_FACADE_PROTOCOL);
        Context ctx = new InitialContext(env);

        Object obj;
        try {
            log.debug("About to look up jndi name " + ApplicationServer.PIPELINE_SERVICE_FACADE_JNDI_NAME);
            obj = ctx.lookup(ApplicationServer.PIPELINE_SERVICE_FACADE_JNDI_NAME);
            log.debug("Lookup returned " + obj);
        } catch (CommunicationException e) {
            log.warn("Received a CommunicationException.: "  + e.getMessage() + "Retrying...");
            ctx = new InitialContext(env);
            log.debug("About to look up jndi name " + ApplicationServer.PIPELINE_SERVICE_FACADE_JNDI_NAME);
            obj = ctx.lookup(ApplicationServer.PIPELINE_SERVICE_FACADE_JNDI_NAME);
            log.debug("Lookup returned " + obj);
        } finally {
            ctx.close();
        }

        return (PipelineServiceFacade) obj;
    }
}
