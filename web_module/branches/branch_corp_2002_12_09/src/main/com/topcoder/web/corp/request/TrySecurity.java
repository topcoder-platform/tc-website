package com.topcoder.web.corp.request;

import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.web.common.AppContext;

/**
 * 
 * Just testing RMI-IIOP
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TrySecurity extends BaseProcessor { 
    
    public TrySecurity() {
        pageInContext = true; // Static pages in same contect.
        nextPage = "/error.jsp";
    }

    /**
     * nothing useful - just trying to get remote PrincipalManager
     * always go to error page to see was any exception here or not 
     * 
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        PrincipalMgrRemote remotePrincipalMgr = AppContext.getInstance().getRemotePrincipalManager();
        UserPrincipal user = remotePrincipalMgr.getUser(132456);
        throw new Exception("debug exception");
    }
}