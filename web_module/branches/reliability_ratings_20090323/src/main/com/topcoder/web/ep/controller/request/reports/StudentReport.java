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
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.SharedBaseProcessor;
import com.topcoder.web.ep.model.AssignmentScoreType;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;
import com.topcoder.web.ep.util.StudentReportDetailRow;
import com.topcoder.web.ep.util.StudentReportRow;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StudentReport extends SharedBaseProcessor {
    public static final Integer ASSIGNMENT_COL = 1;
    public static final Integer SCORE_COL = 2;
    public static final Integer NUM_TESTS_COL = 3;
    public static final Integer PERCENT_TESTS_COL = 4;

    private static Logger log = Logger.getLogger(StudentReport.class);

    @Override
    protected void professorProcessing() throws Exception {
        Classroom c = validateClassroom();
        Coder s = validateStudent(c);

        // check if this classroom belongs to the logged professor
        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // generate report lines
        List<StudentReportRow> larr = processReport(c, s);

        getRequest().setAttribute("is_student", Boolean.FALSE);
        commonPostProcessing(c, s, larr);
        
    }

    @Override
    protected void studentProcessing() throws Exception {
        Classroom c = validateClassroom();
        Coder s = validateStudent(c);

        // check if the logged student belongs to this classroom 
        if (DAOUtil.getFactory().getStudentClassroomDAO().findActiveUsingStudentIdClassroomId(getUser().getId(), c.getId()) == null) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // generate report lines
        List<StudentReportRow> larr = processReport(c, s);

        // apply viewing restrictions for students
        applyStudentRestrictions(s, larr);

        getRequest().setAttribute("is_student", Boolean.TRUE);
        commonPostProcessing(c, s, larr);
    }

    protected List<StudentReportRow> processReport(Classroom c, Coder s) throws Exception {
        ResultSetContainer rsc = getData(c.getId(), s.getId());
        
        StudentReportRow srr = null;
        List<StudentReportRow> larr = new ArrayList<StudentReportRow>();
        List<StudentReportDetailRow> lsrdr = new ArrayList<StudentReportDetailRow>();
        Long oldAssignment = -1l;
        Double totalScore = 0d;
        Integer totalTests = 0;
        Integer totalNumPassed = -1;
        boolean firstTime = true;
        for (ResultSetRow rsr : rsc) {
            Long assignmentId = rsr.getLongItem("round_id");
            String assignmentName = rsr.getStringItem("round_name");
            Long componentId = rsr.getLongItem("component_id");
            String problemName = rsr.getStringItem("problem_name");
            Double points = rsr.getDoubleItem("points");
            Double possiblePoints = rsr.getDoubleItem("possible_points");
            Integer total = rsr.getIntItem("total");
            Integer succeeded = (rsr.getItem("succeeded").getResultData() == null) ? null : rsr.getIntItem("succeeded"); 
            Long showAll = rsr.getLongItem("show_all");
            Long scoreType = rsr.getLongItem("score_type");
            
            if (!oldAssignment.equals(assignmentId)) {
                if (!firstTime) {
                    srr.setAssignmentScore(totalScore);
                    srr.setAssignmentNumTestsPassed(totalNumPassed);
                    srr.setAssignmentPercentTestsPassed(totalNumPassed * 100d / totalTests);
                    srr.setDetails(lsrdr);
                    larr.add(srr);
                }
                
                srr = new StudentReportRow(assignmentId,assignmentName,0d,0,0d,showAll,scoreType,null);
                    
                totalScore = 0d;
                totalNumPassed = -1;
                totalTests = 0;
                
                lsrdr = new ArrayList<StudentReportDetailRow>();
            }

            if (succeeded != null) {
                lsrdr.add(new StudentReportDetailRow(componentId,problemName,points,possiblePoints,succeeded,succeeded * 100d / total));
                if (totalNumPassed.equals(-1)) {
                    totalNumPassed = succeeded;
                } else {
                    totalNumPassed += succeeded;
                }
            } else {
                lsrdr.add(new StudentReportDetailRow(componentId,problemName,points,possiblePoints,-1,0d));
            }

            totalTests += total;
            totalScore += points;

            oldAssignment = assignmentId;
            firstTime = false;
        }
        if (rsc.size() > 0) {
            srr.setAssignmentScore(totalScore);
            srr.setAssignmentNumTestsPassed(totalNumPassed);
            srr.setAssignmentPercentTestsPassed(totalNumPassed * 100d / totalTests);
            srr.setDetails(lsrdr);
            larr.add(srr);
        }

        return larr;
    }

    private ResultSetContainer getData(Long classroomId, Long coderId) throws TCWebException {
        try {
            Request r = new Request();
            String queryName = "student_results_all";

            r.setContentHandle(queryName);
            r.setProperty("clsid", classroomId.toString());
            r.setProperty("cr", coderId.toString());

            DataAccessInt dai = getDataAccess();
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get(queryName);

            return rsc;
        } catch (Exception e) {
            throw new TCWebException("Could not get data from DB", e);
        }
    }

    private Coder validateStudent(Classroom c) throws TCWebException {
        StudentClassroom sc = DAOUtil.getFactory().getStudentClassroomDAO().findUsingStudentIdClassroomId(getStudentParam(), c.getId());
        Coder s = (sc != null) ? sc.getId().getStudent() : null;
        if (s == null) {
            throw new TCWebException("Couldn't find student");
        }
        return s;
    }

    private Classroom validateClassroom() throws TCWebException {
        // check if it's a valid classroom
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find(getClassroomParam());
        if (c == null) {
            throw new TCWebException("Couldn't find classroom");
        }
        return c;
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

    private void applyStudentRestrictions(Coder s, List<StudentReportRow> larr) {
        // if the student is seeing his report, do nothing, otherwise remove rows that cannot be shown
        if (!s.getId().equals(getUser().getId())) {
            List<StudentReportRow> remove = new ArrayList<StudentReportRow>();
            for (StudentReportRow srr : larr) {
                if (!srr.getShowAllCoders().equals(1l)) {
                    remove.add(srr);
                }
            }
            larr.removeAll(remove);
        }

        // we put a -999 there for sorting purpose, UI will take care of filtering that data
        for (StudentReportRow srr : larr) {
           if (srr.getScoreType().equals(AssignmentScoreType.TC_SCORE_TYPE)) {
               if (!srr.getAssignmentNumTestsPassed().equals(-1)) {
                   srr.setAssignmentNumTestsPassed(-999);
               }
               srr.setAssignmentPercentTestsPassed(-999d);
           } else if (srr.getScoreType().equals(AssignmentScoreType.PASSED_SCORE_TYPE)) {
               srr.setAssignmentScore(-999d);
               srr.setAssignmentPercentTestsPassed(-999d);
           } else if (srr.getScoreType().equals(AssignmentScoreType.SUCCESS_FAIL_SCORE_TYPE)) {
               srr.setAssignmentScore(-999d);
               if (!srr.getAssignmentNumTestsPassed().equals(-1)) {
                   srr.setAssignmentNumTestsPassed(-999);
               }
           }  
        }
    }

    private void commonPostProcessing(Classroom c, Coder s, List<StudentReportRow> larr) {
        // sort results
        sortResult(larr);
        
        getRequest().setAttribute("results", larr);
        getRequest().setAttribute("student", s);
        getRequest().setAttribute("classroom", c);
        getRequest().setAttribute("schoolName", c.getSchool().getName());                

        setNextPage("/reports/student.jsp");
        setIsNextPageInContext(true);
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
                    return arg0.getAssignmentScore().compareTo(arg1.getAssignmentScore());
                }
            });
        } else if (NUM_TESTS_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<StudentReportRow>() {
                public int compare(StudentReportRow arg0, StudentReportRow arg1) {
                    return arg0.getAssignmentNumTestsPassed().compareTo(arg1.getAssignmentNumTestsPassed());
                }
            });
        } else if (PERCENT_TESTS_COL.toString().equals(sortCol)) {
            Collections.sort(larr, new Comparator<StudentReportRow>() {
                public int compare(StudentReportRow arg0, StudentReportRow arg1) {
                    return arg0.getAssignmentPercentTestsPassed().compareTo(arg1.getAssignmentPercentTestsPassed());
                }
            });
        } else {
            Collections.sort(larr, new Comparator<StudentReportRow>() {
                public int compare(StudentReportRow arg0, StudentReportRow arg1) {
                    return arg0.getAssignment().toUpperCase().compareTo(arg1.getAssignment().toUpperCase());
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
