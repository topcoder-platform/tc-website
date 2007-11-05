/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.reports;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TimeZone;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.ComponentState;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.algo.Submission;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.SharedBaseProcessor;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;
import com.topcoder.web.ep.util.SystemTestRow;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewSubmission extends SharedBaseProcessor {
    public static final Integer STUDENT_COL = 1;
    public static final Integer SCORE_COL = 2;
    public static final Integer NUM_TESTS_COL = 3;
    public static final Integer PERCENT_TESTS_COL = 4;
    
    @Override
    protected void professorProcessing() throws Exception {
        // check if it's a valid assignment
        Round a = validateAssignment();

        // check if this assignment belongs to the logged student
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find((Long) a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID));
        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // check if it's a valid student
        StudentClassroom sc = DAOUtil.getFactory().getStudentClassroomDAO().findUsingStudentIdClassroomId(getStudentParam(), c.getId());
        Coder s = (sc != null) ? sc.getId().getStudent() : null;

        if (s == null) {
            throw new TCWebException("Couldn't find student");
        }

        commonProcessing(a, c, s);
    }

    @Override
    protected void studentProcessing() throws Exception {
        // check if it's a valid assignment
        Round a = validateAssignment();

        // check if this assignment belongs to the logged student
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find((Long) a.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID));
        if (DAOUtil.getFactory().getStudentClassroomDAO().findActiveUsingStudentIdClassroomId(getUser().getId(), c.getId()) == null) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // check if it's a valid student
        StudentClassroom sc = DAOUtil.getFactory().getStudentClassroomDAO().findUsingStudentIdClassroomId(getStudentParam(), c.getId());
        Coder s = (sc != null) ? sc.getId().getStudent() : null;
        if (s == null) {
            throw new TCWebException("Couldn't find student");
        }
        
        if (!s.getId().equals(new Long(getUser().getId()))) {
            throw new NavigationException("You don't have permission to see this page.");
        }
        
        commonProcessing(a, c, s);
    }

    protected void commonProcessing(Round a, Classroom c, Coder s) throws Exception {

        // get component parameter
        Long componentId = getComponentParam();

        // check if it's a valid component
        Component cmp = DAOUtil.getFactory().getComponentDAO().find(componentId);
        if (cmp == null) {
            throw new TCWebException("Couldn't find component");
        }
        
        // get results
        ResultSetContainer rscResults = getResults(a.getId(), cmp.getId(), s.getId());
        if (rscResults == null || rscResults.size() == 0) {
            throw new TCWebException("Could not retrieve results");
        }
        
        ResultSetRow rsr = rscResults.iterator().next();

        if (rsr.getIntItem("submission_number") ==0) {
            throw new TCWebException("There are no submissions");
        }
        
        Integer total = rsr.getIntItem("total");
        Integer succeeded = (rsr.getItem("succeeded").getResultData() == null) ? 0 : rsr.getIntItem("succeeded");

        // get submission
        Submission sub = DAOUtil.getFactory().getAlgoSubmissionDAO().find(
                new Submission.Identifier(
                        DAOUtil.getFactory().getComponentStateDAO().find(rsr.getLongItem("component_state_id")), 
                        rsr.getIntItem("submission_number")));

        SimpleDateFormat sdfTime = new SimpleDateFormat("H:mm:ss.SSS");
        sdfTime.setTimeZone(TimeZone.getTimeZone("GMT"));

        // get system tests
        ResultSetContainer rsc = getData(a.getId(), cmp.getId(), s.getId());

        List<SystemTestRow> lstr = new ArrayList<SystemTestRow>(); 
        for (ResultSetRow rsr2 : rsc) {
            lstr.add(new SystemTestRow(
                StringUtils.htmlEncode(rsr2.getItem("args").toString()),
                StringUtils.htmlEncode(rsr2.getItem("expected").toString()),
                rsr2.getLongItem("succeeded") == 1
                ));
        }
        
        getRequest().setAttribute("classroom", c);
        getRequest().setAttribute("assignment", a);
        getRequest().setAttribute("component", cmp);
        getRequest().setAttribute("student", s);
        getRequest().setAttribute("score", rsr.getDoubleItem("points"));
        getRequest().setAttribute("numTestPassed", succeeded);
        getRequest().setAttribute("percentTestPassed", succeeded * 100d / total);
        getRequest().setAttribute("status", ComponentState.getStatusDescription(rsr.getIntItem("status_id")));
        getRequest().setAttribute("time", sdfTime.format(new Time(sub.getSubmitTime() - sub.getOpenTime())));
        getRequest().setAttribute("system_tests", lstr);
        
        getRequest().setAttribute("submission", addSpace(sub.getSubmissionText()));
        
        setNextPage("/reports/submission.jsp");
        setIsNextPageInContext(true);
    }

    private Round validateAssignment() throws TCWebException {
        Round a = DAOUtil.getFactory().getRoundDAO().find(getAssignmentParam());
        if (a == null) {
            throw new TCWebException("Couldn't find assignment");
        }
        return a;
    }
    
    private String addSpace(String text) {
        int i = -1;
        text = StringUtils.htmlEncode(text);
        while ((i = text.indexOf("\n\n")) >= 0) {
            text = text.substring(0, i + 1) + "&#160;" + text.substring(i + 1);
        }

        StringTokenizer strtok = new StringTokenizer(text, "\n");
        StringBuffer stBuffer = new StringBuffer(text.length());
        String sTemp = "";
        while (strtok.hasMoreTokens()) {
            sTemp = strtok.nextToken();
            boolean inTag = false;
            for (i = 0; i < sTemp.length(); i++) {
                if (!inTag && sTemp.charAt(i) == '<') {
                    inTag = true;
                }
                if (inTag && sTemp.charAt(i) == '>') {
                    inTag = false;
                }
                if (!inTag && sTemp.charAt(i) == ' ') {
                    stBuffer.append("&#160;");
                } else {
                    stBuffer.append(sTemp.charAt(i));
                }
            }
            stBuffer.append("<br />");
        }
        return stBuffer.toString();
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
    
    private ResultSetContainer getResults(Long roundId, Long componentId, Long coderId) throws TCWebException {
        try {
            Request r = new Request();
            String queryName = "assignment_problem_results_student";
            r.setProperty("cr", coderId.toString());
            r.setProperty("rd", roundId.toString());
            r.setProperty("compid", componentId.toString());
            r.setContentHandle(queryName);

            DataAccessInt dai = getDataAccess();
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get(queryName);

            return rsc;
        } catch (Exception e) {
            throw new TCWebException("Could not get data from DB", e);
        }
    }

    private ResultSetContainer getData(Long roundId, Long componentId, Long coderId) throws TCWebException {
        try {
            Request r = new Request();
            String queryName = "submission_system_tests";
            r.setProperty("cr", coderId.toString());
            r.setProperty("rd", roundId.toString());
            r.setProperty("compid", componentId.toString());
            r.setContentHandle(queryName);

            DataAccessInt dai = getDataAccess();
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get(queryName);

            return rsc;
        } catch (Exception e) {
            throw new TCWebException("Could not get data from DB", e);
        }
    }

}
