/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.HashSet;
import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditClassroom extends Base {

    private static Logger log = Logger.getLogger(EditClassroom.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Edit Classroom called...");
        if (userIdentified()) {
            log.debug("User identified - " + getUser().getUserName());
            
            if (!"POST".equals(getRequest().getMethod())) {
                log.debug("First pass - " + getUser().getUserName());
                // the user has just got here
                //set up the user object we're gonna use
                User u = getActiveUser();
                if (u == null) {
                    u = new User();
                    setActiveUser(u);
                }
    
                // new or edit
                Long classroomId = getClassroomParam();
    
                Classroom c;
                if (classroomId != null) {
                    // check if this classroom belongs to the active user
                    c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);
                    
                    if (!c.getProfessor().getId().equals(getUser().getId())) {
                        throw new NavigationException("You don't have permission to see this page.");
                    }
                    
                    setDefault("classroom_name", c.getName());
                    setDefault("classroom_academic_period", c.getAcademicPeriod());
                    setDefault("classroom_description", c.getDescription());
                } else {
                    c = new Classroom();
                }
                
                // prepare stuff for the long transaction
                clearSession();
    
                setClassroom(c);
    
                setNextPage("/professor/editClassroom.jsp");
                setIsNextPageInContext(true);
            } else {
                log.debug("Second pass - " + getUser().getUserName());
                if (getActiveUser() == null) {
                    throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
                } else if (userLoggedIn()) {
                    String classroomName = StringUtils.checkNull(getRequest().getParameter("classroom_name"));
                    if (classroomName == "") {
                        addError("error", "Please enter a name");
                    }
                    String classroomAcademicPeriod = StringUtils.checkNull(getRequest().getParameter("classroom_academic_period"));
                    if (classroomAcademicPeriod == "") {
                        addError("error", "Please enter a academic period");
                    }
                    String classroomDescription = StringUtils.checkNull(getRequest().getParameter("classroom_description"));
                    if (classroomDescription == "") {
                        addError("error", "Please enter a description");
                    }
                    // got a response, validate.
                    
                    if (!hasErrors()) {
                        Classroom c = getClassroom();
                        
                        if (c.getId() != null && !c.getProfessor().getId().equals(getUser().getId())) {
                            throw new NavigationException("You don't have permission to see this page.");
                        }
    
                        c.setName(classroomName);
                        c.setAcademicPeriod(classroomAcademicPeriod);
                        c.setDescription(classroomDescription);
                        c.setStatusId(Classroom.ACTIVE);
                        c.setProfessor(getActiveUser().getProfessor());
                        
                        Set<Coder> sc = c.getStudents(StudentClassroom.PENDING_STATUS);
                        sc.addAll(c.getStudents(StudentClassroom.ACTIVE_STATUS));
    
                        // generate checked students collection
                        Set checkedStudents = new HashSet<Coder>();
                        for (Coder coder : sc) {
                            checkedStudents.add(coder.getId().toString());
                        }
                        getRequest().setAttribute("checked_students", checkedStudents);            
                        
                        getRequest().setAttribute("possible_students", getActiveUser().getProfessor().getStudents());            

                        // next step, students.
                        setNextPage("/professor/selectStudents.jsp");
                        setIsNextPageInContext(true);
                    } else {
                        setDefault("classroom_name", classroomName);
                        setDefault("classroom_academic_period", classroomAcademicPeriod);
                        setDefault("classroom_description", classroomDescription);
    
                        setNextPage("/professor/editClassroom.jsp");
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
    
    private Long getClassroomParam() throws TCWebException {
        String classroomId = StringUtils.checkNull(getRequest().getParameter(Constants.CLASSROOM_ID));
        
        if (classroomId == "") {
            return null;
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
