/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor.reports;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.StringTokenizer;
import java.util.TimeZone;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.ComponentState;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.algo.Submission;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewSubmission extends ShortHibernateProcessor {
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

        // get student parameter
        Long studentId = getStudentParam();

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

        // check if it's a valid student
        Coder s = c.getStudent(studentId);
        if (s == null) {
            throw new TCWebException("Couldn't find student");
        }

        // get component state
        ComponentState cs = DAOUtil.getFactory().getComponentStateDAO().getStudentResultsByComponent(a, cmp, studentId);

        // get tests results
        Object systemTestResults = DAOUtil.getFactory().getSystemTestResultDAO().getSystemTestResultsByStudentComponent(a, cmp, studentId);
        Object[] lo = (Object[]) systemTestResults;
        Integer total = (Integer)lo[0];
        Integer succeeded = (Integer)lo[1];

        // get submission
        Submission sub = DAOUtil.getFactory().getAlgoSubmissionDAO().find(new Submission.Identifier(cs, cs.getSubmissionNumber()));

        SimpleDateFormat sdfTime = new SimpleDateFormat("H:mm:ss.SSS");
        sdfTime.setTimeZone(TimeZone.getTimeZone("GMT"));

        getRequest().setAttribute("assignment", a);
        getRequest().setAttribute("component", cmp);
        getRequest().setAttribute("student", s);
        getRequest().setAttribute("score", cs.getPoints());
        getRequest().setAttribute("numTestPassed", succeeded);
        getRequest().setAttribute("percentTestPassed", succeeded * 100d / total);
        getRequest().setAttribute("status", ComponentState.getStatusDescription(cs.getStatusId()));
        getRequest().setAttribute("time", sdfTime.format(new Time(sub.getSubmitTime() - sub.getOpenTime())));
        
        getRequest().setAttribute("submission", addSpace(sub.getSubmissionText()));
        
        setNextPage("/reports/submission.jsp");
        setIsNextPageInContext(true);
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
}
