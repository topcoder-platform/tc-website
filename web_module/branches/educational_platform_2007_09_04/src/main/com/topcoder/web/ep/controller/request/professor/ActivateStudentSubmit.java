/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ActivateStudentSubmit extends StudentActivationBase {

    private static Logger log = Logger.getLogger(ActivateStudentSubmit.class);

    protected void process(StudentClassroom sc) {

        log.debug("activating " + sc.getId().getStudent().getUser().getHandle() + 
                " for classroom " + sc.getId().getClassroom().getName());
        
        sc.setStatusId(StudentClassroom.ACTIVE_STATUS);
        
        DAOUtil.getFactory().getStudentClassroomDAO().saveOrUpdate(sc);
                
        getRequest().setAttribute("message", "You have successfuly activated student " + 
                sc.getId().getStudent().getUser().getHandle() +
                " for classroom " + sc.getId().getClassroom().getName());                  
        getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, 
                "/ep?module=ViewClassroomDetails&" + Constants.CLASSROOM_ID + "=" + sc.getId().getClassroom().getId());                  
        setNextPage("/message.jsp");
    }
}
