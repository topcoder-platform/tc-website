/*
 * Common.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.persistence;

import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.security.AdminPermission;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.PolicyRemoteHome;
import com.topcoder.util.cache.refreshable.RefreshException;
import com.topcoder.util.cache.refreshable.RefreshManager;
import com.topcoder.util.cache.refreshable.Refreshable;
import com.topcoder.util.cache.refreshable.RefreshableCache;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/**
 * DOCUMENT ME!
 *
 * @author TCSDeveloper
 */
public class Common {
    public static int MAX_FIELD_SIZE = 20000;
    private static UserManagerLocal userManager = null;
//    private static PolicyRemote policy = null;
    private static Log log;

    public static boolean tooBig(String s) {
        return s != null && s.length() > MAX_FIELD_SIZE;
    }

    /**
     * DOCUMENT ME!
     *
     * @param key DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public static Refreshable getFromCache(String key) {
        //System.out.println("Common.getFromCache( " + key + " )");
        RefreshManager manager = RefreshManager.getInstance();
        RefreshableCache cache = null;
        Refreshable refreshable = null;

        try {
            cache = manager.getCache("review_cache");
        } catch (IllegalArgumentException e) {
            cache = null;
        }

        //System.out.println("cache: " + cache);
        if (cache == null) {
            // create a RefreshableCache
            cache = new RefreshableCache("review_cache");
            refreshable = addManager(cache, key);

            // cache.setPeriod(60000); // refresh every 60 second
            // manage the caches
            manager.addCache(cache);
        } else {
            refreshable = (Refreshable) cache.get(key);

            if (refreshable == null) {
                refreshable = addManager(cache, key);
            }
        }

        return refreshable;
    }

    private static Refreshable addManager(RefreshableCache cache, String key) {
        Refreshable newManager = null;

        try {
            try {
                newManager = (Refreshable) Class.forName("com.topcoder.apps.review.document." + key).newInstance();
            } catch (ClassNotFoundException e) {
                newManager = (Refreshable) Class.forName("com.topcoder.apps.review.projecttracker." + key).newInstance();
            }

            try {
                //System.out.println("Common.addManager, class: " + newManager.getClass().getName());
                newManager.refresh();
            } catch (RefreshException e) {
                throw new RuntimeException(e);
            }

            cache.put(key, newManager);
        } catch (InstantiationException e1) {
            throw new RuntimeException(e1);
        } catch (IllegalAccessException e1) {
            throw new RuntimeException(e1);
        } catch (ClassNotFoundException e1) {
            throw new RuntimeException(e1);
        }

        return newManager;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public static DataSource getDataSource() {
        //Hashtable env = new Hashtable();
        //env.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");

        //initialContextFactory);
        //env.put(Context.PROVIDER_URL, "localhost:1199"); //providerUrl);

        Context ctx;
        DataSource dataSource = null;

        try {
            //ctx = new InitialContext(env);
            ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:/InformixDS");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }

        return dataSource;
    }

    /**
     * DOCUMENT ME!
     *
     * @param dataSource DOCUMENT ME!
     * @param userId DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    public static User getUser(DataSource dataSource, long userId) {
        User user = null;

        try {
            if (userManager == null) {
                Context ctx = new InitialContext();
                UserManagerLocalHome home = (UserManagerLocalHome) PortableRemoteObject.narrow(ctx.lookup(
                        "com.topcoder.apps.review.projecttracker.UserManagerLocalHome"), UserManagerLocalHome.class);
                userManager = home.create();
            }

            user = userManager.getUser(userId);
        } catch (ClassCastException e) {
            throw new RuntimeException(e);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (CreateException e) {
            throw new RuntimeException(e);
        }

        return user;
    }

    public static boolean isAdmin(TCSubject user) {
        boolean isAdmin = false;
        try {
            Context ctx = new InitialContext();
            PolicyRemoteHome pHome = (PolicyRemoteHome) PortableRemoteObject.narrow(ctx.lookup(
                    PolicyRemoteHome.EJB_REF_NAME), PolicyRemoteHome.class);
            PolicyRemote policy = pHome.create();
            isAdmin = policy.checkPermission(user, new AdminPermission());
        } catch (Exception e1) {
            Common.error("Exception when using policy manager: " + e1.toString());
            throw new RuntimeException(e1);
        }
        return isAdmin;
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     * @param ps DOCUMENT ME!
     * @param rs DOCUMENT ME!
     */
    public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            close(rs);
        } finally {
            try {
                close(ps);
            } finally {
                close(conn);
            }
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param conn DOCUMENT ME!
     */
    public static void close(Connection conn) {
        if (conn == null) {
            return;
        }

        try {
            conn.close();
        } catch (Exception e) {
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param ps DOCUMENT ME!
     */
    public static void close(PreparedStatement ps) {
        if (ps == null) {
            return;
        }

        try {
            ps.close();
        } catch (Exception e) {
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param rs DOCUMENT ME!
     */
    public static void close(ResultSet rs) {
        if (rs == null) {
            return;
        }

        try {
            rs.close();
        } catch (Exception e) {
        }
    }

    private static void info(String msg) {
        try {
            if (log == null) {
                log = Common.getLog();
            }
            log.log(Level.INFO, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private static void debug(String msg) {
        try {
            if (log == null) {
                log = Common.getLog();
            }
            log.log(Level.DEBUG, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private static void error(String msg) {
        try {
            if (log == null) {
                log = Common.getLog();
            }
            log.log(Level.ERROR, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private static Log getLog() {
        Log newLog = null;
        try {
            newLog = LogFactory.getInstance().getLog("com.topcoder.apps.review.persistence.Common");
        } catch (LogException e) {
            e.printStackTrace();
        }
        return newLog;
    }

    /**
     * @param project
     * @param requestorId
     * @return
     */
    public static boolean isRole(Project project, long requestorId, long role) {
        UserRole[] userRole = project.getParticipants();

        boolean isRole = false;
        for (int i = 0; i < userRole.length; i++) {
            if (userRole[i].getUser() != null &&
                    userRole[i].getUser().getId() == requestorId &&
                    userRole[i].getRole().getId() == role) {
                isRole = true;
                break;
            }
        }
        return isRole;
    }

    /**
     * Tests if two Objects are equal taking nulls into consideration.
     *
     * @param a an object
     * @param b an object
     *
     * @return whether the Objects are equal or not
     */
    public static boolean equals(Object a, Object b) {
        return a == b || (a != null && a.equals(b));
    }
}
