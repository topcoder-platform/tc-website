package com.topcoder.web.hs.controller.requests;

import java.util.*;

import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.common.*;
import com.topcoder.web.hs.model.*;
import com.topcoder.shared.util.logging.Logger;

/**
 * Contains some of the basic methods and data for request processors.
 *
 * @author Ambrose Feinstein
 */
public abstract class Base extends BaseProcessor {

    /* set by the creator */
//    protected HttpServletRequest request;
//    protected WebAuthentication auth;

    /* attached to the request */
    protected SessionInfoBean info;
    protected NavZoneBean nav;

    /* used internally */
    protected User user;
    protected Authorization hsa;
    protected static Logger log = Logger.getLogger(Base.class);

    public Base() {
        log.debug("constructing " + this.getClass().getName());
    }

    /**
     * Some things we want to do for most subclassed request processors.
     * Override this to disable auth setup and adding default beans.
     */
    protected void baseProcessing() throws TCWebException {
        log.debug("entering baseProcessing");
        try {
            try {
                user = getUser();
                hsa = new HSAuthorization(user);

            } catch (Exception e) {
                log.warn("problem getting User and Authorization objects, trying again as guest", e);

                /* most likely a stale cookie, so clear it out and try again */
                getAuthentication().logout();
                user = getUser();
                hsa = new HSAuthorization(user);
            }
            info = new SessionInfoBean();
            getRequest().setAttribute("SessionInfo", info);
            Set groups = ((HSAuthorization) hsa).getGroups();
            info.setAll(user, groups);

            Resource r = new ClassResource(this.getClass());
            if (!hsa.hasPermission(new ClassResource(this.getClass())))
                throw new PermissionException(user, r);

            nav = new NavZoneBean();
            getRequest().setAttribute("NavZone", nav);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }


    }

}
