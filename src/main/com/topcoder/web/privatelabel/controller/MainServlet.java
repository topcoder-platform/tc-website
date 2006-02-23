package com.topcoder.web.privatelabel.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.RegistrationBase;

import java.util.MissingResourceException;
import java.util.Set;

/**
 *
 * @author gpaul 06.26.2003
 */
public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        long companyId = Long.parseLong(request.getParameter(Constants.COMPANY_ID));
        String db=null;
        try {
            db = RegistrationBase.getCompanyDb(companyId, Constants.TRANSACTIONAL);
        } catch (Exception e) {
            log.warn("no db found for company " + companyId);
        }
        if (db==null) {
            return new BasicAuthentication(new SessionPersistor(request.getSession()),
                    request, response, BasicAuthentication.PRIVATE_LABEL_SITE);
        } else {
            return new BasicAuthentication(new SessionPersistor(request.getSession()),
                    request, response, BasicAuthentication.PRIVATE_LABEL_SITE, db);
        }
    }

    protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        CoderSessionInfo ret = new CoderSessionInfo(request, auth, groups);
        return ret;
    }


    protected String getProcessor(String key) {
        String ret = super.getProcessor(key);
        if (ret.equals(key)) {
            //yuck, gonna throw errors all over the place
            TCResourceBundle bundle = new TCResourceBundle("PrivateLabel");
            try {
                ret = bundle.getProperty(key);
            } catch (MissingResourceException ignore) {
                //just return what we got
            }
        }
        return ret;
    }

}