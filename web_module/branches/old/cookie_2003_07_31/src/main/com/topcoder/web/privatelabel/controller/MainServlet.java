package com.topcoder.web.privatelabel.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.Resource;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.InvalidContentTypeException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author gpaul 06.26.2003
 */
public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.initialize(config);

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");
    }

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

}