package com.topcoder.web.corp;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.NotSupportedException;
import javax.transaction.SystemException;
import javax.transaction.Transaction;
import javax.transaction.TransactionManager;
import java.rmi.RemoteException;

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
            throws NamingException, SystemException, NotSupportedException {
        InitialContext ic = null;
        try {
            ic = (InitialContext)TCContext.getInitial();
            TransactionManager tm;
            tm = (TransactionManager) ic.lookup(ApplicationServer.TRANS_MANAGER);
            tm.begin();
            return tm.getTransaction();
        } finally {
            closeIC(ic);
        }
    }

    /**
     * Just closes initial context with care
     * @param ic
     */
    public static void closeIC(InitialContext ic) {
        if (ic == null) return;
        try {
            ic.close();
        } catch (Exception e) {
            log.error("Can't close initial context " + ic);
        }
    }

    /**
     * Pulls out TCSubject object for given userID from DB
     *
     * @param userID
     * @return TCSubject
     * @throws NoSuchUserException there is not user for given handle in DB
     * @throws Exception some tech faults prevents to the operation completion
     */
    public static TCSubject retrieveTCSubject(long userID)
            throws NoSuchUserException, Exception {
        PrincipalMgrRemote mgr = getPrincipalManager();
        TCSubject ret = mgr.getUserSubject(userID);
        log.debug("TCSubject retreived by ID [" + ret + "]");
        return ret;
    }

    /**
     * Pulls out TCSubject object for given user handle from DB
     *
     * @param handle
     * @return TCSubject
     * @throws NoSuchUserException there is not user for given handle in DB
     * @throws Exception some tech faults prevents to the operation completion
     */
    public static TCSubject retrieveTCSubject(String handle)
            throws NoSuchUserException, Exception {
        PrincipalMgrRemote mgr = getPrincipalManager();
        TCSubject ret = mgr.getUserSubject(mgr.getUser(handle).getId());
        log.debug("TCSubject retreived by handle [" + ret + "]");
        return ret;
    }

    /**
     * Returns remote principal manager
     *
     * @return PrincipalMgrRemote
     *
     * @throws NamingException
     * @throws CreateException
     * @throws RemoteException
     */
    public static PrincipalMgrRemote getPrincipalManager()
            throws NamingException, CreateException, RemoteException {
        InitialContext ic = null;
        try {
            ic = (InitialContext) TCContext.getContext(
                    ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL
            );
            PrincipalMgrRemoteHome rHome = (PrincipalMgrRemoteHome)
                    ic.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);

            PrincipalMgrRemote ret = rHome.create();
            return ret;
        } finally {
            closeIC(ic);
        }
    }

    /**
     * Returns corp web application path composed from context path and servlet
     * path which is semantically same as root (very first) page of application.
     *
     * @param req
     * @return String
     */
    public static String appRootPage(HttpServletRequest req) {
        return req.getContextPath() + req.getServletPath();
    }

    /**
     * This is like a hack.  I can't think of a way to have the
     * Transaction servlet put up the correct path for the links
     * in top, left and bottom.  This is only gonna work if the
     * app is deployed as the default and the servlet = "/"
     * @return
     */
    public static String appRootPage() {
        return "/";
    }

}
