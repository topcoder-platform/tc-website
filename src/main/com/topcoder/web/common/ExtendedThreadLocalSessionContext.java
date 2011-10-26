package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;
import org.hibernate.FlushMode;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.context.ThreadLocalSessionContext;
import org.hibernate.engine.SessionFactoryImplementor;

/**
 * Trivial implementation of a session-per-conversation context.
 * <p/>
 * This is how you can activate it programmatically:
 * <pre>
 *         HibernateUtil.getConfiguration().setProperty(
 *              Environment.CURRENT_SESSION_CONTEXT_CLASS,
 *              ExtendedThreadLocalSessionContext.class.getName()
 *        );
 * <p/>
 * </pre>
 * <p/>
 * Or simply set the <tt>hibernate.current_session_context_class</tt>
 * configuration option to this fully qualified class name.
 * <p/>
 * You have to bind/unbind your disconnected long-running Session on each requst:
 * <p/>
 * <pre>
 *  ExtendedThreadLocalSessionContext.bind(hibernateSession); // Begin request
 *  // ... service executes
 *  hibernateSession = ExtendedThreadLocalSessionContext.unbind(sf); // End request
 *  // ... store hibernateSession until next request
 * </pre>
 * <p/>
 * Finally, don't forget to end your long-running conversation by
 * calling <tt>flush()</tt> on your Session, and make sure you close
 * it afterwards.
 *
 * @author christian@hibernate.org
 * @see org.hibernate.ce.auction.web.filter.HibernateThreadExtendedFilter
 */
public class ExtendedThreadLocalSessionContext extends ThreadLocalSessionContext {

    protected static final Logger log = Logger.getLogger(ExtendedThreadLocalSessionContext.class);

    public ExtendedThreadLocalSessionContext(SessionFactoryImplementor factory) {
        super(factory);
    }

    // No automatic flushing of the Session at transaction commit, client calls flush()
    protected boolean isAutoFlushEnabled() {
        return false;
    }

    protected Session buildOrObtainSession() {
        log.debug("Opening a new Session");
        //Thread.dumpStack();
        Session s = super.buildOrObtainSession();
        s.enableFilter("activeFilter").setParameter("status", "A");
        //log.debug("Disabling automatic flushing of the Session");
        s.setFlushMode(FlushMode.NEVER);
        return s;
    }

    // No automatic closing of the Session at transaction commit, client calls close()
    protected boolean isAutoCloseEnabled() {
        return false;
    }

    // Don't unbind after transaction completion, we expect the client to do this
    // so it can flush() and close() if needed (or continue the conversation).
    protected CleanupSynch buildCleanupSynch() {
        return new NoCleanupSynch(factory);
    }

    private static class NoCleanupSynch extends ThreadLocalSessionContext.CleanupSynch {
        public NoCleanupSynch(SessionFactory factory) {
            super(factory);
        }

        public void beforeCompletion() {
        }

        public void afterCompletion(int i) {
        }
    }
}

