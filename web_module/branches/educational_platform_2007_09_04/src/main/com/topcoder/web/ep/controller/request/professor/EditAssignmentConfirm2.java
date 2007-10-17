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
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditAssignmentConfirm2 extends LongBase {

    private static Logger log = Logger.getLogger(EditAssignmentConfirm2.class);

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

                if (userLoggedIn()) {
                    if (hasErrors()) {
                    } else {
                        setNextPage("/professor/editAssignmentConfirm2.jsp");
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
        
        if (pointsStr.equals("")) {
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
