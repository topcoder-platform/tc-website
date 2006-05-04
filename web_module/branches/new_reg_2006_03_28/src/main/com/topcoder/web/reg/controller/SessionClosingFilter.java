package com.topcoder.web.reg.controller;

import com.topcoder.web.reg.HibernateUtils;

import javax.servlet.*;
import java.io.IOException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 4, 2006
 */
public class SessionClosingFilter implements Filter {
   private FilterConfig filterConfig = null;
   public void init(FilterConfig filterConfig)
      throws ServletException {
      this.filterConfig = filterConfig;
   }
   public void destroy() {
      this.filterConfig = null;
   }
   public void doFilter(ServletRequest request,
                        ServletResponse response, FilterChain chain)
      throws IOException, ServletException {

        HibernateUtils.closeSession();


   }
}