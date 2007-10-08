/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.HashMap;
import java.util.Map;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ep.controller.request.Base;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditAssignmentConfirm extends Base {

    private static Logger log = Logger.getLogger(EditAssignmentConfirm.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Edit assignment called...");

        if (userLoggedIn()) {
            if (!"POST".equals(getRequest().getMethod())) {
                throw new TCWebException("Cannot get here via get");
            } else {
                if (getActiveUser() == null) {
                    throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
                } else if (userLoggedIn()) {
                    // got a response, validate. 
                    AssignmentDTO adto = getAssignment();

                    if (adto.getComponents().size() == 0) {
                        addError("actionError", "You must add at least one component");
                    }
                    
                    // check points
                    Map<Long, Double> points = new HashMap<Long, Double>(adto.getComponents().size());
                    for (ComponentDTO cdto : adto.getComponents()) {
                        Double pointsParam = getPointsParam(cdto.getComponentId()); 
                        if (pointsParam == null || pointsParam != -1d) {
                            points.put(cdto.getComponentId(), pointsParam);
                        } else {
                            addError("actionError", "Invalid points entered");
                            break;
                        }
                    }

                    if (hasErrors()) {
                        setNextPage("/professor/selectComponents.jsp");
                        setIsNextPageInContext(true);
                    } else {
                        // update points
                        for (ComponentDTO cdto : adto.getComponents()) {
                            if (points.containsKey(cdto.getComponentId())) {
                                cdto.setPoints(points.get(cdto.getComponentId()));
                            } else {
                                throw new TCWebException("Error: missing component points");
                            }
                        }
                    
                        setNextPage("/professor/editAssignmentConfirm.jsp");
                        setIsNextPageInContext(true);
                    }
                } else {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
    
    private Double getPointsParam(Long componentId) throws TCWebException {
        String pointsStr = StringUtils.checkNull(getRequest().getParameter("points_" + componentId));
        
        if (pointsStr == "") {
            return null;
        }

        Double points;
        try {
            points = Double.parseDouble(pointsStr);
        } catch (NumberFormatException e) {
            return -1d;
        }
        
        return points;
    }

}
