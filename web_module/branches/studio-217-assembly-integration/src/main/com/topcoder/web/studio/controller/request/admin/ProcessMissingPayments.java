package com.topcoder.web.studio.controller.request.admin;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;

import com.topcoder.service.studio.StudioService;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;

/**
 * @author aisacovich
 * @version $Revision
 */
public class ProcessMissingPayments extends Base {

    protected void dbProcessing() throws Exception {
        Long contestId;

        try {
            contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Contest Specified");
        }

        final Properties p = new Properties();
        p.setProperty(Context.SECURITY_PRINCIPAL, ApplicationServer.STUDIO_SERVICES_USERNAME);
        p.setProperty(Context.SECURITY_CREDENTIALS, ApplicationServer.STUDIO_SERVICES_PASSWORD);
        p.setProperty(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.security.jndi.JndiLoginInitialContextFactory");
        p.setProperty(Context.PROVIDER_URL, ApplicationServer.STUDIO_SERVICES_PROVIDER_URL);
        p.setProperty(Context.SECURITY_PROTOCOL, "cockpitDomain");
        // get context to Cockpit Jboss Instance.
        Context context = new InitialContext(p);
        if (log.isDebugEnabled()) {
            log.debug("got context");
        }
        Object ref = context.lookup("StudioServiceBean/remote");
        StudioService studioService = (StudioService)javax.rmi.PortableRemoteObject.narrow(ref,StudioService.class);
        if (log.isDebugEnabled()) {
            log.debug("got remote StudioServiceBean");
        }
        
        studioService.processMissingPayments(contestId);

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=ViewSubmissions&" + Constants.CONTEST_ID + "=" + contestId);
        setIsNextPageInContext(false);
    }
}
