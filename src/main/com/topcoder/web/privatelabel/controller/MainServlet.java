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

    private FileUpload fu = null;
    private boolean checkedForResume = false;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.initialize(config);

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");
    }

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected String getParameter(HttpServletRequest request, String name) throws Exception {
        log.debug("parameter: " + name);
        String ret = null;
        try {
            String contentType = StringUtils.checkNull(request.getContentType());
            if (contentType.toLowerCase().startsWith("multipart/form-data")) {
                fu = new FileUpload(request, false);
                checkedForResume = true;
                ret = fu.getParameter(name);
            }
        } catch (InvalidContentTypeException ignore) {
            //that's ok, we'll just procede with out
        }
        if (ret==null) {
            ret = request.getParameter(name);
        }
        return ret;
    }

    /**
     * override the callProcess method because we have to pass the FileUpload object to the
     * request processor.   we have to do this here because we can only instantiate the file upload
     * object 1 time, because you can only get an inputstream from the request 1 time
     * @param processorName
     * @param request
     * @param authentication
     * @return
     * @throws Exception
     */
    protected RequestProcessor callProcess(String processorName, HttpServletRequest request,
                                           WebAuthentication authentication) throws Exception {
        RequestProcessor rp = null;

        try {
            if (!checkedForResume) {
                fu = new FileUpload(request, false);
                checkedForResume = true;
            }
        } catch (InvalidContentTypeException ignore) {
            //that's ok, we'll just procede with out
        }

        rp = (RequestProcessor) Class.forName(processorName).newInstance();
        if (processorName.equals(Constants.FULL_REG_CONFIRM)) {
            ((FullRegConfirm)rp).setResume(fu);
        }
        rp.setRequest(request);
        rp.setAuthentication(authentication);
        rp.process();
        return rp;
    }

}