/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.reports;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.SharedBaseProcessor;
import com.topcoder.web.ep.model.AssignmentScoreType;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;
import com.topcoder.web.ep.util.AssignmentReportRow;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: ProblemAssignmentReport.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class ProblemAssignmentReport extends SharedBaseProcessor {
    public static final Integer STUDENT_COL = 1;
    public static final Integer SCORE_COL = 2;
    public static final Integer NUM_TESTS_COL = 3;
    public static final Integer PERCENT_TESTS_COL = 4;
    
    @Override
    protected void professorProcessing() throws Exception {
        Round a = validateAssignment();
        Component cmp = validateComponent();
        
        // check if this assignment belongs to the logged professor
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find((Long) a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID));
        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }
        
        getRequest().setAttribute("selected_score_type", (Long) a.getProperty(RoundProperty.SCORE_TYPE_PROPERTY_ID));
        
        // generate report lines
        List<AssignmentReportRow> larr = processReport(a, c, cmp, null);
        commonPostProcessing(larr, a, c, cmp);
    }

    @Override
    protected void studentProcessing() throws Exception {
        Round a = validateAssignment();
        
        Component cmp = validateComponent();

        // check if this student belongs to the class
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find((Long) a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID));
        StudentClassroom sc = DAOUtil.getFactory().getStudentClassroomDAO().findActiveUsingStudentIdClassroomId(getUser().getId(), c.getId());
        Coder s = (sc != null) ? sc.getId().getStudent() : null;
        if (s == null) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // check viewing restrictions
        Long showAllCoders = (Long) a.getProperty(RoundProperty.SHOW_ALL_SCORES_PROPERTY_ID);
        Long studentId = null;
        if (!showAllCoders.equals(1l)) {
            // If show all is off, he can only see his results
            studentId = s.getId();
        }

        // generate report lines
        List<AssignmentReportRow> larr = processReport(a, c, cmp, studentId);

        // apply restrictions for students
        Long scoreType = (Long) a.getProperty(RoundProperty.SCORE_TYPE_PROPERTY_ID);
        applyStudentRestrictions(larr, scoreType);

        getRequest().setAttribute("score_type", scoreType);
        commonPostProcessing(larr, a, c, cmp);
    }

    protected List<AssignmentReportRow> processReport(Round a, Classroom c, Component cmp, Long studentId) throws Exception {
        ResultSetContainer rsc = getData(a.getId(), studentId, cmp.getId());
        List<AssignmentReportRow> larr = new ArrayList<AssignmentReportRow>();
        
        for (ResultSetRow rsr : rsc) {
            if (rsr.getItem("succeeded").getResultData() != null) {  
                larr.add(new AssignmentReportRow(
                    rsr.getLongItem("coder_id"), 
                    rsr.getStringItem("last_name") + ", " + rsr.getStringItem("first_name"),
                    rsr.getDoubleItem("points"),
                    rsr.getIntItem("succeeded"),
                    rsr.getLongItem("succeeded") * 100d / rsr.getLongItem("total")));
            } else {
                larr.add(new AssignmentReportRow(
                    rsr.getLongItem("coder_id"), 
                    rsr.getStringItem("last_name") + ", " + rsr.getStringItem("first_name"),
                    rsr.getDoubleItem("points"),
                    -1,
                    0d));
            }   
        }

        return larr;
    }

    private ResultSetContainer getData(Long roundId, Long coderId, Long componentId) throws TCWebException {
        try {
            Request r = new Request();
            String queryName;
            if (coderId == null) {
                queryName = "assignment_problem_results_all";
            } else {
                queryName = "assignment_problem_results_student";
                r.setProperty("cr", coderId.toString());
            }
            r.setContentHandle(queryName);
            r.setProperty("rd", roundId.toString());
            r.setProperty("compid", componentId.toString());

            DataAccessInt dai = getDataAccess();
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get(queryName);

            return rsc;
        } catch (Exception e) {
            throw new TCWebException("Could not get data from DB", e);
        }
    }

    private void commonPostProcessing(List<AssignmentReportRow> larr, Round a, Classroom c, Component cmp) {
        // sort results
        sortResult(larr);
        
        getRequest().setAttribute("results", larr);
        getRequest().setAttribute("assignment", a);
        getRequest().setAttribute("classroom", c);
        getRequest().setAttribute("component", cmp);
        getRequest().setAttribute("schoolName", c.getSchool().getName());                

        setNextPage("/reports/probAssignment.jsp");
        setIsNextPageInContext(true);
    }
    
    private void applyStudentRestrictions(List<AssignmentReportRow> larr, Long scoreType) {
        // we put a -999 there for sorting purpose, UI will take care of filtering that data

        for (AssignmentReportRow srr : larr) {
           if (scoreType.equals(AssignmentScoreType.TC_SCORE_TYPE)) {
               if (!srr.getNumTestsPassed().equals(-1)) {
                   srr.setNumTestsPassed(-999);
               }
               srr.setPercentTestsPassed(-999d);
           } else if (scoreType.equals(AssignmentScoreType.PASSED_SCORE_TYPE)) {
               srr.setScore(-999d);
               srr.setPercentTestsPassed(-999d);
           } else if (scoreType.equals(AssignmentScoreType.SUCCESS_FAIL_SCORE_TYPE)) {
               srr.setScore(-999d);
               if (!srr.getNumTestsPassed().equals(-1)) {
                   srr.setNumTestsPassed(-999);
               }
           }  
        }
    }

    private Round validateAssignment() throws TCWebException {
        // check if it's a valid assignment
        Round a = DAOUtil.getFactory().getRoundDAO().find(getAssignmentParam());
        if (a == null) {
            throw new TCWebException("Couldn't find assignment");
        }
        return a;
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
    

    private Component validateComponent() throws TCWebException {
        // check if it's a valid component
        Component cmp = DAOUtil.getFactory().getComponentDAO().find(getComponentParam());
        if (cmp == null) {
            throw new TCWebException("Couldn't find component");
        }
        return cmp;
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
                    return arg0.getScore().compareTo(arg1.getScore());
                }
            });
        } else if (NUM_TESTS_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<AssignmentReportRow>() {
                public int compare(AssignmentReportRow arg0, AssignmentReportRow arg1) {
                    return arg0.getNumTestsPassed().compareTo(arg1.getNumTestsPassed());
                }
            });
        } else if (PERCENT_TESTS_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<AssignmentReportRow>() {
                public int compare(AssignmentReportRow arg0, AssignmentReportRow arg1) {
                    return arg0.getPercentTestsPassed().compareTo(arg1.getPercentTestsPassed());
                }
            });
        } else {
            Collections.sort(larr, new Comparator<AssignmentReportRow>() {
                public int compare(AssignmentReportRow arg0, AssignmentReportRow arg1) {
                    return arg0.getStudent().toUpperCase().compareTo(arg1.getStudent().toUpperCase());
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
