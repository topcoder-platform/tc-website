package com.topcoder.web.common;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.TCSAuthorization;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Mar 30, 2005
 */
public class SecurityHelper {

    private static final Logger log = Logger.getLogger(SecurityHelper.class);

    public static final String KEY_PREFIX = "user_subject:";

    public static TCSubject getUserSubject(long l, boolean forceLoadFromDb)
            throws Exception, NoSuchUserException, NamingException {
        return getUserSubject(l, forceLoadFromDb, null);
    }

    public static TCSubject getUserSubject(long l, boolean forceLoadFromDb, String dataSource)
            throws Exception, NoSuchUserException, NamingException {
        //log.debug("get " + l + " from db " + forceLoadFromDb);
        TCSubject ret = null;

        String key = KEY_PREFIX + dataSource == null ? "" : dataSource + String.valueOf(l);
        Context ctx = null;
        try {
            boolean hasCacheConnection = true;
            CacheClient cc = null;
            try {
                cc = CacheClientFactory.createCacheClient();
                if (!forceLoadFromDb)
                    ret = (TCSubject) (cc.get(key));
            } catch (Exception e) {
                log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
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
                        cc.set(key, ret, 1000 * 60 * 30);
                    } catch (Exception e) {
                        log.error("UNABLE TO INSERT INTO CACHE: " + e.getMessage());
                    }
                }
            }
            return ret;
        } catch (Exception e) {
            throw e;
        } finally {
            try {
                if (ctx != null) ctx.close();
            } catch (Exception e) {
            }
        }
    }

    public static TCSubject getUserSubject(long l)
            throws Exception, NoSuchUserException, NamingException {
        return getUserSubject(l, false);
    }

    public static TCSubject getUserSubject(long l, String dataSource)
            throws Exception, NoSuchUserException, NamingException {
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

}