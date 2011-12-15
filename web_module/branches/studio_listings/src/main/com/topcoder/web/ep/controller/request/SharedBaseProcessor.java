/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.ep.util.Helper;

/**
 * This is a processor for the shared pages. It will identify the user and his role and
 * delegate the process accordingly.
 * 
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public abstract class SharedBaseProcessor extends ShortHibernateProcessor {

    private static Logger log = Logger.getLogger(SharedBaseProcessor.class);

    /**
     * Processor implementation for professors
     * 
     * @throws Exception
     */
    protected abstract void professorProcessing() throws Exception;
    
    
    /**
     * Processor implementation for students
     * 
     * @throws Exception
     */
    protected abstract void studentProcessing() throws Exception;
    
    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userIdentified()) {
            // check whether student or professor
            if (DAOUtil.getFactory().getProfessorDAO().isProfessor(getUser().getId())) {
                // since it's a shared processor check if he has permission
                if (!Helper.hasProfessorPermission(getUser())) {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }

                log.debug(getUser().getUserName() + " logging in as professor");
                
                getRequest().setAttribute("user_type", "professor");
                
                professorProcessing();
            } else {
                if (!Helper.hasStudentPermission(getUser())) {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }

                log.debug(getUser().getUserName() + " logging in as student");

                getRequest().setAttribute("user_type", "student");

                studentProcessing();
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
    
    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }

}
