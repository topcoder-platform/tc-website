/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.List;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ActivateStudentSubmit extends StudentActivationBase {

    private static Logger log = Logger.getLogger(ActivateStudentSubmit.class);

    protected void process(Classroom c, List<StudentClassroom> lsc) {
        String message = "";
        for (StudentClassroom sc : lsc) {
            log.debug("activating " + sc.getId().getStudent().getUser().getHandle() + 
                    " for classroom " + c.getName());
            
            // activate
            sc.setStatusId(StudentClassroom.ACTIVE_STATUS);
            DAOUtil.getFactory().getStudentClassroomDAO().saveOrUpdate(sc);
            
            // build message to show
            message += sc.getId().getStudent().getUser().getLastName() + ", " +
                sc.getId().getStudent().getUser().getFirstName() + " (" +
                sc.getId().getStudent().getUser().getHandle() + ")<br/>";
        }
        getRequest().setAttribute("message", "You have successfuly activated the following students:<br/> " + 
                message + " for classroom " + c.getName());                  
        getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, 
                "/education?module=ViewClassroomDetails&" + Constants.CLASSROOM_ID + "=" + c.getId());                  
        setNextPage("/message.jsp");
    }
}
