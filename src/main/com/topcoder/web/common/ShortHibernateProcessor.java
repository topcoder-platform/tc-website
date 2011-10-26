package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;

/**
 * This implementation uses the session-per-thread strategy.
 * Therefore, it's appropriate when you have some data you would like to
 * update or retrieve and there is no long running conversation of data.
 * This implementation will be a little more processor intensive because
 * the first level cache may be used less, however it will be memory efficient
 * because we won't be hanging on to data very long, only the length of the
 * http request.
 *
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 27, 2006
 */
public abstract class ShortHibernateProcessor extends LongHibernateProcessor {
    protected static final Logger log = Logger.getLogger(ShortHibernateProcessor.class);

    protected void businessProcessing() throws Exception {
        log.debug("sessionid: " + getRequest().getSession().getId());

        try {
            /*
            We'd like to truly use a session-per-thread stategy, however, that's tricky
            because the configuration is application wide, and it includes the use of
            the ExtendedThreadLocalSessionContext.  We can't really get around using
            it, i don't think, so instead, we'll just start and end the conversation on
            every request.  This shouldn't be significantly less efficient than doing
            it the right way, but should work the same as far as users of this class are
             concerned.
            */
            beginCommunication();
            dbProcessing();
        } catch (Exception e) {
            exceptionCallBack();
            handleException(e);
            throw e;
        } catch (Throwable ex) {
            exceptionCallBack();
            handleException(ex);
            throw new Exception(ex);
        }
    }

    public void postProcessing() throws Exception {
        log.debug("post processing called");
        try {
            closeConversation();
        } catch (Throwable e) {
            handleException(e);
            throw new Exception(e);
        }

    }

}