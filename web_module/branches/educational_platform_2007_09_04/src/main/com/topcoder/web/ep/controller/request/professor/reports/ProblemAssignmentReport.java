/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor.reports;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ProblemAssignmentReport extends ShortHibernateProcessor {
    public static final Integer STUDENT_COL = 1;
    public static final Integer SCORE_COL = 2;
    public static final Integer NUM_TESTS_COL = 3;
    public static final Integer PERCENT_TESTS_COL = 4;
    
    @Override
    protected void dbProcessing() throws Exception {
        // get classroom parameter
        Long assignmentId = getAssignmentParam();

        // get component parameter
        Long componentId = getComponentParam();

        // check if it's a valid assignment
        Round a = DAOUtil.getFactory().getRoundDAO().find(assignmentId);
        if (a == null) {
            throw new TCWebException("Couldn't find assignment");
        }
        
        // check if it's a valid component
        Component cmp = DAOUtil.getFactory().getComponentDAO().find(componentId);
        if (cmp == null) {
            throw new TCWebException("Couldn't find component");
        }
        
        // check if this assignment belongs to the logged professor
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find((Long) a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID));
        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // we need assignment and component results (problem score, #tests passed, %tests passed)
        // get the room
        // Iterate results and generate report
        List<Object> l = DAOUtil.getFactory().getComponentStateDAO().getResultsSummary(a.getId(), cmp.getId());

        List<AssignmentReportRow> larr = new ArrayList<AssignmentReportRow>();
        for (Object o : l) {
            Object[] lo = (Object[]) o; 
            larr.add(new AssignmentReportRow((String)lo[0] + ", " + (String)lo[1], (Double)lo[2], null, null));
        }

        // now we need to get tests results
        // TODO
        
        // sort results
        sortResult(larr);
        
        getRequest().setAttribute("results", larr);
        getRequest().setAttribute("assignment", a);
        getRequest().setAttribute("classroom", c);
        getRequest().setAttribute("component", cmp);
        
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
    
    private Long getComponentParam() throws TCWebException {
        String componentId = StringUtils.checkNull(getRequest().getParameter(Constants.COMPONENT_ID));

        if (componentId.equals("")) {
            throw new TCWebException("Invalid component id");
        }

        Long id;
        try {
            id = Long.parseLong(componentId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid component id");
        }

        return id;
    }
    
    private void sortResult(List<AssignmentReportRow> larr) {
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        
        if (sortDir.equals("")) {
            sortCol = "asc";
        }
        
        if (sortCol.equals("")) {
            sortCol = STUDENT_COL.toString();
        }
        
        setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
        setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);

        if (SCORE_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<AssignmentReportRow>() {
                public int compare(AssignmentReportRow arg0, AssignmentReportRow arg1) {
                    return arg1.getScore().compareTo(arg0.getScore());
                }
            });
        } else if (NUM_TESTS_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<AssignmentReportRow>() {
                public int compare(AssignmentReportRow arg0, AssignmentReportRow arg1) {
                    return arg1.getNumTestsPassed().compareTo(arg0.getNumTestsPassed());
                }
            });
        } else if (PERCENT_TESTS_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<AssignmentReportRow>() {
                public int compare(AssignmentReportRow arg0, AssignmentReportRow arg1) {
                    return arg1.getPercentTestsPassed().compareTo(arg0.getPercentTestsPassed());
                }
            });
        } else {
            Collections.sort(larr, new Comparator<AssignmentReportRow>() {
                public int compare(AssignmentReportRow arg0, AssignmentReportRow arg1) {
                    return arg1.getStudent().compareTo(arg0.getStudent());
                }
            });
        }
        
        if (sortDir.equals("desc")) {
            Collections.reverse(larr);
        }
        
        setSortInfo();
    }

    
    protected void setSortInfo() {
        SortInfo s = new SortInfo();
        s.addDefault(STUDENT_COL, "asc");
        s.addDefault(SCORE_COL, "desc");
        s.addDefault(NUM_TESTS_COL, "desc");
        s.addDefault(PERCENT_TESTS_COL, "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}
