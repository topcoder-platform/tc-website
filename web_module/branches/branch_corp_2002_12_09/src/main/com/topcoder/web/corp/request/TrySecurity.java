package com.topcoder.web.corp.request;

import java.util.Iterator;

import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.web.common.AppContext;
import com.topcoder.web.corp.stub.PersistStore;

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
        nextPage = "/index.jsp";
    }

    /**
     * nothing useful - just trying to get remote PrincipalManager
     * always go to error page to see was any exception here or not 
     * 
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
//        Iterator i = PersistStore.getInstance(null).userList();
//        while( i.hasNext() ) {
//            System.err.println("------"+i.next()+"-------");
//        }
        PrincipalMgrRemote remotePrincipalMgr = AppContext.getInstance().getRemotePrincipalManager();
        log.debug("--- remote principal manager instantiated");
        UserPrincipal user = remotePrincipalMgr.getUser(132456);
        log.debug("--- UserPrincipal instantiated");
        throw new Exception("debug exception - successfully passed");
    }
}