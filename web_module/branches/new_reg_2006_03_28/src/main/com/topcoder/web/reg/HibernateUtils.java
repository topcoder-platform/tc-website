package com.topcoder.web.reg;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import com.topcoder.web.reg.model.TCInterceptor;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class HibernateUtils {
    private static final ThreadLocal tSession = new ThreadLocal();
    private static final ThreadLocal tFactory = new ThreadLocal();

    /**
     * If the session doesn't exist in the currently executing thread,
     * create it, hang onto it if the current thread needs it aggain
     * and return it.
     * @return the session for this thread.
     */
    public static Session getSession() {
        Session ret = (Session)tSession.get();
        if (ret == null) {
            ret = getFactory().openSession(new TCInterceptor());
            tSession.set(ret);
        }
        return ret;
    }

    /**
     * If the factory doesn't exist in the currently executing thread,
     * create it, hang onto it if the current thread needs it again
     * and return it.
     * @return the session factory for this thread.
     */
    public static SessionFactory getFactory() {
        SessionFactory factory = (SessionFactory)tFactory.get();
        if (factory == null) {
            Configuration conf = new Configuration();
            conf.configure();
            factory = conf.buildSessionFactory();
            tFactory.set(factory);
        }
        return factory;
    }

    /**
     * Close the session if it exists in the currently executing thread.
     */
    public static void closeSession() {
        Session session = (Session)tSession.get();
        if (session!=null) {
            session.close();
        }
    }

    /**
     * Close the factory if it exists in the currently executing thread.
     */
    public static void closeFactory() {
        SessionFactory factory = (SessionFactory)tFactory.get();
        if (factory!=null) {
            factory.close();
        }
    }

    /**
     * Close both the Session and the factory
     */
    public static void close() {
        closeSession();
        closeFactory();
    }



}
