/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelectClassroom extends Base {

    private static Logger log = Logger.getLogger(SelectClassroom.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("Select school called...");
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
            setIsNextPageInContext(true);
            if (!"POST".equals(getRequest().getMethod())) {
                log.debug("First pass - " + getUser().getUserName());
                // get school parameter
                Long schoolId = getSchoolParam();
                
                // add selected school to the session
                School s  = getFactory().getSchoolDAO().find(schoolId);
                setSchool(s);
    
                // set possible classrooms
                setPossibleClassrooms(s);            
                
                setNextPage("/student/selectClassroom.jsp");
            } else {
                log.debug("Second pass - " + getUser().getUserName());
                // get selection
                String[] values = getRequest().getParameterValues(Constants.CLASSROOM_ID);
                
                // add selected classrooms to the session
                List<Classroom> selectedClassrooms = new ArrayList<Classroom>();
                if (values != null) {
                    for (String value : values) {
                        Classroom c = null;
                        if (value != null) {
                            try {
                                c = getFactory().getClassroomDAO().find(Long.parseLong(value));
                            } catch (NumberFormatException e) {
                                // just drop this selection
                            }
                            selectedClassrooms.add(c);
                        }
                    }
                }
                if (selectedClassrooms.size() == 0) {
                    addError("error", "You must select at least one classroom");
                } else {
                    setSelectedClassrooms(selectedClassrooms);
                }

                if (hasErrors()) {
                    setPossibleClassrooms(getSchool());            
                    setNextPage("/student/selectClassroom.jsp");
                } else {
                    setNextPage("/student/selfRegisterConfirm.jsp");
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }

    /**
     * @param s
     */
    private void setPossibleClassrooms(School s) {
        // get professors from that school
        Set<Professor> professors  = s.getActiveProfessors();
        
        // include only non-registered classrooms
        User u = getActiveUser();
        
        Set<Classroom> sc = new HashSet<Classroom>();
        for (Professor p : professors) {
            for (Classroom c: p.getClassrooms()) {
                if (!u.getCoder().getStudentClassrooms().contains(new StudentClassroom(u.getCoder(), c, null))) {
                    sc.add(c);
                }
            }
        }
        getRequest().setAttribute("possible_classrooms", sc);
    }

    private Long getSchoolParam() throws TCWebException {
        String schoolId = StringUtils.checkNull(getRequest().getParameter(Constants.SCHOOL_ID));
        
        if (schoolId == "") {
            throw new TCWebException("Invalid school id");
        }

        Long id;
        try {
            id = Long.parseLong(schoolId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid school id");
        }
        
        return id;
    }
}
