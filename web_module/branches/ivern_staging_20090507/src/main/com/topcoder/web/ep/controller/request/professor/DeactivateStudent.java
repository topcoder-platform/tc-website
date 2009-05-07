/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.List;

import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class DeactivateStudent extends StudentActivationBase {
    protected void process(Classroom c, List<StudentClassroom> lsc) {
        getRequest().setAttribute("classroom", c);
        getRequest().setAttribute("student_classrooms", lsc);
        setNextPage("/professor/deactivateStudentConfirm.jsp");
    }
}
