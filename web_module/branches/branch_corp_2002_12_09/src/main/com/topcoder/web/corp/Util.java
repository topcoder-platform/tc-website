package com.topcoder.web.corp;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.transaction.SystemException;
import javax.transaction.Transaction;
import javax.transaction.TransactionManager;

import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;


/**
 * Helper class to be used in scope of application   
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Util {
    private static final Logger log = Logger.getLogger(Util.class);
    
    /**
     * Begins new Transaction. To allow an EJB to work in the managed
     * transactional environment they must have &lt;transaction-type&gt;
     * Container&lt; /transaction-type&gt; in deployment descriptor (DD) and,
     * (optionally) have per-method transactions modes set in assembly
     * descriptor of DD.
     * 
     * @return Transaction newly started transaction
     * 
     * @throws NamingException There were some problems when trying to find
     * remote tarnsaction manager
     * @throws SystemException most probably there was failure trying to start
     * transaction in the DB
     */
    public static Transaction beginTransaction()
    throws NamingException, SystemException
    {
        InitialContext ic = null;
        try {
            ic = new InitialContext(Constants.JTA_CONTEXT_ENVIRONMENT);
            TransactionManager tm;
            tm = (TransactionManager)ic.lookup(Constants.JTA_TX_MANAGER);
            ic.close();
            return tm.getTransaction();
        }
        finally {
            closeIC(ic);
        }
    }
    
    /**
     * Just closes initial context with care
     * @param ic
     */
    public static void closeIC(InitialContext ic) {
        if( ic == null ) return;
        try {
            ic.close();
        }
        catch(Exception e) {
            log.error("Can't close initial context "+ic);
        }
    }

    /**
     * Pulls out TCSubject object for given user from DB
     *
     * @return TCSubject
     * @throws Exception some tech faults prevents to the operation completion
     */
    public static TCSubject retrieveTCSubject(User u) throws Exception {
        InitialContext ic = null;
        try {
            ic = new InitialContext(Constants.SECURITY_CONTEXT_ENVIRONMENT);
            PrincipalMgrRemoteHome rHome =
            (PrincipalMgrRemoteHome)ic.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote mgr = rHome.create();
            TCSubject ret = mgr.getUserSubject(u.getId());
            log.debug("current TCSubject: "+ret);
            return ret;
        }
        finally {
            closeIC(ic);
        }
    }
}
