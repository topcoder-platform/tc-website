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
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.LongBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelectClassroom extends LongBase {

    private static Logger log = Logger.getLogger(SelectClassroom.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        User u = getActiveUser(); 
        if (u == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
        } else if (u.isProfessor()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            setIsNextPageInContext(true);
            if (!"POST".equals(getRequest().getMethod())) {
                log.debug("First pass - " + getUser().getUserName());
                // get school parameter
                Long schoolId = getSchoolParam();
                
                // add selected school to the session
                School s  = getFactory().getSchoolDAO().find(schoolId);
                setSchool(s);
    
                // set possible classrooms
                setPossibleClassrooms(s, u);            
                
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
                    setPossibleClassrooms(getSchool(), u);            
                    setNextPage("/student/selectClassroom.jsp");
                } else {
                    setNextPage("/student/selfRegisterConfirm.jsp");
                }
            }
        }        
    }

    /**
     * @param s
     */
    private void setPossibleClassrooms(School s, User u) {
        // include only non-registered classrooms
        Set<Classroom> sc = new HashSet<Classroom>(s.getClassrooms());
        for (Classroom c : u.getCoder().getClassrooms()) {
            if (sc.contains(c)) {
                sc.remove(c);
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
