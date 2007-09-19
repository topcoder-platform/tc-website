/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditClassroomConfirm extends Base {

    private static Logger log = Logger.getLogger(EditClassroomConfirm.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("Edit classroom confirm called...");
            if (getActiveUser() == null) {
                log.debug("user is null");
            } else if (getActiveUser().isNew()) {
                log.debug("user is new");
            } else {
                log.debug("handle : " + getActiveUser().getHandle());
                log.debug("name: " + getActiveUser().getFirstName() + " " + getActiveUser().getLastName());
            }
        }
        if (getActiveUser() == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
        } else if (userLoggedIn()) {            
            // get selection
            String[] values = getRequest().getParameterValues(Constants.STUDENT_ID);
            
            // add selected students to the session
            List<Coder> selectedStudents;
            if (values != null) {
                selectedStudents = new ArrayList<Coder>(values.length); 
                for (String value : values) {
                    Coder s = null;
                    if (value != null) {
                        try {
                            s = getFactory().getCoderDAO().find(Long.parseLong(value));
                        } catch (NumberFormatException e) {
                            // just drop this selection
                        }
                        selectedStudents.add(s);
                    }
                }
            } else {
                selectedStudents = new ArrayList<Coder>();
            }
            setSelectedStudents(selectedStudents);
            
            setNextPage("/professor/editClassroomConfirm.jsp");
            setIsNextPageInContext(true);            
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
}
