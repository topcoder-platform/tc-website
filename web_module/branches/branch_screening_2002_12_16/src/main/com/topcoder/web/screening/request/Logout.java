package com.topcoder.web.screening.request;

import javax.servlet.http.*;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;

/**
 * Processes a logout request.
 * @author  Porgery
 */
public class Logout extends BaseProcessor {
    
    /** Creates a new instance of Logout */
    public Logout() {
    }
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        HttpServletRequest request = (HttpServletRequest)getRequest();
        HttpSession session = request.getSession();
        Persistor persistor = new SessionPersistor(session);
        
        BasicAuthentication auth = 
            new BasicAuthentication(persistor,request,getResponse());
        auth.logout();
        
        setNextPage("/");
        setNextPageInContext(false);
    }
    
}
