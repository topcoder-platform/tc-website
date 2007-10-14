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
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.model.algo.ComponentState;
import com.topcoder.web.common.model.algo.RoomResult;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StudentReport extends ShortHibernateProcessor {
    public static final Integer ASSIGNMENT_COL = 1;
    public static final Integer SCORE_COL = 2;
    public static final Integer NUM_TESTS_COL = 3;
    public static final Integer PERCENT_TESTS_COL = 4;
    
    @Override
    protected void dbProcessing() throws Exception {
        // get classroom parameter
        Long classroomId = getClassroomParam();
        
        // check if it's a valid classroom
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);
        if (c == null) {
            throw new TCWebException("Couldn't find classroom");
        }
        
        // check if this classroom belongs to the logged professor
        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // get student parameter
        Long studentId = getStudentParam();
        
        // check if it's a valid student
        Coder s = c.getStudent(studentId);
        if (s == null) {
            throw new TCWebException("Couldn't find student");
        }
        
        // Iterate results and generate report
        List<Round> lr = DAOUtil.getFactory().getClassroomDAO().getAssignmentsForStudent(classroomId, s.getId());

        List<ComponentState> l = DAOUtil.getFactory().getComponentStateDAO().getStudentResults(lr, s.getId());

        List<StudentReportRow> larr = new ArrayList<StudentReportRow>();
        if (l.size() > 0) {
            List<StudentReportDetailRow> lsrdr = new ArrayList<StudentReportDetailRow>();
            ComponentState oldCs = l.iterator().next();
            Double assignmentPoints = 0d;
            for (ComponentState cs : l) {
                if (!oldCs.getRound().getId().equals(cs.getRound().getId())) {
                    larr.add(new StudentReportRow(oldCs.getRound().getId(), oldCs.getRound().getName(), assignmentPoints, null, null, lsrdr));

                    lsrdr = new ArrayList<StudentReportDetailRow>();
                    assignmentPoints = 0d;
                }

                lsrdr.add(new StudentReportDetailRow(cs.getComponent().getId(), cs.getComponent().getProblem().getName(),
                        cs.getPoints(), null, null));
                assignmentPoints += cs.getPoints(); 
                oldCs = cs;
            }
            larr.add(new StudentReportRow(oldCs.getRound().getId(), oldCs.getRound().getName(), assignmentPoints, null, null, lsrdr));

            lsrdr = new ArrayList<StudentReportDetailRow>();
            assignmentPoints = 0d;
        }

        // now we need to get tests results
        // TODO
        
        // sort results
        sortResult(larr);
        
        getRequest().setAttribute("results", larr);
        getRequest().setAttribute("student", s);
        getRequest().setAttribute("classroom", c);
        
        setNextPage("/reports/student.jsp");
        setIsNextPageInContext(true);
    }

    private Long getClassroomParam() throws TCWebException {
        String classroomId = StringUtils.checkNull(getRequest().getParameter(Constants.CLASSROOM_ID));

        if (classroomId.equals("")) {
            throw new TCWebException("Invalid classroom id");
        }

        Long id;
        try {
            id = Long.parseLong(classroomId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid classroom id");
        }

        return id;
    }

    private Long getStudentParam() throws TCWebException {
        String studentId = StringUtils.checkNull(getRequest().getParameter(Constants.STUDENT_ID));

        if (studentId.equals("")) {
            throw new TCWebException("Invalid student id");
        }

        Long id;
        try {
            id = Long.parseLong(studentId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid student id");
        }

        return id;
    }
    
    private void sortResult(List<StudentReportRow> larr) {
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        
        if (sortDir.equals("")) {
            sortCol = "asc";
        }
        
        if (sortCol.equals("")) {
            sortCol = ASSIGNMENT_COL.toString();
        }
        
        setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
        setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);

        if (SCORE_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<StudentReportRow>() {
                public int compare(StudentReportRow arg0, StudentReportRow arg1) {
                    return arg1.getAssignmentScore().compareTo(arg0.getAssignmentScore());
                }
            });
        } else if (NUM_TESTS_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<StudentReportRow>() {
                public int compare(StudentReportRow arg0, StudentReportRow arg1) {
                    return arg1.getAssignmentNumTestsPassed().compareTo(arg0.getAssignmentNumTestsPassed());
                }
            });
        } else if (PERCENT_TESTS_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<StudentReportRow>() {
                public int compare(StudentReportRow arg0, StudentReportRow arg1) {
                    return arg1.getAssignmentPercentTestsPassed().compareTo(arg0.getAssignmentPercentTestsPassed());
                }
            });
        } else {
            Collections.sort(larr, new Comparator<StudentReportRow>() {
                public int compare(StudentReportRow arg0, StudentReportRow arg1) {
                    return arg1.getAssignment().toUpperCase().compareTo(arg0.getAssignment().toUpperCase());
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
        s.addDefault(ASSIGNMENT_COL, "asc");
        s.addDefault(SCORE_COL, "desc");
        s.addDefault(NUM_TESTS_COL, "desc");
        s.addDefault(PERCENT_TESTS_COL, "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}
