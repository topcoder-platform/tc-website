package com.topcoder.web.tc.controller.request.util;

import java.util.ArrayList;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;

public class CSDN07SubmitRegistration extends CSDN07RegistrationBase {

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        log.debug("alreadyRegisteredProcessing"); // nothing to do here?
        getRequest().setAttribute("registered", Boolean.TRUE);
    }


    protected void regProcessing(Event event, User user) {
        log.debug("regProcessing"); 
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        user.addEventRegistration(event, new ArrayList(), Boolean.TRUE);
        userDAO.saveOrUpdate(user);
        refreshCache(event);
        getRequest().setAttribute("registered", Boolean.TRUE);        
    }

    private void refreshCache(Event e) {
        try {
            CacheClient cc = CacheClientFactory.createCacheClient();
            Request r = new Request();
            log.debug("removing " + e.getShortDescription() + "_registrants" + " from cache.");
            r.setContentHandle(e.getShortDescription() + "_registrants");
            cc.remove(r.getCacheKey());
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }

}
