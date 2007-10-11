/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewClassroomAssignments extends ShortHibernateProcessor {

    private static Logger log = Logger.getLogger(ViewClassroomAssignments.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userIdentified()) {
            
            Long classroomId = getClassroomParam();
            Classroom c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);
            Coder s = c.getStudent(getUser().getId());
            if (c.getProfessor().getId().equals(getUser().getId())) {
                log.debug("is professor");

                // since it's a shared processor check if he has permission
                if (!Helper.hasProfessorPermission(getLoggedInUser())) {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
                // this user is the classroom's professor
                getRequest().setAttribute("classroom", c);
                getRequest().setAttribute("assignments", DAOUtil.getFactory().getClassroomDAO().getAssignments(c.getId()));

                setNextPage("/professor/viewClassroomAssignments.jsp");
            } else if (s != null) {
                log.debug("active student");
                // this user is an active student of the classroom

                getRequest().setAttribute("classroom", c);
                getRequest().setAttribute("assignments", DAOUtil.getFactory().getClassroomDAO().getAssignmentsForStudent(c.getId(), s.getId()));
                setNextPage("/student/viewClassroomAssignments.jsp");
            } else {
                throw new NavigationException("You don't have permission to see this page.");
            }
                
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
    
    private Long getClassroomParam() throws TCWebException {
        String classroomId = StringUtils.checkNull(getRequest().getParameter(Constants.CLASSROOM_ID));
        
        if (classroomId == "") {
            throw new TCWebException("Invalid classroom id");
        }

        Long id;
        try {
            id = Long.parseLong(classroomId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid classroom id");
        }
        
        return id;
    }

}
