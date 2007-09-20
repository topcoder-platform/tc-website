/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import com.topcoder.web.common.model.educ.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class DeactivateStudent extends StudentActivationBase {
    protected void process(StudentClassroom sc) {
        getRequest().setAttribute("student_classroom", sc);
        setNextPage("/professor/deactivateStudentConfirm.jsp");
    }
}
