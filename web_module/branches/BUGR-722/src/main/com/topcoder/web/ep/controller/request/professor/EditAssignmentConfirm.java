/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ep.controller.request.ShortBase;
import com.topcoder.web.ep.dto.AssignmentDTO;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: EditAssignmentConfirm.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class EditAssignmentConfirm extends ShortBase {

    private static Logger log = Logger.getLogger(EditAssignmentConfirm.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        this.sessionPrefix = "ea_";

        log.debug("Edit assignment called...");
        if (userLoggedIn()) {
            if (!"POST".equals(getRequest().getMethod())) {
                throw new TCWebException("Cannot get here via get");
            } else {
                AssignmentDTO adto = getAssignment();
                if (adto == null) {
                    throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/education");
                } else {
                    // got a response, validate. 
                    
                    log.debug("school name: " + adto.getSchoolName());
                    getRequest().setAttribute("schoolName", adto.getSchoolName());                
                    setNextPage("/professor/editAssignmentConfirm.jsp");
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
}
