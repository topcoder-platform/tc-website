package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.service.studio.StudioService;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Properties;
import java.util.HashSet;

import com.topcoder.shared.util.dwload.CacheClearer;

import javax.security.auth.login.LoginContext;
import javax.security.auth.callback.*;
import java.io.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class AddSubmissionPrize extends Base /*extends SubmissionPrizeBase*/ {

	public class CockpitLoginCallBackHandler implements CallbackHandler{

		public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException {
			System.out.println("in CockpitLoginCallBackHandler.handle ");
			for(int i = 0; i < callbacks.length; ++i){
				if(callbacks[i] instanceof NameCallback){
					NameCallback nc = (NameCallback) callbacks[i];
					nc.setName(ApplicationServer.STUDIO_SERVICES_USERNAME);
				}
				if(callbacks[i] instanceof PasswordCallback){
					PasswordCallback pc = (PasswordCallback) callbacks[i];
					pc.setPassword(ApplicationServer.STUDIO_SERVICES_PASSWORD.toCharArray());
				}
			}
			
		}
	}

    @Override
    protected void dbProcessing() throws Exception {
        // submission id, that will retrieved from request
        Long submissionId;
        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        // prize id, that will retrieved from request
        Long prizeId;
        if (!"".equals(StringUtils.checkNull(getRequest().getParameter(Constants.PRIZE_ID)))) {
            try {
                prizeId = new Long(getRequest().getParameter(Constants.PRIZE_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid prize Specified");
            }
        } else {
            throw new NavigationException("Invalid prize Specified");
        }
        if (log.isDebugEnabled()) {
            log.debug("submission id: " + submissionId + " got prize: " + prizeId);
        }

 	 java.lang.System.setProperty("java.security.auth.login.config", "auth.conf");
	 LoginContext lc = new LoginContext("default", new CockpitLoginCallBackHandler());
 	 lc.login();
        if (log.isDebugEnabled()) {
            	 log.debug("logged in");
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
        studioService.setSubmissionPlacement(submissionId, prizeId);

        try {
            HashSet<String> cachedStuff = new HashSet<String>();
            cachedStuff.add(Constants.CONTEST_ID + "=" + getRequest().getParameter(Constants.CONTEST_ID));
            cachedStuff.add("studio_home_data");
            CacheClearer.removelike(cachedStuff);
        } catch (Exception ignore) {
                ignore.printStackTrace();
        }
        // redirect
        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submissionId);
        setIsNextPageInContext(false);
    }

    /*protected void submissionProcessing(Submission s, Prize p) throws Exception {
       s.addPrize(p);
       //if the prize is a contest prize and we haven't set a contest result placed record for this
       //then set one.  the site uses contest result to show place, so we need to set that up
       //in the case that we're not using online review.
       if (p.getType().getId().equals(PrizeType.CONTEST)) {
           ContestResult cr = s.getResult();
           if (cr == null) {
               cr = new ContestResult(s);
           }
           if (cr.getPlaced() == null) {
               cr.setPlaced(p.getPlace());
           }
       }
   } */
}

