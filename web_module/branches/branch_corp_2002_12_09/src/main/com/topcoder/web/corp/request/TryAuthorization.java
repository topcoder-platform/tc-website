package com.topcoder.web.corp.request;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.TCESAuthorization;
import com.topcoder.web.corp.Util;

/**
 *  Just tries instantiate Authorization token for connected user
 *  
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TryAuthorization extends BaseProcessor {

    /**
     * Just logs all permissions for given user
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        log.debug("entering TryAuthorization module");
        TCSubject user;
        user = Util.retrieveTCSubject(authToken.getActiveUser().getId());
        TCESAuthorization perm = new TCESAuthorization(user);
        
        String rcName = request.getParameter("rc-name");
        boolean ableTo = perm.hasPermission(new SimpleResource(rcName)); 
        setFormFieldDefault("rc-name", rcName);
        request.setAttribute("perm-value", ""+ableTo);
        pageInContext = true;
        nextPage = "/corp/test-perm.jsp";
        SessionPersistor.getInstance(request.getSession(true)).popLastPage();
        return;
    }
}
