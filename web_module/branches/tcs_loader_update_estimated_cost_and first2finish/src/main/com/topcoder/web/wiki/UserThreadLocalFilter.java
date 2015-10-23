package com.topcoder.web.wiki;

import com.atlassian.confluence.user.AuthenticatedUserThreadLocal;
import com.atlassian.user.User;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 25, 2007
 */

/**
 * Makes sure the current user is always in the AuthenticatedUserThreadLocal at the beginning of a request, and is cleared
 * at the end.
 * <p/>
 * Obviously, this filter can only be run after Seraph gets its grubby little paws on the request.
 */
public class UserThreadLocalFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        boolean alreadyFiltered = false;
        try {
            if (servletRequest instanceof HttpServletRequest) {
                User user = getUserFromRequest((HttpServletRequest) servletRequest);
                User existingUser = AuthenticatedUserThreadLocal.getUser();

                if (existingUser != null && existingUser.equals(user))
                    alreadyFiltered = true;

                AuthenticatedUserThreadLocal.setUser(user);
            }

            filterChain.doFilter(servletRequest, servletResponse);
        }
        finally {
            if (!alreadyFiltered)
                AuthenticatedUserThreadLocal.setUser(null);
        }
    }

    public void destroy() {
    }

    private User getUserFromRequest(HttpServletRequest servletRequest) {
        try {
            return (User) new TCAuthenticator().getUser(servletRequest, null);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
