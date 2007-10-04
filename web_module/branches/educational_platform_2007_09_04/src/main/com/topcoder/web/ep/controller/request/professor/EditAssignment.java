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
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.educ.AssignmentScoreType;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditAssignment extends Base {

    private static Logger log = Logger.getLogger(EditAssignment.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Edit assignment called...");

        if (!"POST".equals(getRequest().getMethod())) {
            log.debug("First pass - " + getUser().getUserName());

            User u = getActiveUser();
            
            if (u.getProfessor().getActiveSchools().size() == 0) {
                throw new TCWebException("No active schools for this professor");
            }
            
            // new or edit
            Long assignmentId = getAssignmentParam();
            Long classroomId = getClassroomParam();

            Round a = null;
            Classroom c = null;
            if (assignmentId != null) {
                // we are editing
                
                // check if this assignment belongs to the active user
                a = DAOUtil.getFactory().getRoundDAO().find(assignmentId);

                Object classroomProperty = a.getProperty(RoundProperty.CLASSROOM_ID);

                if (classroomProperty == null) {
                    throw new TCWebException("The assignment has an invalid classroom id");
                }

                classroomId = (Long) classroomProperty;

                setDefault("assignment_name", a.getName());
                setDefault("assignment_start", a.getContest().getStartDate());
                setDefault("assignment_end", a.getContest().getEndDate());
                setDefault("assignment_coding_phase_length", (Long)a.getProperty(RoundProperty.CODING_PHASE_LENGTH));
                setDefault("assignment_show_all_scores", (Long)a.getProperty(RoundProperty.SHOW_ALL_SCORES));
                setDefault("assignment_score_type", (Long)a.getProperty(RoundProperty.SCORE_TYPE));

            } else {
                // this is a new assignment, we need the classroom id
                if (classroomId == null) {
                    throw new TCWebException("Invalid classroom id");
                }
            }

            // check if this classroom belongs to the active user
            c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);
            
            if (!c.getProfessor().getId().equals(getUser().getId())) {
                throw new NavigationException("You don't have permission to see this page.");
            }

            // prepare stuff for the long transaction
            clearSession();

            getRequest().setAttribute("assignment_score_types", AssignmentScoreType.getAll());            
            
            setAssignment(a);
            setClassroom(c);

            setNextPage("/professor/editAssignment.jsp");
            setIsNextPageInContext(true);
        } else {
            log.debug("Second pass - " + getUser().getUserName());
            if (getActiveUser() == null) {
                throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
            } else if (userLoggedIn()) {
                Long schoolId = 0l;
                School s = null;
                if (schoolId == null) {
                    addError("error", "Please select a school");
                } else {
                    s = getActiveUser().getProfessor().getSchoolUsingId(schoolId);                    
                    if (s == null) {
                        throw new TCWebException("Invalid school id");                        
                    }
                }
                
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

                Classroom c = getClassroom();
                
                // check there's no other classroom with the same name, academic period in the same school.
                if (s != null && getActiveUser().getProfessor().hasClassroom(s,
                        classroomName, 
                        classroomAcademicPeriod)) {
                    // check if it's not finding the edited classroom
                    if (!(c.getId() != null && c.getName().equals(classroomName) &&
                            c.getAcademicPeriod().equals(classroomAcademicPeriod) &&
                            c.getSchool().equals(s))) {
                        addError("error", "This classroom already exists");
                    }
                }
                
                if (!hasErrors()) {
                    
                    if (c.getId() != null && !c.getProfessor().getId().equals(getUser().getId())) {
                        throw new NavigationException("You don't have permission to see this page.");
                    }

                    c.setName(classroomName);
                    c.setAcademicPeriod(classroomAcademicPeriod);
                    c.setDescription(classroomDescription);
                    c.setStatusId(Classroom.ACTIVE);
                    c.setSchool(s);
                    
                    Set<Coder> sc = c.getStudents(StudentClassroom.PENDING_STATUS);
                    sc.addAll(c.getStudents(StudentClassroom.ACTIVE_STATUS));

                    // generate checked students collection
                    Set checkedStudents = new HashSet<Long>();
                    for (Coder coder : sc) {
                        checkedStudents.add(coder.getId());
                    }
                    getRequest().setAttribute("checked_students", checkedStudents);            
                    
                    getRequest().setAttribute("possible_students", getActiveUser().getProfessor().getStudents(s));            

                    log.debug("classroom's school: " + c.getSchool() == null ? null : c.getSchool().getName());

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

    private Long getAssignmentParam() throws TCWebException {
        String assignmentId = StringUtils.checkNull(getRequest().getParameter(Constants.ASSIGNMENT_ID));
        
        if (assignmentId == "") {
            return null;
        }

        Long id;
        try {
            id = Long.parseLong(assignmentId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid assignment (round) id");
        }
        
        return id;
    }

}
