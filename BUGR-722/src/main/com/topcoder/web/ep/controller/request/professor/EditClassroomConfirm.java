/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.model.Classroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: EditClassroomConfirm.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class EditClassroomConfirm extends LongBase {

    private static Logger log = Logger.getLogger(EditClassroomConfirm.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongBase#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        this.sessionPrefix = "ec_";
        Classroom c = getClassroom();
        if (c == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/education");
        } else {            
            // get selection
            String[] values = getRequest().getParameterValues(Constants.STUDENT_ID);
            
            // add selected students to the session
            List<Coder> selectedStudents;
            if (values != null) {
                selectedStudents = new ArrayList<Coder>(values.length); 
                for (String value : values) {
                    Coder s = null;
                    if (value != null) {
                        try {
                            s = getFactory().getCoderDAO().find(Long.parseLong(value));
                        } catch (NumberFormatException e) {
                            // just drop this selection
                        }
                        selectedStudents.add(s);
                    }
                }
            } else {
                selectedStudents = new ArrayList<Coder>();
            }
            setSelectedStudents(selectedStudents);

            getRequest().setAttribute("schoolName", c.getSchool().getName());                

            setNextPage("/professor/editClassroomConfirm.jsp");
            setIsNextPageInContext(true);            
        }        
    }
}
