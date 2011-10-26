/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

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
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.School;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: EditClassroom.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class EditClassroom extends LongBase {

    private static Logger log = Logger.getLogger(EditClassroom.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongBase#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        this.sessionPrefix = "ec_";

        log.debug("Edit Classroom called...");
        if (userLoggedIn()) {
            log.debug("User identified - " + getUser().getUserName());

            if (!"POST".equals(getRequest().getMethod())) {
                log.debug("First pass - " + getUser().getUserName());

                if (DAOUtil.getFactory().getSchoolDAO().findSchoolsUsingProfessorId(getUser().getId()).isEmpty()) {
                    throw new TCWebException("No active schools for this professor");
                }

                // new or edit
                Long classroomId = getClassroomParam();

                Classroom c;
                if (classroomId != null) {
                    // check if this classroom belongs to the active user
                    c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);
                    getRequest().setAttribute("schoolName", c.getSchool().getName());                

                    if (!c.getProfessor().getId().equals(getUser().getId())) {
                        throw new NavigationException("You don't have permission to see this page.");
                    }

                    setDefault(Constants.SCHOOL_ID, c.getSchool().getId());
                    setDefault("classroom_name", c.getName());
                    setDefault("classroom_academic_period", c.getAcademicPeriod());
                    setDefault("classroom_description", c.getDescription());
                } else {
                    c = new Classroom();
                    c.setProfessor(DAOUtil.getFactory().getProfessorDAO().find(getUser().getId()));
                }

                // prepare stuff for the long transaction
                clearSession();
                setClassroom(c);

                setNextPage("/professor/editClassroom.jsp");
                setIsNextPageInContext(true);
            } else {
                log.debug("Second pass - " + getUser().getUserName());
                Classroom c = getClassroom();

                if (c == null) {
                    throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/education");
                } else {
                    Long schoolId = getSchoolParam();
                    School s = null;
                    if (schoolId == null) {
                        addError("error", "Please select a school");
                    } else {
                        s = findProfessorSchool(schoolId);
                        if (s == null) {
                            throw new TCWebException("Invalid school id " + schoolId);
                        }
                    }

                    String classroomName = StringUtils.checkNull(getRequest().getParameter("classroom_name"));
                    if (classroomName.equals("")) {
                        addError("error", "Please enter a name");
                    }
                    String classroomAcademicPeriod = StringUtils.checkNull(getRequest().getParameter("classroom_academic_period"));
                    if (classroomAcademicPeriod.equals("")) {
                        addError("error", "Please enter a academic period");
                    }
                    String classroomDescription = StringUtils.checkNull(getRequest().getParameter("classroom_description"));
                    if (classroomDescription.equals("")) {
                        addError("error", "Please enter a description");
                    }
                    // got a response, validate.

                    // check there's no other classroom with the same name, academic period in the same school.
                    if (s != null) {
                        List<Classroom> others = DAOUtil.getFactory().getClassroomDAO().findClassroomUsingNameAndPeriod(s.getId(), classroomName, classroomAcademicPeriod);
                        // check if it's not finding the edited classroom
                        if (others.size() > 0) { 
                            if (c.getId() == null) {
                                addError("error", "This classroom / academic period already exists");
                            } else {
                                if (others.size() > 1 || !c.getId().equals(others.iterator().next().getId())) {
                                    addError("error", "This classroom already exists");
                                }
                            }
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

                        List<Coder> sc = new ArrayList<Coder>();
                        if (c.getId() != null) {
                            sc = DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.PENDING_STATUS);
                            sc.addAll(DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.ACTIVE_STATUS));
                        }
                        
                        List<Coder> ps = DAOUtil.getFactory().getStudentClassroomDAO().findUsingProfessorIdSchoolId(c.getProfessor().getId(), s.getId());

                        // if editing or no student to select, we go directly to the confirmation
                        if (c.getId() == null && (sc.size() > 0 || ps.size() > 0)) {
                            // generate checked students collection
                            Set<Long> checkedStudents = new HashSet<Long>();
                            for (Coder coder : sc) {
                                checkedStudents.add(coder.getId());
                            }
                            getRequest().setAttribute("checked_students", checkedStudents);

                            getRequest().setAttribute("possible_students", ps);

                            log.debug("classroom's school: " + c.getSchool() == null ? null : c.getSchool().getName());

                            // next step, students.
                            setNextPage("/professor/selectStudents.jsp");
                            setIsNextPageInContext(true);
                        } else {
                            // if this is their first class and there are no students to select, go directly to the confirmation
                            setSelectedStudents(new ArrayList<Coder>());

                            setNextPage("/professor/editClassroomConfirm.jsp");
                            setIsNextPageInContext(true);
                        }
                    } else {
                        setDefault("classroom_name", classroomName);
                        setDefault("classroom_academic_period", classroomAcademicPeriod);
                        setDefault("classroom_description", classroomDescription);

                        setNextPage("/professor/editClassroom.jsp");
                        setIsNextPageInContext(true);
                    }
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

    private School findProfessorSchool(Long schoolId) {
        School s = null;
        List<School> ls = DAOUtil.getFactory().getSchoolDAO().findSchoolsUsingProfessorId(getUser().getId());
        for (School sc : ls) {
            if (sc.getId().equals(schoolId)) {
                s = sc;
            }
        }
        return s;
    }

    private Long getClassroomParam() throws TCWebException {
        String classroomId = StringUtils.checkNull(getRequest().getParameter(Constants.CLASSROOM_ID));

        if (classroomId.equals("")) {
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

    private Long getSchoolParam() throws TCWebException {
        String schoolId = StringUtils.checkNull(getRequest().getParameter(Constants.SCHOOL_ID));

        if (schoolId.equals("")) {
            return null;
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
