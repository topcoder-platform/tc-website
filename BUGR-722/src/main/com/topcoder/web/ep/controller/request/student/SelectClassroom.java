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

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.School;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.model.Classroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: SelectClassroom.java 66912 2007-11-06 12:27:49Z pulky $
 */
public class SelectClassroom extends LongBase {

    private static Logger log = Logger.getLogger(SelectClassroom.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongBase#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (!"POST".equals(getRequest().getMethod())) {
            log.debug("First pass - " + getUser().getUserName());
            // get school parameter
            Long schoolId = getSchoolParam();

            // prepare stuff for the long transaction
            clearSession();
            
            // add selected school to the session
            School s  = getFactory().getSchoolDAO().find(schoolId);
            setSchool(s);
            getRequest().setAttribute("schoolName", s.getName());                

            // set possible classrooms
            getRequest().setAttribute("possible_classrooms", getPossibleClassrooms(s, getUser().getId()));
            
            setNextPage("/student/selectClassroom.jsp");
            setIsNextPageInContext(true);
        } else {
            School s = getSchool();
            if (s == null) {
                throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/education");
            }
            log.debug("Second pass - " + getUser().getUserName());
            // get selection
            String[] values = getRequest().getParameterValues(Constants.CLASSROOM_ID);

            Set<Classroom> possibleClassrooms = getPossibleClassrooms(s, getUser().getId());

            getRequest().setAttribute("schoolName", s.getName());                

            // add selected classrooms to the session
            List<Classroom> selectedClassrooms = new ArrayList<Classroom>();
            if (values != null) {
                for (String value : values) {
                    Classroom c = null;
                    if (value != null) {
                        Long classroomId = null;
                        try {
                            classroomId = Long.parseLong(value);
                        } catch (NumberFormatException e) {
                            // just drop this selection
                        }
                        
                        // we don't need to store the classroom object, maybe some reduced set of information
                        c = getFactory().getClassroomDAO().find(classroomId);
                        if (!possibleClassrooms.contains(c)) {
                            throw new TCWebException("Invalid classroom selected");
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
                getRequest().setAttribute("possible_classrooms", possibleClassrooms);
                setNextPage("/student/selectClassroom.jsp");
            } else {
                setNextPage("/student/selfRegisterConfirm.jsp");
            }
            setIsNextPageInContext(true);
        }
    }

    private Set<Classroom> getPossibleClassrooms(School s, Long userId) {
        // include only non-registered classrooms
        Set<Classroom> sc = new HashSet<Classroom>(DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingSchoolId(s.getId()));
        
        for (Classroom c : DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(userId)) {
            if (sc.contains(c)) {
                sc.remove(c);
            }
        }
        return sc;
    }

    private Long getSchoolParam() throws TCWebException {
        String schoolId = StringUtils.checkNull(getRequest().getParameter(Constants.SCHOOL_ID));
        
        if (schoolId.equals("")) {
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
