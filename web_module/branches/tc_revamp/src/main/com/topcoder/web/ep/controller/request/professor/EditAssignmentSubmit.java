/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ep.arena.ArenaServicesFactory;
import com.topcoder.web.ep.controller.request.ShortBase;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: EditAssignmentSubmit.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class EditAssignmentSubmit extends ShortBase {

    private static Logger log = Logger.getLogger(EditAssignmentSubmit.class);

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
                    getRequest().setAttribute("schoolName", adto.getSchoolName());                
                    Boolean update = adto.getRoundId() != null; 
                    if (update) {
                        // update
                        log.debug("updating...");
                        log.debug("roundId: " + adto.getRoundId());
                        for (ComponentDTO cdto : adto.getComponents()) {
                            log.debug("component: " + cdto.getComponentId());
                        }
                        
                        ArenaServicesFactory.getArenaServices().editAssignment(adto);                        
                    } else {
                        // new
                        ArenaServicesFactory.getArenaServices().addNewAssignment(adto);
                    }

                    // clear objects in session
                    clearSession();

                    getRequest().setAttribute("message", "You have successfuly " + (update ? "updated" : "added") + " assignment " + adto.getAssignmentName());                  
                    getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, "/education/?module=ViewClassroomAssignments&clsid=" + adto.getClassroomId());                  
                    setNextPage("/message.jsp");
                    setIsNextPageInContext(true);            
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
}
