/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor.reports;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.algo.Room;
import com.topcoder.web.common.model.algo.RoomResult;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class AssignmentReport extends ShortHibernateProcessor {
    @Override
    protected void dbProcessing() throws Exception {
        // get classroom parameter
        Long assignmentId = getAssignmentParam();
        
        // check if it's a valid assignment
        Round a = DAOUtil.getFactory().getRoundDAO().find(assignmentId);
        if (a == null) {
            throw new TCWebException("Couldn't find assignment");
        }
        
        // check if this assignment belongs to the logged professor
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find((Long) a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID));
        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // we need assignment and results (problem score, #tests passed, %tests passed)
        // get the room
        Room rm = a.getRooms().iterator().next();
        
        // Iterate results and generate report
        List<Object> l = DAOUtil.getFactory().getRoomResultDAO().getResultsSummary(rm.getId());

        List<AssignmentReportRow> larr = new ArrayList<AssignmentReportRow>();
        for (Object o : l) {
            Object[] lo = (Object[]) o; 
            larr.add(new AssignmentReportRow((String)lo[0] + ", " + (String)lo[1], (Double)lo[2], null, null));
        }

        // now we need to get tests results
        // TODO
        
        getRequest().setAttribute("results", larr);
        getRequest().setAttribute("assignment", a);
        getRequest().setAttribute("classroom", c);
        
        setNextPage("/reports/assignment.jsp");
        setIsNextPageInContext(true);
    }
    
    private Long getAssignmentParam() throws TCWebException {
        String assignmentId = StringUtils.checkNull(getRequest().getParameter(Constants.ASSIGNMENT_ID));

        if (assignmentId.equals("")) {
            throw new TCWebException("Invalid assignment id");
        }

        Long id;
        try {
            id = Long.parseLong(assignmentId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid assignment id");
        }

        return id;
    }
}
