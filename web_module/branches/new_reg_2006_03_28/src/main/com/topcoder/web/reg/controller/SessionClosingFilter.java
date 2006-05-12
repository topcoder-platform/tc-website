package com.topcoder.web.reg.controller;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.*;
import java.io.IOException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 4, 2006
 */
public class SessionClosingFilter implements Filter {
    protected static final Logger log = Logger.getLogger(SessionClosingFilter.class);

    public void init(FilterConfig filterConfig) {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request,
                         ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

            chain.doFilter(request, response);
    }



}
