/*
 * Copyright (C) 2005-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.studio.util.SubmissionUploadProgressTracker;
import com.topcoder.web.studio.util.SubmissionUploadRequestParser;
import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.MissingResourceException;

/**
 * <p>A main servlet for <code>Studio</code> web site.</p>
 * <p>
 * Version 1.1 (Replatforming Studio Release 5) change notes:
 * <ol>
 *   <li>Override {@link #hasPermission(WebAuthentication, Resource)} method in order to not checking resource permission
 *   for studio site.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Upload Progress Bar Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Overridden {@link #createRequest(HttpServletRequest)} method.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, isv
 * @version 1.2
 */
public class StudioServlet extends BaseServlet {
    private static final Logger log = Logger.getLogger(StudioServlet.class);

    static {
        throttleEnabled = false;
    }

/*
    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response,
                BasicAuthentication.STUDIO_SITE);
    }
*/

    protected String getProcessor(String key) {
        String ret = super.getProcessor(key);
        if (ret.equals(key)) {
            //yuck, gonna throw errors all over the place
            TCResourceBundle bundle = new TCResourceBundle("Studio");
            try {
                ret = bundle.getProperty(key);
            } catch (MissingResourceException ignore) {
                //just return what we got
            }
        }
        return ret;
    }


    protected void handleException(HttpServletRequest request, HttpServletResponse response, Throwable e)
            throws Exception {
        log.error("caught exception, forwarding to error page", e);
        if (e instanceof PermissionException) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            request.setAttribute(MESSAGE_KEY, "Sorry, you do not have permission to access the specified resource.  Please confirm that you are a member of TopCoder Studio.");
        } else if (e instanceof NavigationException) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            request.setAttribute(MESSAGE_KEY, e.getMessage());
            if (((NavigationException) e).hasUrl())
                request.setAttribute(URL_KEY, ((NavigationException) e).getUrl());
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            request.setAttribute(MESSAGE_KEY, "An error has occurred when attempting to process your request.");
        }
        request.setAttribute("exception", e);
        fetchRegularPage(request, response, ERROR_PAGE, true);
    }

    /**
     * Checks whether the user has permission to access the resource.
     * 
     * @param auth the authentication object
     * @param r the resource
     * @return true always
     */
    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    /**
     * <p>Creates the wrapper around the specified incoming request from the client.</p>
     * 
     * @param request an <code>HttpServletRequest</code> representing incoming request. 
     * @return a <code>TCRequest</code> wrapping the specified request.
     * @since 1.1
     */
    protected TCRequest createRequest(HttpServletRequest request) {
        String contentType = request.getContentType();
        if (contentType == null || !contentType.toLowerCase().startsWith("multipart/form-data")) {
            return HttpObjectFactory.createRequest(request, null);
        } else {
            return HttpObjectFactory.createRequest(request, 
                                                   new SubmissionUploadRequestParser(
                                                       new SubmissionUploadProgressTracker(request)));
        }
    }
}
