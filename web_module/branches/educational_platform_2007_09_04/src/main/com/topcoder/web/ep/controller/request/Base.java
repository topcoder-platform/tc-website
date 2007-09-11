/*
* Base
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.web.common.LongHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public abstract class Base extends LongHibernateProcessor {

    private User user = null;
    private DAOFactory factory = null;

    /**
     * Retrieve the user that is involved in the current registration process.
     * First see if it's cached in this request processor, then try the session
     * and finally load it from the db.
     *
     * @return the user, we'll return null if the user does not currently have an
     *         account or if <code>setRegUser</code> has not yet been called.
     */
    protected User getActiveUser() {
        if (user == null) {
            user = (User) getRequest().getSession().getAttribute(Constants.USER);
            if (user == null) {
                if (userLoggedIn()) {
                    log.debug("get user from the dao");
                    user = getFactory().getUserDAO().find(new Long(getUser().getId()));
                    if (user != null) {
                        setActiveUser(user);
                    } else {
                        throw new RuntimeException("Couldn't find user " + getUser().getId() + " in the database");
                    }
                } else {
                    log.debug("not logged in and user is null");
                }
            } else {
                if (log.isDebugEnabled()) {
                    log.debug("got id: " + user.getId() + " handle: " + user.getHandle() + " user from session");
                }
            }
        } else {
            if (log.isDebugEnabled()) {
                log.debug("got id: " + user.getId() + " handle: " + user.getHandle() + " user from processor");
            }
        }
        return user;
    }

    protected void clearSession() {
        getRequest().getSession().setAttribute(Constants.USER, null);
    }
    /**
     * Set the  user in the current request processor.  This is generally
     * only necessary if it's a new user istering.  Existing users can be loaded
     * by <code>getUser</code>
     *
     * @param u
     */
    protected void setActiveUser(User u) {
        this.user = u;
        getRequest().getSession().setAttribute(Constants.USER, user);
    }
    
    protected DAOFactory getFactory() {
        if (factory  == null) {
            factory = DAOUtil.getFactory();
        }
        return factory;
    }
}
