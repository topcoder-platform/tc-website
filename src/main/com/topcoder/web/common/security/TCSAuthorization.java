package com.topcoder.web.common.security;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.PolicyRemoteHome;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

/**
 * This will be using the TopCoder Software security component to determine if a
 * particular user has access to a particular resource.  This can be done using
 * com.topcoder.security.policy and passing it the TCSubject associated with
 * this object and a TCPermission object that can be created using the Resource
 * object passed in to the hasPermission() method.
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TCSAuthorization implements Authorization {
    protected static final Logger log = Logger.getLogger(
        TCSAuthorization.class
    );
    
    private TCSubject tcUser;

    /**
     * Creates Authorization token for given user.
     * 
     * @param user
     */    
    public TCSAuthorization(TCSubject user) {
        tcUser = user;
    } 
    
    /**
     * There will be TCSAuthorization token for every user, so this method will
     * return true if user to which this Authorization belongs to, has
     * permission to given resource.
     * 
     * @see com.topcoder.shared.security.Authorization#hasPermission(com.topcoder.shared.security.Resource)
     */
    public boolean hasPermission(Resource rc) throws Exception {
        InitialContext ic = null;
        try {
            ic = (InitialContext)TCContext.getContext(
                ApplicationServer.SECURITY_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_PROVIDER_URL
            );
            PolicyRemoteHome pHome;
            pHome = (PolicyRemoteHome)ic.lookup(PolicyRemoteHome.EJB_REF_NAME);
            
            PolicyRemote policy = pHome.create();
            return policy.checkPermission(
                tcUser, 
                new GenericPermission(rc.getName())
            );
        }
        // catches are there with only goal - to show what exceptions 
        // are expected from underlying software
        catch(NamingException ne) {
            throw ne;
        }
        catch(GeneralSecurityException gse) {
            throw gse;
        }
        catch(CreateException ce) {
            throw ce;
        }
        catch(RemoteException re) {
            throw re;
        }
        finally {
            closeIC(ic);
        }
    }

    /**
     * Just closes initial context with care
     * @param ic
     */
    private static void closeIC(InitialContext ic) {
        if( ic == null ) return;
        try {
            ic.close();
        }
        catch(Exception e) {
            log.error("Can't close initial context "+ic);
        }
    }
}
