/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.ArenaServicesFactory;
import com.topcoder.web.ep.controller.request.LongBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditAssignmentStudentsSubmit extends LongBase {

    private static Logger log = Logger.getLogger(EditAssignmentStudentsSubmit.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Edit assignment students submit called...");
        if (userLoggedIn()) {
            User u = getActiveUser();
            log.debug("User identified - " + u.getHandle());

            Long assignmentId = getAssignmentParam();

            //todo change this to only count professor associations, not all
            if (u.getSchools().isEmpty()) {
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


            if (!"POST".equals(getRequest().getMethod())) {
                // user shouldn't get here with a get
                throw new TCWebException("Invalid request");
            } else {
                // got a response, validate.
                List<Long> studentIds = getStudentParam();

                // TODO: validate if non selected users can be removed

                // validate if the selected students are active students
                for (Long studentId : studentIds) {
                    Coder s = c.getStudent(studentId);
                    if (s == null) {
                        throw new TCWebException("Invalid student selected");
                    }
                }

                ArenaServicesFactory.getArenaServices().updateRoundRegistration(assignmentId, studentIds);

                getRequest().setAttribute("message", "You have successfuly updated students registration for assignment " + a.getName());
                getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, "/ep//?module=ViewClassroomAssignments&clsid=" + c.getId());
                setNextPage("/message.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }


    /**
     * @param classroomId
     * @return
     * @throws NavigationException
     */
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
                } catch (NumberFormatException e) {
                    throw new TCWebException("Invalid student id");
                }
                ids.add(id);
            }
        }

        return ids;
    }

}

