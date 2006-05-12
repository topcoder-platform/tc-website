package com.topcoder.web.reg.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.StaleObjectStateException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 4, 2006
 */
public class SessionClosingFilter implements Filter {
    protected static final Logger log = Logger.getLogger(SessionClosingFilter.class);

    public static final String HIBERNATE_SESSION_KEY = "hibernate_session";
    public static final String END_OF_CONVERSATION_FLAG = "end_of_conversation";

    private FilterConfig config;

    public void init(FilterConfig filterConfig) {
        this.config = filterConfig;
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request,
                         ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        //log.debug("oh yeah, filtering!!!");
/*        try {
            chain.doFilter(request, response);
        } finally {
            HibernateUtils.closeSession();
        }*/

        HttpSession httpSession =
                ((HttpServletRequest) request).getSession();
        Session hibernateSession =
                (Session) httpSession.getAttribute(HIBERNATE_SESSION_KEY);

        try {

/*            if (hibernateSession != null) {
                log.debug("< Continuing conversation");
                ExtendedThreadLocalSessionContext.bind(hibernateSession);
            } else {
                log.debug(">>> New conversation");
            }

            log.debug("Starting a database transaction");
            HibernateUtils.begin();

            // Do the work...
            */
            chain.doFilter(request, response);
/*
            // End or continue the long-running conversation?
            if (request.getAttribute(END_OF_CONVERSATION_FLAG) != null) {

                log.debug("Flushing Session");
                HibernateUtils.getSession().flush();

                log.debug("Committing the database transaction");
                HibernateUtils.commit();

                log.debug("Closing and unbinding Session from thread");
                HibernateUtils.getSession().close(); // Unbind is automatic here

                log.debug("Removing Session from HttpSession");
                httpSession.setAttribute(HIBERNATE_SESSION_KEY, null);

                log.debug("<<< End of conversation");

            } else {

                log.debug("Committing database transaction");
                HibernateUtils.commit();

                log.debug("Unbinding Session from thread");
                hibernateSession = ExtendedThreadLocalSessionContext.unbind(HibernateUtils.getFactory());

                log.debug("Storing Session in the HttpSession");
                httpSession.setAttribute(HIBERNATE_SESSION_KEY, hibernateSession);

                log.debug("> Returning to user in conversation");
            }*/

        } catch (StaleObjectStateException staleEx) {
            log.error("This interceptor does not implement optimistic concurrency control!");
            log.error("Your application will not work until you add compensation actions!");
            // Rollback, close everything, possibly compensate for any permanent changes
            // during the conversation, and finally restart business conversation. Maybe
            // give the user of the application a chance to merge some of his work with
            // fresh data... what you do here depends on your applications design.
            throw staleEx;
        } catch (Throwable ex) {
            log.debug("XXXXX got exception in filter");
            //application exceptions should never get this far, they should be handled by the servlet
            try {
                if (HibernateUtils.getSession().getTransaction().isActive()) {
                    log.debug("Trying to rollback database transaction after exception");
                    HibernateUtils.rollback();
                }
            } catch (Throwable rbEx) {
                log.error("Could not rollback transaction after exception!", rbEx);
            } finally {
                log.error("Cleanup after exception!");

                // Cleanup
                log.debug("Closing and unbinding Session from thread");
                HibernateUtils.closeSession(); // Unbind is automatic here

                log.debug("Removing Session from HttpSession");
                httpSession.setAttribute(HIBERNATE_SESSION_KEY, null);

            }

            // Let others handle it... maybe another interceptor for exceptions?
            throw new ServletException(ex);
        }
    }

/*

    protected void handleException(HttpServletRequest request, HttpServletResponse response, Throwable e)
            throws Exception {
        log.error("caught exception, forwarding to error page", e);
        if (e instanceof PermissionException) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            request.setAttribute(BaseServlet.MESSAGE_KEY, "Sorry, you do not have permission to access the specified resource.");
        } else if (e instanceof NavigationException) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            request.setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
            if (((NavigationException) e).hasUrl())
                request.setAttribute(BaseServlet.URL_KEY, ((NavigationException) e).getUrl());
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            request.setAttribute(BaseServlet.MESSAGE_KEY, "An error has occurred when attempting to process your request.");
        }
        request.setAttribute("exception", e);
        //todo don't hardcode errorPage.jsp
        fetchRegularPage(request, response, "/errorPage.jsp", true);
    }

    protected final void fetchRegularPage(HttpServletRequest request, HttpServletResponse response, String dest,
                                          boolean forward) throws Exception {

        if (forward) {
            if (!dest.startsWith("/")) {
                dest = "/" + dest;
            }
            log.debug("forwarding to " + dest);
            config.getServletContext().getRequestDispatcher(response.encodeURL(dest)).forward(request, response);
        } else {
            log.debug("redirecting to " + dest);
            response.sendRedirect(response.encodeRedirectURL(dest));
        }
    }
*/


}
