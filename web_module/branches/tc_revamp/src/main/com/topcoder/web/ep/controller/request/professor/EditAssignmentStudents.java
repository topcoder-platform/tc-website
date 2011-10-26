/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.algo.RoundRegistration;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: EditAssignmentStudents.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class EditAssignmentStudents extends ShortHibernateProcessor {

    private static Logger log = Logger.getLogger(EditAssignmentStudents.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.ShortHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Edit assignment students called...");
        if (userLoggedIn()) {
            Long assignmentId = getAssignmentParam();

            if (DAOUtil.getFactory().getSchoolDAO().findSchoolsUsingProfessorId(getUser().getId()).isEmpty()) {
                throw new TCWebException("No active schools for this professor");
            }

            Round a = DAOUtil.getFactory().getRoundDAO().find(assignmentId);

            if (a == null) {
                throw new TCWebException("Couldn't find assignment");
            }

            // check if this classroom belongs to the active user
            Object classroomProperty = a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID);
            if (classroomProperty == null) {
                throw new TCWebException("The assignment has an invalid classroom id");
            }
            Classroom c = checkValidClassroom((Long) classroomProperty);

            getRequest().setAttribute("schoolName", c.getSchool().getName());                

            // if the assignment ended, registrations cannot be updated 
            if ((new Date()).after(a.getContest().getEndDate())) {
                throw new NavigationException("The assignment has ended, you cannot assign students at this time");
            }

            if (!"POST".equals(getRequest().getMethod())) {
                log.debug("First pass - " + getUser().getUserName());

                getRequest().setAttribute("activeStudents", DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.ACTIVE_STATUS));
                getRequest().setAttribute(Constants.ASSIGNMENT_ID, a.getId());
                getRequest().setAttribute(Constants.CLASSROOM, c);
                getRequest().setAttribute("assignment_name", a.getName());

                List<Long> checkedStudents = new ArrayList<Long>();
                for (RoundRegistration rr : a.getRoundRegistrations()) {
                    checkedStudents.add(rr.getId().getCoder().getId());
                }

                getRequest().setAttribute("checked_students", checkedStudents);

                setNextPage("/professor/editAssignmentStudents.jsp");
                setIsNextPageInContext(true);
            } else {
                log.debug("Second pass - " + getUser().getUserName());
                if (userLoggedIn()) {
                    // got a response, validate.
                    List<Long> studentIds = getStudentParam();

                    // if the assignment has started or about to start validate if non selected users can be removed                    
                    if ((new Timestamp((new Date()).getTime() + Constants.TIME_BEFORE_EDIT)).after(a.getContest().getStartDate())) {
                        // cannot remove students, check if there's any to remove
                        for (RoundRegistration rr : a.getRoundRegistrations()) {
                            if (!studentIds.contains(rr.getId().getCoder().getId())) {
                                // this means the professor took someone out, add error
                                addError("error", "The assignment is about to start or has already started and therefore students cannot be removed");
                                break;
                            }
                        }
                    }

                    // validate if the selected students are active students
                    List<Coder> students = new ArrayList<Coder>();
                    for (Long studentId : studentIds) {
                        StudentClassroom sc = DAOUtil.getFactory().getStudentClassroomDAO().findActiveUsingStudentIdClassroomId(studentId, c.getId());
                        Coder s = (sc != null) ? sc.getId().getStudent() : null;
                        if (s == null) {
                            throw new TCWebException("Invalid student selected");
                        } else {
                            students.add(s);
                        }
                    }

                    getRequest().setAttribute(Constants.ASSIGNMENT_ID, a.getId());
                    getRequest().setAttribute("assignment_name", a.getName());

                    if (!hasErrors()) {
                        getRequest().setAttribute(Constants.STUDENTS, students);

                        // next step, confirmation.
                        setNextPage("/professor/editAssignmentStudentsConfirm.jsp");
                        setIsNextPageInContext(true);
                    } else {
                        getRequest().setAttribute(Constants.CLASSROOM, c);
                        getRequest().setAttribute("checked_students", studentIds);
                        getRequest().setAttribute("activeStudents", DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.ACTIVE_STATUS));

                        setNextPage("/professor/editAssignmentStudents.jsp");
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

    private Classroom checkValidClassroom(Long classroomId) throws NavigationException {
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);

        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }
        return c;
    }

    private Long getAssignmentParam() throws TCWebException {
        String assignmentId = StringUtils.checkNull(getRequest().getParameter(Constants.ASSIGNMENT_ID));

        if (assignmentId.equals("")) {
            throw new TCWebException("Missing assignment (round) id");
        }

        Long id;
        try {
            id = Long.parseLong(assignmentId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid assignment (round) id");
        }

        return id;
    }

    private List<Long> getStudentParam() throws TCWebException {
        String[] values = getRequest().getParameterValues(Constants.STUDENT_ID);
        List<Long> ids = new ArrayList<Long>();

        if (values != null) {
            for (String value : values) {
                Long id;
                try {
                    id = Long.parseLong(value);
                    log.debug("value: " + id);
                } catch (NumberFormatException e) {
                    throw new TCWebException("Invalid student id");
                }
                ids.add(id);
            }
        }

        return ids;
    }

}

