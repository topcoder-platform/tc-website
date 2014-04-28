/*
* Base
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.dto.AssignmentDTO;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public abstract class ShortBase extends ShortHibernateProcessor {
    private DAOFactory factory = null;
    
    /**
     * This prefix is to help distinguish different objects in the same session but for different
     * wizards. 
     */
    public String sessionPrefix = "";

    /**
     * Clears session objects
     */
    protected void clearSession() {
        getRequest().getSession().setAttribute(sessionPrefix + Constants.ASSIGNMENT, null);

        log.debug("Cleaning, sessionPrefix: " + sessionPrefix);
    }

    /**
     * Set the assignment in the current request processor.  
     *
     * @param assignment the assignment to set
     */
    protected void setAssignment(AssignmentDTO assignment) {
        log.debug("set assignment in session");
        getRequest().getSession().setAttribute(sessionPrefix + Constants.ASSIGNMENT, assignment);
    }
    
    /**
     * Get the assignment in the current request processor. 
     */
    protected AssignmentDTO getAssignment() {
        AssignmentDTO assignment = (AssignmentDTO) getRequest().getSession().getAttribute(sessionPrefix + Constants.ASSIGNMENT);
        if (assignment == null) {
            log.debug("Couldn't find assignment in the session");
        } else {
            if (log.isDebugEnabled()) {
                log.debug("got assignment from session");
            }
        }
        return assignment;
    }
    
    protected DAOFactory getFactory() {
        if (factory  == null) {
            factory = DAOUtil.getFactory();
        }
        return factory;
    }
}
