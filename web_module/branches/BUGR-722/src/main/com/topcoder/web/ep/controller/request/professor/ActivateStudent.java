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
 * @version $Id: ActivateStudent.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class ActivateStudent extends StudentActivationBase {
    protected void process(Classroom c, List<StudentClassroom> lsc) {
        getRequest().setAttribute("classroom", c);
        getRequest().setAttribute("student_classrooms", lsc);
        setNextPage("/professor/activateStudentConfirm.jsp");
    }
}
