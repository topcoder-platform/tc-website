package com.topcoder.web.common;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchGroupException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.cache.CacheClient;
import com.topcoder.web.common.cache.CacheClientFactory;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.cache.address.AddressFactory;
import com.topcoder.web.common.cache.address.CacheAddress;
import com.topcoder.web.common.security.TCSAuthorization;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Mar 30, 2005
 */
public class SecurityHelper {

    private static final Logger log = Logger.getLogger(SecurityHelper.class);

    public static final String KEY_PREFIX = "user_subject:";

    public static TCSubject getUserSubject(long l, boolean forceLoadFromDb)
            throws GeneralSecurityException, NamingException, CreateException, RemoteException {
        return getUserSubject(l, forceLoadFromDb, null);
    }

    public static TCSubject getUserSubject(long l, boolean forceLoadFromDb, String dataSource)
            throws GeneralSecurityException, NamingException, CreateException, RemoteException {
        //log.debug("get " + l + " from db " + forceLoadFromDb);
        TCSubject ret = null;

        CacheAddress address = AddressFactory.create(new TCSubject(l), dataSource, MaxAge.HOUR);
        //log.debug("address " + address.toString());

        Context ctx = null;
        try {
            boolean hasCacheConnection = true;
            CacheClient cc = null;
            try {
                cc = CacheClientFactory.create();
                if (!forceLoadFromDb) {
                    ret = (TCSubject) (cc.get(address));
                }
            } catch (Exception e) {
                log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e);
                hasCacheConnection = false;
            }
            if (ret == null) {
                ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                        ApplicationServer.SECURITY_PROVIDER_URL);
                PrincipalMgrRemoteHome pmgrHome = (PrincipalMgrRemoteHome) PortableRemoteObject.narrow(ctx.lookup(
                        PrincipalMgrRemoteHome.EJB_REF_NAME),
                        PrincipalMgrRemoteHome.class);
                PrincipalMgrRemote pmgr = pmgrHome.create();
                if (dataSource == null) {
                    ret = pmgr.getUserSubject(l);
                } else {
                    ret = pmgr.getUserSubject(l, dataSource);
                }
                if (hasCacheConnection) {
                    try {
                        cc.set(address, ret);
                    } catch (Exception e) {
                        log.error("UNABLE TO INSERT INTO CACHE: " + e.getMessage());
                    }
                }
            } else {
                //log.debug("ret was not null");
            }
            return ret;
        } finally {
            TCContext.close(ctx);
        }
    }

    public static TCSubject getUserSubject(long l)
            throws GeneralSecurityException, NamingException, CreateException, RemoteException {
        return getUserSubject(l, false);
    }

    public static TCSubject getUserSubject(long l, String dataSource)
            throws GeneralSecurityException, NamingException, CreateException, RemoteException {
        return getUserSubject(l, false, dataSource);
    }

    public static boolean hasPermission(User u, Resource r) {
        try {
            return new TCSAuthorization(u).hasPermission(r);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean hasPermission(long userId, Resource r) {
        try {
            return hasPermission(getUserSubject(userId), r);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean hasPermission(TCSubject u, Resource r) {
        try {
            return new TCSAuthorization(u).hasPermission(r);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    public static void addUserToGroup(long userId, long groupId) throws NamingException, RemoteException, CreateException, NoSuchGroupException, NoSuchUserException, GeneralSecurityException {
        Context ctx = null;
        try {
            ctx = TCContext.getContext(
                    ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            PrincipalMgrRemoteHome pmgrHome = (PrincipalMgrRemoteHome) PortableRemoteObject
                    .narrow(
                            ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME),
                            PrincipalMgrRemoteHome.class);
            PrincipalMgrRemote pmgr = pmgrHome.create();

            pmgr.addUserToGroup(pmgr.getGroup(groupId), pmgr.getUser(userId), new TCSubject(0));
        } finally {
            TCContext.close(ctx);
        }
    }


}