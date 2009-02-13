package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 4, 2006
 */
public class GZIPResponseFilter implements Filter {
    private static final Logger log = Logger.getLogger(GZIPResponseFilter.class);

    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {
        if (req instanceof HttpServletRequest) {
            HttpServletRequest request = (HttpServletRequest) req;
            HttpServletResponse response = (HttpServletResponse) res;
            String ae = request.getHeader("accept-encoding");
            if (ae != null && ae.indexOf("gzip") != -1 && "text/html".equalsIgnoreCase(request.getContentType())) {
                if (log.isDebugEnabled()) {
                    log.debug("GZIP supported, compressing.");
                }
                GZIPResponseWrapper wrappedResponse =
                        new GZIPResponseWrapper(response);
                chain.doFilter(req, wrappedResponse);
                wrappedResponse.finishResponse();
                return;
            }
            chain.doFilter(req, res);
        }
    }

    public void init(FilterConfig filterConfig) {
    }

    public void destroy() {
    }

}


