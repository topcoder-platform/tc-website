/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor.reports;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        // get all rounds for this classroom, student
        List<Round> lr = DAOUtil.getFactory().getClassroomDAO().getAssignmentsForStudent(classroomId, s.getId());

        // get and prepare system test results so they are available to construct the rows
        List<Object> systemTestResults = DAOUtil.getFactory().getSystemTestResultDAO().getSystemTestResultsByStudent(lr, s.getId());

        
        Map<Long, AssignmentTestResult> assignmentResults = new HashMap<Long, AssignmentTestResult>();
        
        for (Object o : systemTestResults ) {
            Object[] lo = (Object[]) o;
            Integer total = (Integer)lo[0];
            Integer succeeded = (Integer)lo[1];
            Long assignmentId = (Long)lo[2]; 
            Long componentId = (Long)lo[3];

            AssignmentTestResult atr;
            if (assignmentResults.containsKey(assignmentId)) {
                atr = assignmentResults.get(assignmentId);
            } else {
                atr = new AssignmentTestResult(assignmentId);
                assignmentResults.put(assignmentId, atr);
            }
            atr.setSucceeded(atr.getSucceeded() + succeeded);
            atr.setTotal(atr.getTotal() + total);
            
            atr.getComponentTestResults().put(componentId, new ComponentTestResult(componentId, total, succeeded));
        }

        // Iterate results and generate report
        List<ComponentState> l = DAOUtil.getFactory().getComponentStateDAO().getStudentResults(lr, s.getId());

        List<StudentReportRow> larr = new ArrayList<StudentReportRow>();
        if (l.size() > 0) {
            List<StudentReportDetailRow> lsrdr = new ArrayList<StudentReportDetailRow>();
            ComponentState oldCs = l.iterator().next();
            Double assignmentPoints = 0d;
            for (ComponentState cs : l) {
                if (!oldCs.getRound().getId().equals(cs.getRound().getId())) {
                    if (assignmentResults.containsKey(oldCs.getRound().getId())) {
                        larr.add(new StudentReportRow(oldCs.getRound().getId(), oldCs.getRound().getName(), assignmentPoints, 
                                assignmentResults.get(oldCs.getRound().getId()).getSucceeded(), 
                                assignmentResults.get(oldCs.getRound().getId()).getSucceeded() * 100d / assignmentResults.get(oldCs.getRound().getId()).getTotal(), 
                                lsrdr));
                    } else {
                        larr.add(new StudentReportRow(oldCs.getRound().getId(), oldCs.getRound().getName(), assignmentPoints, 
                                -1, 0d, lsrdr));
                    }

                    lsrdr = new ArrayList<StudentReportDetailRow>();
                    assignmentPoints = 0d;
                }

                if (assignmentResults.containsKey(cs.getRound().getId())) {
                    Map<Long, ComponentTestResult> componentTestResults = assignmentResults.get(cs.getRound().getId()).getComponentTestResults(); 
                    if (componentTestResults.containsKey(cs.getComponent().getId())) {
                        lsrdr.add(new StudentReportDetailRow(cs.getComponent().getId(), cs.getComponent().getProblem().getName(), cs.getPoints(), 
                                componentTestResults.get(cs.getComponent().getId()).getSucceeded(), 
                                componentTestResults.get(cs.getComponent().getId()).getSucceeded() * 100d / componentTestResults.get(cs.getComponent().getId()).getTotal()));
                    } else {
                        lsrdr.add(new StudentReportDetailRow(cs.getComponent().getId(), cs.getComponent().getProblem().getName(), cs.getPoints(), 
                            -1, 0d));
                    }
                } else {
                    lsrdr.add(new StudentReportDetailRow(cs.getComponent().getId(), cs.getComponent().getProblem().getName(), cs.getPoints(), 
                        -1, 0d));
                }
                    
                    
                assignmentPoints += cs.getPoints(); 
                oldCs = cs;
            }
            larr.add(new StudentReportRow(oldCs.getRound().getId(), oldCs.getRound().getName(), assignmentPoints, null, null, lsrdr));

            lsrdr = new ArrayList<StudentReportDetailRow>();
            assignmentPoints = 0d;
        }

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

    private class AssignmentTestResult {
        private Long assignmentId;
        private Integer total = 0;
        private Integer succeeded = 0;
        private Map<Long, ComponentTestResult> componentTestResults = new HashMap<Long, ComponentTestResult>();

        
        public AssignmentTestResult(Long assignmentId) {
            super();
            this.assignmentId = assignmentId;
        }
        /**
         * @return the assignmentId
         */
        public Long getAssignmentId() {
            return assignmentId;
        }
        /**
         * @param assignmentId the assignmentId to set
         */
        public void setAssignmentId(Long assignmentId) {
            this.assignmentId = assignmentId;
        }
        /**
         * @return the total
         */
        public Integer getTotal() {
            return total;
        }
        /**
         * @param total the total to set
         */
        public void setTotal(Integer total) {
            this.total = total;
        }
        /**
         * @return the succeeded
         */
        public Integer getSucceeded() {
            return succeeded;
        }
        /**
         * @param succeded the succeeded to set
         */
        public void setSucceeded(Integer succeeded) {
            this.succeeded = succeeded;
        }
        /**
         * @return the componentTestResults
         */
        public Map<Long, ComponentTestResult> getComponentTestResults() {
            return componentTestResults;
        }
        /**
         * @param componentTestResults the componentTestResults to set
         */
        public void setComponentTestResults(
                Map<Long, ComponentTestResult> componentTestResults) {
            this.componentTestResults = componentTestResults;
        }
        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result
                    + ((assignmentId == null) ? 0 : assignmentId.hashCode());
            return result;
        }
        /* (non-Javadoc)
         * @see java.lang.Object#equals(java.lang.Object)
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            final AssignmentTestResult other = (AssignmentTestResult) obj;
            if (assignmentId == null) {
                if (other.assignmentId != null)
                    return false;
            } else if (!assignmentId.equals(other.assignmentId))
                return false;
            return true;
        }
        
        
    }

    private class ComponentTestResult {
        private Long componentId;
        private Integer total;
        private Integer succeeded;

        public ComponentTestResult(Long componentId, Integer total,
                Integer succeeded) {
            super();
            this.componentId = componentId;
            this.total = total;
            this.succeeded = succeeded;
        }
        /**
         * @return the total
         */
        public Integer getTotal() {
            return total;
        }
        /**
         * @param total the total to set
         */
        public void setTotal(Integer total) {
            this.total = total;
        }
        /**
         * @return the succeeded
         */
        public Integer getSucceeded() {
            return succeeded;
        }
        /**
         * @param succeded the succeeded to set
         */
        public void setSucceeded(Integer succeeded) {
            this.succeeded = succeeded;
        }
        /**
         * @return the componentId
         */
        public Long getComponentId() {
            return componentId;
        }
        /**
         * @param componentId the componentId to set
         */
        public void setComponentId(Long componentId) {
            this.componentId = componentId;
        }
        
        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result
                    + ((componentId == null) ? 0 : componentId.hashCode());
            return result;
        }
        /* (non-Javadoc)
         * @see java.lang.Object#equals(java.lang.Object)
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            final ComponentTestResult other = (ComponentTestResult) obj;
            if (componentId == null) {
                if (other.componentId != null)
                    return false;
            } else if (!componentId.equals(other.componentId))
                return false;
            return true;
        }
        
        
    }
}
